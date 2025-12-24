import 'package:flutter/material.dart';
import 'package:resturant/data/dummy_data.dart';
import 'package:resturant/main.dart';
import 'package:resturant/models/meals.dart';
import 'package:resturant/provider/favouritesMealProvider.dart';
import 'package:resturant/provider/filtersprovider.dart';
import 'package:resturant/provider/meal_provider.dart';
import 'package:resturant/screens/catagoriesscreen.dart';
import 'package:resturant/screens/filters.dart';
import 'package:resturant/screens/mealsscreen.dart';
import 'package:resturant/widgets/main_drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const kIntialFilters = {
  Filter.glutenfree: false,
  Filter.lactosefree: false,
  Filter.veganfree: false,
  Filter.vegeterainfree: false,
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int selectedIndex = 0;

  void _selectpage(int index) {
    setState(() {
      selectedIndex =
          index; // <--- FIX 1: Use the 'index' variable, don't hardcode 1
    });
  }

  void setScreen(String identifier) async {
    // 1. Always close the drawer first
    Navigator.of(context).pop();

    if (identifier == 'filters') {
      // 2. Logic for opening Filters
      Navigator.of(
        context,
      ).push<Map<Filter, bool>>(MaterialPageRoute(builder: (ctx) => Filters()));
    } else {
      // 3. Logic for 'Meals' (The Fix)
      setState(() {
        selectedIndex = 0; // <--- This switches the view back to Categories!

        // OPTIONAL: If you literally want to "reset filters" too, uncomment this:
        // selectedFilters = kIntialFilters;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final avaiableMeals = ref.watch(filterdMealsProvider);

    Widget activeScreen = Catagoriesscreen(
      selectedFilterMeals: avaiableMeals.toList(),
    );
    var activePageTitle = 'Categories'; // Optional: Change title dynamically

    if (selectedIndex == 1) {
      final favouriteMeals = ref.watch(FavouritesProvider);
      activeScreen = Mealsscreen(meals: favouriteMeals);
      activePageTitle = 'Your Favorites';
    }

    return Scaffold(
      drawer: MainDrawer(setScreen: setScreen),
      appBar: AppBar(title: Text(activePageTitle)),
      body: activeScreen,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectpage,
        currentIndex: selectedIndex, // <--- FIX 2: Highlight the correct icon
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
        ],
      ),
    );
  }
}
