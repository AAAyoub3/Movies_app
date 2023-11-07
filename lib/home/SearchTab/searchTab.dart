import 'package:flutter/material.dart';
import '../../myTheme.dart';

class SearchTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          height: 50,
          width: 320,
          margin: EdgeInsets.only(
            top: 50,
            left: 25,
            right: 10,
          ),
          child: TextField(
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.search_rounded,
                color: MyThemeData.whiteColor,
              ),
              hintText: "Search",
              hintStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w200,
                fontSize: 14,
              ),
              fillColor: MyThemeData.greyyColor,
              filled: true,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                  color: MyThemeData.whiteColor,
                ),
              ),

              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                  color: MyThemeData.greyyColor,
                ),
              ),
              //icon: Icon(Icons.search_rounded)
            ),
          ),
        ),
        Container(
            margin: EdgeInsets.only(
              top: 220,
            ),
            child: Center(child: Image.asset("assets/images/Group 22.png"))),
      ],
    );
  }
}
