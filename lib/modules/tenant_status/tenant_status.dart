import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jms_flutter_bloc/config/constants/color_constants.dart';
import 'package:jms_flutter_bloc/config/constants/size_constants.dart';
import 'package:jms_flutter_bloc/modules/job_list/bloc/job_list_bloc.dart';
import 'package:jms_flutter_bloc/modules/job_list/bloc/job_list_event.dart';
import 'package:jms_flutter_bloc/modules/job_list/bloc/job_list_state.dart';
import 'package:jms_flutter_bloc/modules/job_list/repo/job_list_repository.dart';
import 'package:jms_flutter_bloc/network/web_services.dart';
import 'package:jms_flutter_bloc/storage/sharedprefs/shared_prefs.dart';
import 'package:progress_dialog/progress_dialog.dart';

class TenantStatus extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TenantStatusState();
  }
}

class _TenantStatusState extends State<TenantStatus> {

  @override
  void initState() {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tenant Status",
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 20.0,
                color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        alignment: Alignment.center,
        child: ListView(padding: EdgeInsets.only(right: SizeConstants.SIZE_32,left: SizeConstants.SIZE_32, top: SizeConstants.SIZE_64),
          children: [
            RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(SizeConstants.SIZE_10),
              ),
              padding: EdgeInsets.all(SizeConstants.SIZE_16),
              child: Text("Tenant Available",
                  style: TextStyle(fontSize: SizeConstants.SIZE_16)),
              onPressed: () {
             print("Tenant AVailable");
              },
              color: ColorConstants.primaryDarkColor,
              textColor: Colors.white,
            ),SizedBox(height: SizeConstants.SIZE_32),
            RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(SizeConstants.SIZE_10),
              ),
              padding: EdgeInsets.all(SizeConstants.SIZE_16),
              child: Text("Tenant Unavailable",
                  style: TextStyle(fontSize: SizeConstants.SIZE_16)),
              onPressed: () {
                print("Tenant UnaVailable");
              },
              color: ColorConstants.primaryDarkColor,
              textColor: Colors.white,
            ),SizedBox(height: SizeConstants.SIZE_32),
            RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(SizeConstants.SIZE_10),
              ),
              padding: EdgeInsets.all(SizeConstants.SIZE_16),
              child: Text("Tenant Refused",
                  style: TextStyle(fontSize: SizeConstants.SIZE_16)),
              onPressed: () {
                print("Tenant Refused");
              },
              color: ColorConstants.primaryDarkColor,
              textColor: Colors.white,
            ),SizedBox(height: SizeConstants.SIZE_32),
            RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(SizeConstants.SIZE_10),
              ),
              padding: EdgeInsets.all(SizeConstants.SIZE_16),
              child: Text("Others",
                  style: TextStyle(fontSize: SizeConstants.SIZE_16)),
              onPressed: () {
                print("Tenant Others");
              },
              color: ColorConstants.primaryDarkColor,
              textColor: Colors.white,
            ),SizedBox(height: SizeConstants.SIZE_32),
          ],
        ),
      ),
    );
  }

}
