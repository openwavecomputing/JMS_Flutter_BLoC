import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jms_flutter_bloc/config/constants/color_constants.dart';
import 'package:jms_flutter_bloc/config/constants/size_constants.dart';
import 'package:jms_flutter_bloc/modules/tenant_status/tenant_others/reason.dart';

class TenantOthers extends StatefulWidget {
  @override
  _TenantOthersState createState() => _TenantOthersState();
}

class _TenantOthersState extends State<TenantOthers> {
  List<Reason> reasons = [
    Reason("1", "Technician visit the site and the job is closed by client"),
    Reason("2", "Wrong address provided in the work order"),
    Reason("3", "Tenant denies entry to the premises"),
    Reason("4", "Technician visit the site and the job is done by others"),
    Reason("4", "Technician visit the site and the job is done by others"),
    Reason("4", "Technician visit the site and the job is done by others"),

  ];
  final TextEditingController _inputTextField = new TextEditingController();
  int _radioValue = 0;
  String _radioTextValue = "Yes";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Other Reasons",
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 20.0,
                color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: _buildReasons(),
      ),
    );
  }

  List<Widget> _buildReasons() {
    List<Widget> reasonWidgets = [];
    reasons.forEach((element) {
      reasonWidgets.add(Card(
        child: Row(
          textDirection: TextDirection.ltr,
          children: [
            Radio<int>(
                value: 0,
                activeColor: Colors.green,
                groupValue: _radioValue,
                ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "${element.reasonName}", textAlign: TextAlign.start,
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20.0),
                ),
              ),
            ),
          ],
        ),
      ));
    });
    reasonWidgets.add(SizedBox(height: 16.0));
    reasonWidgets.add( Container(
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
    ));
    reasonWidgets.add(SizedBox(height: 16.0));
    reasonWidgets.add( Padding(
      padding: const EdgeInsets.all(8.0),
      child:  RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        padding: EdgeInsets.all(SizeConstants.SIZE_16),
        child: Text("Submit",
            style: TextStyle(fontSize: SizeConstants.SIZE_16)),
        onPressed: () {
          print("Submit");
        },
        color: ColorConstants.primaryDarkColor,
        textColor: Colors.white,
      ),
    ));
    return reasonWidgets;
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
  // Widget _buildBottom() {
  //   return ListView(
  //     children: [
  //       Container(
  //         color: Colors.white,
  //         child: Padding(
  //           padding: const EdgeInsets.fromLTRB(12.0, 4.0, 12.0, 4.0),
  //           child: TextField(
  //             keyboardType: TextInputType.multiline,
  //             minLines: 5,
  //             maxLines: null,
  //             textCapitalization: TextCapitalization.characters,
  //             controller: _inputTextField,
  //             decoration: InputDecoration(
  //               hintText: "Describe here",
  //             ),
  //           ),
  //         ),
  //       ),
  //       Padding(
  //         padding: const EdgeInsets.all(8.0),
  //         child: RaisedButton(
  //           color: Colors.blue,
  //           onPressed: () {},
  //           child: Text(
  //             "Submit",
  //             style: TextStyle(
  //               fontWeight: FontWeight.w500,
  //               fontSize: 16.0,
  //               color: Colors.white,
  //             ),
  //           ),
  //         ),
  //       )
  //     ],
  //   );
  // }
}
