import 'package:flutter/material.dart';
import 'package:movies/home/HomeTab/HorizontalSliderWidget.dart';
import 'package:movies/myTheme.dart';

import 'bookMarkButton.dart';

class HomeTab extends StatefulWidget {
  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Column(children: [
              ClipRect(
                child: Align(
                  alignment: Alignment.center,
                  heightFactor: 0.3,
                  child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset("assets/images/Image.png"),
                        IconButton(onPressed: (){},
                            icon: const Icon(Icons.play_circle),
                            color: MyThemeData.whiteColor,
                            iconSize: 100,)
                      ]),
                ),
              ),
              const SizedBox(
                height: 70,
              )
            ]),
            IntrinsicHeight(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(children: [
                  Stack(
                      alignment: Alignment.topLeft,
                      children:[
                    Image.asset("assets/images/Image.png", scale: 3.5),
                    BookMarkButton()
                  ] ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Dora and the lost city of gold",
                            style: Theme.of(context).textTheme.titleSmall),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("2019  PG-13  2h 7m",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(fontSize: 10)),
                      ),
                    ],
                  )
                ]),
              ),
            ),
          ],
        ),
        HorizontalSliderWidget(title: "New Releases" ,image: "assets/images/toystory.png"),
        SizedBox(height: 30,),
        HorizontalSliderWidget(title: "Recommended" ,image: "assets/images/2.png" ),
        SizedBox(height: 30,),
      ],
    );
  }
}
