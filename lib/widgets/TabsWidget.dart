import 'package:flutter/material.dart';

import 'CircleTabIndicator.dart';

class Tabswidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = (MediaQuery.of(context).size.width) / 3;

    return TabBar(
        indicator: CircleTabIndicator(color: Color(0xff8288BA), radius: 4),
        labelPadding: EdgeInsets.only(top: 16, bottom: 16, right: 12, left: 12),
        tabs: [
          getTab('03', 'Organizations', width),
          getTab('05', 'Teams', width),
          getTab('15', 'Projects', width),
        ]);
  }

  Tab getTab(String top, String bottom, double width) {
    return Tab(
        child: Container(
      width: width,
      child: RichText(
        text: new TextSpan(
          children: <TextSpan>[
            new TextSpan(
              text: "$top\n",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
            new TextSpan(
              text: bottom,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w300,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
