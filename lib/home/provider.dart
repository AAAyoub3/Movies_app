import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../MovieDataClass.dart';
import '../firebase_utils.dart';

class provider_list extends ChangeNotifier {
  List<Movie> Movieslist =[];

  void getAllMoviesFromFireStore() async{
    QuerySnapshot<Movie> querySnapshot = await FirebaseUtils.getMoviesCollection().get();
    Movieslist = querySnapshot.docs.map((doc){return doc.data();}).toList();
    notifyListeners();
  }
}