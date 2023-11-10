import 'package:flutter/material.dart';
import 'package:movies/API/api_manager.dart';
import 'package:movies/home/HomeTab/HorizontalSliderWidget.dart';
import 'package:movies/home/HomeTab/popular_movies_widget.dart';
import 'package:movies/model/popularResource.dart';
import 'package:movies/myTheme.dart';
import 'StackButtonWidget.dart';

class HomeTab extends StatefulWidget {
  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PopularResource?>(future: ApiManager.getPopular(),
        builder: (context,snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){  /// If he is still loading
            return Center(child: CircularProgressIndicator(color: Theme.of(context).primaryColor));
          }
          /// User Error
          else if (snapshot.hasError){
            return Column(
              children: [
                Text(snapshot.data?.status_message ?? ''),
                ElevatedButton(onPressed: (){}, child: const Text("Try Again"))
              ],
            );
          }

          /// API Error
          if (snapshot.data?.results == null){
            return Column(
              children: [
                Text(snapshot.data?.status_message ?? ''),
                ElevatedButton(onPressed: (){}, child: const Text("Try Again"))
              ],
            );
          }

          var list = snapshot.data?.results;

          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              /// popular
              SizedBox(
                height: MediaQuery.of(context).size.height*0.42,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder:(context, index) => PopularMoviesWidget(index: index, list: list) ,
                  itemCount: list!.length,
                ),),

              /// new releases
              HorizontalSliderWidget(title: "New Releases",
                imgPath: "assets/images/Doraa2.png",),
              const SizedBox(height: 30,),

              /// recommended
              HorizontalSliderWidget(title: "Recommended",
                  imgPath: "assets/images/Doraa2.png"),
              const SizedBox(height: 30,)

            ],
          );

        });


  }
}
