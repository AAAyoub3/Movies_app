import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:movies/API/api_constants.dart';
import 'package:movies/model/SimilarResource.dart';
import '../model/DiscoverResource.dart';
import '../model/categoriesResource.dart';
import '../model/popularResource.dart';
import '../model/recommendResource.dart';
import '../model/releasesResource.dart';
import '../model/searchResource.dart';

class ApiManager{
  static Future<PopularResource> getPopular() async{

    Uri url = Uri.https(ApiConstants.baseURL,ApiConstants.popularAPI);

    try{
      var response = await http.get(url,headers: {HttpHeaders.authorizationHeader: ApiConstants.authenticationKey});
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return PopularResource.fromJson(json);
    }
    catch(e){
      throw (e);
    }
  }

  static Future<NewReleasesResource> getRelease() async{

    Uri url = Uri.https(ApiConstants.baseURL,ApiConstants.releaseAPI);

    try{
      var response = await http.get(url,headers: {HttpHeaders.authorizationHeader: ApiConstants.authenticationKey});
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return NewReleasesResource.fromJson(json);
    }
    catch(e){
      throw (e);
    }
  }

  static Future<RecommendResource> getRecommended() async{

    Uri url = Uri.https(ApiConstants.baseURL,ApiConstants.recommendAPI);

    try{
      var response = await http.get(url,headers: {HttpHeaders.authorizationHeader: ApiConstants.authenticationKey});
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return RecommendResource.fromJson(json);
    }
    catch(e){
      throw (e);
    }
  }

  static Future<CategoriesResource> getCategory() async{

    Uri url = Uri.https(ApiConstants.baseURL,ApiConstants.categoryAPI);

    try{
      var response = await http.get(url,headers: {HttpHeaders.authorizationHeader: ApiConstants.authenticationKey});
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return CategoriesResource.fromJson(json);
    }
    catch(e){
      throw (e);
    }
  }

  static Future<DiscoverResource> getDiscover() async{

    Uri url = Uri.https(ApiConstants.baseURL,ApiConstants.discoverAPI);

    try{
      var response = await http.get(url,headers: {HttpHeaders.authorizationHeader: ApiConstants.authenticationKey});
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return DiscoverResource.fromJson(json);
    }
    catch(e){
      throw (e);
    }
  }

  static Future<SimilarResource> getSimilar(var id) async{

    Uri url = Uri.https(ApiConstants.baseURL,"/3/movie/$id/similar");

    try{
      var response = await http.get(url,headers: {HttpHeaders.authorizationHeader: ApiConstants.authenticationKey});
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return SimilarResource.fromJson(json);
    }
    catch(e){
      throw (e);
    }
  }

  static Future<SearchResource> getSearch(var title) async{

    Uri url = Uri.https(ApiConstants.baseURL,"/3/search/movie?query=$title&include_adult=false&language=en-US&page=1");

    try{
      var response = await http.get(url,headers: {HttpHeaders.authorizationHeader: ApiConstants.authenticationKey});
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return SearchResource.fromJson(json);
    }
    catch(e){
      throw (e);
    }
  }
}