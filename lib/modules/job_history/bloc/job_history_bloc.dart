import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jms_flutter_bloc/modules/login/repo/login_repository.dart';
import 'package:jms_flutter_bloc/network/web_constants.dart';

import 'job_history_event.dart';
import 'job_history_state.dart';

class JobHistoryBloc extends Bloc<JobHistoryEvent, JobHistoryState> {
  final LoginRepository repository;

  JobHistoryBloc({@required this.repository}) : super(JobHistoryEmpty());

  @override
  JobHistoryState get initialState => JobHistoryEmpty();

  @override
  Stream<JobHistoryState> mapEventToState(JobHistoryEvent event) async* {
    print("Call flow LoginBloc $event");
    if (event is JobHistoryLoadEvent) {
      yield JobHistoryLoading();
      try {
        var response = await repository.submitLogin(event.loginMappedValues);
        print("LoginBloc response ${response.response.success}");
        print(
            "LoginBloc compare ${response.response.success == WebConstants.STATUS_VALUE_SUCCESS}");
        if (response.response.success == WebConstants.STATUS_VALUE_SUCCESS) {
          await repository.saveUserDetails(response.response.user);
          yield JobHistorySuccess(user: response.response.user);
        } else {
          yield JobHistoryError(message: response.response.message);
        }
      } catch (_) {
        print("exception $_");
        yield JobHistoryError(message: "Unable to process your request right now");
      }
    }
  }
}
