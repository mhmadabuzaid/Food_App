import 'package:flutter/material.dart';
import 'package:resturant/models/meals.dart';
import 'package:resturant/widgets/main_drawer.dart';
import 'package:resturant/widgets/meal_item.dart';

class Mealsscreen extends StatelessWidget {
  const Mealsscreen({
    super.key,
    required this.meals,
    this.title,
  });

  final String? title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    // 1. Define your content separately
    Widget content = meals.isEmpty
        ? Center(
            // Added Center so the message isn't stuck at the top
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Nothing here',
                  style: Theme.of(
                    context,
                  ).textTheme.headlineLarge!.copyWith(color: Colors.white),
                ),
                const SizedBox(height: 16),
                Text(
                  'Add Some Favourite Meals',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge!.copyWith(color: Colors.white),
                ),
              ],
            ),
          )
        : ListView.builder(
            itemCount: meals.length,
            itemBuilder: (ctx, index) {
              return MealItem(meal: meals[index]);
            },
          );

    // 2. THE LOGIC:
    // If title is null, return ONLY the content (for Tabs).
    if (title == null) {
      return content;
    }

    // If title is NOT null, return the full Scaffold (for Category selection).
    return Scaffold(
      appBar: AppBar(title: Text(title!)),
      body: content,
    );
  }
}
