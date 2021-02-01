
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jms_flutter_bloc/config/constants/color_constants.dart';
import 'package:jms_flutter_bloc/config/constants/size_constants.dart';
import 'package:jms_flutter_bloc/utils/date_utils.dart';

class JobPostPone extends StatefulWidget {
  @override
  _JobPostPoneState createState() => _JobPostPoneState();
}

class _JobPostPoneState extends State<JobPostPone> {
  final TextEditingController _inputTextField = new TextEditingController();
  DateTime currentDateTime;
  DateTime startDateTime;
  String startDate;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentDateTime =  DateTime.now().add(Duration(days: 1));
    startDateTime = currentDateTime;

    startDate =
        DateUtils().getFormattedDateForDisplay(startDateTime.toString());
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        InkWell(
          onTap: (){getPlatformDatePicker(context);},
          child: Padding(
            padding: const EdgeInsets.only(top:32.0,bottom: 32.0, left: 16.0, right:16.0),
            child: Row(
              children: [
                Expanded(flex:1,child: Text("$startDate",style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold, color: Colors.black54))),
                Icon(Icons.calendar_today)
              ],
            ),
          ),
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
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            padding: EdgeInsets.all(SizeConstants.SIZE_16),color:ColorConstants.primaryDarkColor,
            onPressed: () {},
            child: Text(
              "Submit",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: SizeConstants.SIZE_18,
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }

  Future<Null> getPlatformDatePicker(BuildContext context) {
    if (Platform.isAndroid) {
      selectAndroidDate(context);
    } else {
      selectIOSDate(context);
    }
  }
  Future<Null> selectAndroidDate(BuildContext context) async {
    final DateTime pickedDateTime = await showDatePicker(
        context: context,
        helpText: "Select Date",
        initialDate: DateTime.now().add(Duration(days: 1)),
        firstDate: DateTime.now().add(Duration(days: 1)),
        lastDate: DateTime.now().add(Duration(days: 30)));

    if (pickedDateTime != null && pickedDateTime != currentDateTime) {
      print("Postpone Date is ${pickedDateTime.toString()}");
      print(
          "Picked DateUtils is ${DateUtils().getFormattedDateForDisplay(pickedDateTime.toString())}");
      setState(() {
        startDateTime = pickedDateTime;
        startDate =
            DateUtils().getFormattedDateForDisplay(pickedDateTime.toString());
      });
    }
  }

  Future<Null> selectIOSDate(BuildContext context) async {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            height: 270.0,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          "Postpone Date",
                          style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: ColorConstants.primaryDarkColor),
                        ),
                      ),
                      RaisedButton(
                        color: ColorConstants.primaryDarkColor,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Done",
                            style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w400,
                                color: ColorConstants.whiteColor),
                            textAlign: TextAlign.end,
                          ),
                        ),
                        onPressed: () {
                          print("Date Done Clicked");
                          Navigator.pop(context);
                        },
                      )
                    ],
                  ),
                ),
                selectIOSDatePicker(context),
              ],
            ),
          );
        });
  }
  Widget selectIOSDatePicker(BuildContext context) {
    return SizedBox(
      height: 220.0,
      child: CupertinoDatePicker(
        minimumDate: DateTime.now().subtract(Duration(days: 365)),
        maximumDate: DateTime.now().add(Duration(days: 365)),
        initialDateTime: currentDateTime,
        mode: CupertinoDatePickerMode.date,
        onDateTimeChanged: (dateTime) {
          if (dateTime != null && dateTime != currentDateTime) {
            print("Picked Date is ${dateTime.toString()}");
            print(
                "Picked DateUtils is ${DateUtils().getFormattedDateForDisplay(dateTime.toString())}");

            setState(() {
              startDateTime = dateTime;
              startDate =
                  DateUtils().getFormattedDateForDisplay(dateTime.toString());
            });
          }
        },
      ),
    );
  }
}
