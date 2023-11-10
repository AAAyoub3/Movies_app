import 'package:flutter/material.dart';

import '../../myTheme.dart';
import 'StackButtonWidget.dart';

class PopularMoviesWidget extends StatelessWidget{
  int index;
  var list;
  PopularMoviesWidget({required this.index,required this.list});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          /// video
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
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
              ],
            ),
          ),

          /// movie's pic && data
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  /// pic
                  StackButtonWidget(
                    imgPath: "https://image.tmdb.org/t/p/w500${list![index].posterPath}",
                  ),

                  /// data
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(list![index].title,
                              style: Theme.of(context).textTheme.titleSmall,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                          ),

                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(list![index].releaseDate,
                              style: Theme.of(context).textTheme.titleSmall
                                  ?.copyWith(fontSize: 10)),
                        ),
                      ],
                    ),
                  )
                ]
            ),
          ),
        ],
      ),
    );
  }
}