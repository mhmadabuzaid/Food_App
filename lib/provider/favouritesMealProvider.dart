import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:resturant/models/meals.dart';

class Favouritesmealprovider extends StateNotifier<List<Meal>> {
  Favouritesmealprovider() : super([]);

  bool toggleFavourite(Meal meal) {
    final isFavourite = state.contains(meal);
    if (isFavourite) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final FavouritesProvider =
    StateNotifierProvider<Favouritesmealprovider, List<Meal>>((ref) {
      return Favouritesmealprovider();
    });

