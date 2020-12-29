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
      body: Container(
        child: BlocConsumer<JobListBloc, JobListState>(
          cubit: _jobListBloc,
          listener: (context, state) {
            if (state is JobListInitial) {}
            if (state is JobListLoading) {
              _progressDialog.show();
            }
            if (state is JobListError) {
              _progressDialog.hide();
              return Center(child: Text("${state.failedValue.toString()}"));
            }
            if (state is JobListSuccess) {
              _progressDialog.hide();
              state.successValue.response.jobList.forEach((element) {
                print("element ${element.jobId}");
              });
            }
          },
          builder: (context, state) {
            return Center(child: Text("Check values"));
          },
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
