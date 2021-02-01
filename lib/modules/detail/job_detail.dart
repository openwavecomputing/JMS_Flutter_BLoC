import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jms_flutter_bloc/config/constants/color_constants.dart';
import 'package:jms_flutter_bloc/config/constants/nav_constants.dart';
import 'package:jms_flutter_bloc/config/constants/size_constants.dart';
import 'package:jms_flutter_bloc/modules/job_list/bloc/job_list_bloc.dart';
import 'package:jms_flutter_bloc/modules/job_list/bloc/job_list_event.dart';
import 'package:jms_flutter_bloc/modules/job_list/bloc/job_list_state.dart';
import 'package:jms_flutter_bloc/modules/job_list/repo/job_list_repository.dart';
import 'package:jms_flutter_bloc/network/web_services.dart';
import 'package:jms_flutter_bloc/storage/sharedprefs/shared_prefs.dart';
import 'package:progress_dialog/progress_dialog.dart';

class JobDetail extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _JobDetailState();
  }
}

class _JobDetailState extends State<JobDetail> {

  @override
  void initState() {

  }

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
      body: ListView(padding: EdgeInsets.only(right: SizeConstants.SIZE_16,left:  SizeConstants.SIZE_16, top:  SizeConstants.SIZE_16),
        children: [
          Text("Work Order",style: TextStyle(fontSize:  SizeConstants.SIZE_16,fontWeight: FontWeight.bold, color: Colors.black54)),
          Text("123412342134",style: TextStyle(fontSize:  SizeConstants.SIZE_18,fontWeight: FontWeight.w500, color: Colors.black)),
          SizedBox(height:  SizeConstants.SIZE_8),
          Text("Trade",style: TextStyle(fontSize:  SizeConstants.SIZE_16,fontWeight: FontWeight.bold, color: Colors.black54)),
          Text("Carpentry",style: TextStyle(fontSize:  SizeConstants.SIZE_18,fontWeight: FontWeight.w500, color: Colors.black)),
          SizedBox(height:  SizeConstants.SIZE_8),
          Text("Priority",style: TextStyle(fontSize:  SizeConstants.SIZE_16,fontWeight: FontWeight.bold, color: Colors.black54)),
          Text("Medium",style: TextStyle(fontSize:  SizeConstants.SIZE_18,fontWeight: FontWeight.w500, color: Colors.black)),
          SizedBox(height:  SizeConstants.SIZE_8),
          Text("Due Date",style: TextStyle(fontSize:  SizeConstants.SIZE_16,fontWeight: FontWeight.bold, color: Colors.black54)),
          Text("Dec 20, 2020 4:40pm",style: TextStyle(fontSize:  SizeConstants.SIZE_18,fontWeight: FontWeight.w500, color: Colors.black)),
          SizedBox(height:  SizeConstants.SIZE_8),
          Text("Supervisor",style: TextStyle(fontSize:  SizeConstants.SIZE_16,fontWeight: FontWeight.bold, color: Colors.black54)),
          Text("John Kevin",style: TextStyle(fontSize:  SizeConstants.SIZE_18,fontWeight: FontWeight.w500, color: Colors.black)),
          SizedBox(height:  SizeConstants.SIZE_8),
          Padding(padding:EdgeInsets.all( SizeConstants.SIZE_8),child: Divider(height: SizeConstants.DIVIDER_1,color: Colors.black26)),
          Text("Work Description",style: TextStyle(fontSize:  SizeConstants.SIZE_18,fontWeight: FontWeight.bold, color: Colors.black54)),
          Padding(
            padding: const EdgeInsets.all( SizeConstants.SIZE_8),
            child: Text("This job is to fix tap leakage and or having new connection from tank to kitchen",style: TextStyle(fontSize:  SizeConstants.SIZE_16, color: Colors.black)),
          ),
          SizedBox(height:  SizeConstants.SIZE_8),
          Padding(padding:EdgeInsets.all( SizeConstants.SIZE_8),child: Divider(height: SizeConstants.DIVIDER_1,color: Colors.black26)),
                Padding(
            padding: const EdgeInsets.only(top: SizeConstants.SIZE_8,bottom:  SizeConstants.SIZE_8),
            child: Text("Contact Details",style: TextStyle(fontSize:  SizeConstants.SIZE_18,fontWeight: FontWeight.bold, color: Colors.black54)),
          ),
Column(crossAxisAlignment:CrossAxisAlignment.start,
  children: [
        Row(crossAxisAlignment:CrossAxisAlignment.start,children: [
      Padding(
        padding: const EdgeInsets.all( SizeConstants.SIZE_8),
        child: Icon(Icons.account_box),
      ),
      Padding(
        padding: const EdgeInsets.all( SizeConstants.SIZE_8),
        child: Text("Ismail Mac",style: TextStyle(fontSize:  SizeConstants.SIZE_16,fontWeight: FontWeight.w400, color: Colors.black)),
      )
    ],),
    Row(crossAxisAlignment:CrossAxisAlignment.start,children: [
      Padding(
        padding: const EdgeInsets.all( SizeConstants.SIZE_8),
        child: Icon(Icons.phone),
      ),
      Padding(
        padding: const EdgeInsets.all( SizeConstants.SIZE_8),
        child: Text("+91 62346 62346",style: TextStyle(fontSize:  SizeConstants.SIZE_16,fontWeight: FontWeight.w400, color: Colors.black)),
      )
    ],),
    Row(crossAxisAlignment:CrossAxisAlignment.start,children: [
      Padding(
        padding: const EdgeInsets.all( SizeConstants.SIZE_8),
        child: Icon(Icons.place),
      ),
      Padding(
        padding: const EdgeInsets.all( SizeConstants.SIZE_8),
        child: Text("3, 3rd Cross Street",softWrap:false,style: TextStyle(fontSize:  SizeConstants.SIZE_16,fontWeight: FontWeight.w400, color: Colors.black)),
      )
    ],),
  ],
),
          SizedBox(height:  SizeConstants.SIZE_8),
          Padding(padding:EdgeInsets.all( SizeConstants.SIZE_8),child: Divider(height: SizeConstants.DIVIDER_1,color: Colors.black26)),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(flex:1,child: FlatButton(onPressed: (){
                Navigator.of(context)
                    .pushNamed(NavConstants.ROUTE_JOB_HISTORY);
              }, child: Text("Job History",style: TextStyle(fontSize:  SizeConstants.SIZE_18,fontWeight: FontWeight.bold, color: Colors.black54),textAlign: TextAlign.left))),
              Icon(Icons.arrow_forward_ios, size:  SizeConstants.SIZE_16,)
            ],
          ),
          Padding(padding:EdgeInsets.all( SizeConstants.SIZE_8),child: Divider(height: SizeConstants.DIVIDER_1,color: Colors.black26)),
          Row(children: [
            Expanded(flex:1,child: RaisedButton(shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
                padding: EdgeInsets.all(SizeConstants.SIZE_16),color:ColorConstants.primaryDarkColor,child: Text("Update Job",style: TextStyle(fontSize:SizeConstants.SIZE_16,fontWeight: FontWeight.w500,color: Colors.white),),onPressed: (){
              Navigator.of(context)
                  .pushNamed(NavConstants.ROUTE_JOB_UPDATE);
            } )),
            SizedBox(width:  SizeConstants.SIZE_16,),
            Expanded(flex:1,child: RaisedButton(shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
                padding: EdgeInsets.all(SizeConstants.SIZE_16),color:ColorConstants.primaryDarkColor,child: Text("Start Job",style: TextStyle(fontSize:SizeConstants.SIZE_16,fontWeight: FontWeight.w500,color: Colors.white),),onPressed: (){
            // Alert
            } )),
          ],)
        ],
      ),
    );
  }

}
