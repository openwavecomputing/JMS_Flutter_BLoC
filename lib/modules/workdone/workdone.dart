import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WorkDoneScreen extends StatefulWidget {
  @override
  _WorkDoneScreenState createState() => _WorkDoneScreenState();
}

class _WorkDoneScreenState extends State<WorkDoneScreen> {
  final descriptionController = TextEditingController();
  final locationController = TextEditingController();
  FocusNode descriptionFocusNode;
  FocusNode locationFocusNode;

  @override
  void initState() {
    super.initState();
    descriptionFocusNode = FocusNode();
    locationFocusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Work Done",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 20.0,
                  color: Colors.white)),
          backgroundColor: Colors.blue,
        ),
        body: Column(
          children: [
            Expanded(
              child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: 500,
                    padding: EdgeInsets.all(16.0),
                    color: Colors.black26,
                    child: Text(
                      "Work Order : 123372345",
                      style: TextStyle(fontSize: 18.0, color: Colors.black),
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)),
                    hintText: 'Description',
                    labelText: 'Description'),
                maxLength: 1000,
                controller: descriptionController,
                cursorColor: Colors.blue,
                focusNode: descriptionFocusNode,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16.0,
                    color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                  decoration: new InputDecoration(
                      border: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.blue)),
                      hintText: 'Location',
                      labelText: 'Location'),
                  maxLength: 50,
                  controller: locationController,
                  cursorColor: Colors.blue,
                  focusNode: locationFocusNode,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16.0,
                      color: Colors.black)),
            ),
            const Spacer(),
            Expanded(
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: 300,
                    child: MaterialButton(
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(8.0),
                        ),
                        color: Colors.blue,
                        textColor: Colors.white,
                        child: Text("Submit"),
                        //    style: TextStyle(fontSize: 14)
                        onPressed: () {
                          setState(() {});
                        }),
                  )),
            ),
            /*Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 175),
              child: MaterialButton(
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(8.0),
                  ),
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text("Submit"),
                  //    style: TextStyle(fontSize: 14)
                  onPressed: () {
                    setState(() {});
                  }),
            )*/
          ],
        ));
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    descriptionController.dispose();
    locationController.dispose();
    descriptionFocusNode.dispose();
    locationFocusNode.dispose();
    super.dispose();
  }
}
