import 'package:flutter/material.dart';
import 'package:scrum_it/models/Member.dart';

import 'LoadImage.dart';

class HorizontalListView extends StatefulWidget {

  List<Member> list;
  int maxNumber;

  HorizontalListView(this.list, this.maxNumber);

  @override
  _HorizontalListViewState createState() => _HorizontalListViewState();
}

class _HorizontalListViewState extends State<HorizontalListView> {
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 40,
      width: (widget.maxNumber.toDouble() + 1) * 40 + 10 ,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: widget.list.length > widget.maxNumber
                  ? widget.maxNumber
                  : widget.list.length,
              itemBuilder:
                  (BuildContext context, int index) {
                return Padding(
                    padding:
                    const EdgeInsets.only(right: 1.0),
                    child: LoadImage(40, 40, widget.list[index].image, 40, 40, 40, 40, true)
                );
              }),
          if (widget.list.length > 3)
            Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(color: Colors.white),
                ),
                child: Center(
                  child: Text(
                    '+' +
                        (widget.list.length - 3)
                            .toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                )),
        ],
      ),
    );
  }
}
