import 'dart:convert';

import 'package:filmflix/models/moviesmodel.dart';
import 'package:filmflix/widgets/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
class HomeController extends GetxController{

   List<Results> trendingMovieList=[];
   List<Results> upComingMovieList=[];
   List<Results> topRatedMovieList=[];
  static const _trendingURl = "";

  @override
  void onInit() {
    // TODO: implement onInit
    getTrending();
    super.onInit();
  }

   Future<List<Results>> getTrending() async {
     print("objdssfect");
    final response = await http.get(Uri.parse("https://api.themoviedb.org/3/trending/movie/day?api_key=af3e82c5684422b6119d538bb8ccd050"));
    print("dhuko");
    var data = jsonDecode(response.body)["results"] as List;
    print("object");
    if(response.statusCode==200)
      {
        trendingMovieList.clear();

        for(Map i in data)
          {
            trendingMovieList.add(Results.fromJson(i));

          }
        return trendingMovieList;

        // return allMlist;
      }
    else
      {
        return trendingMovieList;
        print("failed bro");
        // allMlist;
      }
  }
   Future<List<Results>> Upcoming() async {
     print("objdssfect");
     final response = await http.get(Uri.parse("https://api.themoviedb.org/3/movie/upcoming?api_key=af3e82c5684422b6119d538bb8ccd050"));
     print("dhuko");
     var data = jsonDecode(response.body)["results"] as List;
     print("object");
     if(response.statusCode==200)
     {
       upComingMovieList.clear();

       for(Map i in data)
       {
         upComingMovieList.add(Results.fromJson(i));

       }
       return upComingMovieList;

       // return allMlist;
     }
     else
     {
       return upComingMovieList;
       print("failed bro");
       // allMlist;
     }
   }
   Future<List<Results>> topRated() async {
     print("objdssfect");
     final response = await http.get(Uri.parse("https://api.themoviedb.org/3/movie/top_rated?api_key=af3e82c5684422b6119d538bb8ccd050"));
     print("dhuko");
     var data = jsonDecode(response.body)["results"] as List;
     print("object");
     if(response.statusCode==200)
     {
       topRatedMovieList.clear();

       for(Map i in data)
       {
         topRatedMovieList.add(Results.fromJson(i));

       }
       return topRatedMovieList;

     }
     else
     {
       return topRatedMovieList;

     }
   }



}