import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login/screens/academic_resources/academic_resource_screen.dart';
import 'package:login/screens/maps/locate_building.dart';
import 'package:login/screens/notifications/notifications_screen.dart';
import 'package:login/screens/peer_clubs/peer_clubs_screen.dart';
import 'package:login/widgets/bottom_bar.dart';
import 'package:login/screens/profile/profile.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

enum BottomIcons { Home, Peers, Maps, Resources, Account }

class _MainPageState extends State<MainPage> {
  BottomIcons bottomIcons = BottomIcons.Home;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);

    return SafeArea(
      top: true,
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            //holds all main pages /the 4 screens
            //if bottomIcons == home /display home screen ...
            bottomIcons == BottomIcons.Home
                ? Padding(
                    padding: EdgeInsets.only(bottom: 50),
                    child: NotificationScreen(),
                  )
                : Container(),
            //if bottomIcons == peers /display peers club screen ...
            bottomIcons == BottomIcons.Peers
                ? Padding(
                    padding: EdgeInsets.only(bottom: 50),
                    child: PeerClubsScreen(),
                  )
                : Container(),
            //if bottomIcons == Maps /display MAps screen ...
            bottomIcons == BottomIcons.Maps
                ? Padding(
                    padding: EdgeInsets.only(bottom: 50),
                    child: LocateBuildingScreen(),
                  )
                : Container(),
            //if bottomIcons == Resources /display Resouces screen ...
            bottomIcons == BottomIcons.Resources
                ? Padding(
                    padding: EdgeInsets.only(bottom: 50),
                    child: AcademicResourcesScreen(),
                  )
                : Container(),
            //if bottomIcons == Account /display profile screen ...
            bottomIcons == BottomIcons.Account
                ? Padding(
                    padding: EdgeInsets.only(bottom: 50),
                    child: ProfilePage(),
                  )
                : Container(),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                // height: 60,
                decoration: BoxDecoration(color: Colors.white70),
                padding:
                    EdgeInsets.only(left: 30, right: 30, bottom: 10, top: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    //Home
                    BottomBar(
                      onPressed: () {
                        setState(() {
                          bottomIcons = BottomIcons.Home;
                        });
                      },
                      bottomIcons:
                          bottomIcons == BottomIcons.Home ? true : false,
                      icons: Icons.home,
                      text: "Home",
                    ),
                    //Pear Clubs
                    BottomBar(
                      onPressed: () {
                        setState(() {
                          bottomIcons = BottomIcons.Peers;
                        });
                      },
                      bottomIcons:
                          bottomIcons == BottomIcons.Peers ? true : false,
                      icons: Icons.group_outlined,
                      text: "Clubs",
                    ),
                    //Gogle Maps
                    BottomBar(
                      onPressed: () {
                        setState(() {
                          bottomIcons = BottomIcons.Maps;
                        });
                      },
                      bottomIcons:
                          bottomIcons == BottomIcons.Maps ? true : false,
                      icons: Icons.location_on_outlined,
                      text: "Maps",
                    ),
                    //Find Academic Resouce
                    BottomBar(
                      onPressed: () {
                        setState(() {
                          bottomIcons = BottomIcons.Resources;
                        });
                      },
                      bottomIcons:
                          bottomIcons == BottomIcons.Resources ? true : false,
                      icons: Icons.menu_book_rounded,
                      text: "Resources",
                    ),
                    //Student Profile
                    BottomBar(
                      onPressed: () {
                        setState(() {
                          bottomIcons = BottomIcons.Account;
                        });
                      },
                      bottomIcons:
                          bottomIcons == BottomIcons.Account ? true : false,
                      icons: Icons.account_circle_sharp,
                      text: "Profile",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
