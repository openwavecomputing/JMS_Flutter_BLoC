import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jms_flutter_bloc/modules/login/repo/login_repository.dart';
import 'package:jms_flutter_bloc/network/web_constants.dart';

import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository repository;

  LoginBloc({@required this.repository}) : super(LoginEmpty());

  @override
  LoginState get initialState => LoginEmpty();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    print("Call flow LoginBloc $event");
    if (event is LoginClickEvent) {
      yield LoginLoading();
      try {
        var response = await repository.submitLogin(event.loginMappedValues);
        print("LoginBloc response ${response.response.success}");
        print(
            "LoginBloc compare ${response.response.success == WebConstants.STATUS_VALUE_SUCCESS}");
        if (response.response.success == WebConstants.STATUS_VALUE_SUCCESS) {
          await repository.saveUserDetails(response.response.user);
          yield LoginSuccess(user: response.response.user);
        } else {
          yield LoginError(message: "response.response.message");
        }
      } catch (_) {
        print("exception $_");
        yield LoginError(message: "Unable to process your request right now");
      }
    }
  }
}
