import 'package:flutter/material.dart';
import 'package:movies/home/HomeTab/Phase2/CategoryWidget.dart';
import 'package:movies/home/HomeTab/PosterWithBookmark.dart';
import '../../../myTheme.dart';
import '../HorizontalSliderWidget.dart';

class MovieDetailsScreen extends StatelessWidget {

  static const String routeName = 'movieDetailsScreen';

  @override
  Widget build(BuildContext context) {

    var args = ModalRoute.of(context)!.settings.arguments as MovieArgs;
    return Scaffold(
      backgroundColor: MyThemeData.blackColor,
      appBar: AppBar(
        title: Text(args.object.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            /// video
            Column(
              children: [
                Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.network("https://image.tmdb.org/t/p/w500${args.object.backdropPath}"),

                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.play_circle),
                        color: MyThemeData.whiteColor,
                        iconSize: 100,
                      ),
                    ]
                ),
              ],
            ),
            
            /// Title and data
            Padding(
              padding: const EdgeInsets.only(left: 12.0, bottom: 6, top: 6),
              child: Text(args.object.title,
                style: Theme.of(context).textTheme.titleMedium,),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0, bottom: 6, top: 6),
              child: Text(args.object.releaseDate,
                style: Theme.of(context).textTheme.bodySmall,),
            ),

            /// image & category & description
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// img and bookmark
                  PosterWithBookmark(object: args.object),
 
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        /// categories
                        SizedBox(
                          height: MediaQuery.of(context).size.height*0.11,
                          child: GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) =>
                                CategoryWidget(category: args.object.genreIds[index]),
                            itemCount: args.object.genreIds.length,
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              childAspectRatio: 2.3,
                            ),
                          ),
                        ),

                        /// description
                        Text(args.object.overview,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        
                        /// star rate
                        Row(
                          children: [
                            Icon(Icons.star, color: MyThemeData.yellowColor,),
                            Text('${args.object.voteAverage}')
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),

            /// More Like This 7ot todo: hna list el MORE LIKESSSSS
            //HorizontalSliderWidget(title: "More Like This", list: ),

            const SizedBox(height: 15)
          ]
      ),
    );
  }
}

class MovieArgs {
  var object;
  MovieArgs({
    required this.object
  });


}
