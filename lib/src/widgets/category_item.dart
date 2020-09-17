import 'package:flutter/material.dart';

import '../shared/colors.dart';
import '../shared/styles.dart';
import '../models.dart';

class CategoryItem extends StatelessWidget {
  final Category category;
  final Color color;
  final VoidCallback onPressed;

  const CategoryItem({
    Key key,
    @required this.category,
    this.color = white,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            width: 86,
            height: 86,
            child: FloatingActionButton(
              shape: CircleBorder(),
              heroTag: '${category.name}',
              onPressed: () => onPressed?.call(),
              backgroundColor: color ?? white,
              child: Icon(category.icon, size: 35, color: Colors.black87),
            ),
          ),
          Text(category.name + ' ›', style: categoryText)
        ],
      ),
    );
  }
}
