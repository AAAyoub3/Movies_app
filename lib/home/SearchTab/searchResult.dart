import 'package:flutter/material.dart';
import 'package:movies/home/MovieList_item.dart';
import 'package:movies/model/searchResource.dart';

import '../../API/api_manager.dart';
import '../MovieDetailsScreen.dart';

class SearchResult extends StatefulWidget {
  String title;
  SearchResult({required this.title});

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<SearchResource?>(
        future: ApiManager.getSearch(widget.title),
        builder: (context, snapshot) {

          var searchResponse = snapshot.data;
          List<Results>? searchList = searchResponse?.results;

          /// If it is still loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor));
          }

          /// User Error
          if (snapshot.hasError) {
            return Column(
              children: [
                Text(searchResponse?.status_message ?? ''),
                ElevatedButton(onPressed: () {}, child: const Text("Try Again"))
              ],
            );
          }

          /// API Error
          if (searchResponse?.results == null) {
            return Center(
                heightFactor: MediaQuery.of(context).size.height*0.0062,
                child: Image.asset("assets/images/Group 22.png"));
          }

          /// movies found
          return Expanded(child: ListView.builder(itemBuilder: (context, index) => MovieListItem(object: searchList?[index]),itemCount: searchList?.length));
        });
  }
}
