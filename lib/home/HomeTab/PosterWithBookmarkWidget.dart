import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/home/MovieDetailsScreen.dart';
import '../../myTheme.dart';

class PosterWithBookmark extends StatefulWidget {
  bool state;
  var object;
  PosterWithBookmark({this.state = false,required this.object});

  @override
  State<PosterWithBookmark> createState() => _PosterWithBookmarkState();
}

class _PosterWithBookmarkState extends State<PosterWithBookmark> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          /// image
          InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                MovieDetailsScreen.routeName,
                arguments: MovieArgs(
                  object: widget.object
                ),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(7.0),
              child: Stack(
                children: [
                  /// image
                  CachedNetworkImage(
                    imageUrl: "https://image.tmdb.org/t/p/w500${widget.object.posterPath}",
                    fit: BoxFit.fitHeight,
                    height: MediaQuery.of(context).size.height * 0.25,
                    placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => const Center(child: Icon(Icons.error)),
                  ),
                ],
              ),
            ),
          ),

          /// bookmark
          InkWell(
              onTap: () {
                if (widget.state) {
                  widget.state = false;
                } else {
                  widget.state = true;
                }
                setState(() {});
              },
              child: widget.state == false
                  ? Stack(alignment: Alignment.center, children: [
                      /// bookmark
                      Icon(
                        Icons.bookmark,
                        color: MyThemeData.greyColor.withOpacity(0.8),
                        size: 50,
                      ),

                      /// add
                      Icon(Icons.add, color: MyThemeData.whiteColor),
                    ])
                  : Stack(alignment: Alignment.center, children: [
                      /// bookmark
                      Icon(
                        Icons.bookmark,
                        color: MyThemeData.yellowColor.withOpacity(0.8),
                        size: 50,
                      ),

                      /// check
                      Icon(Icons.check, color: MyThemeData.whiteColor),
                    ])),
        ],
      ),
    );
  }
}
