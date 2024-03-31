import 'package:flutter/material.dart';

class TrendingLoadingCard extends StatelessWidget {
  const TrendingLoadingCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/loading.jpg'),
                fit: BoxFit.cover),
          ),
          height: 300,
          width: 200,
        ),
      ),
    );
  }
}
