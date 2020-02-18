import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:scrum_it/models/Project.dart';
import 'package:scrum_it/widgets/CircularChartWidget.dart';
import 'package:scrum_it/widgets/HorizontalListView.dart';
import 'package:scrum_it/widgets/LoadImage.dart';

class ProjectDetails extends StatefulWidget {
  Project project;

  ProjectDetails(this.project);

  @override
  _ProjectDetailsState createState() => _ProjectDetailsState();
}

class _ProjectDetailsState extends State<ProjectDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 2.0),
                child: Container(
                  height: 320,
                  decoration: BoxDecoration(
                    color: Color(0xffF6F7FA),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x55B8B9BF),
                        blurRadius: 20.0,
                        spreadRadius: 4.0,
                        offset: Offset(
                          0.0,
                          0.0,
                        ),
                      ),
                    ],
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(24),
                      bottomLeft: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(
                        height: 72,
                      ),
                      ListTile(
                        leading: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            InkWell(
                              onTap: () => Navigator.pop(context),
                              child: SvgPicture.asset(
                                'assets/icons/back.svg',
                                color: Color(0xff8288BA),
                                width: 24,
                                height: 24,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 24.0),
                              child: LoadImage(
                                  52, 52, widget.project.logo, 8, 8, 8, 8),
                            ),
                          ],
                        ),
                        title: Text(widget.project.name),
                        subtitle: Text(
                            widget.project.members.length.toString() +
                                ' members'),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      CircularChartWidget(),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24.0, left: 12, bottom: 12),
                child: Text(
                  widget.project.name + ' User Stories',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
              ),
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Color(0xffF6F7FA),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x55B8B9BF),
                      blurRadius: 20.0,
                      spreadRadius: 4.0,
                      offset: Offset(
                        2.0,
                        2.0,
                      ),
                    ),
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    HorizontalListView(widget.project.members, 5, 32, true),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
