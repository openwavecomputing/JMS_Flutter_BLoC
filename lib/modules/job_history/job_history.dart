import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jms_flutter_bloc/config/constants/size_constants.dart';
import 'package:jms_flutter_bloc/modules/job_list/bloc/job_list_bloc.dart';
import 'package:jms_flutter_bloc/modules/job_list/bloc/job_list_event.dart';
import 'package:jms_flutter_bloc/modules/job_list/bloc/job_list_state.dart';
import 'package:jms_flutter_bloc/modules/job_list/repo/job_list_repository.dart';
import 'package:jms_flutter_bloc/network/web_services.dart';
import 'package:jms_flutter_bloc/storage/sharedprefs/shared_prefs.dart';
import 'package:progress_dialog/progress_dialog.dart';

class JobHistory extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _JobHistoryState();
  }
}

class _JobHistoryState extends State<JobHistory> {
  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Job History",
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: SizeConstants.SIZE_20,
                color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return _buildJobHistory();
        },
      ),
    );
  }

  Widget _buildJobHistory() {
    return Card(
      elevation: 4,
      child: Container(
        padding: EdgeInsets.all(SizeConstants.SIZE_8),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Text(
                      "James Robert",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.blue,
                          fontSize: 16.0),
                    )),
                Text("27 Jan, 2021 4:30pm",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                        fontSize: 12.0)),
              ],
            ),
            SizedBox(
              height: 12.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left:SizeConstants.SIZE_8,right: SizeConstants.SIZE_8,bottom: SizeConstants.SIZE_8),
              child: Text(
                  "This job was taken but due to the reason and reason we cannot continue the same for several hours, so the next person who is up to take this job kindly carry respective tools along with you",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black87,
                      fontSize: SizeConstants.SIZE_15)),
            ),
          ],
        ),
      ),
    );
  }
}
