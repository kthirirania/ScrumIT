import 'package:flutter/material.dart';
import 'package:scrum_it/models/Member.dart';
import 'package:scrum_it/models/Organization.dart';

class OrganizationItem extends StatelessWidget {

  /*
  final List<Member> members = [
    new Member(
        "https://drive.google.com/uc?export=view&id=1Ys39cycdk2lwBcmasJwAesYgYH7RjMMy",
        "",
        ""),
    new Member(
        "https://drive.google.com/uc?export=view&id=1-cEfiVtfrcNMNxDFIvZM3vG2lSYtmsvk",
        "",
        ""),
    new Member(
        "https://drive.google.com/uc?export=view&id=1_Gw8zH53C_ytYko6Mc463UvWDQi3uaOS",
        "",
        ""),
    new Member(
        "https://drive.google.com/uc?export=view&id=1hwWbkT5OhQuPdOLs-AX2dKkfUfxX5vtS",
        "",
        ""),
    new Member(
        "https://drive.google.com/uc?export=view&id=1fW8Vwvwlts_9yXuIxkprzH_qg9IECZdA",
        "",
        "")
  ];*/


  Organization organization;

  OrganizationItem(this.organization);


  @override
  Widget build(BuildContext context) {

    return Container(
      height: 170,
      width: 260,
      decoration: new BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(24),),
          border: Border.all(color: Colors.grey[100],),
          boxShadow: [
            BoxShadow(color: Colors.grey[100], blurRadius: 10, spreadRadius: 5)
          ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Flexible(
            flex: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
              child: Container(
                child: Align(
                  alignment: Alignment.center,
                  child: Image.network(
                    organization.coverImage,
                    //"https://drive.google.com/uc?export=view&id=1_TAqF38E3XYffc_FLw17Mnd-eDRZylOU",
                    height: 90,
                    width: 260,
                    fit: BoxFit.cover,),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Flexible(
                    flex: 2,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                      child: Container(
                        child: Align(
                          alignment: Alignment.center,
                          child: Image.network(
                            organization.logo,
                            //"https://drive.google.com/uc?export=view&id=1l0ztgFzFmWAUa7YbtkYWA8JK4jzpbOWw",
                            height: 68,
                            width: 68,
                            fit: BoxFit.contain,),
                        ),
                      ),
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
                          //"Brewing Hub",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                        SizedBox(
                          height: 40,
                          width: 174,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: organization.members.length > 3 ? 3: organization.members.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(right: 1.0),
                                      child: ClipOval(
                                        child: Image.network(
                                          organization.members[index].image,
                                          height: 40,
                                          width: 40,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    );
                                  }),
                              if (organization.members.length > 3) Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  child: Center(
                                    child: Text('+'+ (organization.members.length - 3).toString(), style: TextStyle(
                                        color: Colors.white
                                    ),),
                                  )
                              ),
                            ],
                          ),
                        ),
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
