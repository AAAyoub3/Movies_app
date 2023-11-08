import 'package:flutter/material.dart';

import '../../myTheme.dart';

class BookMarkButton extends StatefulWidget{
  const BookMarkButton({super.key});

  @override
  State<BookMarkButton> createState() => _BookMarkButtonState();
}

class _BookMarkButtonState extends State<BookMarkButton> {
  @override
  Widget build(BuildContext context) {
    bool state = false;
    return InkWell(
      onTap: (){
        setState(() {
          state = true;
        });
      },  /// ADD BUTTON HERE
      child: state == false ?
      Stack(
          alignment: Alignment.center,
          children:[
            Icon(Icons.bookmark,color: MyThemeData.greyColor.withOpacity(0.8),size: 50,),
            Icon(Icons.add,color: MyThemeData.whiteColor),
          ]
      ):
      Stack(
          alignment: Alignment.center,
          children:[
            Icon(Icons.bookmark,color: MyThemeData.yellowColor.withOpacity(0.8),size: 50,),
            Icon(Icons.check,color: MyThemeData.whiteColor),
          ]
      )
    );
  }
}