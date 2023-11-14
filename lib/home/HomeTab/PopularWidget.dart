import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../myTheme.dart';
import 'PosterWithBookmarkWidget.dart';

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
          Column(
            children: [
              Stack(
                  alignment: Alignment.center,
                  children: [
                    CachedNetworkImage(
                      imageUrl: "https://image.tmdb.org/t/p/w500${list![index].backdropPath}",
                      fit: BoxFit.fitWidth,
                      placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
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

          /// movie's pic && data
          Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                /// Poster
                PosterWithBookmark(object: list![index]),

                /// Data
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
        ],
      ),
    );
  }
}