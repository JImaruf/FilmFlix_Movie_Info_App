import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:filmflix/controller/home_controller.dart';
import 'package:filmflix/models/moviesmodel.dart';
import 'package:filmflix/widgets/constants.dart';
import 'package:filmflix/widgets/movieLoadingCard.dart';
import 'package:filmflix/widgets/movies_slider.dart';
import 'package:filmflix/widgets/trendingLoadingCard.dart';
import 'package:filmflix/widgets/trending_movies.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctrl) {
      return RefreshIndicator(
        onRefresh:() async {
        ctrl.update();
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            title: const Text(
              'FILMFLIX',
              style: TextStyle(color: Colors.red, fontSize: 24),
            ),
          ),
          body: SingleChildScrollView(

              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Trending Movies', style: TextStyle(fontSize: 24)),
                    SizedBox(
                      height: 10,
                    ),
                    FutureBuilder(
                      future: ctrl.getTrending(),
                      builder: (context, snapshot) {
                        if (ctrl.trendingMovieList.isNotEmpty) {
                          print("snanpshot");
                          return TrendingMovies(
                            trendingList: ctrl.trendingMovieList,
                          );
                        } else {
                          return TrendingLoadingCard();
                        }
                      },
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Text('Top Rated Movies', style: TextStyle(fontSize: 24)),
                    SizedBox(
                      height: 16,
                    ),
                    FutureBuilder(
                      future: ctrl.topRated(),
                      builder: (context, snapshot) {
                        if (ctrl.topRatedMovieList.isNotEmpty) {
                          print("snanpshot");
                          return MoviesSlider(
                            movieList: ctrl.topRatedMovieList,
                          );
                        } else {
                          return LoadingCard();
                        }
                      },
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Text('Upcoming Movies', style: TextStyle(fontSize: 24)),
                    SizedBox(
                      height: 16,
                    ),
                    FutureBuilder(
                      future: ctrl.Upcoming(),
                      builder: (context, snapshot) {
                        if (ctrl.upComingMovieList.isNotEmpty) {
                          print("snanpshot");
                          return MoviesSlider(
                            movieList: ctrl.upComingMovieList,
                          );
                        } else {
                          return LoadingCard();
                        }
                      },
                    ),
                  ],
                ),
              )),
        ),
      );
    });
  }
}

