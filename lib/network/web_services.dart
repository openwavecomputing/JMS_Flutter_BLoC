import 'dart:convert';
import 'dart:developer';
import 'package:jms_flutter_bloc/modules/job_list/repo/job_list_response.dart';
import 'package:jms_flutter_bloc/modules/login/repo/login_response.dart';
import 'package:jms_flutter_bloc/network/web_constants.dart';
import 'package:http/http.dart' as http;
class Webservices {

  // Singleton approach
  static final Webservices _instance = Webservices._internal();
  factory Webservices() => _instance;
  Webservices._internal();

  final Map<String, String> _headers = {
    'Content-Type': 'application/json; charset=UTF-8'
  };
  Codec<String, String> stringToBase64 = utf8.fuse(base64);

  // Reusable Method
  Future<http.Response> getJsonResponse(
      String action, Map<String, String> mappedValues) {
    print("Request URL " + WebConstants.BASE_URL_COMMON + action);
    print("Request Params " + mappedValues.toString());
    String encodedJsonMapper = jsonEncode(mappedValues);
    String encodeData = stringToBase64.encode(encodedJsonMapper);
    print("Request encodeData " +'JsonData='+ encodeData);

    return http.post(
      WebConstants.BASE_URL_COMMON + action,
      headers: _headers,
      body: jsonEncode(<String, String>{'JsonData': encodeData}),
    );
  }

  // Login Webservice
  Future<LoginResponse> submitLogin(
      Map<String, String> loginMappedValues) async {
    var loginResponse;

    final http.Response response =
        await getJsonResponse(WebConstants.LOGIN_ACTION, loginMappedValues);
    print("Call flow Webservices submitLogin");
    print("response ${response.body.toString()}");

    if (response.statusCode == WebConstants.STATUS_CODE_SUCCESS) {
      var jsonResponse = jsonDecode(response.body);
      loginResponse = LoginResponse.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to make request');
    }
    return loginResponse;
  }

  // Login Webservice
  Future<JobListResponse> fetchJobList(
      Map<String, String> loginMappedValues) async {
    var jobListResponse;

    final http.Response response =
    await getJsonResponse(WebConstants.JOB_LIST_ACTION, loginMappedValues);
    print("Call flow Webservices submitLogin");
    // Using log to print full response to avoid cutdown strings
    log("response ${response.body.toString()}");

    if (response.statusCode == WebConstants.STATUS_CODE_SUCCESS) {
      var jsonResponse = jsonDecode(response.body);
      jobListResponse = JobListResponse.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to make request');
    }
    return jobListResponse;
  }

}
