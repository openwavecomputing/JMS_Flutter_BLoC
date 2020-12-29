import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jms_flutter_bloc/config/constants/nav_constants.dart';
import 'package:jms_flutter_bloc/modules/job_list/view/job_list.dart';
import 'package:jms_flutter_bloc/modules/login/view/login_screen.dart';
import 'package:jms_flutter_bloc/modules/splash/splash_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    final args = routeSettings.arguments;
    switch (routeSettings.name) {
      case NavConstants.ROUTE_SPLASH:
        return MaterialPageRoute(builder: (context) => SplashScreen());
      case NavConstants.ROUTE_LOGIN:
        return MaterialPageRoute(builder: (context) => LoginScreen());
      case NavConstants.ROUTE_JOB_LIST:
        return MaterialPageRoute(builder: (context) => JobListScreen());
      default:
        return _routeNotFound();
    }
  }

  static Route<dynamic> _routeNotFound() {
    return MaterialPageRoute(builder: (context) {
      return Scaffold(
        body: Center(
          child: Text("Page not found!"),
        ),
      );
    });
  }
}
