

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jms_flutter_bloc/modules/job_list/repo/job_list_repository.dart';
import 'package:jms_flutter_bloc/network/web_constants.dart';

import 'job_list_event.dart';
import 'job_list_state.dart';


class JobListBloc extends Bloc<JobListEvent, JobListState> {
  final JobListRepository repository;

  JobListBloc({@required this.repository}) : super(JobListInitial());

  JobListState get initialState => JobListInitial();

  @override
  Stream<JobListState> mapEventToState(JobListEvent event) async* {
    print("Call flow LoginBloc $event");
    if (event is JobListFetchEvent) {
      yield JobListLoading();
      try {
        Map<String, String> mappedValues = {
          WebConstants.JOB_LIST_1_USER_ID: await repository.sharedPrefs.getUserId(),
          WebConstants.JOB_LIST_2_PASSCODE: WebConstants.PASSCODE
        };
        var response = await repository.fetchJobList(mappedValues);
        print("LoginBloc response ${response.response.success}");
        print(
            "LoginBloc compare ${response.response.success == WebConstants.STATUS_VALUE_SUCCESS}");
        if (response.response.success == WebConstants.STATUS_VALUE_SUCCESS) {
          yield JobListSuccess(successValue: response);
        } else {
          yield JobListError(failedValue: response.response);
        }
      } catch (_) {
        print("exception $_");
        yield JobListError(failedValue: "Unable to process your request right now");
      }
    }
  }
}
