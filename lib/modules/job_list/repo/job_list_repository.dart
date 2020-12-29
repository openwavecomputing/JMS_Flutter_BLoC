
import 'package:flutter/widgets.dart';
import 'package:jms_flutter_bloc/network/web_services.dart';
import 'package:jms_flutter_bloc/storage/sharedprefs/shared_prefs.dart';
import 'job_list_response.dart';

class JobListRepository {
  final Webservices jmsApiClient;
  final SharedPrefs sharedPrefs;

  JobListRepository({@required this.jmsApiClient, @required this.sharedPrefs})
      : assert(jmsApiClient != null),assert(sharedPrefs != null);

  Future<JobListResponse> fetchJobList(
      Map<String, String> loginMappedValues) async {
    print("Call flow JobListRepository");
    return await jmsApiClient.fetchJobList(loginMappedValues);
  }

}
