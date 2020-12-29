import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

// class FetchLogin extends LoginEvent {
//   const FetchLogin();
//
//   @override
//   List<Object> get props => [];
// }

class LoginClickEvent extends LoginEvent {
  final Map<String, String> loginMappedValues;

  const LoginClickEvent({@required this.loginMappedValues});

  @override
  List<Object> get props => [loginMappedValues.values];
}
