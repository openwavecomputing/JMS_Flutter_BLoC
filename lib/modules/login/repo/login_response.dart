import 'package:equatable/equatable.dart';

class LoginResponse extends Equatable{
  Response _response;

  Response get response => _response;

  LoginResponse({Response response}) {
    _response = response;
  }

  LoginResponse.fromJson(dynamic json) {
    _response =
        json["response"] != null ? Response.fromJson(json["response"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_response != null) {
      map["response"] = _response.toJson();
    }
    return map;
  }

  @override
    List<Object> get props => [response];
}

class Response {
  String _success;
  String _message;
  User _user;

  String get success => _success;

  String get message => _message;

  User get user => _user;

  Response({String success ="", String message = "", User user}) {
    _success = success;
    _user = user;
    _message = message;
  }

  Response.fromJson(dynamic json) {
    _success = json["Success"];
    _user = json["User"] != null ? User.fromJson(json["User"]) : null;
    _message =   json["message"] != null ? json["message"] : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["Success"] = _success;
    if (_user != null) {
      map["User"] = _user.toJson();
    }
    if(_message!=null){
      map["message"] = _message;
    }
    return map;
  }
}

class User {
  String _userMasterId;
  String _userId;
  String _userName;
  String _devicePlatform;
  String _deviceId;
  String _status;
  String _userGroupMasterId;

  String get userMasterId => _userMasterId;

  String get userId => _userId;

  String get userName => _userName;

  String get devicePlatform => _devicePlatform;

  String get deviceId => _deviceId;

  String get status => _status;

  String get userGroupMasterId => _userGroupMasterId;

  User(
      {String userMasterId,
      String userId,
      String userName,
      String devicePlatform,
      String deviceId,
      String status,
      String userGroupMasterId}) {
    _userMasterId = userMasterId;
    _userId = userId;
    _userName = userName;
    _devicePlatform = devicePlatform;
    _deviceId = deviceId;
    _status = status;
    _userGroupMasterId = userGroupMasterId;
  }

  User.fromJson(dynamic json) {
    _userMasterId = json["UserMasterId"];
    _userId = json["UserId"];
    _userName = json["UserName"];
    _devicePlatform = json["DevicePlatform"];
    _deviceId = json["DeviceId"];
    _status = json["Status"];
    _userGroupMasterId = json["UserGroupMasterId"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["UserMasterId"] = _userMasterId;
    map["UserId"] = _userId;
    map["UserName"] = _userName;
    map["DevicePlatform"] = _devicePlatform;
    map["DeviceId"] = _deviceId;
    map["Status"] = _status;
    map["UserGroupMasterId"] = _userGroupMasterId;
    return map;
  }
}
