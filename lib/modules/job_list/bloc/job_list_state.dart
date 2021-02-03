import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:jms_flutter_bloc/modules/job_list/repo/job_list_response.dart';
import 'package:jms_flutter_bloc/modules/job_list/repo/job_list_response.dart';


abstract class JobListState extends Equatable {
  const JobListState();

  @override
  List<Object> get props => [];
}

class JobListInitial extends JobListState {}

class JobListLoading extends JobListState {}

class JobListError extends JobListState {
  final Object failedValue;
  const JobListError({@required this.failedValue}) : assert(failedValue != null);
  List<String> get props => [failedValue];
}

class JobListSuccess extends JobListState {
  final JobListResponse successValue;

  const JobListSuccess({@required this.successValue}) : assert(successValue != null);

  @override
  List<Object> get props => [successValue];
}
