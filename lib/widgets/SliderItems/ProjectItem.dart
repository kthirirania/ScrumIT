import 'package:flutter/material.dart';
import 'package:scrum_it/models/Project.dart';
import 'package:tinycolor/tinycolor.dart';

import '../../Utlis.dart';
import '../HorizontalListView.dart';
import '../LoadImage.dart';
import '../NotificationIcon.dart';

class ProjectItem extends StatelessWidget {

  Project project;

  ProjectItem(this.project);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: 240,
      decoration: BoxDecoration(
          color: TinyColor.fromString(project.color).darken(20).color,
          borderRadius: BorderRadius.all(
            Radius.circular(24),
          ),
          boxShadow: [
            BoxShadow(color: Colors.grey[100], blurRadius: 10, spreadRadius: 5)
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Flexible(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Flexible(
                    flex: 2,
                      child: LoadImage(46, 46, project.logo, 8,8,8,8)),
                  Flexible(
                    flex: 5,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(project.name, style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 20, color: Colors.white,
                        ),),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.topRight,
                        child: NotificationIcon(21, 21, '11', Utils.getColorFromHex(project.color),)),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                project.description,
                maxLines: 4,
                softWrap: true,
                textAlign: TextAlign.justify,
                style: TextStyle(
                color: Colors.white, fontSize: 12,
              ),),
            ),
          ),
          Flexible(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: HorizontalListView(project.members, 4),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Stack(
              children: <Widget>[
                Container(
                  height: 6.0,
                  decoration: new BoxDecoration(
                    color: Utils.getColorFromHex(project.color).withOpacity(0.3),
                  ),
                ),
                Positioned(
                  child: Container(
                    height: 6.0,
                    width: (MediaQuery.of(context).size.width * project.progress) * 0.62,
                    decoration: new BoxDecoration(
                      color: Utils.getColorFromHex(project.color),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Center
              (child: Text(
                (project.progress * 100).toString() + '%',
              style: TextStyle(
              color: Colors.white, fontSize: 12
            ),),
            ),
          ),
        ],
      ),
    );
  }
}
