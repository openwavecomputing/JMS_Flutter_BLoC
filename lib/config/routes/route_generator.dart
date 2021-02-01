import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jms_flutter_bloc/config/constants/nav_constants.dart';
import 'package:jms_flutter_bloc/modules/detail/job_detail.dart';
import 'package:jms_flutter_bloc/modules/feedback/feedback.dart';
import 'package:jms_flutter_bloc/modules/hazard_form/hazard_form.dart';
import 'package:jms_flutter_bloc/modules/job_history/job_history.dart';
import 'package:jms_flutter_bloc/modules/job_list/view/job_list.dart';
import 'package:jms_flutter_bloc/modules/job_update/job_update.dart';
import 'package:jms_flutter_bloc/modules/login/view/login_screen.dart';
import 'package:jms_flutter_bloc/modules/splash/splash_screen.dart';
import 'package:jms_flutter_bloc/modules/tenant_status/tenant_status.dart';
import 'package:jms_flutter_bloc/modules/to_be_continue/to_be_continue.dart';

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
      case NavConstants.ROUTE_JOB_DETAIL:
        return MaterialPageRoute(builder: (context) => JobDetail());
      case NavConstants.ROUTE_JOB_HISTORY:
        return MaterialPageRoute(builder: (context) => JobHistory());
      case NavConstants.ROUTE_JOB_UPDATE:
        return MaterialPageRoute(builder: (context) => JobUpdate());
      case NavConstants.ROUTE_TENANT_STATUS:
        return MaterialPageRoute(builder: (context) => TenantStatus());
      case NavConstants.ROUTE_HAZARD_FORM:
        return MaterialPageRoute(builder: (context) => HazardForm());
      case NavConstants.ROUTE_TO_BE_CONTINUE:
        return MaterialPageRoute(builder: (context) => ToBeContinue());
      case NavConstants.ROUTE_FEEDBACK:
        return MaterialPageRoute(builder: (context) => FeedbackScreen());
      // case NavConstants.ROUTE_WORK_IN_PROGRESS:
      //   return MaterialPageRoute(builder: (context) => );
      // case NavConstants.ROUTE_MATERIAL_USED:
      //   return MaterialPageRoute(builder: (context) => );
      // case NavConstants.ROUTE_WORK_DONE:
      //   return MaterialPageRoute(builder: (context) => );

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
