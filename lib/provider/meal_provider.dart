import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resturant/data/dummy_data.dart';

final mealProvider = Provider((ref) {
  return dummyMeals;
});
