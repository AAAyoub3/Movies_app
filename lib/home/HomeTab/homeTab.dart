import 'package:flutter/material.dart';
import 'package:movies/home/HomeTab/HorizontalSliderWidget.dart';
import 'package:movies/myTheme.dart';
import 'StackButtonWidget.dart';

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
            /// video
            Column(
                children: [
                  ClipRect(
                    child: Align(
                      alignment: Alignment.center,
                      heightFactor: 0.3,
                      child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.asset("assets/images/Doraa2.png", scale: 3.5,),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.play_circle),
                              color: MyThemeData.whiteColor,
                              iconSize: 100,
                            )
                          ]
                      ),
                    ),
              ),
                  const SizedBox(height: 70,)
                ]
            ),

            /// movie's pic && data
            Padding(
              padding: const EdgeInsets.only(bottom: 11),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    /// pic
                    StackButtonWidget(
                      state: false,
                      imgPath: "assets/images/Doraa2.png",
                    ),
                    /// data
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, left: 8.0),
                          child: Text("Dora and the lost city of gold",
                              style: Theme.of(context).textTheme.titleSmall),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("2019  PG-13  2h 7m",
                              style: Theme.of(context).textTheme.titleSmall
                                  ?.copyWith(fontSize: 10)),
                        ),
                      ],
                    )
                  ]
              ),
            ),
          ],
        ),

        /// new releases
        HorizontalSliderWidget(title: "New Releases",
          imgPath: "assets/images/Doraa2.png",),
        const SizedBox(height: 30,),

        /// recommended
        HorizontalSliderWidget(title: "Recommended",
            imgPath: "assets/images/Doraa2.png"),
        const SizedBox(height: 30,),
      ],
    );
  }
}
