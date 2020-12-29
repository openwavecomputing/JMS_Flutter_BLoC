import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class JobListEvent extends Equatable {
  const JobListEvent();
}

class JobListFetchEvent extends JobListEvent {

  const JobListFetchEvent();

  @override
  List<Object> get props => [];
}
