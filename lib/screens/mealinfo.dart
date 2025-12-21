import 'package:flutter/material.dart';
import 'package:resturant/models/meals.dart';

class Mealinfo extends StatelessWidget {
  const Mealinfo({super.key, required this.meal});
  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(meal.title)),
      body: Column(
        children: [
          Image.network(meal.imageUrl),
          SizedBox(height: 8),
          Text(meal.title),
        ],
      ),
    );
  }
}
