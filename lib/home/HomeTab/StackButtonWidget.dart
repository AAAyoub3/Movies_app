import 'package:flutter/material.dart';
import 'package:movies/home/HomeTab/MovieDetailsScreen.dart';
import '../../myTheme.dart';

class StackButtonWidget extends StatefulWidget{

  bool state;
  String imgPath;
  StackButtonWidget({this.state = false, required this.imgPath});

  @override
  State<StackButtonWidget> createState() => _StackButtonWidgetState();
}

class _StackButtonWidgetState extends State<StackButtonWidget> {

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          /// image
          InkWell(
            onTap: (){
              Navigator.pushNamed(context, MovieDetailsScreen.routeName,
                  arguments: MovieArgs(
                      title: 'Movie Title',
                      imgPath: widget.imgPath
                  )
              );
            },
            child: Image.network(widget.imgPath,scale: MediaQuery.of(context).size.height*0.005)
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
        ],
      ),
    );
  }
}