import 'package:flutter/material.dart';
import 'package:login/models/notications_model.dart';
import 'package:login/responsive/sizing/sizing_information.dart';
import 'package:login/screens/home/widgets/events_image.dart';
import 'package:login/screens/home/widgets/events_title_text.dart';
import 'package:login/style.dart';

//container holding notification's image and text
class NotificationsCorousel extends StatelessWidget {
  const NotificationsCorousel({
    Key key,
    @required this.sizingInformation,
    @required this.title,
  }) : super(key: key);

  final SizingInformation sizingInformation;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //Title of Category (Notifications/Events/..)
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(color: mzuniGreen),
              ),
              //yellow circle holding count of events
              Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: mzuniYellow,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  //Count of items to be displayed
                  child: Text(
                    notifications.length.toString(),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          color: mzuniWhiter,
          margin: EdgeInsets.all(10.0),
          height: sizingInformation.screenSize.height / 3.1,
          // horizontal scroll on home
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: notifications.length,
              itemBuilder: (BuildContext context, int index) {
                //custom Notification panel
                CustomNotification notification = notifications[index];
                //Root Container inside the list view
                return GestureDetector(
                  onTap: () => {},
                  child: Container(
                    color: mzuniWhiter,
                    margin: EdgeInsets.all(10.0),
                    width: sizingInformation.screenSize.width * 0.47,
                    height: sizingInformation.screenSize.height * 3.5,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        //Bottom text below image
                        EventsTitleText(
                          sizingInformation: sizingInformation,
                          notification: notification,
                        ),
                        // image of an event / notification
                        EventsImage(
                          notification: notification,
                          sizingInformation: sizingInformation,
                          width: 0.40,
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
