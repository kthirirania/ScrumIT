import 'package:flutter/material.dart';
import 'package:scrum_it/models/Member.dart';

import 'LoadImage.dart';

class HorizontalListView extends StatefulWidget {
  List<Member> list;
  int maxNumber;
  double size = 40;
  bool withAddButton = false;

  HorizontalListView(this.list, this.maxNumber,
      [this.size = 40, this.withAddButton = false]);

  @override
  _HorizontalListViewState createState() => _HorizontalListViewState();
}

class _HorizontalListViewState extends State<HorizontalListView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.size,
      width: widget.list.length > widget.maxNumber
          ? widget.withAddButton
              ? (widget.maxNumber.toDouble() + 2) * widget.size + 10
              : (widget.maxNumber.toDouble() + 1) * widget.size + 10
          : widget.withAddButton
              ? (widget.maxNumber.toDouble() + 1) * widget.size + 10
              : widget.maxNumber.toDouble() * widget.size + 10,
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
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                    padding: const EdgeInsets.only(right: 1.0),
                    child: LoadImage(
                        widget.size,
                        widget.size,
                        widget.list[index].image,
                        widget.size,
                        widget.size,
                        widget.size,
                        widget.size,
                        true));
              }),
          if (widget.list.length > widget.maxNumber)
            Container(
              height: widget.size,
              width: widget.size,
              decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.circular(widget.size),
                border: Border.all(color: Colors.white),
              ),
              child: Center(
                child: Text(
                  '+' + (widget.list.length - widget.maxNumber).toString(),
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          if (widget.withAddButton)
            Container(
              height: widget.size,
              width: widget.size,
              decoration: BoxDecoration(
                color: Color(0xff8288BA),
                borderRadius: BorderRadius.circular(widget.size),
                border: Border.all(color: Colors.white),
              ),
              child: Center(
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: widget.size - widget.size / 3,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
