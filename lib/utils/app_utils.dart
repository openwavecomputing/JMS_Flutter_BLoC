import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:package_info/package_info.dart';

class AppUtils {
  // Singleton approach
  static final AppUtils _instance = AppUtils._internal();
  factory AppUtils() => _instance;
  AppUtils._internal();

  static Future<String> getAppVersionNumber() async {
    String appVersion;
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    try {
      appVersion = packageInfo.buildNumber;
    } on PlatformException {
      print('Failed to get platform version');
    }

    return appVersion;
  }
}
