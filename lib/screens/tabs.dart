import 'package:flutter/material.dart';
import 'package:resturant/main.dart';
import 'package:resturant/models/meals.dart';
import 'package:resturant/screens/catagoriesscreen.dart';
import 'package:resturant/screens/mealsscreen.dart';
import 'package:resturant/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int selectedIndex = 0;
  final List<Meal> favouriteMeals = [];

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

  void setScreen(String screen) {
    if (screen == 'filters') {
      
    } else {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget activeScreen = Catagoriesscreen(onFavourite: addfavourite);
    var activePageTitle = 'Categories'; // Optional: Change title dynamically

    if (selectedIndex == 1) {
      activeScreen = Mealsscreen(
        meals: favouriteMeals,
        onFavourite: addfavourite,
      );
      activePageTitle = 'Your Favorites';
    }

    return Scaffold(
      drawer: MainDrawer(setScreen: setScreen,),
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
