import 'package:flutter/material.dart';

class HazardForm extends StatefulWidget {
  @override
  _HazardFormState createState() => _HazardFormState();
}

class _HazardFormState extends State<HazardForm> {
  int _radioValue = 0;
  String _radioTextValue = "Yes";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hazard Form",
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 20.0,
                color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return _buildHazardFormItem();
        },
      ),
    );
  }

  Widget _buildHazardFormItem() {
    return Card(
      elevation: 3,
      child: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
                "Do you have your ID card and white card with you? this is the test content to check the wrap options",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.black87,
                    fontSize: 18.0),
                textAlign: TextAlign.start),
            SizedBox(
              height: 8.0,
            ),
            Row(
              children: [
                Radio<int>(
                    value: 0,
                    activeColor: Colors.green,
                    groupValue: _radioValue,
                    onChanged: _processRadioChanged),
                Text(
                  "Yes",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20.0),
                ),
                Radio<int>(
                    value: 1,
                    activeColor: Colors.green,
                    groupValue: _radioValue,
                    onChanged: _processRadioChanged),
                Text(
                  "No",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20.0),
                ),
              ],
            ),
            TextField()
          ],
        ),
      ),
    );
  }

  void _processRadioChanged(int value) {
    setState(() {
      _radioValue = value;
      print("radioValue $_radioValue");
      switch (_radioValue) {
        case 0:
          _radioTextValue = "Yes";
          break;
        case 1:
          _radioTextValue = "No";
          break;
      }
    });
  }
}
