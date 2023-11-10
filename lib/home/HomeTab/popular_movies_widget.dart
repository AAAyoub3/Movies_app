import 'package:flutter/material.dart';

import '../../myTheme.dart';
import 'StackButtonWidget.dart';

class PopularMoviesWidget extends StatelessWidget{
  int index;
  var list;
  PopularMoviesWidget({required this.index,required this.list});
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        /// video
        Column(
          children: [
            Stack(
                alignment: Alignment.center,
                children: [
                  Image.network("https://image.tmdb.org/t/p/w500${list![index].backdropPath}"),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.play_circle),
                    color: MyThemeData.whiteColor,
                    iconSize: 100,
                  ),
                ]
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.07),
          ],
        ),


        /// movie's pic && data
        Padding(
          padding: const EdgeInsets.only(bottom: 11),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                /// pic
                StackButtonWidget(
                  imgPath: "https://image.tmdb.org/t/p/w500${list![index].posterPath}",
                ),
                /// data
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, left: 8.0),
                      child: Text(list![index].title,
                          style: Theme.of(context).textTheme.titleSmall),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(list![index].releaseDate,
                          style: Theme.of(context).textTheme.titleSmall
                              ?.copyWith(fontSize: 10)),
                    ),
                  ],
                )
              ]
          ),
        ),
      ],
    );
  }

}