import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrum_it/models/Member.dart';
import 'package:scrum_it/models/Organization.dart';
import 'package:scrum_it/widgets/CircleTabIndicator.dart';
import 'package:scrum_it/widgets/LoadImage.dart';
import 'package:scrum_it/widgets/OrganizationItem.dart';
import 'package:scrum_it/widgets/menuIcon.dart';

import '../Utlis.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  List child = Utils.map<Widget>(Organization.getOrganizationData(), (index, i){
    return OrganizationItem(i);
  },).toList();


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.only(top: 48, left: 12, right: 12, bottom: 12),
            child: MenuIcon(16, 8),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 12, left: 12, right: 12, bottom: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text(
                      'Hello,',
                      style:
                          TextStyle(fontWeight: FontWeight.w300, fontSize: 24),
                    ),
                    Text(
                      'Rania Kthiri',
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
                    ),
                  ],
                ),
                Stack(
                  overflow: Overflow.visible,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.8),
                              spreadRadius: 10,
                              blurRadius: 5,
                              offset:
                                  Offset(0, 7), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Image.network(
                              'https://drive.google.com/uc?export=view&id=1UFVwHjuoUQSK1SqYIQ6TjWUVJVjM_fNx'),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 48.0,
                      top: -8,
                      child: Container(
                        width: 21,
                        height: 21,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xffB99EAA),
                        ),
                        child: Center(
                          child: Text(
                            '11',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          /*
          PreferredSize(
            preferredSize: new Size(MediaQuery.of(context).size.width, 100.0),
            child: Container(
              height: 70,
              width: MediaQuery.of(context).size.width,
              child: TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: CircleTabIndicator(color: Color(0xff8288BA), radius: 4),
                  isScrollable: true,
                  labelColor: Colors.black,
                  tabs: [
                    Container(
                      height: 50,
                      child: Tab(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text(
                              "03",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              "Organizations",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      child: Tab(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text(
                              "05",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              "Teams",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      child: Tab(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Text(
                                "15",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                "Projects",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          )
                      ),
                    ),
              ]),
            ),
          ),
 */

          PreferredSize(
            preferredSize: Size(MediaQuery.of(context).size.width, 100.0),
            child: Container(
              height: 70,
              child: TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator:
                      CircleTabIndicator(color: Color(0xff8288BA), radius: 4),
                  isScrollable: true,
                  labelColor: Colors.black,
                  tabs: [
                    Container(
                      height: 50,
                      child: Tab(
                          child: RichText(
                        text: new TextSpan(
                          // Note: Styles for TextSpans must be explicitly defined.
                          // Child text spans will inherit styles from parent
                          style: new TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            new TextSpan(
                              text: "03\n",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                              ),
                            ),
                            new TextSpan(
                              text: "Organizations",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      )),
                    ),
                    Container(
                      height: 50,
                      child: Tab(
                          child: RichText(
                        text: new TextSpan(
                          // Note: Styles for TextSpans must be explicitly defined.
                          // Child text spans will inherit styles from parent
                          style: new TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            new TextSpan(
                              text: "05\n",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                              ),
                            ),
                            new TextSpan(
                              text: "Teams",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      )),
                    ),
                    Container(
                      height: 50,
                      child: Tab(
                          child: RichText(
                        text: new TextSpan(
                          // Note: Styles for TextSpans must be explicitly defined.
                          // Child text spans will inherit styles from parent
                          style: new TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            new TextSpan(
                              text: "15\n",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                              ),
                            ),
                            new TextSpan(
                              text: "Projects",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      )),
                    ),
                  ]),
            ),
          ),

          /*
          TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: CircleTabIndicator(color: Color(0xff8288BA), radius: 4),
              isScrollable: true,
              labelColor: Colors.black,
              tabs: [
                Tab(
                    child: RichText(
                      text: new TextSpan(
                        // Note: Styles for TextSpans must be explicitly defined.
                        // Child text spans will inherit styles from parent
                        style: new TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                          new TextSpan(text: 'Hello'),
                          new TextSpan(text: 'World', style: new TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    )
                ),
                Tab(
                    child: RichText(
                      text: new TextSpan(
                        // Note: Styles for TextSpans must be explicitly defined.
                        // Child text spans will inherit styles from parent
                        style: new TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                          new TextSpan(text: 'Hello'),
                          new TextSpan(text: 'World', style: new TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    )
                ),
                Tab(
                    child: RichText(
                      text: new TextSpan(
                        // Note: Styles for TextSpans must be explicitly defined.
                        // Child text spans will inherit styles from parent
                        style: new TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                          new TextSpan(text: 'Hello'),
                          new TextSpan(text: 'World', style: new TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    )
                ),
              ]),
           */

          Expanded(
            child: TabBarView(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Container(
                        //color: Colors.red,
                        height: 170,
                        child: CarouselSlider(
                          items: child,
                          initialPage: 1,
                          scrollPhysics: BouncingScrollPhysics(),
                          enableInfiniteScroll: true,
                          autoPlay: true,
                          pauseAutoPlayOnTouch: Duration(seconds: 30),
                          enlargeCenterPage: true,
                          aspectRatio: 1.8,
                          viewportFraction: 0.7,
                          height: 170.0,
                        ),
                      ),
                    ),

                  ],
                ),
                Container(
                  height: 10,
                  //color: Colors.white,
                  child: Center(
                    child: Text(
                      'Clients',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                Container(
                  height: 10,
                  //color: Colors.white,
                  child: Center(
                    child: Text(
                      'Completed',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

}
