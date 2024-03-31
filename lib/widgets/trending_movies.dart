import 'package:carousel_slider/carousel_slider.dart';
import 'package:filmflix/models/moviesmodel.dart';
import 'package:filmflix/pages/details_page.dart';
import 'package:filmflix/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TrendingMovies extends StatelessWidget {

final List<Results> trendingList;


  const TrendingMovies({
    super.key, required this.trendingList,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CarouselSlider.builder(

          itemCount:trendingList.length,
          itemBuilder: (context, index, realIndex) {
            return GestureDetector(
              onTap: (){
                Get.to(DetailsPage(singleMovie: trendingList[index]));
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  decoration:BoxDecoration(
                    image: DecorationImage(image: AssetImage('images/loading.jpg'),
                    fit: BoxFit.cover),
                  ),
                  height: 300,
                  width: 200,
                  child: Image.network(
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover, Constants.imagebasePath+trendingList[index].posterPath.toString()),
                ),
              ),
            );
          }, options: CarouselOptions(

          height: 300,
          autoPlay: true,
          viewportFraction: 0.55,
          enlargeCenterPage: true,
          pageSnapping: true,
          autoPlayCurve: Curves.fastOutSlowIn,
          autoPlayAnimationDuration: const Duration(seconds: 2)
      )),);
  }
}
