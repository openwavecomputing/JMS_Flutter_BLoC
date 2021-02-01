import 'package:flutter/material.dart';
import 'package:jms_flutter_bloc/config/constants/color_constants.dart';
import 'package:jms_flutter_bloc/config/constants/size_constants.dart';

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
          Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(SizeConstants.SIZE_12, SizeConstants.SIZE_4, SizeConstants.SIZE_12, SizeConstants.SIZE_4),
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
            padding: const EdgeInsets.all(SizeConstants.SIZE_8),
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
}
