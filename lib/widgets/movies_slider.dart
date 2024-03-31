
import 'package:filmflix/models/moviesmodel.dart';
import 'package:filmflix/pages/details_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'constants.dart';

class MoviesSlider extends StatelessWidget {
  final List<Results> movieList;
  const MoviesSlider({
    super.key, required this.movieList,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: ListView.builder(
        itemCount: movieList.length,
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(8.0),
            child: InkWell(
              onTap: (){
                Get.to(DetailsPage(singleMovie: movieList[index]));
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(

                  height: 200,
                  width: 150,
                  child: Image.network(
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.cover, Constants.imagebasePath+movieList[index].posterPath.toString()),


                ),
              ),
            ),
          );

        },),
    );
  }
}