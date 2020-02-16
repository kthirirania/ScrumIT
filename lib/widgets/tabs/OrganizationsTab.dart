import 'package:flutter/material.dart';
import 'package:scrum_it/models/Organization.dart';
import 'package:scrum_it/models/Project.dart';

import '../CircleTabIndicator.dart';
import '../DashboardSlider.dart';
import 'package:scrum_it/widgets/SliderItems/OrganizationItem.dart';
import 'BacklogsTab.dart';
import 'TeamsTab.dart';

class OrganizationsTab extends StatefulWidget {

  @override
  _OrganizationsTabState createState() => _OrganizationsTabState();
}

class _OrganizationsTabState extends State<OrganizationsTab> {

  bool projectsIsSelected = true;
  Organization selectedOrganization = Organization.getOrganizationData()[0];

  void refresh(dynamic index) {
    setState(() {
      selectedOrganization = Organization.getOrganizationData()[index];
    });
  }


  @override
  Widget build(BuildContext context) {
    double width = (MediaQuery.of(context).size.width) / 3;


    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          DashboardSlider(200, Organization.getOrganizationData(), 'OrganizationItem', 1.7, 0.7, refresh),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              InkWell(
                onTap: () =>   setState(() {
                  this.projectsIsSelected = true;
                }),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text("Projects",
                        style: TextStyle(
                            color: this.projectsIsSelected ? Colors.black: Colors.black54,
                            fontWeight: this.projectsIsSelected ? FontWeight.w700 : FontWeight.w400),),
                      if(this.projectsIsSelected) Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xff8288BA)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () =>   setState(() {
                  this.projectsIsSelected = false;
                }),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text("Backlogs",
                        style: TextStyle(
                            color: !this.projectsIsSelected ? Colors.black: Colors.black54,
                            fontWeight: !this.projectsIsSelected ? FontWeight.w700 : FontWeight.w400),),
                      if(!this.projectsIsSelected) Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xff8288BA)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          if (projectsIsSelected)DashboardSlider(290, selectedOrganization.projects, 'ProjectItem', 1.7, 0.62, refresh),
        ],
      ),
    );
  }
}
