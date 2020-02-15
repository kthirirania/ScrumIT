import 'package:scrum_it/models/Member.dart';

class Project{
  String logo;
  String name;
  List<Member> members;

  Project(this.logo, this.name, this.members);

  static List<Project> getProjectsList(){
    return [
      new Project("https://drive.google.com/uc?export=view&id=1bW-qGe-3lpgOt05_LldyR2kJ4dkTEG7z", "GoTrip", Member.getMembersList().sublist(0, 1)),
      new Project("https://drive.google.com/uc?export=view&id=1-7BiITGlzdz42Z9kMzDUNpfFIkoB1CYn", "xTrack", Member.getMembersList().sublist(2, 3)),
      new Project("https://drive.google.com/uc?export=view&id=1Jh-216wTt_hn2cGwckYIVJaD_NpTrQpu", "TalkBot", Member.getMembersList().sublist(4, 5)),
      new Project("https://drive.google.com/uc?export=view&id=1oZYyR2pHEVz3ypfEI55a27PzxPpucMMv", "D2C", Member.getMembersList().sublist(6, 7))];
  }
}