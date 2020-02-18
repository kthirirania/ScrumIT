import 'dart:ui';

import 'package:scrum_it/models/Member.dart';

class Task {
  String title;
  String startDate;
  String endDate;
  double progress;
  Status status;
  List<Member> assignee;

  Task(this.title, this.startDate, this.endDate, this.progress, this.status,
      this.assignee);

  static List<Task> getTasks() => [
        new Task("", "", "", 70, Status.inProgress,
            Member.getMembers().sublist(2, 8)),
        new Task("", "", "", 80, Status.inProgress,
            Member.getMembers().sublist(4, 9)),
        new Task("", "", "", 90, Status.inProgress,
            Member.getMembers().sublist(2, 6)),
        new Task("", "", "", 90, Status.toRectify,
            Member.getMembers().sublist(0, 8)),
        new Task(
            "", "", "", 100, Status.done, Member.getMembers().sublist(6, 10)),
        new Task(
            "", "", "", 100, Status.done, Member.getMembers().sublist(6, 10)),
        new Task(
            "", "", "", 100, Status.done, Member.getMembers().sublist(6, 10)),
        new Task(
            "", "", "", 100, Status.done, Member.getMembers().sublist(6, 10)),
        new Task(
            "", "", "", 100, Status.done, Member.getMembers().sublist(6, 10)),
        new Task(
            "", "", "", 100, Status.done, Member.getMembers().sublist(6, 10)),
        new Task("", "", "", 0, Status.toDo, null),
        new Task("", "", "", 0, Status.toDo, Member.getMembers().sublist(0, 4)),
        new Task("", "", "", 10, Status.inProgress,
            Member.getMembers().sublist(0, 4)),
        new Task("", "", "", 10, Status.toRectify,
            Member.getMembers().sublist(0, 9)),
        new Task("", "", "", 20, Status.inProgress,
            Member.getMembers().sublist(0, 2)),
        new Task("", "", "", 30, Status.inProgress,
            Member.getMembers().sublist(0, 9)),
        new Task("", "", "", 40, Status.inProgress,
            Member.getMembers().sublist(0, 6)),
        new Task("", "", "", 50, Status.inProgress,
            Member.getMembers().sublist(5, 9)),
        new Task("", "", "", 60, Status.inProgress,
            Member.getMembers().sublist(7, 10)),
      ];
}

class Status {
  static const notSet = const Status._("Not Set");
  static const toDo = const Status._("To Do");
  static const inProgress = const Status._("In Progress");
  static const done = const Status._("Done");
  static const toRectify = const Status._("To Rectify");

  static get statuses => [toDo, inProgress, done, toRectify];

  final String status;

  const Status._(this.status);
}

class StatusColors {
  static const notSet = const StatusColors._(Color(0xffecebf5));
  static const toDo = const StatusColors._(Color(0xffDC7070));
  static const inProgress = const StatusColors._(Color(0xff4E8CBB));
  static const done = const StatusColors._(Color(0xff75BDE0));
  static const toRectify = const StatusColors._(Color(0xffF89B9B));

  static get colors => [toDo, inProgress, done, toRectify];

  static getColor(Status status) {
    switch (status) {
      case Status.notSet:
        return notSet.color;
        break;
      case Status.toDo:
        return toDo.color;
        break;
      case Status.inProgress:
        return inProgress.color;
        break;
      case Status.done:
        return done.color;
        break;
      case Status.toRectify:
        return toRectify.color;
        break;
    }
  }

  final Color color;

  const StatusColors._(this.color);
}

class TaskByStatus {
  Status status;
  double percentage;

  TaskByStatus(this.status, this.percentage);

  static List<TaskByStatus> tasksByStatus() {
    List<TaskByStatus> taskByStatuses = [];
    TaskByStatus taskByStatus = new TaskByStatus(Status.done, 0);

    //done
    for (int i = 0; i < Task.getTasks().length; i++) {
      if (Task.getTasks()[i].status.status.toString() ==
          Status.done.status.toString()) {
        print(taskByStatuses[i].percentage);
        taskByStatus.percentage += 1;
      }
    }
    taskByStatus.percentage /= Task.getTasks().length;
    taskByStatuses.add(taskByStatus);

    //inprogress
    for (int i = 0; i < Task.getTasks().length; i++) {
      if (Task.getTasks()[i].status.status.toString() ==
          Status.inProgress.status.toString()) {
        taskByStatus.percentage += 1;
      }
    }
    taskByStatus.percentage /= Task.getTasks().length;
    taskByStatuses.add(taskByStatus);

    //torectify
    for (int i = 0; i < Task.getTasks().length; i++) {
      if (Task.getTasks()[i].status.status.toString() ==
          Status.toRectify.status.toString()) {
        taskByStatus.percentage += 1;
      }
    }
    taskByStatus.percentage /= Task.getTasks().length;
    taskByStatuses.add(taskByStatus);

    //to-do
    for (int i = 0; i < Task.getTasks().length; i++) {
      if (Task.getTasks()[i].status.status.toString() ==
          Status.toDo.status.toString()) {
        taskByStatus.percentage += 1;
      }
    }
    taskByStatus.percentage /= Task.getTasks().length;
    taskByStatuses.add(taskByStatus);

    for (int i = 0; i < taskByStatuses.length; i++) {
      print(taskByStatuses[i].percentage);
    }
    return taskByStatuses;
  }

  static List<TaskByStatus> TasksSumplified() {
    return [
      new TaskByStatus(Status.done, 0.5),
      new TaskByStatus(Status.toDo, 0.2),
      new TaskByStatus(Status.toRectify, 0.1),
      new TaskByStatus(Status.inProgress, 0.3)
    ];
  }
}
