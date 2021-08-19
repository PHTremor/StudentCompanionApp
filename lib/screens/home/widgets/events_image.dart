import 'package:flutter/material.dart';
import 'package:login/responsive/sizing/sizing_information.dart';
import 'package:login/style.dart';

class EventsImage extends StatelessWidget {
  final double width;

  const EventsImage({
    Key key,
    @required this.notification,
    @required this.sizingInformation,
    this.width = 0.40,
  }) : super(key: key);

  final notification;
  final SizingInformation sizingInformation;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: mzuniWhite,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 2.0),
            blurRadius: 1.0,
          ),
        ],
      ),
      child: Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image(
              image: AssetImage(notification.imageUrl),
              fit: BoxFit.fill,
              height: sizingInformation.localWidgetSize.height * 0.20,
              width: sizingInformation.localWidgetSize.width * width,
            ),
          ),
        ],
      ),
    );
  }
}
