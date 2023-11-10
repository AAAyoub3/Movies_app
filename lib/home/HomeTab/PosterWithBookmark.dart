import 'package:flutter/material.dart';
import 'package:movies/home/HomeTab/Phase2/MovieDetailsScreen.dart';
import '../../myTheme.dart';

class PosterWithBookmark extends StatefulWidget{

  bool state;
  String imgPath;
  String type;
  String? releaseDate;
  String? title;
  num? voteAverage;
  PosterWithBookmark({this.state = false, required this.imgPath,required this.type,this.title='',this.voteAverage=0,this.releaseDate=''});

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
                  title: 'Movie Title',
                  imgPath: widget.imgPath,
                ),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(7.0),
              child: Stack(
                children: [
                  /// image
                  Image.network(widget.imgPath, scale: MediaQuery.of(context).size.height * 0.005,),
                ],
              ),
            ),
          ),

          /// bookmark
          InkWell(
              onTap: (){
                if(widget.state){
                  widget.state = false;
                }
                else{
                  widget.state = true;
                }
                setState(() {});
              },
              child: widget.state == false ?
              Stack(
                  alignment: Alignment.center,
                  children:[
                    /// bookmark
                    Icon(
                      Icons.bookmark,
                      color: MyThemeData.greyColor.withOpacity(0.8),
                      size: 50,
                    ),
                    /// add
                    Icon(
                        Icons.add,
                        color: MyThemeData.whiteColor
                    ),
                  ]
              ) :
              Stack(
                  alignment: Alignment.center,
                  children:[
                    /// bookmark
                    Icon(
                      Icons.bookmark,
                      color: MyThemeData.yellowColor.withOpacity(0.8),
                      size: 50,
                    ),
                    /// check
                    Icon(
                        Icons.check,
                        color: MyThemeData.whiteColor
                    ),
                  ]
              )
          ),

          /// data
          /*if (widget.type == 'Recommended') Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: MyThemeData.darkGreyColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.star, color: MyThemeData.yellowColor,),
                      Text(' ${widget.voteAverage}',),
                    ],
                  ),
                  Text(widget.title!),
                  Text(widget.releaseDate!,style: Theme.of(context).textTheme.titleSmall!.copyWith(color: MyThemeData.lightGreyColor)),
                ],
              ),
            ),
          )*/
        ],
      ),
    );
  }
}
