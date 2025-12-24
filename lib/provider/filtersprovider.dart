import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:resturant/provider/meal_provider.dart';

enum Filter { glutenfree, lactosefree, veganfree, vegeterainfree }

class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier()
    : super({
        Filter.glutenfree: false,
        Filter.lactosefree: false,
        Filter.veganfree: false,
        Filter.vegeterainfree: false,
      });

  void setFilter(Filter filter, bool isActive) {
    state = {...state, filter: isActive};
  }

  void setAllFilters(Map<Filter, bool> chossenFilters) {
    state = chossenFilters;
  }
}

final FiltersProvider =
    StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>(
      (ref) => FiltersNotifier(),
    );

final filterdMealsProvider = Provider((ref) {
  final meals = ref.watch(mealProvider);
  final activeFilters = ref.watch(FiltersProvider);
  return meals.where((meal) {
    // FIX: Use '?? false' instead of '!'
    if ((activeFilters[Filter.glutenfree] ?? false) && !meal.isGlutenFree) {
      return false;
    }
    if ((activeFilters[Filter.lactosefree] ?? false) && !meal.isLactoseFree) {
      return false;
    }
    if ((activeFilters[Filter.veganfree] ?? false) && !meal.isVegan) {
      return false;
    }
    if ((activeFilters[Filter.vegeterainfree] ?? false) && !meal.isVegetarian) {
      return false;
    }
    return true;
  });
});
