import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'config/routes/route_generator.dart';
import 'modules/login/bloc/login_bloc.dart';
import 'modules/splash/splash_screen.dart';

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
      onGenerateRoute: RouteGenerator.generateRoute,
      home: Scaffold(
        body: SplashScreen(),
      ),
    );
  }

  void getValue(Object object){
    object.toString();
  }
}
