import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jms_flutter_bloc/config/constants/size_constants.dart';
import 'package:jms_flutter_bloc/modules/job_list/repo/job_list_response.dart';

class JobHistory extends StatefulWidget {
  List<JobHistoryObject> listJobHistory;

  JobHistory({Key key, this.listJobHistory}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _JobHistoryState(listJobHistory);
  }
}

class _JobHistoryState extends State<JobHistory> {
  List<JobHistoryObject> jobHistoryList;

  _JobHistoryState(this.jobHistoryList);

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Job History",
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: SizeConstants.SIZE_20,
                color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: _jobHistoryList(),
    );
  }

  Widget _jobHistoryList() {
    if (jobHistoryList.length > 0) {
      return ListView.builder(
        itemCount: jobHistoryList.length,
        itemBuilder: (context, index) {
          return _buildJobHistory(jobHistoryList[index]);
        },
      );
    } else {
      return Center(child: Text("No History Found!"));
    }
  }

  Widget _buildJobHistory(JobHistoryObject jobHistory) {
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
                      "${jobHistory.name}",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.blue,
                          fontSize: 16.0),
                    )),
                Text("${jobHistory.dateTime}",
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
              padding: const EdgeInsets.only(
                  left: SizeConstants.SIZE_8,
                  right: SizeConstants.SIZE_8,
                  bottom: SizeConstants.SIZE_8),
              child: Text("${jobHistory.description}",
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
