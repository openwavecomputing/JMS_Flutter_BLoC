import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:jms_flutter_bloc/modules/login/repo/login_response.dart';


abstract class JobHistoryState extends Equatable {
  const JobHistoryState();

  @override
  List<Object> get props => [];
}

class JobHistoryEmpty extends JobHistoryState {}

class JobHistoryLoading extends JobHistoryState {}

class JobHistoryError extends JobHistoryState {
  final String message;
  const JobHistoryError({@required this.message}) : assert(message != null);
  List<String> get props => [message];
}

class JobHistorySuccess extends JobHistoryState {
  final User user;

  const JobHistorySuccess({@required this.user}) : assert(user != null);

  @override
  List<Object> get props => [user];
}
