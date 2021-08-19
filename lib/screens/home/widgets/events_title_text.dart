import 'package:flutter/material.dart';
import 'package:login/responsive/sizing/sizing_information.dart';
import 'package:login/style.dart';

class EventsTitleText extends StatelessWidget {
  const EventsTitleText({
    Key key,
    @required this.sizingInformation,
    @required this.notification,
  }) : super(key: key);

  final SizingInformation sizingInformation;
  final notification;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20.0,
      child: Container(
        height: sizingInformation.screenSize.height * 0.11,
        width: sizingInformation.localWidgetSize.width * 0.44,
        decoration: BoxDecoration(
          color: mzuniWhite,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            right: 10.0,
            left: 30.0,
            bottom: 30.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                notification.title,
                style: Theme.of(context)
                    .textTheme
                    .subtitle2
                    .copyWith(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              Text(
                notification.publisher,
                style: Theme.of(context).textTheme.caption,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
