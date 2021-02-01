import 'package:flutter/material.dart';
import 'package:jms_flutter_bloc/config/constants/size_constants.dart';

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
                fontSize: SizeConstants.SIZE_20,
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
      elevation: SizeConstants.ELEVATION_3,
      child: Container(
        padding: EdgeInsets.all(SizeConstants.SIZE_8),
        child: Column(
          children: [
            Text(
                "Do you have your ID card and white card with you? this is the test content to check the wrap options",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.black87,
                    fontSize: SizeConstants.SIZE_18),
                textAlign: TextAlign.start),
            SizedBox(
              height: SizeConstants.SIZE_8,
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
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: SizeConstants.SIZE_20),
                ),
                Radio<int>(
                    value: 1,
                    activeColor: Colors.green,
                    groupValue: _radioValue,
                    onChanged: _processRadioChanged),
                Text(
                  "No",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: SizeConstants.SIZE_20),
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
