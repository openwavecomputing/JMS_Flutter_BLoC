import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jms_flutter_bloc/modules/login/view/login_screen.dart';

import 'config/routes/route_generator.dart';
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
          body: LoginScreen(),
        ),
      ),
    );
  }

  void getValue(Object object) {
    object.toString();
  }
}
