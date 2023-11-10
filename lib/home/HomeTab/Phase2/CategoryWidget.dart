import 'package:flutter/material.dart';

import '../../../myTheme.dart';

class CategoryWidget extends StatelessWidget {

  String category;
  CategoryWidget({required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 10, left: 6, right: 6),
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: MyThemeData.lightGreyColor)
        ),
        child: Text(category,
          style: Theme.of(context).textTheme.bodySmall,
        )
    );
  }
}
