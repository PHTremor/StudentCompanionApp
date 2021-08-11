import 'package:flutter/material.dart';
import 'package:login/screens/login/background.dart';
import 'package:login/screens/login/login_ui.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: LayoutBuilder(
          builder: (BuildContext context, dimensions) {
            //device dimension to keep the page responsive
            final width = dimensions.maxWidth;
            final height = dimensions.maxHeight;

            return Container(
              width: width,
              height: height,
              child: Stack(
                children: <Widget>[
                  // green/yellow Background
                  Background(),
                  //Holds the form...
                  SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: height / 1.5,
                        maxWidth: width / 1.1,
                      ),
                      child: LoginUi(),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
