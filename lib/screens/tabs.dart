import 'package:flutter/material.dart';
import 'package:resturant/data/dummy_data.dart';
import 'package:resturant/main.dart';
import 'package:resturant/models/meals.dart';
import 'package:resturant/screens/catagoriesscreen.dart';
import 'package:resturant/screens/filters.dart';
import 'package:resturant/screens/mealsscreen.dart';
import 'package:resturant/widgets/main_drawer.dart';

const kIntialFilters = {
  Filter.glutenfree: false,
  Filter.lactosefree: false,
  Filter.veganfree: false,
  Filter.vegeterainfree: false,
};

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int selectedIndex = 0;
  final List<Meal> favouriteMeals = [];
  Map<Filter, bool> selectedFilters = {
    Filter.glutenfree: false,
    Filter.lactosefree: false,
    Filter.veganfree: false,
    Filter.vegeterainfree: false,
  };

  void _selectpage(int index) {
    setState(() {
      selectedIndex =
          index; // <--- FIX 1: Use the 'index' variable, don't hardcode 1
    });
  }

  void showAdded(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), duration: Duration(seconds: 1)),
    );
  }

  void addfavourite(Meal meal) {
    if (favouriteMeals.contains(meal)) {
      setState(() {
        favouriteMeals.remove(meal);
      });
      showAdded('Meal was removed');
    } else {
      setState(() {
        favouriteMeals.add(meal);
      });
      showAdded('Meal was added');
    }
  }

  void setScreen(String identifier) async {
    // 1. Always close the drawer first
    Navigator.of(context).pop();

    if (identifier == 'filters') {
      // 2. Logic for opening Filters
      final result = await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (ctx) => Filters(currentFilter: selectedFilters),
        ),
      );
      setState(() {
        selectedFilters = result ?? kIntialFilters;
      });
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
    final avaiableMeals = dummyMeals.where((meal) {
      if (selectedFilters[Filter.glutenfree]! && !meal.isGlutenFree) {
        return false;
      }
      if (selectedFilters[Filter.lactosefree]! && !meal.isLactoseFree) {
        return false;
      }
      if (selectedFilters[Filter.veganfree]! && !meal.isVegan) {
        return false;
      }
      if (selectedFilters[Filter.vegeterainfree]! && !meal.isVegetarian) {
        return false;
      }
      return true;
    });

    Widget activeScreen = Catagoriesscreen(
      onFavourite: addfavourite,
      selectedFilterMeals: avaiableMeals.toList(),
    );
    var activePageTitle = 'Categories'; // Optional: Change title dynamically

    if (selectedIndex == 1) {
      activeScreen = Mealsscreen(
        meals: favouriteMeals,
        onFavourite: addfavourite,
      );
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
