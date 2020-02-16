import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
                  top: 48, left: 12, right: 12, bottom: 12),
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
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.8),
                              spreadRadius: 10,
                              blurRadius: 5,
                              offset:
                                  Offset(0, 7), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Image.network(
                              'https://drive.google.com/uc?export=view&id=1UFVwHjuoUQSK1SqYIQ6TjWUVJVjM_fNx'),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 48.0,
                      top: -8,
                      child: Container(
                        width: 21,
                        height: 21,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xffB99EAA),
                        ),
                        child: Center(
                          child: Text(
                            '11',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        ),
                      ),
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
