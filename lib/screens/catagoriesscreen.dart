import 'package:flutter/material.dart';
import 'package:resturant/data/dummy_data.dart';
import 'package:resturant/models/catagory.dart';
import 'package:resturant/models/meals.dart';
import 'package:resturant/screens/mealsscreen.dart';
import 'package:resturant/widgets/catagory_grid_item.dart';

class Catagoriesscreen extends StatelessWidget {
  const Catagoriesscreen({super.key, required this.onFavourite});
  final void Function(Meal meal) onFavourite;

  @override
  Widget build(BuildContext context) {
    void selectedCatagory(Catagory catagory) {
      final filteredMeals = dummyMeals
          .where((meal) => meal.categories.contains(catagory.id))
          .toList();

      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => Mealsscreen(
            meals: filteredMeals,
            title: catagory.title,
            onFavourite: onFavourite,
          ),
        ),
      );
    }

    return GridView(
      padding: EdgeInsets.all(24),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: availableCategories.map((catagory) {
        return CatagoryGridItem(
          catagory: catagory,
          onselect: () {
            selectedCatagory(catagory);
          },
        );
      }).toList(),
    );
  }
}
