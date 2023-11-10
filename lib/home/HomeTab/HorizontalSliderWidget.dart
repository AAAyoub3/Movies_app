import 'package:flutter/material.dart';
import '../../myTheme.dart';
import 'PosterWithBookmark.dart';

class HorizontalSliderWidget extends StatelessWidget{
  String title;
  var list;
  String type;
  HorizontalSliderWidget({required this.title, required this.list,required this.type});

  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Container(
          color: MyThemeData.containerColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// title
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 15, 0, 5),
                child: Text(title,
                    style: Theme.of(context).textTheme.titleMedium
                        ?.copyWith(fontWeight: FontWeight.bold)
                ),
              ),

              /// horizontal scroll - list
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder:(context, index) =>
                      PosterWithBookmark(
                        imgPath: "https://image.tmdb.org/t/p/w500${list![index].posterPath}",
                        type: type,
                        title: list![index].title,
                        voteAverage: list![index].voteAverage,
                        releaseDate: list![index].releaseDate,
                      ),
                  itemCount: list!.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}