import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jms_flutter_bloc/modules/detail/job_detail.dart';
import 'package:jms_flutter_bloc/modules/feedback/feedback.dart';
import 'package:jms_flutter_bloc/modules/job_history/job_history.dart';
import 'package:jms_flutter_bloc/modules/job_update/job_update.dart';
import 'package:jms_flutter_bloc/modules/splash/splash_screen.dart';
import 'package:jms_flutter_bloc/modules/tenant_status/tenant_others/tenant_others.dart';
import 'package:jms_flutter_bloc/modules/to_be_continue/to_be_continue.dart';
import 'package:jms_flutter_bloc/modules/work_in_progress/workinprogress.dart';
import 'package:jms_flutter_bloc/modules/workdone/workdone.dart';
import 'config/routes/route_generator.dart';
import 'modules/hazard_form/hazard_form.dart';
import 'modules/login/bloc/login_bloc.dart';

void main() {
  // BlocSupervisor.delegate = SimpleBlocDelegate();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    getValue(LoginBloc);
    return MaterialApp(
      title: 'JMS',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.generateRoute,
      home: SafeArea(
        child: Scaffold(
          body: WorkInProgressScreen(),
        ),
      ),
    );
  }

  void getValue(Object object) {
    object.toString();
  }
}
