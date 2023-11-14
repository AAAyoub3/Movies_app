import 'package:flutter/material.dart';
import '../../myTheme.dart';

class SearchTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height*0.08),
          /// search
          Container(
            margin: const EdgeInsets.all(10),
            height: MediaQuery.of(context).size.height*0.07,
            child: TextField(
              style: Theme.of(context).textTheme.bodyMedium,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search_rounded,
                  color: MyThemeData.whiteColor,
                ),
                hintText: "Search",
                hintStyle: Theme.of(context).textTheme.bodyMedium,
                fillColor: MyThemeData.greyColor,
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    color: MyThemeData.whiteColor,
                    width: 1
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    color: MyThemeData.whiteColor,
                    width: 1
                  ),
                ),
                //icon: Icon(Icons.search_rounded)
              ),
            ),
          ),

          /// no movies found
          Center(
            heightFactor: MediaQuery.of(context).size.height*0.0062,
              child: Image.asset("assets/images/Group 22.png")),
        ],
      ),
    );
  }
}
