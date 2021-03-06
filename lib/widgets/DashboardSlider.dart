import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:scrum_it/widgets/SliderItems/OrganizationItem.dart';

import '../Utlis.dart';
import 'SliderItems/ProjectItem.dart';

class DashboardSlider extends StatefulWidget {
  double height;
  List dataList;
  String item;
  double aspectRatio;
  double viewPort;
  bool autoP = true;

  final void Function(dynamic index) updateSelection;

  DashboardSlider(this.height, this.dataList, this.item, this.aspectRatio,
      this.viewPort, this.updateSelection);

  @override
  _DashboardSliderState createState() => _DashboardSliderState();
}

class _DashboardSliderState extends State<DashboardSlider> {
  int _organization = 0;
  int _project = 0;

  setAutoPlayToFalse() {
    setState(() {
      widget.autoP = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    List child = Utils.map<Widget>(
      //Organization.getOrganizationData(),
      widget.dataList,
      (index, i) {
        switch (widget.item) {
          case 'OrganizationItem':
            return OrganizationItem(i);
            break;
          case 'ProjectItem':
            return ProjectItem(i);
            break;
          default:
            return OrganizationItem(i);
        }
      },
    ).toList();

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          height: widget.height,
          child: CarouselSlider(
            items: child,
            initialPage: child.length > 2 ? 1 : 0,
            scrollPhysics: BouncingScrollPhysics(),
            enableInfiniteScroll: child.length > 2 ? true : false,
            autoPlay: child.length > 2 ? widget.autoP : false,
            pauseAutoPlayOnTouch: Duration(seconds: 3),
            enlargeCenterPage: true,
            //aspectRatio: 1.7,
            aspectRatio: widget.aspectRatio,
            //viewportFraction: 0.7,
            viewportFraction: widget.viewPort,
            height: widget.height - 30,
            onPageChanged: (index) {
              switch (widget.item) {
                case 'OrganizationItem':
                  return setState(() {
                    _organization = index;
                    widget.updateSelection(index);
                  });
                  break;
                case 'ProjectItem':
                  return setState(() {
                    _project = index;
                  });
                  break;
              }
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: Utils.map<Widget>(widget.dataList, (index, item) {
            switch (widget.item) {
              case 'OrganizationItem':
                return Container(
                  width: _organization == index ? 28 : 8.0,
                  height: 8.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                      shape: _organization == index
                          ? BoxShape.rectangle
                          : BoxShape.circle,
                      borderRadius: _organization == index
                          ? BorderRadius.all(Radius.circular(28))
                          : null,
                      color: _organization == index
                          ? Color(0xffB99EAA)
                          : Color(0x33B99EAA)),
                );
                break;
              case 'ProjectItem':
                return Container(
                  width: _project == index ? 28 : 8.0,
                  height: 8.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                      shape: _project == index
                          ? BoxShape.rectangle
                          : BoxShape.circle,
                      borderRadius: _project == index
                          ? BorderRadius.all(Radius.circular(28))
                          : null,
                      color: _project == index
                          ? Color(0xffB99EAA)
                          : Color(0x33B99EAA)),
                );
                break;

              default:
                return Container();
            }
          }),
        )
      ],
    );
  }
}
