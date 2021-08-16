import 'package:flutter/material.dart';
import 'package:login/style.dart';
import 'package:login/widgets/custom_dialog_box.dart';
import 'package:login/widgets/profile_list_widget.dart';
import 'package:login/widgets/top_curved_banner.dart';

class RegisteredCoursesScreen extends StatefulWidget {
  const RegisteredCoursesScreen({Key key}) : super(key: key);

  @override
  _RegisteredCoursesScreenState createState() =>
      _RegisteredCoursesScreenState();
}

class _RegisteredCoursesScreenState extends State<RegisteredCoursesScreen> {
  //this key uniquely identifies the Form widget and allows validation of the form.
  final _formKey = GlobalKey<FormState>();
  // TextFormField controllers
  final _studentIdController = TextEditingController();
  final _passwordController = TextEditingController();
  //page title
  final String pagetitle = "Registered Courses";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Stack(
              children: [
                ClipPath(
                  //ProfileCripper class makes the top container to have curves
                  clipper: ProfileCripper(),
                  //Green widget at top (with Curves, lol)
                  child: TopCurveBanner(
                    title: pagetitle,
                  ),
                ),
              ],
            ),
            //Profile Menu ListView
            SizedBox(height: 3.0),
            _coursesList(),
            Padding(
              padding: EdgeInsets.only(
                bottom: 30.0,
                left: 320,
              ),
              //Floating Action Button to add a course
              child: FloatingActionButton(
                tooltip: "Add a Course",
                backgroundColor: Colors.green,
                onPressed: () => {
                  _addCouseItem(context),
                },
                child: Icon(
                  Icons.add,
                  size: 40,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

//Courses list view {./clickable?=>WhereTo?}
  Widget _coursesList() {
    return Expanded(
      child: ListView(
        shrinkWrap: true,
        children: [
          ProfileListItem(
            icon: Icons.library_books,
            text: "Intoduction To Programming",
            hasNavigation: false,
            height: 60.0,
          ),
          ProfileListItem(
            icon: Icons.library_books,
            text: "Communication Skills 1",
            hasNavigation: false,
            height: 60.0,
          ),
          ProfileListItem(
            icon: Icons.library_books,
            text: "Pre-Calculus",
            hasNavigation: false,
            height: 60.0,
          ),
          ProfileListItem(
            icon: Icons.library_books,
            text: "Computer Architecture & Organisation",
            hasNavigation: false,
            height: 60.0,
          ),
          ProfileListItem(
            icon: Icons.library_books,
            text: "Computer Networks 1",
            height: 60.0,
            hasNavigation: false,
          ),
        ],
      ),
    );
  }

  //Pop up Dialog to add course
  Future _addCouseItem(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        //Custom dialog (reusable widget)
        return CustomDialogBox(
          title: "Custom Dialog",
          widgetContent: _addCourseForm(),
          descriptions: "lol",
          text: "yes",
          hasImage: false,
          hasWidget: true,
        );
      },
    );
  }

  Widget _addCourseForm() {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(
          right: 10,
          left: 10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              // height: 100.0,
              width: 200.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
              ),
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 80.0, maxWidth: 80.0),
                  child: Form(
                    key: _formKey,
                    child: Wrap(
                      children: [
                        TextFormField(
                          controller: _studentIdController,
                          decoration: InputDecoration(
                            fillColor: mzuniGreen,
                            prefixIcon: Icon(
                              Icons.account_circle,
                              color: mzuniGreen,
                            ),
                            border: UnderlineInputBorder(),
                            hintText: "Student ID",
                            hintStyle:
                                Theme.of(context).textTheme.caption.copyWith(
                                      color: Color(0xFFE1E1E1),
                                    ),
                            // TextStyle(color: Color(0xFFE1E1E1), fontSize: 14),
                          ),
                          validator: _validateStudent,
                        ),
                        SizedBox(),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock),
                            border: UnderlineInputBorder(),
                            hintText: "Password",
                            hintStyle:
                                Theme.of(context).textTheme.caption.copyWith(
                                      color: Color(0xFFE1E1E1),
                                    ),
                          ),
                          validator: _validatePassword,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
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
}
