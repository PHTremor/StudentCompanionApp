import 'package:flutter/material.dart';

class ProfileListItem extends StatelessWidget {
  final IconData icon;
  final text;
  final bool hasNavigation;
  final height;

  const ProfileListItem({
    Key key,
    this.icon,
    this.text,
    this.hasNavigation = true,
    this.height = 40.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: EdgeInsets.symmetric(horizontal: 40).copyWith(bottom: 15.0),
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white70,
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 5.0,
            ),
            child: Icon(
              this.icon,
              size: 20.0,
            ),
          ),
          SizedBox(width: 15.0),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(right: 1.0),
              child: Text(
                this.text,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    .copyWith(fontSize: 14),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          if (hasNavigation)
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Icon(
                Icons.arrow_back_ios,
                textDirection: TextDirection.rtl,
              ),
            ),
        ],
      ),
    );
  }
}
