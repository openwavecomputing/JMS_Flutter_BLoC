import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jms_flutter_bloc/config/constants/nav_constants.dart';
import 'package:jms_flutter_bloc/config/constants/size_constants.dart';
import 'package:jms_flutter_bloc/modules/job_list/bloc/job_list_bloc.dart';
import 'package:jms_flutter_bloc/modules/job_list/bloc/job_list_event.dart';
import 'package:jms_flutter_bloc/modules/job_list/bloc/job_list_state.dart';
import 'package:jms_flutter_bloc/modules/job_list/repo/job_list_repository.dart';
import 'package:jms_flutter_bloc/modules/job_list/repo/job_list_response.dart';
import 'package:jms_flutter_bloc/network/web_services.dart';
import 'package:jms_flutter_bloc/storage/sharedprefs/shared_prefs.dart';
import 'package:progress_dialog/progress_dialog.dart';

class JobListScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _JobListState();
  }
}

class _JobListState extends State<JobListScreen> {
  ProgressDialog _progressDialog;
  JobListBloc _jobListBloc;

  // BlocProvider<JobListBloc> _loginBlocProvider;

  @override
  void initState() {
    _progressDialog = ProgressDialog(context);
    final JobListRepository repository = JobListRepository(
        jmsApiClient: Webservices(), sharedPrefs: SharedPrefs());
    _jobListBloc = JobListBloc(repository: repository);
    // _loginBlocProvider = BlocProvider(create: (context) => _jobListBloc);
    fetchJobList(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Job List",
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: SizeConstants.SIZE_20,
                color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: BlocBuilder(
        cubit: _jobListBloc,
        builder: (context, state) {
          if (state is JobListInitial) {}
          if (state is JobListLoading) {
            // _progressDialog.show();
            return Center(child: Text("Loading..."));
          }
          if (state is JobListError) {
            _progressDialog.hide();
            return Center(child: Text("${state.failedValue.toString()}"));
          }
          if (state is JobListSuccess) {
            _progressDialog.hide();
            print('jobList size ${state.successValue.response.jobList.length}');
            print(
                'jobList workOrderNo ${state.successValue.response.jobList[0].workOrderNo}');
            print(
                'jobList tenantAddress ${state.successValue.response.jobList[0].tenantAddress}');
            if (state.successValue.response.jobList.length > 0) {
              return ListView.builder(
                itemCount: state.successValue.response.jobList.length,
                itemBuilder: (context, index) {
                  print(
                      'jobList workOrderNo ${state.successValue.response.jobList[index].workOrderNo}');
                  print(
                      'jobList tenantAddress ${state.successValue.response.jobList[index].tenantAddress}');
                  return _buildJobItem(
                      state.successValue.response.jobList[index]);
                },
              );
            } else {
              return Center(child: Text("No Jobs Found!"));
            }
          }
          return Center(child: Text("Loading..."));
        },
      ),
    );
  }

  Widget _buildJobItem(JobItem jobItem) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: () {
          Navigator.of(context)
              .pushNamed(NavConstants.ROUTE_JOB_DETAIL, arguments: jobItem);
        },
        child: Container(
          height: 80.0,
          padding: EdgeInsets.all(SizeConstants.SIZE_8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  flex: 1,
                  child: Text(
                    "Work Order No: ${jobItem.workOrderNo}",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.blue,
                        fontSize: 16.0),
                  )),
              Text("Location : ${jobItem.tenantAddress}",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                      fontSize: 12.0)),
            ],
          ),
        ),
      ),
    );
  }

  Future<String> fetchJobList(BuildContext context) async {
    _jobListBloc.add(JobListFetchEvent());
  }

  void showSnackbar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    Scaffold.of(context).showSnackBar(snackBar);
  }
}
