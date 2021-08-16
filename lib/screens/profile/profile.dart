import 'package:flutter/material.dart';
import 'package:login/responsive/sizing/base_widget.dart';
import 'package:login/responsive/sizing/sizing_information.dart';
import 'package:login/routes.dart';
import 'package:login/widgets/curve_banner_text.dart';
import 'package:login/widgets/custom_dialog_box.dart';
import 'package:login/widgets/profile_list_widget.dart';
import 'package:login/widgets/top_curved_banner.dart';

class ProfilePage extends StatelessWidget {
  final String title;

  const ProfilePage({Key key, this.title = "Profile"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      builder: (context, sizingInformation) {
        return SafeArea(
          child: Scaffold(
            body: Column(
              children: <Widget>[
                Stack(
                  children: [
                    ClipPath(
                      //ProfileCripper class makes the top container to have curves
                      clipper: ProfileCripper(),
                      //Green widget at top (with Curves, lol)
                      child: TopCurveBanner(
                        title: title,
                      ),
                    ),
                    CurveBannerText(),
                    //Profile image and editing pen
                    _profileImage(sizingInformation),
                    _editPen(sizingInformation, context),
                  ],
                ),
                //Name and Student ID
                _studentInfoText(context),

                //
                //Profile Menu ListView
                SizedBox(height: 30),
                _profileListItems(context),
              ],
            ),
          ),
        );
      },
    );
  }

//Crickable Profile list items
  Widget _profileListItems(context) {
    return Expanded(
      child: ListView(
        children: [
          GestureDetector(
            onTap: () => Navigator.of(context)
                ?.pushNamed(RouteGenerator.registeredCoursesPage),
            child: ProfileListItem(
              icon: Icons.library_books,
              text: "Registered Courses",
            ),
          ),
          GestureDetector(
            onTap: () => {openDialog(context)},
            child: ProfileListItem(
              icon: Icons.alarm,
              text: "Reminders",
            ),
          ),
          ProfileListItem(
            icon: Icons.location_city,
            text: "Hostel Location",
          ),
          ProfileListItem(
            icon: Icons.fingerprint,
            text: "Change Sign-In",
          ),
          ProfileListItem(
            icon: Icons.login_rounded,
            text: "Log Out",
            hasNavigation: false,
          ),
        ],
      ),
    );
  }

  Future openDialog(context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        //Custom dialog (reusable widget)
        return CustomDialogBox(
          title: "Custom Dialog",
          descriptions:
              "Custom Dialog made by me Custom Dialog made by me Custom Dialog made by me Custom Dialog made by me",
          text: "yes",
          hasImage: true,
        );
      },
    );
  }

//Student details widgets
  Widget _studentInfoText(BuildContext context) {
    final double _containerHeight = 40;
    final double _containerWidth = 100;

    return Column(
      children: [
        SizedBox(height: 10.0),
        Text("Jane Banda", style: Theme.of(context).textTheme.headline6),
        SizedBox(height: 5.0),
        Text(
          "BICTU 2218",
          style: Theme.of(context).textTheme.subtitle2,
        ),
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: _containerHeight,
              width: _containerWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Colors.white70,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 5.0),
                    blurRadius: 10,
                    color: Colors.black38,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Level 4",
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ],
              ),
            ),
            Container(
              height: _containerHeight,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Colors.white70,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 5.0),
                    blurRadius: 10,
                    color: Colors.black38,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Semester 8",
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ],
              ),
            ),
            Container(
              height: _containerHeight,
              width: _containerWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Colors.white70,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 5.0),
                    blurRadius: 10,
                    color: Colors.black38,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Courses 5",
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

// edit pen to edit profile image
  Widget _editPen(SizingInformation sizingInformation, BuildContext context) {
    return Positioned(
      bottom: sizingInformation.screenSize.height / 200.0,
      right: sizingInformation.screenSize.width * 0.42,
      //opens dialog to edit
      child: GestureDetector(
        onTap: () => {openDialog(context)},
        child: Container(
          height: 30.0,
          width: 30.0,
          decoration: BoxDecoration(
            color: Colors.yellow,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.edit,
            color: Colors.black54,
          ),
        ),
      ),
    );
  }

// the Profile image
  Widget _profileImage(SizingInformation sizingInformation) {
    return Positioned(
      bottom: sizingInformation.screenSize.height * 0.01,
      right: sizingInformation.screenSize.width * 0.4,
      child: CircleAvatar(
        radius: 60.0,
        backgroundImage: AssetImage("assets/images/face_girl.jpg"),
      ),
    );
  }
}
