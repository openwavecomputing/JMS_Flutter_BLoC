import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      body: ListView(padding: EdgeInsets.only(right: 16.0,left: 16.0, top: 16.0),
        children: [
          Text("Work Order",style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold, color: Colors.black54)),
          Text("123412342134",style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.w500, color: Colors.black)),
          SizedBox(height: 8.0),
          Text("Trade",style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold, color: Colors.black54)),
          Text("Carpentry",style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.w500, color: Colors.black)),
          SizedBox(height: 8.0),
          Text("Priority",style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold, color: Colors.black54)),
          Text("Medium",style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.w500, color: Colors.black)),
          SizedBox(height: 8.0),
          Text("Due Date",style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold, color: Colors.black54)),
          Text("Dec 20, 2020 4:40pm",style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.w500, color: Colors.black)),
          SizedBox(height: 8.0),
          Text("Supervisor",style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold, color: Colors.black54)),
          Text("John Kevin",style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.w500, color: Colors.black)),
          SizedBox(height: 8.0),
          Padding(padding:EdgeInsets.all(8.0),child: Divider(height: 1.0,color: Colors.black26)),
          Text("Work Description",style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold, color: Colors.black54)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("This job is to fix tap leakage and or having new connection from tank to kitchen",style: TextStyle(fontSize: 16.0, color: Colors.black)),
          ),
          SizedBox(height: 8.0),
          Padding(padding:EdgeInsets.all(8.0),child: Divider(height: 1.0,color: Colors.black26)),
                Padding(
            padding: const EdgeInsets.only(top:8.0,bottom: 8.0),
            child: Text("Contact Details",style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold, color: Colors.black54)),
          ),
Column(crossAxisAlignment:CrossAxisAlignment.start,
  children: [
        Row(crossAxisAlignment:CrossAxisAlignment.start,children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(Icons.account_box),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text("Ismail Mac",style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w400, color: Colors.black)),
      )
    ],),
    Row(crossAxisAlignment:CrossAxisAlignment.start,children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(Icons.phone),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text("+91 62346 62346",style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w400, color: Colors.black)),
      )
    ],),
    Row(crossAxisAlignment:CrossAxisAlignment.start,children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(Icons.place),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text("3, 3rd Cross Street",softWrap:false,style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w400, color: Colors.black)),
      )
    ],),
  ],
),
          SizedBox(height: 8.0),
          Padding(padding:EdgeInsets.all(8.0),child: Divider(height: 1.0,color: Colors.black26)),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(flex:1,child: FlatButton(onPressed: (){}, child: Text("Job History",style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold, color: Colors.black54),textAlign: TextAlign.left))),
              Icon(Icons.arrow_forward_ios, size: 16.0,)
            ],
          ),
          Padding(padding:EdgeInsets.all(8.0),child: Divider(height: 1.0,color: Colors.black26)),
          Row(children: [
            Expanded(flex:1,child: RaisedButton( color:Colors.blue,child: Text("Update Job",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white),),onPressed: (){} )),
            SizedBox(width: 16.0,),
            Expanded(flex:1,child: RaisedButton( color:Colors.blue,child: Text("Start Job",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white),),onPressed: (){} )),
          ],)
        ],
      ),
    );
  }

}
