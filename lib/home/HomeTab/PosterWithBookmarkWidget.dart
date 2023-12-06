import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/home/MovieDetailsScreen.dart';
import 'package:provider/provider.dart';
import '../../MovieDataClass.dart';
import '../../firebase_utils.dart';
import '../../myTheme.dart';
import '../provider.dart';

class PosterWithBookmark extends StatefulWidget {
  bool state;
  var object;
  PosterWithBookmark({this.state = false,required this.object});

  @override
  State<PosterWithBookmark> createState() => _PosterWithBookmarkState();
}

class _PosterWithBookmarkState extends State<PosterWithBookmark> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var listprovider= Provider.of<provider_list>(context);
    listprovider.getAllMoviesFromFireStore();
    for(int i = 0 ;i<listprovider.Movieslist.length;i++){
      if(listprovider.Movieslist[i].id == widget.object.id)
        {setState(() {
          widget.state =true;
        });}
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key:formKey,
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
                  setState((){
                    if(widget.state==false){
                      AddMovie();
                      widget.state=true;
                    }
                    });
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
      ),
    );
  }
  void AddMovie(){ /// working
    if(formKey.currentState!.validate()){
      FirebaseUtils.addMovieToFireStore(Movie(
        title: widget.object.title,
        posterPath: widget.object.posterPath,
        releaseDate: widget.object.releaseDate,
        voteCount: widget.object.voteCount,
        id: widget.object.id,
        backdropPath: widget.object.backdropPath,
        adult: widget.object.adult,
        genreIds: widget.object.genreIds,
        originalLanguage: widget.object.originalLanguage,
        originalTitle: widget.object.originalTitle,
        overview:widget.object. overview,
        popularity: widget.object.popularity,
        video: widget.object.video,
        voteAverage: widget.object.voteAverage,
      ));
    }
    else{
      setState(() {
        print('Error');
      });
    }
  }
}
