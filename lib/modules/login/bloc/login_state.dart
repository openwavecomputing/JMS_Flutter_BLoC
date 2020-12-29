import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:jms_flutter_bloc/modules/login/repo/login_response.dart';


abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginEmpty extends LoginState {}

class LoginLoading extends LoginState {}

class LoginError extends LoginState {
  final String message;
  const LoginError({@required this.message}) : assert(message != null);
  List<String> get props => [message];
}

class LoginSuccess extends LoginState {
  final User user;

  const LoginSuccess({@required this.user}) : assert(user != null);

  @override
  List<Object> get props => [user];
}
