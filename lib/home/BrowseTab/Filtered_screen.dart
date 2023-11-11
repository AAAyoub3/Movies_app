import 'package:flutter/material.dart';
import 'package:movies/home/BrowseTab/filterMovieWidget.dart';
import 'package:movies/myTheme.dart';

class FilterScreen extends StatelessWidget {
  static const String routeName = 'Filter_screen';
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as FilterDataArgs;

    return Scaffold(
      backgroundColor: MyThemeData.blackColor,
      appBar: AppBar(title: Text(args.title)),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(itemBuilder: (context, index) => FilterMovieWidget(
                title: args.list[index].title,
                imgPath: args.list[index].posterPath),
                itemCount: args.list.length),
          ),
        ],
      ),
    );
  }
}
class FilterDataArgs{
  var list;
  String title;
  FilterDataArgs({required this.list,required this.title});
}
