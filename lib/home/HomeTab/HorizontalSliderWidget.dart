import 'package:flutter/material.dart';

import '../../myTheme.dart';
import 'bookMarkButton.dart';

class HorizontalSliderWidget extends StatelessWidget{
  String title;
  String image;
  HorizontalSliderWidget({required this.title,required this.image});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: MyThemeData.containerColor,
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 15, 0, 5),
              child: Text(title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder:(context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Stack(
                        alignment: Alignment.topLeft,
                        children:[
                          Image.asset(image, scale: 4),
                          BookMarkButton()
                        ] ),
                  );
                } ,itemCount: 10,),
            ),
          ],
        ),
      ),
    );
  }

}