/// response : {"success":"True","tbc_version":"9","job_list":[{"job_id":40012,"work_order_no":"115031201","trade":"ELECTRICAL","priority":"BESGRP","due_date":"05-10-2019","status":"Assigned","job_desc":"Defect # 56355 It appears that all lighting on ground south garbage area not working - To dark for photo - requires further investigation - (Hourly Rate: Investigate and asses defect)\r\n\r\nFurther quote will be provided as soon as defect has been assessed i","tenant_alert":0,"PushNotificationStatus":"0","job_history_list":[{"name":"logesh2 ","description":"Weather","status":"Weather","date_time":"24-12-2020 17:45 To 24-12-2020 18:01","details":"ubub","audio_url_file":"","time_sheet_id":44893,"url":"http://113.193.25.21:817/JobAttachmentPartial/LoadJobImageHistory?History=3Hi0syb4G8i3bsddSXw9oTja1jszVgLpdqi+0ucZ2eCzu6Rvxn7ZRZMXmnCou/268B372gwTLdjqIEllkUG2TYhVFanXlgkr/d8IhZiQZHpilZTDBwBO9nuIzeU9OIXJ"}],"tenant_name":"Grant Wenban","tenant_phone":"","tenant_address":"UNIT 101-815, 55 WALKER ST REDFERN  NSW 2016 AU","postal_code":"2016"}]}

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

/// success : "True"
/// tbc_version : "9"
/// job_list : [{"job_id":40012,"work_order_no":"115031201","trade":"ELECTRICAL","priority":"BESGRP","due_date":"05-10-2019","status":"Assigned","job_desc":"Defect # 56355 It appears that all lighting on ground south garbage area not working - To dark for photo - requires further investigation - (Hourly Rate: Investigate and asses defect)\r\n\r\nFurther quote will be provided as soon as defect has been assessed i","tenant_alert":0,"PushNotificationStatus":"0","job_history_list":[{"name":"logesh2 ","description":"Weather","status":"Weather","date_time":"24-12-2020 17:45 To 24-12-2020 18:01","details":"ubub","audio_url_file":"","time_sheet_id":44893,"url":"http://113.193.25.21:817/JobAttachmentPartial/LoadJobImageHistory?History=3Hi0syb4G8i3bsddSXw9oTja1jszVgLpdqi+0ucZ2eCzu6Rvxn7ZRZMXmnCou/268B372gwTLdjqIEllkUG2TYhVFanXlgkr/d8IhZiQZHpilZTDBwBO9nuIzeU9OIXJ"}],"tenant_name":"Grant Wenban","tenant_phone":"","tenant_address":"UNIT 101-815, 55 WALKER ST REDFERN  NSW 2016 AU","postal_code":"2016"}]

class Response {
  String _success;
  String _tbcVersion;
  List<JobItem> _jobList;

  String get success => _success;
  String get tbcVersion => _tbcVersion;
  List<JobItem> get jobList => _jobList;

  Response({
      String success, 
      String tbcVersion, 
      List<JobItem> jobList}){
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
        _jobList.add(JobItem.fromJson(v));
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

/// job_id : 40012
/// work_order_no : "115031201"
/// trade : "ELECTRICAL"
/// priority : "BESGRP"
/// due_date : "05-10-2019"
/// status : "Assigned"
/// job_desc : "Defect # 56355 It appears that all lighting on ground south garbage area not working - To dark for photo - requires further investigation - (Hourly Rate: Investigate and asses defect)\r\n\r\nFurther quote will be provided as soon as defect has been assessed i"
/// tenant_alert : 0
/// PushNotificationStatus : "0"
/// job_history_list : [{"name":"logesh2 ","description":"Weather","status":"Weather","date_time":"24-12-2020 17:45 To 24-12-2020 18:01","details":"ubub","audio_url_file":"","time_sheet_id":44893,"url":"http://113.193.25.21:817/JobAttachmentPartial/LoadJobImageHistory?History=3Hi0syb4G8i3bsddSXw9oTja1jszVgLpdqi+0ucZ2eCzu6Rvxn7ZRZMXmnCou/268B372gwTLdjqIEllkUG2TYhVFanXlgkr/d8IhZiQZHpilZTDBwBO9nuIzeU9OIXJ"}]
/// tenant_name : "Grant Wenban"
/// tenant_phone : ""
/// tenant_address : "UNIT 101-815, 55 WALKER ST REDFERN  NSW 2016 AU"
/// postal_code : "2016"

class JobItem {
  int _jobId;
  String _workOrderNo;
  String _trade;
  String _priority;
  String _dueDate;
  String _status;
  String _jobDesc;
  int _tenantAlert;
  String _pushNotificationStatus;
  List<JobHistoryObject> _jobHistoryList;
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
  List<JobHistoryObject> get jobHistoryList => _jobHistoryList;
  String get tenantName => _tenantName;
  String get tenantPhone => _tenantPhone;
  String get tenantAddress => _tenantAddress;
  String get postalCode => _postalCode;

  JobItem({
      int jobId, 
      String workOrderNo, 
      String trade, 
      String priority, 
      String dueDate, 
      String status, 
      String jobDesc, 
      int tenantAlert, 
      String pushNotificationStatus, 
      List<JobHistoryObject> jobHistoryList,
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

  JobItem.fromJson(dynamic json) {
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
      json["job_history_list"].forEach((v) {
        _jobHistoryList.add(JobHistoryObject.fromJson(v));
      });
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

/// name : "logesh2 "
/// description : "Weather"
/// status : "Weather"
/// date_time : "24-12-2020 17:45 To 24-12-2020 18:01"
/// details : "ubub"
/// audio_url_file : ""
/// time_sheet_id : 44893
/// url : "http://113.193.25.21:817/JobAttachmentPartial/LoadJobImageHistory?History=3Hi0syb4G8i3bsddSXw9oTja1jszVgLpdqi+0ucZ2eCzu6Rvxn7ZRZMXmnCou/268B372gwTLdjqIEllkUG2TYhVFanXlgkr/d8IhZiQZHpilZTDBwBO9nuIzeU9OIXJ"

class JobHistoryObject {
  String _name;
  String _description;
  String _status;
  String _dateTime;
  String _details;
  String _audioUrlFile;
  int _timeSheetId;
  String _url;

  String get name => _name;
  String get description => _description;
  String get status => _status;
  String get dateTime => _dateTime;
  String get details => _details;
  String get audioUrlFile => _audioUrlFile;
  int get timeSheetId => _timeSheetId;
  String get url => _url;

  JobHistoryObject({
      String name, 
      String description, 
      String status, 
      String dateTime, 
      String details, 
      String audioUrlFile, 
      int timeSheetId, 
      String url}){
    _name = name;
    _description = description;
    _status = status;
    _dateTime = dateTime;
    _details = details;
    _audioUrlFile = audioUrlFile;
    _timeSheetId = timeSheetId;
    _url = url;
}

  JobHistoryObject.fromJson(dynamic json) {
    _name = json["name"];
    _description = json["description"];
    _status = json["status"];
    _dateTime = json["date_time"];
    _details = json["details"];
    _audioUrlFile = json["audio_url_file"];
    _timeSheetId = json["time_sheet_id"];
    _url = json["url"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["name"] = _name;
    map["description"] = _description;
    map["status"] = _status;
    map["date_time"] = _dateTime;
    map["details"] = _details;
    map["audio_url_file"] = _audioUrlFile;
    map["time_sheet_id"] = _timeSheetId;
    map["url"] = _url;
    return map;
  }

}