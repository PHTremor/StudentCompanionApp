import 'package:flutter/material.dart';
import 'package:login/routes.dart';
import 'package:login/style.dart';

class TopCurveBanner extends StatelessWidget {
  final String title;

  const TopCurveBanner({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomRight,
          colors: greenGradients,
        ),
      ),
      child: Stack(
        children: [
          //Back arrow button ./Add Search to the left/logout Button
          _backArrow(context),
          SizedBox(width: 10),
          Positioned(
            top: 12.0,
            left: 60.0,
            //page title
            child: Text(
              this.title,
              style: Theme.of(context)
                  .appBarTheme
                  .textTheme
                  .headline6
                  .copyWith(fontSize: 20),
            ),
          ),
          //logout button to the left
          Positioned(
            right: 20.0,
            child: _logOut(context),
          ),
        ],
      ),
    );
  }

  Widget _backArrow(context) {
    return IconButton(
      padding: EdgeInsets.only(left: 20),
      icon: Icon(
        Icons.arrow_back_ios,
        color: Colors.white,
        size: 30.0,
      ),
      //Go back to last screen /pop
      onPressed: () {
        Navigator.of(context)?.pop();
      },
    );
  }

  Widget _logOut(context) {
    return IconButton(
      tooltip: "Logout",
      padding: EdgeInsets.only(left: 20),
      icon: Icon(
        Icons.logout,
        color: Colors.white,
        semanticLabel: "Logout",
        size: 30.0,
      ),
      //Go back to login Page
      onPressed: () {
        Navigator.of(context)?.pushNamed(RouteGenerator.homePage);
      },
    );
  }
}

//The green curve at top on profile screen
class ProfileCripper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
