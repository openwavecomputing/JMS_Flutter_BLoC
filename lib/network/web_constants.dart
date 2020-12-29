class WebConstants {
  // Standard Values
  static const int STATUS_CODE_SUCCESS = 200;
  static const String STATUS_VALUE_SUCCESS = "True";
  static const String STATUS_VALUE_FAILED = "False";

  // Pointing Servers
  static const String BASE_URL_LIVE = "http://113.193.25.21:816/";
  static const String BASE_URL_UAT= "http://113.193.25.21:816/";

  // Common for all webservices
  static const String BASE_URL_COMMON = BASE_URL_UAT;
  static const String PASSCODE = "Sk1TU2VjcmV0S2V5OTg1Mg==";

  // Login
  static const String LOGIN_ACTION = BASE_URL_COMMON + "MasterUsersMobile.svc/GetMasterUsersCommonMobile";
  static const String LOGIN_1_USERNAME = "username";
  static const String LOGIN_2_PASSWORD = "password";
  static const String LOGIN_3_PASSCODE = "PassCode";
  static const String LOGIN_4_DEVICE_ID = "device_id";
  static const String LOGIN_5_DEVICE_TOKEN = "device_token";
  static const String LOGIN_6_DEVICE_PLATFORM = "device_platform";
  static const String LOGIN_7_APP_VERSION = "app_version";
  static const String LOGIN_8_PROCEED = "Proceed";

  // Job List
  static const String JOB_LIST_ACTION = "JobDetailsService.svc/GetJobDetailsCommonMobile";
  static const String JOB_LIST_1_USER_ID = "user_id";
  static const String JOB_LIST_2_PASSCODE = "PassCode";
}
