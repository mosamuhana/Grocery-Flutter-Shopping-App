import 'package:flutter/material.dart';

import '../../shared/styles.dart';

class HorizontalHeaderedList extends StatelessWidget {
  final List<Widget> children;
  final double height;
  final String title;
  final VoidCallback onViewMore;
  final bool shrinkWrap;

  const HorizontalHeaderedList({
    Key key,
    @required this.children,
    @required this.title,
    this.height,
    this.onViewMore,
    this.shrinkWrap = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildHeader(context),
        SizedBox(
          height: height ?? 150,
          child: ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: shrinkWrap,
            children: children,
          ),
        )
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 15, top: 10),
          child: Text(title, style: h4),
        ),
        Container(
          margin: EdgeInsets.only(left: 15, top: 2),
          child: FlatButton(
            onPressed: onViewMore,
            child: Text('View All ›', style: contrastText),
          ),
        )
      ],
    );
  }
}
