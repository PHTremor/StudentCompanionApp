import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login/widgets/wavy_footer.dart';
import 'package:login/widgets/wavy_header.dart';

class Background extends StatelessWidget {
  const Background({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          new Stack(
            alignment: Alignment.bottomCenter,
            children: [
              //the wave header on login and the image/text at top center
              SvgPicture.asset(
                "assets/images/login_illustration.svg",
                height: 200.0,
                width: 200.0,
              ),
              WavyHeader(),
            ],
          ),
          Expanded(
            child: Container(),
          ),
          Stack(
            //wave at the bottom left of the screen
            alignment: Alignment.bottomLeft,
            children: [
              WavyFooter(),
              _mzuniLogo(),
            ],
          )
        ],
      ),
    );
  }

  Widget _mzuniLogo() {
    return Padding(
      padding: EdgeInsets.only(left: 330, bottom: 12),
      child: Image(
        height: 55,
        width: 55,
        image: AssetImage("assets/images/Mzuni.png"),
      ),
    );
  }
}
