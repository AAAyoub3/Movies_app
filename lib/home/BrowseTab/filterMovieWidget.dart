import 'package:flutter/material.dart';
import 'package:movies/home/MovieDetailsScreen.dart';
import 'package:movies/myTheme.dart';

class FilterMovieWidget extends StatelessWidget {
  var object;
  FilterMovieWidget({required this.object});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){Navigator.pushNamed(context, MovieDetailsScreen.routeName,arguments: MovieArgs(object: object));},
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Image.network("https://image.tmdb.org/t/p/w500${object.posterPath}",scale: 4),
            SizedBox(width: 10),
            Expanded(child: Text(object.title,maxLines: 3,style:Theme.of(context).textTheme.titleMedium!.copyWith(color: MyThemeData.whiteColor)))
          ],
        ),
      ),
    );
  }
}
