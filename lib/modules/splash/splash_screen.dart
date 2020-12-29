import 'package:flutter/material.dart';
import 'package:jms_flutter_bloc/config/constants/asset_constants.dart';
import 'package:jms_flutter_bloc/config/constants/color_constants.dart';
import 'package:jms_flutter_bloc/config/constants/nav_constants.dart';
import 'package:jms_flutter_bloc/config/constants/size_constants.dart';
import 'package:jms_flutter_bloc/modules/login/view/login_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State {
  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage(AssetConstants.splashAppImage), context);
    return new Scaffold(
        body: SafeArea(
            child: Column(
      children: <Widget>[
        Expanded(
          flex: SizeConstants.FLEX_8,
          child: Padding(
            padding: const EdgeInsets.all(SizeConstants.SIZE_16),
            child: const Image(
              image: const AssetImage(AssetConstants.splashAppImage),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(SizeConstants.SIZE_20),
          child: Container(
            height: SizeConstants.SIZE_50,
            width: SizeConstants.SIZE_50,
            child: CircularProgressIndicator(
              backgroundColor: ColorConstants.primaryColor,
              strokeWidth: 5.0,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            "v1.0.1",
            style: TextStyle(
                fontWeight: FontWeight.w400, fontSize: SizeConstants.SIZE_16),
          ),
        ),
      ],
    )));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed(NavConstants.ROUTE_LOGIN);
    });
  }
}
