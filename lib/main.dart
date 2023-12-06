import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movies/home/MovieDetailsScreen.dart';
import 'package:provider/provider.dart';
import 'home/BrowseTab/FilteredScreen.dart';
import 'home/homescreen.dart';
import 'home/provider.dart';
import 'myTheme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    /// Providers are above [MyApp] instead of inside it, so that tests
    /// can use [MyApp] while mocking the providers
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => provider_list(),),
      ],
      child: MyApp(),
    ),
  );
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
