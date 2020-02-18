import 'package:scrum_it/models/Member.dart';

import 'Task.dart';

class UserStory {
  String title;
  int priority;
  String startDate;
  String endDate;
  List<Member> members;
  List<Task> tasks;

  UserStory(this.title, this.priority, this.startDate, this.endDate,
      this.members, this.tasks);

  static get userStories => [
        new UserStory(
            "As a customer I can refund my order using quick …",
            1,
            "2019-12-01 12:04:35",
            "2020-03-01 12:04:35",
            Member.getMembers().sublist(0, 8),
            Task.getTasks().sublist(0, 5)),
        new UserStory(
            "As a store owner I can contact my suppliers so …",
            1,
            "2019-12-01 12:04:35",
            "2020-03-01 12:04:35",
            Member.getMembers().sublist(0, 8),
            Task.getTasks().sublist(5, 10)),
        new UserStory(
            "As a store owner I can contact my suppliers so …",
            1,
            "2019-12-01 12:04:35",
            "2020-03-01 12:04:35",
            Member.getMembers().sublist(0, 8),
            Task.getTasks().sublist(10, 15)),
      ];
}
