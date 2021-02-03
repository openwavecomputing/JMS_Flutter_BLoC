import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:jms_flutter_bloc/modules/job_list/repo/job_list_response.dart';
import 'package:jms_flutter_bloc/modules/job_list/repo/job_list_response.dart';
import 'package:jms_flutter_bloc/modules/login/repo/login_response.dart';
import 'package:jms_flutter_bloc/network/web_constants.dart';
import 'package:http/http.dart' as http;

import 'api_exceptions.dart';
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

  Future<dynamic> post(Map<String, String> loginMappedValues) async {

    String json = jsonEncode(loginMappedValues);

    print(json);
    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    String encoded = stringToBase64.encode(json);
    String decoded = stringToBase64.decode(encoded);
    print(encoded);
    print(decoded);


    Map<String, String> requestData = {
      'JsonData': encoded
    };


    String reqUrl =  WebConstants.LOGIN_ACTION;

    print(reqUrl);
    print(requestData);

    print(jsonEncode(requestData));
    var responseJson;
    try {
      final response = await http.post(reqUrl,headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      }, body: jsonEncode(<String, String>{
        'JsonData': encoded
      }));
      responseJson = _returnResponse(response);
    } on SocketException {
      print('No network connection');
      throw FetchDataException('No Internet connection');
    }
    print('api post.');
    return responseJson;
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


dynamic _returnResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      var responseJson = json.decode(response.body.toString());
      print(responseJson);
      return responseJson;
    case 400:
      throw BadRequestException(response.body.toString());
    case 401:
    case 403:
      throw UnauthorisedException(response.body.toString());
    case 500:
    default:
      throw FetchDataException(
          'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
  }
}