import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:scrum_it/models/UserStory.dart';

import '../Utlis.dart';
import 'HorizontalListView.dart';

class UserStoryItem extends StatelessWidget {
  UserStory userStory;

  UserStoryItem(this.userStory);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0, left: 12, right: 12),
      child: Container(
        height: 190,
        decoration: BoxDecoration(
          color: Color(0xffF6F7FA),
          boxShadow: [
            BoxShadow(
              color: Color(0x33B8B9BF),
              blurRadius: 20.0,
              spreadRadius: 0.0,
              offset: Offset(
                0.0,
                0.0,
              ),
            ),
          ],
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: StatusColors.getColor(userStory.status)),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: Text(
                        '12h',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: RotatedBox(
                      quarterTurns: 1,
                      child: SvgPicture.asset(
                        'assets/icons/more.svg',
                        height: 16,
                        //width: 18,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 24.0),
                      child: SvgPicture.asset(
                        'assets/icons/chat.svg',
                        height: 16,
                        //width: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(userStory.title),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 4, bottom: 4),
              child: HorizontalListView(userStory.members, 8, 32, true),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 4, left: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SvgPicture.asset(
                    'assets/icons/priority.svg',
                    height: 14,
                    //width: 18,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20, left: 8),
                    child: Text(
                      userStory.priority.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  SvgPicture.asset(
                    'assets/icons/tasks.svg',
                    height: 14,
                    //width: 18,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20, left: 8),
                    child: Text(
                      userStory.tasks.length.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  SvgPicture.asset(
                    'assets/icons/time.svg',
                    height: 14,
                    //width: 18,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20, left: 8),
                    child: Text(
                      Utils.getDate(userStory.startDate, userStory.endDate)
                          .toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Stack(
                children: <Widget>[
                  Container(
                    height: 4.0,
                    decoration: new BoxDecoration(
                      color: Color(0xff8288BA).withOpacity(0.3),
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                  ),
                  Positioned(
                    child: Container(
                      height: 4.0,
                      width: MediaQuery.of(context).size.width *
                          userStory.progress,
                      decoration: new BoxDecoration(
                        color: Color(0xff8288BA),
                        borderRadius: BorderRadius.all(
                          Radius.circular(4),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4, bottom: 4.0),
              child: Center(
                child: Text(
                  (userStory.progress * 100).round().toString() + ' %',
                  style: TextStyle(
                      color: Color(0xff8288BA), fontWeight: FontWeight.w500),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
