import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrum_it/widgets/LoadImage.dart';
import 'package:scrum_it/widgets/NotificationIcon.dart';
import 'package:scrum_it/widgets/TabsWidget.dart';
import 'package:scrum_it/widgets/menuIcon.dart';
import 'package:scrum_it/widgets/tabs/OrganizationsTab.dart';
import 'package:scrum_it/widgets/tabs/ProjectsTab.dart';
import 'package:scrum_it/widgets/tabs/TeamsTab.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 16, left: 12, right: 12, bottom: 12),
              child: MenuIcon(16, 8),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 12, left: 12, right: 12, bottom: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text(
                      'Hello,',
                      style:
                          TextStyle(fontWeight: FontWeight.w300, fontSize: 24),
                    ),
                    Text(
                      'Rania Kthiri',
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
                    ),
                  ],
                ),
                Stack(
                  overflow: Overflow.visible,
                  children: <Widget>[
                    LoadImage(60, 60, 'https://drive.google.com/uc?export=view&id=1UFVwHjuoUQSK1SqYIQ6TjWUVJVjM_fNx' ,8,8,8,8),
                    Positioned(
                      left: 48.0,
                      top: -8,
                      child: NotificationIcon(21,21, '11', Color(0xffB99EAA)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Tabswidget(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TabBarView(
                children: [
                  OrganizationsTab(),
                  TeamsTab(),
                  ProjectsTab(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
