import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:scrum_it/models/Task.dart';

import '../Utlis.dart';

class CircularChartWidget extends StatefulWidget {
  @override
  _CircularChartWidgetState createState() => _CircularChartWidgetState();
}

class _CircularChartWidgetState extends State<CircularChartWidget> {
  List<Widget> children = Utils.map<Widget>(
      StatusRow.statusRows(), (index, i) => StatusRowWidget(i)).toList();

  List<Widget> chartChildren =
      Utils.map<Widget>(TaskByStatus.TasksSumplified(), (index, i) {
    double startAngle = 210;
    if (index == 0) {
      return CircleProgress(startAngle, i);
    } else {
      for (int i = 0; i < index; i++) {
        startAngle += TaskByStatus.TasksSumplified()[i].percentage * 360;
      }
      return CircleProgress(startAngle, i);
    }
  }).toList();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Flexible(
            flex: 2,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Container(
                  child: Stack(
                    alignment: Alignment.topLeft,
                    children: chartChildren,
                  ),
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: "14\n",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      TextSpan(
                        text: 'Days left',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Flexible(
            flex: 3,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: children),
          )
        ],
      ),
    );
  }
}

class CircleProgress extends StatelessWidget {
  double startAngle = 0.0;
  TaskByStatus task;

  CircleProgress(this.startAngle, this.task);

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      startAngle: startAngle,
      radius: 130.0,
      animation: true,
      animationDuration: 1200,
      lineWidth: 16.0,
      percent: task.percentage,
      circularStrokeCap: CircularStrokeCap.butt,
      backgroundColor: Colors.transparent,
      progressColor: StatusColors.getColor(task.status),
    );
  }
}

class StatusRowWidget extends StatelessWidget {
  StatusRow statusRow;

  StatusRowWidget(this.statusRow);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0, right: 4, left: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Flexible(
            flex: 1,
            child: Container(
              width: 20,
              height: 20,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: statusRow.color),
            ),
          ),
          Flexible(
            flex: 7,
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  statusRow.status,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                statusRow.progress + ' %',
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class StatusRow {
  Color color;
  String status;
  String progress;

  StatusRow(this.color, this.status, this.progress);

  static List<StatusRow> statusRows() {
    return [
      new StatusRow(
          StatusColors.done.color, Status.done.status.toString(), '50'),
      new StatusRow(StatusColors.inProgress.color,
          Status.inProgress.status.toString(), '30'),
      new StatusRow(StatusColors.toRectify.color,
          Status.toRectify.status.toString(), '10'),
      new StatusRow(
          StatusColors.toDo.color, Status.toDo.status.toString(), '20'),
    ];
  }
}
