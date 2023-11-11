import 'package:flutter/material.dart';
import 'package:movies/myTheme.dart';

class FilterMovieWidget extends StatelessWidget {
  String imgPath;
  String title;
  FilterMovieWidget({required this.title,required this.imgPath});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Image.network("https://image.tmdb.org/t/p/w500${imgPath}",scale: 4),
          SizedBox(width: 10),
          Expanded(child: Text(title,maxLines: 3,style:Theme.of(context).textTheme.titleMedium!.copyWith(color: MyThemeData.whiteColor)))
        ],
      ),
    );
  }
}
