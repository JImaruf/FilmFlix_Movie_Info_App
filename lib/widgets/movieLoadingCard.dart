import 'package:flutter/material.dart';

class LoadingCard extends StatelessWidget {
  const LoadingCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration:BoxDecoration(
          image: DecorationImage(image: AssetImage('images/loading.jpg'),
              fit: BoxFit.cover),
        ),
        height: 200,
        width: 150,
      ),
    );
  }
}