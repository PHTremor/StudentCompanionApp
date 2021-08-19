import 'package:flutter/material.dart';
import 'package:login/models/events_model.dart';
import 'package:login/responsive/sizing/base_widget.dart';
import 'package:login/responsive/sizing/sizing_information.dart';
import 'package:login/style.dart';
import 'package:login/widgets/back_arrow.dart';

class EventDetails extends StatefulWidget {
  final CustomEvent event;
  const EventDetails({
    Key key,
    // @required
    this.event,
  }) : super(key: key);

  @override
  _EventDetailsState createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  //custom event of Type CustomEvent
  //get index with provider //to dynamically get data to display
  CustomEvent eventDetail = events[1];
  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      builder: (context, sizingInfomation) {
        return SafeArea(
          child: Scaffold(
            body: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    //placeholder //Top image
                    topDetailsImage(sizingInfomation, eventDetail),
                    //back arrow inside image
                    CustomBackArrow()
                  ],
                ),
                detailsHeaderText(context, eventDetail),
                eventDetailsParagraph(sizingInfomation, eventDetail),
              ],
            ),
          ),
        );
      },
    );
  }

  Expanded eventDetailsParagraph(
      SizingInformation sizingInfomation, CustomEvent eventDetail) {
    return Expanded(
        child: ListView.builder(itemBuilder: (BuildContext context, index) {
      return Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(8.0),
            height: sizingInfomation.localWidgetSize.width,
            width: double.infinity,
            decoration: BoxDecoration(
              color: mzuniWhiter,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Column(
              children: [
                Text(
                  eventDetail.description,
                  style: Theme.of(context).textTheme.bodyText2,
                )
              ],
            ),
          )
        ],
      );
    }));
  }

  Widget detailsHeaderText(BuildContext context, CustomEvent eventDetail) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, left: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            eventDetail.title,
            style: Theme.of(context).textTheme.headline6,
          ),
          Text(
            eventDetail.publisher,
            style: Theme.of(context)
                .textTheme
                .subtitle2
                .copyWith(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  Widget topDetailsImage(
      SizingInformation sizingInfomation, CustomEvent eventDetail) {
    return Container(
      height: sizingInfomation.screenSize.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0.0, 2.0),
            blurRadius: 6.0,
          ),
        ],
      ),
      //image of the event
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30.0),
            bottomRight: Radius.circular(30.0)),
        child: Image(
          image: AssetImage(eventDetail.imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
