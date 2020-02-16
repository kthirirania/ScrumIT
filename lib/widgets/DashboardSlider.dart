import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:scrum_it/models/Organization.dart';

import '../Utlis.dart';
import 'OrganizationItem.dart';

class DashboardSlider extends StatefulWidget {
  @override
  _DashboardSliderState createState() => _DashboardSliderState();
}

class _DashboardSliderState extends State<DashboardSlider> {
  List child = Utils.map<Widget>(
    Organization.getOrganizationData(),
    (index, i) {
      return OrganizationItem(i);
    },
  ).toList();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: CarouselSlider(
        items: child,
        initialPage: 1,
        scrollPhysics: BouncingScrollPhysics(),
        enableInfiniteScroll: true,
        autoPlay: true,
        pauseAutoPlayOnTouch: Duration(seconds: 30),
        enlargeCenterPage: true,
        aspectRatio: 16 / 9,
        viewportFraction: 0.7,
        height: 170.0,
      ),
    );
  }
}
