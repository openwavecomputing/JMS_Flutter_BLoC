import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jms_flutter_bloc/modules/job_list/bloc/job_list_bloc.dart';
import 'package:jms_flutter_bloc/modules/job_list/bloc/job_list_event.dart';
import 'package:jms_flutter_bloc/modules/job_list/bloc/job_list_state.dart';
import 'package:jms_flutter_bloc/modules/job_list/repo/job_list_repository.dart';
import 'package:jms_flutter_bloc/modules/job_update/job_closed_by_tenant.dart';
import 'package:jms_flutter_bloc/modules/job_update/job_postpone.dart';
import 'package:jms_flutter_bloc/network/web_services.dart';
import 'package:jms_flutter_bloc/storage/sharedprefs/shared_prefs.dart';
import 'package:progress_dialog/progress_dialog.dart';

class JobUpdate extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _JobUpdateState();
  }
}

class _JobUpdateState extends State<JobUpdate>   with SingleTickerProviderStateMixin  {

  TabController _tabController;
  String appTitleText = "PostPone";

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabChange);
    super.initState();
  }
  void _handleTabChange() {
    if (_tabController.index == 0) {
      setState(() {
        appTitleText = "PostPone";
      });
    } else {
      setState(() {
        appTitleText = "Closed By Tenant";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Job",
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 20.0,
                color: Colors.white)),
        bottom: TabBar(
          tabs: [
            Tab(
              text: "PostPone",
            ),
            Tab(
              text: "Closed By Tenant",
            )
          ],
          indicatorColor: Colors.white,
          controller: _tabController,
        ),
        backgroundColor: Colors.blue,
      ),
      body: TabBarView(
        children: [
          Center(child: JobPostPone()),
          Center(child: JobClosedByTenant()),
        ],
        controller: _tabController,
      ),
    );
  }
}
