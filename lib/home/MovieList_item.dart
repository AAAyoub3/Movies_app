import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/home/HomeTab/PosterWithBookmarkWidget.dart';

class MovieListItem extends StatelessWidget {
  var object;
  MovieListItem({required this.object});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          /// image and bookmark
          PosterWithBookmark(object: object),

           SizedBox(width: 12,),

          /// side texts
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            width: MediaQuery.of(context).size.width*0.5,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(object.title, style: Theme.of(context).textTheme.bodyMedium,maxLines: 3),
                  Text(object.releaseDate, style: Theme.of(context).textTheme.bodySmall,maxLines: 3),
                  Text("${object.voteCount}", style: Theme.of(context).textTheme.bodySmall,maxLines: 3),
                ],
              ),
          ),
        ],
      ),
    );
  }
}
