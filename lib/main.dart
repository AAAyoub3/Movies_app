import 'package:flutter/material.dart';
import 'package:movies/home/MovieDetailsScreen.dart';
import 'home/BrowseTab/Filtered_screen.dart';
import 'home/homescreen.dart';
import 'myTheme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies App',
      debugShowCheckedModeBanner: false,
      theme: MyThemeData.darkTheme,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName : (context) => HomeScreen(),
        MovieDetailsScreen.routeName : (context) => MovieDetailsScreen(),
        FilterScreen.routeName : (context) => FilterScreen(),
      },
    );
  }
}