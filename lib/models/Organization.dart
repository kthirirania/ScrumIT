import 'package:scrum_it/models/Member.dart';
import 'package:scrum_it/models/Project.dart';

class Organization{
  String logo;
  String coverImage;
  String name;
  List<Member> members;
  List<Project> projects;

  Organization(this.logo, this.coverImage, this.name, this.members, this.projects);

  static List<Organization> getOrganizationData() {
    return [
      new Organization("https://drive.google.com/uc?export=view&id=1sddC8XpVHlIqBjQHcHQq47HaGdlN1GYG",
        "https://drive.google.com/uc?export=view&id=1dfNjHK47DH0n0fVuGpecjNxibRor4p3w",
        "Connecting", Member.getMembersList().sublist(0,3), Project.getProjectsList().sublist(0, 2)),
      new Organization("https://drive.google.com/uc?export=view&id=1l0ztgFzFmWAUa7YbtkYWA8JK4jzpbOWw",
          "https://drive.google.com/uc?export=view&id=1_TAqF38E3XYffc_FLw17Mnd-eDRZylOU",
          "Brewing Hub", Member.getMembersList().sublist(4,10), Project.getProjectsList().sublist(0, 4)),
      new Organization("https://drive.google.com/uc?export=view&id=1ra8l1DXy9g0wi6dEeDbxDyMlJmO5YA0u",
          "https://drive.google.com/uc?export=view&id=1w33Bwsu-vC-CUHen6wMg-cq4-uIRNJw2",
          "xLines", Member.getMembersList().sublist(4,7), Project.getProjectsList().sublist(1, 4)), ];
  }
}