
import 'package:flutter/material.dart';

class JobPostPone extends StatefulWidget {
  @override
  _JobPostPoneState createState() => _JobPostPoneState();
}

class _JobPostPoneState extends State<JobPostPone> {
  final TextEditingController _inputTextField = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12.0, 4.0, 12.0, 4.0),
            child: TextField(
              keyboardType: TextInputType.multiline,
              minLines: 5,
              maxLines: null,
              textCapitalization: TextCapitalization.characters,
              controller: _inputTextField,
              decoration: InputDecoration(
                hintText: "Describe here",
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: RaisedButton(
            color: Colors.blue,
            onPressed: () {},
            child: Text(
              "Submit",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16.0,
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }
}
