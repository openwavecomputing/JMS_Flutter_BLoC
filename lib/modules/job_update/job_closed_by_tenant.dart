import 'package:flutter/material.dart';

class JobClosedByTenant extends StatefulWidget {
  @override
  _JobClosedByTenantState createState() => _JobClosedByTenantState();
}

class _JobClosedByTenantState extends State<JobClosedByTenant> {
  final TextEditingController _inputTextField = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: [
          Row(
            children: [
              Text("Select Date",style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold, color: Colors.black54)),
              Icon(Icons.calendar_today)
            ],
          ),
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
