import 'package:flutter/material.dart';
import 'package:login/responsive/sizing/base_widget.dart';
import 'package:login/screens/home/events/event_corousel.dart';

import 'notifications/notifications_corousel.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      builder: (context, sizingInfomation) {
        var sizingInformation = sizingInfomation;
        return SafeArea(
          // root container holding items horizontally
          child: ListView(
            padding: EdgeInsets.symmetric(vertical: 30),
            children: <Widget>[
              //Welcome text on top
              welcomeMessage(context),
              SizedBox(height: 40.0),
              //the horizonatal scrollBar /Notifications
              NotificationsCorousel(
                  sizingInformation: sizingInformation, title: 'Notifications'),
              SizedBox(height: 10.0),
              //the horizonatal scrollBar /Events
              EventssCorousel(
                  sizingInformation: sizingInformation, title: 'Campus Events'),
            ],
          ),
        );
      },
    );
  }

//Welcome text on top
  Widget welcomeMessage(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 120.0),
      child: Text(
        "What would you like to find?",
        style: Theme.of(context).textTheme.headline6.copyWith(fontSize: 35.0),
      ),
    );
  }
}
