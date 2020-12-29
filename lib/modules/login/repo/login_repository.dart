
import 'package:flutter/widgets.dart';
import 'package:jms_flutter_bloc/network/web_services.dart';
import 'package:jms_flutter_bloc/storage/sharedprefs/shared_prefs.dart';
import 'login_response.dart';
import 'login_response.dart';

class LoginRepository {
  final Webservices jmsApiClient;
  final SharedPrefs sharedPrefs;

  LoginRepository({@required this.jmsApiClient, @required this.sharedPrefs})
      : assert(jmsApiClient != null),assert(sharedPrefs != null);

  Future<LoginResponse> submitLogin(
      Map<String, String> loginMappedValues) async {
    print("Call flow LoginRepository");
    final response = await jmsApiClient.post(loginMappedValues);

    return LoginResponse.fromJson(response);
  }

  Future<void> saveUserDetails(User user) async {
    sharedPrefs.addUser(user);
  }
}
