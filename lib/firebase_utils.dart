import 'package:cloud_firestore/cloud_firestore.dart';
import 'MovieDataClass.dart';
class FirebaseUtils{

  static CollectionReference<Movie> getMoviesCollection(){
    return  FirebaseFirestore.instance.collection('movies').
    withConverter<Movie>(
        fromFirestore: (snapshot, options) => Movie.fromFireStore(snapshot.data()!),
        toFirestore: (movie, options) => movie.toFireStore()
    );
  }

  static Future<void> addMovieToFireStore(Movie movie){
    var moviesCollection = getMoviesCollection();
    var docRef = moviesCollection.doc();
    return docRef.set(movie);
  }

  static Future<void> deleteMovieFromFireStore(String? id) {
    var moviesCollection = getMoviesCollection();
    return moviesCollection.doc(id).delete();
  }
}