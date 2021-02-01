import 'package:flutter/material.dart';

class FeedbackScreen extends StatefulWidget {
  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Feedback",
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 20.0,
                color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        children: [
          Text("1.Were they polite and courteous?"),
          Text("2.Was the work area left clean?"),
          Text("3.How would you rate the level of\nprovided service today?"),
          Text("4.Were they on time for the their appointment?"),
          Text("5.Was the result of the work done explain clearly to you?"),
          Text("6.Has all the power and light circuits been restored?"),
        ],
      ),
    );
  }
}
