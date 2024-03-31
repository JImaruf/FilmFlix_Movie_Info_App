import 'dart:convert';

import 'package:filmflix/models/movie.dart';
import 'package:http/http.dart' as http;
import 'package:filmflix/widgets/constants.dart';

class Api {

  static const _trendingURl = "https://api.themoviedb.org/3/trending/movie/day?api_key=${Constants.apiKey}";
  Future<List<Movie>> getTrendingMovies () async{

   final response = await http.get(Uri.parse(_trendingURl));
   if(response.statusCode==200)
     {
       final decodedData = json.decode(response.body)['results'] as List;
       return decodedData.map((movie)
       => Movie.fromJson(movie)).toList();


     }
   else
     {
       throw Exception('Something Happened');
     }

  }

}