import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:movies/API/api_constants.dart';
import '../model/popularResource.dart';

class ApiManager{
  static Future<PopularResource> getPopular() async{

    Uri url = Uri.https(ApiConstants.baseURL,ApiConstants.sourceAPI,{
      'apiKey' : 'ae0a128c933f35fff591948663456b55',
    });

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
}