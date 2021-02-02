import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class WorkInProgressScreen extends StatefulWidget {
  @override
  _WorkInProgressScreenState createState() => _WorkInProgressScreenState();
}

class _WorkInProgressScreenState extends State<WorkInProgressScreen> {
  List<Image> beforeImages = [];
  List<Image> afterImages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Work In Progress",
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 20.0,
                color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: Container(
          child: Column(
        children: [
          Expanded(
            child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: 500,
                  padding: EdgeInsets.all(8.0),
                  color: Colors.black26,
                  child: Text(
                    "Work Order : 123372345",
                    style: TextStyle(fontSize: 18.0, color: Colors.black),
                  ),
                )),
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(8.0),
                  ),
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text("Upload Image Before progress"),
                  //    style: TextStyle(fontSize: 14)
                  onPressed: () {
                    _pickedImageCameraOrGallery(1);
                    setState(() {});
                  })),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20.0),
            height: 100.0,
            child: _listViewBuilder(beforeImages),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(8.0),
                ),
                color: Colors.blue,
                textColor: Colors.white,
                child: Text("Upload Image after progress"),
                //    style: TextStyle(fontSize: 14)
                onPressed: () {
                  _pickedImageCameraOrGallery(2);
                  setState(() {});
                }),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20.0),
            height: 100.0,
            child: _listViewBuilder(afterImages),
          ),
          Row(
            children: [
              Expanded(
                child: Center(
                    child: MaterialButton(
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(8.0),
                        ),
                        color: Colors.blue,
                        textColor: Colors.white,
                        child: Text("TBC"),
                        //    style: TextStyle(fontSize: 14)
                        onPressed: () {
                          setState(() {});
                        })),
              ),
              Expanded(
                child: Center(
                    child: MaterialButton(
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(8.0),
                        ),
                        color: Colors.blue,
                        textColor: Colors.white,
                        child: Text("Completed"),
                        //    style: TextStyle(fontSize: 14)
                        onPressed: () {
                          setState(() {});
                        })),
              )
            ],
          ),
        ],
      )),
    );
  }

  void _pickedImageCameraOrGallery(int state) {
    final imagePicker = ImagePicker();
    showDialog<ImageSource>(
      context: context,
      builder: (context) =>
          AlertDialog(content: Text("Choose image source"), actions: [
              FlatButton(
                child: Text("Camera"),
                onPressed: () => Navigator.pop(context, ImageSource.camera),
              ),
              FlatButton(
                child: Text("Gallery"),
                onPressed: () => Navigator.pop(context, ImageSource.gallery),
              ),
      ]),
    ).then((ImageSource source) async {
      if (source != null) {
        final pickedFile = await imagePicker.getImage(source: source);
        setState(() => {
              if (state == 1)
                {
                  beforeImages.add(Image(
                    image: FileImage(File(pickedFile.path)),
                    width: 75,
                    height: 100,
                  ))
                }
              else if (state == 2)
                {
                  afterImages.add(Image(
                    image: FileImage(File(pickedFile.path)),
                    width: 75,
                    height: 100,
                  ))
                }
            });
      }
    });
  }

  Widget _listViewBuilder(List<Image> images) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: images.length,
      itemBuilder: (context, i) => Row(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 8.0,
            shadowColor: Colors.blue,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  images[i],
                ],
              ),
            ),
          ),
        ),
        // images[i],
        Divider()
      ]),
    );
  }
}
