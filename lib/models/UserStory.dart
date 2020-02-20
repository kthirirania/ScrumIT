import 'dart:ui';

import './Member.dart';
import 'Task.dart';

class UserStory {
  String title;
  int priority;
  String startDate;
  String endDate;
  double progress;
  Status status;
  List<Member> members;
  List<Task> tasks;

  UserStory(this.title, this.priority, this.startDate, this.endDate,
      this.progress, this.status, this.members, this.tasks);

  static List<UserStory> userStories() => [
        new UserStory(
            "As a customer I can refund my order using quick …",
            1,
            "2020-01-01",
            "2020-01-02",
            0.8,
            Status.good,
            Member.getMembers().sublist(0, 8),
            Task.getTasks().sublist(0, 5)),
        new UserStory(
            "As a store owner I can contact my suppliers so …",
            2,
            "2019-12-01 12:04:35",
            "2020-03-01 12:04:35",
            1,
            Status.done,
            Member.getMembers().sublist(3, 12),
            Task.getTasks().sublist(10, 15)),
        new UserStory(
            "As a store owner I can contact my suppliers so …",
            3,
            "2019-12-01 12:04:35",
            "2020-03-01 12:04:35",
            0.456,
            Status.warning,
            Member.getMembers().sublist(5, 12),
            Task.getTasks().sublist(5, 10)),
        new UserStory(
            "As a store owner I can contact my suppliers so …",
            4,
            "2019-12-01 12:04:35",
            "2020-03-01 12:04:35",
            0.20,
            Status.critical,
            Member.getMembers().sublist(3, 15),
            Task.getTasks().sublist(10, 15)),
      ];
}

class Status {
  static const done = const Status._("Done");
  static const good = const Status._("Good");
  static const warning = const Status._("Warning");
  static const critical = const Status._("Critical");

  static get statuses => [done, good, warning, critical];

  final String status;

  const Status._(this.status);
}

class StatusColors {
  static const done = const StatusColors._(Color(0xff8ABA82));
  static const good = const StatusColors._(Color(0xff4E8CBB));
  static const warning = const StatusColors._(Color(0xffF89B9B));
  static const critical = const StatusColors._(Color(0xffDC7070));

  static get colors => [done, good, warning, critical];

  static getColor(Status status) {
    switch (status) {
      case Status.done:
        return done.color;
        break;
      case Status.good:
        return good.color;
        break;
      case Status.warning:
        return warning.color;
        break;
      case Status.critical:
        return critical.color;
        break;
    }
  }

  final Color color;

  const StatusColors._(this.color);
}
