import 'package:flutter/material.dart';
import '../../myTheme.dart';
import 'StackButtonWidget.dart';

class HorizontalSliderWidget extends StatelessWidget{
  String title;
  String imgPath;
  // List<String> images;

  HorizontalSliderWidget({required this.title, required this.imgPath});

  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: Container(
        color: MyThemeData.containerColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// title
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 15, 0, 5),
              child: Text(title,
                  style: Theme.of(context).textTheme.titleMedium
                      ?.copyWith(fontWeight: FontWeight.bold)
              ),
            ),

            /// horizontal scroll - list
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder:(context, index) =>
                    StackButtonWidget(
                      state: false,
                      imgPath: imgPath,
                    ),
                itemCount: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }

}