import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_signature_pad/flutter_signature_pad.dart';
import 'package:jms_flutter_bloc/config/constants/color_constants.dart';
import 'package:jms_flutter_bloc/config/constants/size_constants.dart';

class FeedbackScreen extends StatefulWidget {
  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  bool isTechnicianOnTime = false;
  bool isExplainedClearly = false;
  bool isCircuitsRestored = false;

  int _radioValueOnTime = 0;
  int _radioValueExplainedClearly = 1;
  int _radioCircuitsRestored = 2;

  String _radioTextValue = "Yes";

  final _sign = GlobalKey<SignatureState>();

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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "1.Were they polite and courteous?",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.normal),
            ),
          ),
          Container(
            padding: EdgeInsets.all(12.0),
            alignment: Alignment.center,
            child: RatingBar.builder(
              initialRating: 4,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("2.Was the work area left clean?",
                style:
                    TextStyle(fontSize: 18.0, fontWeight: FontWeight.normal)),
          ),
          Container(
            padding: EdgeInsets.all(12.0),
            alignment: Alignment.center,
            child: RatingBar.builder(
              initialRating: 4,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
                "3.How would you rate the level of\nprovided service today?",
                style:
                    TextStyle(fontSize: 18.0, fontWeight: FontWeight.normal)),
          ),
          Container(
            padding: EdgeInsets.all(12.0),
            alignment: Alignment.center,
            child: RatingBar.builder(
              initialRating: 4,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("4.Were they on time for the their appointment?",
                style:
                    TextStyle(fontSize: 18.0, fontWeight: FontWeight.normal)),
          ),
          Container(
            alignment: Alignment.center,
            child: Row(
              children: [
                Radio<int>(
                    value: 0,
                    activeColor: Colors.green,
                    groupValue: _radioValueOnTime,
                    onChanged: _processRadioChanged),
                Text(
                  "Yes",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20.0),
                ),
                Radio<int>(
                    value: 1,
                    activeColor: Colors.green,
                    groupValue: _radioValueOnTime,
                    onChanged: _processRadioChanged),
                Text(
                  "No",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20.0),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
                "5.Was the result of the work done explain clearly to you?",
                style:
                    TextStyle(fontSize: 18.0, fontWeight: FontWeight.normal)),
          ),
          Container(
            alignment: Alignment.center,
            child: Row(
              children: [
                Radio<int>(
                    value: 0,
                    activeColor: Colors.green,
                    groupValue: _radioValueOnTime,
                    onChanged: _processRadioChanged),
                Text(
                  "Yes",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20.0),
                ),
                Radio<int>(
                    value: 1,
                    activeColor: Colors.green,
                    groupValue: _radioValueOnTime,
                    onChanged: _processRadioChanged),
                Text(
                  "No",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20.0),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("6.Has all the power and light circuits been restored?",
                style:
                    TextStyle(fontSize: 18.0, fontWeight: FontWeight.normal)),
          ),
          Container(
            alignment: Alignment.center,
            child: Row(
              children: [
                Radio<int>(
                    value: 0,
                    activeColor: Colors.green,
                    groupValue: _radioValueOnTime,
                    onChanged: _processRadioChanged),
                Text(
                  "Yes",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20.0),
                ),
                Radio<int>(
                    value: 1,
                    activeColor: Colors.green,
                    groupValue: _radioValueOnTime,
                    onChanged: _processRadioChanged),
                Text(
                  "No",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20.0),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Signature", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),),
          ),
          Container(
            color: Colors.blue,
            height: 240,
            width: 360,
            // child: Text("asdflkhasdflkjasdflksdf"),
            child: Signature(
              color: Colors.black,
              // Color of the drawing path
              strokeWidth: 3.0,
              // with
              backgroundPainter: null,
              // Additional custom painter to draw stuff like watermark
              onSign: (){        final sign = _sign.currentState;},
              // Callback called on user pan drawing
              key:
                  null, // key that allow you to provide a GlobalKey that'll let you retrieve the image once user has signed
            ),
          ),
          RaisedButton(child:Text("Clear Signature"),onPressed: (){_sign.currentState.clear();},),
          RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            padding: EdgeInsets.all(SizeConstants.SIZE_16),
            child: Text("Submit",
                style: TextStyle(fontSize: SizeConstants.SIZE_16)),
            onPressed: () {
              print("Tenant Others");
            },
            color: ColorConstants.primaryDarkColor,
            textColor: Colors.white,
          )
        ],
      ),
    );
  }

  void _processRadioChanged(int value) {
    setState(() {
      _radioValueOnTime = value;
      print("radioValue $_radioValueOnTime");
      switch (_radioValueOnTime) {
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
