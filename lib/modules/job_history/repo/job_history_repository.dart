
import 'package:flutter/widgets.dart';
import 'package:jms_flutter_bloc/network/web_services.dart';
import 'package:jms_flutter_bloc/storage/sharedprefs/shared_prefs.dart';
import 'job_history_response.dart';
import 'job_history_response.dart';

class JobHistoryRepository {
  final Webservices jmsApiClient;
  final SharedPrefs sharedPrefs;

  JobHistoryRepository({@required this.jmsApiClient, @required this.sharedPrefs})
      : assert(jmsApiClient != null),assert(sharedPrefs != null);

  Future<JobHistoryResponse> submitLogin(
      Map<String, String> loginMappedValues) async {
    print("Call flow LoginRepository");
    final response = await jmsApiClient.post(loginMappedValues);

    return JobHistoryResponse.fromJson(response);
  }
}
