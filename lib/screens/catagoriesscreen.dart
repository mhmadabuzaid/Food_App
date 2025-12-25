import 'package:flutter/material.dart';
import 'package:resturant/data/dummy_data.dart';
import 'package:resturant/models/catagory.dart';
import 'package:resturant/models/meals.dart';
import 'package:resturant/screens/mealsscreen.dart';
import 'package:resturant/widgets/catagory_grid_item.dart';

class Catagoriesscreen extends StatefulWidget {
  const Catagoriesscreen({super.key, required this.selectedFilterMeals});
  final List<Meal> selectedFilterMeals;

  @override
  State<Catagoriesscreen> createState() => _CatagoriesscreenState();
}

class _CatagoriesscreenState extends State<Catagoriesscreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      duration: Duration(milliseconds: 300),
      lowerBound: 0,
      upperBound: 1,
      vsync: this,
    );
    super.initState();
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void selectedCatagory(Catagory catagory) {
      final filteredMeals = widget.selectedFilterMeals
          .where((meal) => meal.categories.contains(catagory.id))
          .toList();

      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) =>
              Mealsscreen(meals: filteredMeals, title: catagory.title),
        ),
      );
    }

    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) => Padding(
        padding: EdgeInsets.only(top: 100 - _animationController.value * 100),
        child: child,
      ),
      child: GridView(
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
      ),
    );
  }
}
