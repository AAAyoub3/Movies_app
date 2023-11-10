import 'package:flutter/material.dart';
import 'package:movies/API/api_manager.dart';
import 'package:movies/home/HomeTab/HorizontalSliderWidget.dart';
import 'package:movies/home/HomeTab/popular_movies_widget.dart';
import 'package:movies/model/popularResource.dart';
import 'dart:async';


class HomeTab extends StatefulWidget {
  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  late PageController _pageController;
  late var list;
  @override
  void initState() {
    super.initState();
    _pageController = PageController();

    Timer.periodic(const Duration(seconds: 10), (Timer timer) { /// Duration to the run this code section
        if (_pageController.hasClients) {
        var nextPage = _pageController.page! + 1;

        if (nextPage >= list!.length) { /// Reached the end then start over
          _pageController.jumpToPage(0);
        }
        else {
          _pageController.nextPage( /// Switching to the next page
            duration: const Duration(seconds: 1), /// swapping duration
            curve: Curves.easeInOut, /// Speed of swapping
            /// easeIn : slow start , easeOut : slow end , easeInOut smooth transition between start & end
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PopularResource?>(future: ApiManager.getPopular(),
        builder: (context, snapshot) {

          /// If he is still loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator(color: Theme
                .of(context)
                .primaryColor));
          }

          /// User Error
          else if (snapshot.hasError) {
            return Column(
              children: [
                Text(snapshot.data?.status_message ?? ''),
                ElevatedButton(onPressed: () {}, child: const Text("Try Again"))
              ],
            );
          }

          /// API Error
          if (snapshot.data?.results == null) {
            return Column(
              children: [
                Text(snapshot.data?.status_message ?? ''),
                ElevatedButton(onPressed: () {}, child: const Text("Try Again"))
              ],
            );
          }
          list = snapshot.data?.results; /// list for popular

          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              /// popular
              SizedBox(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.37,
                width: double.infinity,
                child: PageView.builder(
                  controller: _pageController,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) =>
                      PopularMoviesWidget(
                        index: index,
                        list: list,
                      ),
                  itemCount: list!.length,
                ),
              ),

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

