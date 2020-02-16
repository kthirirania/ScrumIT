import 'package:flutter/material.dart';

class NotificationIcon extends StatelessWidget {

  double width;
  double height;
  String text;
  Color color;

  NotificationIcon(this.width, this.height, this.text, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.white),
        ),
      ),
    );
  }
}
