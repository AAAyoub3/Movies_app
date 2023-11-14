import 'package:flutter/material.dart';
import 'package:movies/home/MovieList_item.dart';
import 'package:movies/myTheme.dart';

class WatchListTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height*0.1,),
          /// title
          Text('Watch List',
            style: Theme.of(context).textTheme.titleLarge,
          ),

          /// List View
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) => MovieListItem(),
              separatorBuilder: (context, index) =>
                  Divider(color: MyThemeData.lightGreyColor),
              itemCount: 10,
              padding: const EdgeInsets.symmetric(vertical: 12),
            ),
          ),
        ],
      ),
    );
  }
}
