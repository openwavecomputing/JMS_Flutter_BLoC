import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class JobHistoryEvent extends Equatable {
  const JobHistoryEvent();
}

// class FetchLogin extends LoginEvent {
//   const FetchLogin();
//
//   @override
//   List<Object> get props => [];
// }

class JobHistoryLoadEvent extends JobHistoryEvent {
  final Map<String, String> loginMappedValues;

  const JobHistoryLoadEvent({@required this.loginMappedValues});

  @override
  List<Object> get props => [loginMappedValues.values];
}
