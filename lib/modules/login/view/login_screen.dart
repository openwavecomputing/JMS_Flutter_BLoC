import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jms_flutter_bloc/config/constants/asset_constants.dart';
import 'package:jms_flutter_bloc/config/constants/color_constants.dart';
import 'package:jms_flutter_bloc/config/constants/message_constants.dart';
import 'package:jms_flutter_bloc/config/constants/nav_constants.dart';
import 'package:jms_flutter_bloc/config/constants/size_constants.dart';
import 'package:jms_flutter_bloc/modules/login/bloc/login_bloc.dart';
import 'package:jms_flutter_bloc/modules/login/bloc/login_event.dart';
import 'package:jms_flutter_bloc/modules/login/bloc/login_state.dart';
import 'package:jms_flutter_bloc/modules/login/repo/login_repository.dart';
import 'package:jms_flutter_bloc/network/web_constants.dart';
import 'package:jms_flutter_bloc/network/web_services.dart';
import 'package:jms_flutter_bloc/storage/sharedprefs/shared_prefs.dart';
import 'package:jms_flutter_bloc/utils/app_utils.dart';
import 'package:jms_flutter_bloc/utils/device_utils.dart';
import 'package:progress_dialog/progress_dialog.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<LoginScreen> {
  final TextEditingController _usernameController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();

  ProgressDialog _progressDialog;
  LoginBloc _loginBloc;
  BlocProvider<LoginBloc> _loginBlocProvider;

  @override
  void initState() {
    _progressDialog = ProgressDialog(context);
    // _usernameController.text = "MNI149";
    // _passwordController.text = "dhamu1";

    _usernameController.text = "MNI126";
    _passwordController.text = "123456";

    final LoginRepository repository = LoginRepository(
        jmsApiClient: Webservices(), sharedPrefs: SharedPrefs());
    _loginBloc = LoginBloc(repository: repository);
    // _loginBlocProvider = BlocProvider(create:  (context) => _loginBloc);
  }

  Future<String> _submitLogin(BuildContext context) async {
    if (_usernameController.text.toString().isEmpty) {
      print(MessageConstants.MESSAGE_LOGIN_USERNAME_EMPTY);
      showSnackbar(context, MessageConstants.MESSAGE_LOGIN_USERNAME_EMPTY);
    } else if (_passwordController.text.toString().isEmpty) {
      print(MessageConstants.MESSAGE_LOGIN_PASSWORD_EMPTY);
      showSnackbar(context, MessageConstants.MESSAGE_LOGIN_PASSWORD_EMPTY);
    } else {
      // _progressDialog.show();
      Map<String, String> loginMapValues = {
        WebConstants.LOGIN_1_USERNAME: _usernameController.text.toString(),
        WebConstants.LOGIN_2_PASSWORD: _passwordController.text.toString(),
        WebConstants.LOGIN_3_PASSCODE: WebConstants.PASSCODE,
        WebConstants.LOGIN_4_DEVICE_ID: await DeviceUtils.getDeviceDetails(),
        WebConstants.LOGIN_5_DEVICE_TOKEN: "ios1234",
        WebConstants.LOGIN_6_DEVICE_PLATFORM: DeviceUtils.getPlatform(),
        WebConstants.LOGIN_7_APP_VERSION: await AppUtils.getAppVersionNumber(),
        WebConstants.LOGIN_8_PROCEED: "1",
      };
      _loginBloc.add(LoginClickEvent(loginMappedValues: loginMapValues));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: BlocConsumer<LoginBloc, LoginState>(
            cubit: _loginBloc,
            listener: (context, state) {
              if (state is LoginEmpty) {
                print("listener LoginEmpty");
              }
              if (state is LoginLoading) {
                print("listener LoginLoading");
                _progressDialog.show();
              }
              if (state is LoginError) {
                print("listener LoginError");
                _progressDialog.hide();
                showSnackbar(context, "${state.message}");
              }
              if (state is LoginSuccess) {
                print("listener LoginSuccess");
                _progressDialog.hide();
                Navigator.of(context)
                    .pushReplacementNamed(NavConstants.ROUTE_JOB_LIST);
              }
            },
            builder: (context, state) {
              return buildLoginView(context);
            }),
      ),
    );
  }

  Widget buildLoginView(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: SizeConstants.FLEX_3,
          child: Padding(
              padding: const EdgeInsets.all(SizeConstants.SIZE_26),
              child: const Image(
                  fit: BoxFit.fitWidth,
                  image: const AssetImage(AssetConstants.splashAppImage))),
        ),
        Expanded(
          flex: SizeConstants.FLEX_7,
          child: Container(
            alignment: Alignment.topCenter,
            child: Card(
              margin: EdgeInsets.all(SizeConstants.SIZE_20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 5,
              child: Container(
                height: SizeConstants.SIZE_300,
                width: SizeConstants.SIZE_340,
                padding: EdgeInsets.all(SizeConstants.SIZE_20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    TextField(
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
                        LengthLimitingTextInputFormatter(8)
                      ],
                      controller: _usernameController,
                      decoration: InputDecoration(hintText: "Username"),
                    ),
                    TextField(
                      controller: _passwordController,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp('[a-zA-Z0-9]')),
                        LengthLimitingTextInputFormatter(12)
                      ],
                      obscureText: true,
                      decoration: InputDecoration(hintText: "Password"),
                    ),
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      padding: EdgeInsets.all(SizeConstants.SIZE_12),
                      child: Text("Login",
                          style: TextStyle(fontSize: SizeConstants.SIZE_16)),
                      onPressed: () {
                        _submitLogin(context);
                      },
                      color: ColorConstants.primaryDarkColor,
                      textColor: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void showSnackbar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    Scaffold.of(context).showSnackBar(snackBar);
  }
}
