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
        title: Text(args.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            /// video 
            ClipRect(
              child: Align(
                alignment: Alignment.center,
                heightFactor: 0.3,
                child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(args.imgPath, scale: 3.5,),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.play_circle),
                        color: MyThemeData.whiteColor,
                        iconSize: 60,
                      )
                    ]
                ),
              ),
            ),
            
            /// Title and data
            Padding(
              padding: const EdgeInsets.only(left: 12.0, bottom: 6, top: 6),
              child: Text(args.title,
                style: Theme.of(context).textTheme.titleMedium,),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0, bottom: 6, top: 6),
              child: Text("2019 PG-13 2h 30mins",
                style: Theme.of(context).textTheme.bodySmall,),
            ),

            /// image & category & description
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// img and bookmark
                  PosterWithBookmark(imgPath: args.imgPath,type: ''),
 
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
                                CategoryWidget(category: "Category1",),
                            itemCount: 6,
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              childAspectRatio: 2.3,
                            ),
                          ),
                        ),

                        /// description
                        Text('Dora Marquez embarks on a mission with her monkey, '
                            'Boots, and her friends to rescue her missing parents '
                            'and solve the mystery of a fabled city of gold.',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        
                        /// star rate
                        Row(
                          children: [
                            Icon(Icons.star, color: MyThemeData.yellowColor,),
                            Text('7.3')
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),

            /// More Like This
            //HorizontalSliderWidget(title: "More Like This",
            //    imgPath: "assets/images/Doraa2.png"),

            const SizedBox(height: 15,)
          ]
      ),
    );
  }
}

class MovieArgs {
  String title;
  String imgPath;

  MovieArgs({
    required this.title,
    required this.imgPath
  });
}
