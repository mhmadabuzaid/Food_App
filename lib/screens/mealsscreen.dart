import 'package:flutter/material.dart';
import 'package:resturant/models/meals.dart';
import 'package:resturant/widgets/meal_item.dart';

class Mealsscreen extends StatelessWidget {
  const Mealsscreen({super.key, required this.meals, required this.title});
  final String title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    Widget Emptycontent = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Nothing here '),
        SizedBox(height: 16),
        Text('check other catagory'),
      ],
    );
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: meals.isEmpty
          ? Emptycontent
          : ListView.builder(
              itemCount: meals.length,
              itemBuilder: (ctx, index) {
                return MealItem(meal: meals[index]);
              },
            ),
    );
  }
}
