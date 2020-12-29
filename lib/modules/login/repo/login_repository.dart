
import 'package:flutter/widgets.dart';
import 'package:jms_flutter_bloc/network/web_services.dart';
import 'package:jms_flutter_bloc/storage/sharedprefs/shared_prefs.dart';
import 'login_response.dart';

class LoginRepository {
  final Webservices jmsApiClient;
  final SharedPrefs sharedPrefs;

  LoginRepository({@required this.jmsApiClient, @required this.sharedPrefs})
      : assert(jmsApiClient != null),assert(sharedPrefs != null);

  Future<LoginResponse> submitLogin(
      Map<String, String> loginMappedValues) async {
    print("Call flow LoginRepository");
    return await jmsApiClient.post(loginMappedValues);
  }

  Future<void> saveUserDetails(User user) async {
    sharedPrefs.addUser(user);
  }
}
