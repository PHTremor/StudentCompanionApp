import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login/routes.dart';
import 'package:login/screens/login/login_form.dart';

class LoginUi extends StatelessWidget {
  const LoginUi({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height / 2.3),
        ),
        Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 150.0,
                    bottom: 10.0,
                  ),
                  child: Text(
                    "Login",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    //login form widget
                    SingleChildScrollView(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight: MediaQuery.of(context).size.height / 5.0,
                          minWidth: MediaQuery.of(context).size.width / 2.0,
                        ),
                        child: LoginFormWidget(30.0, 30.0),
                      ),
                    ),
                    //LoginUi Button BG Circle
                    Positioned(
                      top: 40.0,
                      bottom: 50.0,
                      right: 50.0,
                      child: GestureDetector(
                        //RouteGeneartor to generate a route from the login button
                        onTap: () => Navigator.of(context)
                            ?.pushNamed(RouteGenerator.mainPageNav),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: ShapeDecoration(
                            shape: CircleBorder(),
                            gradient: LinearGradient(
                              colors: signInGradients,
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          //LoginUi Button
                          child: SvgPicture.asset(
                            "assets/images/login.svg",
                            height: 25.0,
                            width: 25.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 70),
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(top: 40),
                              child: Text(
                                "Forgot?",
                                textAlign: TextAlign.end,
                                style: Theme.of(context).textTheme.caption,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            // Padding(
            //   padding: EdgeInsets.only(bottom: 20),
            // ),
          ],
        ),
      ],
    );
  }
}

const List<Color> signInGradients = [
  Color(0xFF4CAF50),
  Color(0xFF43A047),
];
