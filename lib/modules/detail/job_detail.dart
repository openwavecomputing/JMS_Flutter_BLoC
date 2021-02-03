import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jms_flutter_bloc/config/constants/color_constants.dart';
import 'package:jms_flutter_bloc/config/constants/nav_constants.dart';
import 'package:jms_flutter_bloc/config/constants/size_constants.dart';
import 'package:jms_flutter_bloc/modules/job_list/repo/job_list_response.dart';
import 'package:jms_flutter_bloc/modules/job_list/repo/job_list_response.dart';

class JobDetail extends StatefulWidget {
  JobItem jobItem;

  JobDetail({Key key, this.jobItem}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _JobDetailState(jobItem);
  }
}

class _JobDetailState extends State<JobDetail> {
  JobItem jobItem;

  _JobDetailState(this.jobItem);

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Job Detail",
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 20.0,
                color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        padding: EdgeInsets.only(
            right: SizeConstants.SIZE_16,
            left: SizeConstants.SIZE_16,
            top: SizeConstants.SIZE_16),
        children: [
          Text("Work Order",
              style: TextStyle(
                  fontSize: SizeConstants.SIZE_16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54)),
          Text("${jobItem.workOrderNo}",
              style: TextStyle(
                  fontSize: SizeConstants.SIZE_18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black)),
          SizedBox(height: SizeConstants.SIZE_8),
          Text("Trade",
              style: TextStyle(
                  fontSize: SizeConstants.SIZE_16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54)),
          Text("${jobItem.trade}",
              style: TextStyle(
                  fontSize: SizeConstants.SIZE_18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black)),
          SizedBox(height: SizeConstants.SIZE_8),
          Text("Priority",
              style: TextStyle(
                  fontSize: SizeConstants.SIZE_16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54)),
          Text("${jobItem.priority}",
              style: TextStyle(
                  fontSize: SizeConstants.SIZE_18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black)),
          SizedBox(height: SizeConstants.SIZE_8),
          Text("Due Date",
              style: TextStyle(
                  fontSize: SizeConstants.SIZE_16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54)),
          Text("${jobItem.dueDate}",
              style: TextStyle(
                  fontSize: SizeConstants.SIZE_18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black)),
          SizedBox(height: SizeConstants.SIZE_8),
          Text("Supervisor",
              style: TextStyle(
                  fontSize: SizeConstants.SIZE_16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54)),
          Text("John Kevin",
              style: TextStyle(
                  fontSize: SizeConstants.SIZE_18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black)),
          SizedBox(height: SizeConstants.SIZE_8),
          Padding(
              padding: EdgeInsets.all(SizeConstants.SIZE_8),
              child: Divider(
                  height: SizeConstants.DIVIDER_1, color: Colors.black26)),
          Text("Work Description",
              style: TextStyle(
                  fontSize: SizeConstants.SIZE_18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54)),
          Padding(
            padding: const EdgeInsets.all(SizeConstants.SIZE_8),
            child: Text("${jobItem.jobDesc}",
                style: TextStyle(
                    fontSize: SizeConstants.SIZE_16, color: Colors.black)),
          ),
          SizedBox(height: SizeConstants.SIZE_8),
          Padding(
              padding: EdgeInsets.all(SizeConstants.SIZE_8),
              child: Divider(
                  height: SizeConstants.DIVIDER_1, color: Colors.black26)),
          Padding(
            padding: const EdgeInsets.only(
                top: SizeConstants.SIZE_8, bottom: SizeConstants.SIZE_8),
            child: Text("Contact Details",
                style: TextStyle(
                    fontSize: SizeConstants.SIZE_18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54)),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(SizeConstants.SIZE_8),
                    child: Icon(Icons.account_box),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(SizeConstants.SIZE_8),
                    child: Text("${jobItem.tenantName}",
                        style: TextStyle(
                            fontSize: SizeConstants.SIZE_16,
                            fontWeight: FontWeight.w400,
                            color: Colors.black)),
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(SizeConstants.SIZE_8),
                    child: Icon(Icons.phone),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(SizeConstants.SIZE_8),
                    child: Text("${jobItem.tenantPhone}",
                        style: TextStyle(
                            fontSize: SizeConstants.SIZE_16,
                            fontWeight: FontWeight.w400,
                            color: Colors.black)),
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(SizeConstants.SIZE_8),
                    child: Icon(Icons.place),
                  ),
                  Expanded(
                    child: Text("${jobItem.tenantAddress}",
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                            fontSize: SizeConstants.SIZE_16,
                            fontWeight: FontWeight.w400,
                            color: Colors.black)),
                  )
                ],
              ),
            ],
          ),
          SizedBox(height: SizeConstants.SIZE_8),
          Padding(
              padding: EdgeInsets.all(SizeConstants.SIZE_8),
              child: Divider(
                  height: SizeConstants.DIVIDER_1, color: Colors.black26)),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                  flex: 1,
                  child: FlatButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(NavConstants.ROUTE_JOB_HISTORY,arguments:jobItem.jobHistoryList);
                      },
                      child: Text("Job History",
                          style: TextStyle(
                              fontSize: SizeConstants.SIZE_18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54),
                          textAlign: TextAlign.left))),
              Icon(
                Icons.arrow_forward_ios,
                size: SizeConstants.SIZE_16,
              )
            ],
          ),
          Padding(
              padding: EdgeInsets.all(SizeConstants.SIZE_8),
              child: Divider(
                  height: SizeConstants.DIVIDER_1, color: Colors.black26)),
          Row(
            children: [
              Expanded(
                  flex: 1,
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      padding: EdgeInsets.all(SizeConstants.SIZE_16),
                      color: ColorConstants.primaryDarkColor,
                      child: Text(
                        "Update Job",
                        style: TextStyle(
                            fontSize: SizeConstants.SIZE_16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(NavConstants.ROUTE_JOB_UPDATE);
                      })),
              SizedBox(
                width: SizeConstants.SIZE_16,
              ),
              Expanded(
                  flex: 1,
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      padding: EdgeInsets.all(SizeConstants.SIZE_16),
                      color: ColorConstants.primaryDarkColor,
                      child: Text(
                        "Start Job",
                        style: TextStyle(
                            fontSize: SizeConstants.SIZE_16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      onPressed: () {
                        // Alert
                      })),
            ],
          )
        ],
      ),
    );
  }
}
