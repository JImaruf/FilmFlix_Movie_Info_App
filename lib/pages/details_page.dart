
import 'package:filmflix/models/moviesmodel.dart';
import 'package:filmflix/pages/home_page.dart';
import 'package:filmflix/utils/colors.dart';
import 'package:filmflix/widgets/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class DetailsPage extends StatelessWidget {
  final Results singleMovie;
  const DetailsPage({super.key, required this.singleMovie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colourss.scaffoldBGcolor,
      body: CustomScrollView(slivers: [
        SliverAppBar.large(
          leading: Container(
            height: 70,width: 70,
            margin: EdgeInsets.only(top: 16,left: 16,),
            decoration: BoxDecoration(
              color: Colourss.scaffoldBGcolor,
              borderRadius: BorderRadius.circular(8),

            ),
            child: IconButton(onPressed: (){
              Get.to(HomePage());
            }, icon: Icon(Icons.arrow_back_rounded)),
          ),
          backgroundColor: Colourss.scaffoldBGcolor,
          expandedHeight: 500,
          pinned: true,
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            // title: Container(
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(20),
            //     color: Color(0xFF1469FF),
            //   ),
            //
            //     child: Text(singleMovie.title.toString())),
            background: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
              child: Image.network(Constants.imagebasePath+singleMovie.posterPath.toString(),
              fit: BoxFit.fill,),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  Text('Overview',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w800),),
                  SizedBox(height: 10,),
                Text(singleMovie.overview.toString(),style: TextStyle(fontSize: 18),
                textAlign: TextAlign.left),
                const SizedBox(height: 16,),
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),


                        ),
                        child: Row(
                          children: [
                            Text('Release Data : ',),
                            Icon(Icons.calendar_month,color: Colors.blueGrey,),
                            Text(singleMovie.releaseDate.toString()),

                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),


                        ),
                        child: Row(
                          children: [
                            Text('Rating : '),
                            Icon(Icons.star,color: Colourss.ratingColor,),
                            Text("${singleMovie.voteAverage.toString()}/10"),

                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],)
    );
  }
}
