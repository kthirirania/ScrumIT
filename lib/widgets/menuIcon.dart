import 'package:flutter/material.dart';

class MenuIcon extends StatelessWidget {

  double size;
  double padding;


  MenuIcon(this.size, this.padding);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              width: (size - padding) /2,
              height: (size - padding) /2,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black),
            ),
            Padding(
              padding: EdgeInsets.only(left: padding),
              child: Container(
                width: (size - padding) /2,
                height: (size - padding) /2,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: padding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                width: (size - padding) /2,
                height: (size - padding) /2,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black),
              ),
              Padding(
                padding: EdgeInsets.only(left: padding),
                child: Container(
                  width: (size - padding) /2,
                  height: (size - padding) /2,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
