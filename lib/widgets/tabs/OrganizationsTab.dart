import 'package:flutter/material.dart';

import '../DashboardSlider.dart';

class OrganizationsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: DashboardSlider(),
          ),
        ],
      ),
    );
  }
}
