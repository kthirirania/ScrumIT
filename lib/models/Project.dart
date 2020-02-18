import 'package:scrum_it/models/Member.dart';

class Project {
  String logo;
  String name;
  String color;
  String description;
  double progress;
  List<Member> members;

  Project(this.logo, this.color, this.name, this.description, this.progress,
      this.members);

  static List<Project> getProjectsList() {
    return [
      new Project(
          "https://drive.google.com/uc?export=view&id=1bW-qGe-3lpgOt05_LldyR2kJ4dkTEG7z",
          "518EBD",
          "GoTrip",
          "The quick brown fox jumps over the lazy dog. The quick brown fox"
              " jumps over the lazy dog. The quick brown fox jumps over the lazy dog. The quick "
              "brown fox jumps over the lazy dog. The quick brown fox jumps over the lazy dog.",
          0.45,
          Member.getMembers().sublist(0, 5)),
      new Project(
          "https://drive.google.com/uc?export=view&id=1-7BiITGlzdz42Z9kMzDUNpfFIkoB1CYn",
          "5E31EC",
          "xTrack",
          "The quick brown fox jumps over the lazy dog. The quick brown fox"
              " jumps over the lazy dog. The quick brown fox jumps over the lazy dog. The quick "
              "brown fox jumps over the lazy dog. The quick brown fox jumps over the lazy dog.",
          0.80,
          Member.getMembers().sublist(2, 9)),
      new Project(
          "https://drive.google.com/uc?export=view&id=1Jh-216wTt_hn2cGwckYIVJaD_NpTrQpu",
          "28AE9F",
          "TalkBot",
          "The quick brown fox jumps over the lazy dog. The quick brown fox"
              " jumps over the lazy dog. The quick brown fox jumps over the lazy dog. The quick "
              "brown fox jumps over the lazy dog. The quick brown fox jumps over the lazy dog.",
          0.45,
          Member.getMembers().sublist(0, 5)),
      new Project(
          "https://drive.google.com/uc?export=view&id=1oZYyR2pHEVz3ypfEI55a27PzxPpucMMv",
          "D8DBEF",
          "D2C",
          "The quick brown fox jumps over the lazy dog. The quick brown fox"
              " jumps over the lazy dog. The quick brown fox jumps over the lazy dog. The quick "
              "brown fox jumps over the lazy dog. The quick brown fox jumps over the lazy dog.",
          0.20,
          Member.getMembers().sublist(4, 10))
    ];
  }
}
