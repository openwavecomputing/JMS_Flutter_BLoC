class JobListResponse {
  Response _response;

  Response get response => _response;

  JobListResponse({
      Response response}){
    _response = response;
}

  JobListResponse.fromJson(dynamic json) {
    _response = json["response"] != null ? Response.fromJson(json["response"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_response != null) {
      map["response"] = _response.toJson();
    }
    return map;
  }

}


class Response {
  String _success;
  String _tbcVersion;
  List<Job_list> _jobList;

  String get success => _success;
  String get tbcVersion => _tbcVersion;
  List<Job_list> get jobList => _jobList;

  Response({
      String success, 
      String tbcVersion, 
      List<Job_list> jobList}){
    _success = success;
    _tbcVersion = tbcVersion;
    _jobList = jobList;
}

  Response.fromJson(dynamic json) {
    _success = json["success"];
    _tbcVersion = json["tbc_version"];
    if (json["job_list"] != null) {
      _jobList = [];
      json["job_list"].forEach((v) {
        _jobList.add(Job_list.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["success"] = _success;
    map["tbc_version"] = _tbcVersion;
    if (_jobList != null) {
      map["job_list"] = _jobList.map((v) => v.toJson()).toList();
    }
    return map;
  }

}


class Job_list {
  int _jobId;
  String _workOrderNo;
  String _trade;
  String _priority;
  String _dueDate;
  String _status;
  String _jobDesc;
  int _tenantAlert;
  String _pushNotificationStatus;
  List<dynamic> _jobHistoryList;
  String _tenantName;
  String _tenantPhone;
  String _tenantAddress;
  String _postalCode;

  int get jobId => _jobId;
  String get workOrderNo => _workOrderNo;
  String get trade => _trade;
  String get priority => _priority;
  String get dueDate => _dueDate;
  String get status => _status;
  String get jobDesc => _jobDesc;
  int get tenantAlert => _tenantAlert;
  String get pushNotificationStatus => _pushNotificationStatus;
  List<dynamic> get jobHistoryList => _jobHistoryList;
  String get tenantName => _tenantName;
  String get tenantPhone => _tenantPhone;
  String get tenantAddress => _tenantAddress;
  String get postalCode => _postalCode;

  Job_list({
      int jobId, 
      String workOrderNo, 
      String trade, 
      String priority, 
      String dueDate, 
      String status, 
      String jobDesc, 
      int tenantAlert, 
      String pushNotificationStatus, 
      List<dynamic> jobHistoryList, 
      String tenantName, 
      String tenantPhone, 
      String tenantAddress, 
      String postalCode}){
    _jobId = jobId;
    _workOrderNo = workOrderNo;
    _trade = trade;
    _priority = priority;
    _dueDate = dueDate;
    _status = status;
    _jobDesc = jobDesc;
    _tenantAlert = tenantAlert;
    _pushNotificationStatus = pushNotificationStatus;
    _jobHistoryList = jobHistoryList;
    _tenantName = tenantName;
    _tenantPhone = tenantPhone;
    _tenantAddress = tenantAddress;
    _postalCode = postalCode;
}

  Job_list.fromJson(dynamic json) {
    _jobId = json["job_id"];
    _workOrderNo = json["work_order_no"];
    _trade = json["trade"];
    _priority = json["priority"];
    _dueDate = json["due_date"];
    _status = json["status"];
    _jobDesc = json["job_desc"];
    _tenantAlert = json["tenant_alert"];
    _pushNotificationStatus = json["PushNotificationStatus"];
    if (json["job_history_list"] != null) {
      _jobHistoryList = [];
      // json["job_history_list"].forEach((v) {
      //   _jobHistoryList.add(dynamic.fromJson(v));
      // });
    }
    _tenantName = json["tenant_name"];
    _tenantPhone = json["tenant_phone"];
    _tenantAddress = json["tenant_address"];
    _postalCode = json["postal_code"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["job_id"] = _jobId;
    map["work_order_no"] = _workOrderNo;
    map["trade"] = _trade;
    map["priority"] = _priority;
    map["due_date"] = _dueDate;
    map["status"] = _status;
    map["job_desc"] = _jobDesc;
    map["tenant_alert"] = _tenantAlert;
    map["PushNotificationStatus"] = _pushNotificationStatus;
    if (_jobHistoryList != null) {
      map["job_history_list"] = _jobHistoryList.map((v) => v.toJson()).toList();
    }
    map["tenant_name"] = _tenantName;
    map["tenant_phone"] = _tenantPhone;
    map["tenant_address"] = _tenantAddress;
    map["postal_code"] = _postalCode;
    return map;
  }

}