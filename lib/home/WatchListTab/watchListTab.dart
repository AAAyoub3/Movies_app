import 'package:flutter/material.dart';
import 'package:movies/home/MovieList_item.dart';
import 'package:movies/myTheme.dart';
import 'package:provider/provider.dart';

import '../provider.dart';

class WatchListTab extends StatefulWidget {

  @override
  State<WatchListTab> createState() => _WatchListTabState();
}

class _WatchListTabState extends State<WatchListTab> {
  @override
  Widget build(BuildContext context) {

    var listprovider= Provider.of<provider_list>(context);
    listprovider.getAllMoviesFromFireStore();
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
              itemBuilder: (context, index) => MovieListItem(object: listprovider.Movieslist[index],state: true),
              separatorBuilder: (context, index) =>
                  Divider(color: MyThemeData.lightGreyColor),
              itemCount: listprovider.Movieslist.length,
              padding: const EdgeInsets.symmetric(vertical: 12),
            ),
          ),
        ],
      ),
    );
  }
}
