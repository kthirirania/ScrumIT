import 'package:flutter/material.dart';
import 'package:scrum_it/models/Organization.dart';
import 'package:scrum_it/widgets/LoadImage.dart';

import '../HorizontalListView.dart';

class OrganizationItem extends StatelessWidget {
  Organization organization;

  OrganizationItem(this.organization);

  @override
  Widget build(BuildContext context) {
    //MediaQuery.of(context).size.width
    return Container(
      height: 170,
      width: 260,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(24),
          ),
          border: Border.all(
            color: Colors.grey[100],
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
            flex: 1,
            child: LoadImage(260, 90, organization.coverImage, 24, 24, 0, 0),
          ),
          Flexible(
            flex: 1,
            child: Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Flexible(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: LoadImage(60, 60, organization.logo, 12, 12, 12, 12),
                    ),
                  ),
                  Flexible(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          organization.name,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        HorizontalListView(organization.members, 3),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
