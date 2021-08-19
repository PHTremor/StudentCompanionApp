import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:login/routes.dart';
import 'package:login/style.dart';

class LoginFormWidget extends StatefulWidget {
  final double topRight;
  final double bottomRight;

  const LoginFormWidget(this.topRight, this.bottomRight);

  @override
  _LoginFormWidgetState createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  //this key uniquely identifies the Form widget and allows validation of the form.
  final _formKey = GlobalKey<FormState>();

  // TextFormField controllers
  final _studentIdController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 70.0, bottom: 30.0),
      child: Container(
        width: MediaQuery.of(context).size.width - 40,
        height: MediaQuery.of(context).size.height - 40,
        //Container with elevation holding the login form
        child: Material(
          elevation: 10.0,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(widget.bottomRight),
              topRight: Radius.circular(widget.topRight),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(
                left: 20.0, right: 40.0, top: 10.0, bottom: 10.0),
            child: Expanded(
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Wrap(
                      children: [
                        studentIDField(context),
                        SizedBox(),
                        passwordField(context),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget passwordField(BuildContext context) {
    return TextFormField(
      controller: _passwordController,
      obscureText: true,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.lock),
        border: UnderlineInputBorder(),
        hintText: "Password",
        hintStyle: Theme.of(context).textTheme.caption.copyWith(
              color: Color(0xFFE1E1E1),
            ),
      ),
      validator: _validatePassword,
    );
  }

  Widget studentIDField(BuildContext context) {
    return TextFormField(
      controller: _studentIdController,
      decoration: InputDecoration(
        fillColor: mzuniGreen,
        prefixIcon: Icon(Icons.account_circle),
        border: UnderlineInputBorder(),
        hintText: "Student ID",
        hintStyle: Theme.of(context).textTheme.caption.copyWith(
              color: Color(0xFFE1E1E1),
            ),
        // TextStyle(color: Color(0xFFE1E1E1), fontSize: 14),
      ),
      validator: _validateStudent,
    );
  }

//String? to allow nullubility
//returns an error to the form validator
  String _validateStudent(String value) {
    if (value.isEmpty) {
      return "Field cannot be empty";
    } else {
      return null;
    }
  }

//String? to allow nullubility
//returns an error to the form validat
  String _validatePassword(String value) {
    if (value.length < 8) {
      return "At least 8 chars!";
    } else {
      return null;
    }
  }

//use provider to cache _formkey and move method to login_iu
  void loginLogic() {
    if (_formKey.currentState?.validate() ?? false) {
      Navigator.of(context)?.pushNamed(RouteGenerator.profilePage);
    } else {
      //Alert an error
      print("Something wrong with the Credentials");
    }
  }
}
