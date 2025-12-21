import 'package:flutter/material.dart';
import 'package:resturant/models/meals.dart';
import 'package:resturant/screens/mealinfo.dart';
import 'package:resturant/widgets/mealtrait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({required this.meal, super.key,required this.onFavourite});

  final Meal meal;
  final void Function(Meal meal) onFavourite;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Mealinfo(meal: meal,onFavourite: onFavourite,)),
          );
        },
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                color: Colors.black54,
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 12),
                    Row(
                      children: [
                        Mealtrait(
                          icon: Icons.schedule,
                          label: "${meal.duration} min",
                        ),
                        SizedBox(width: 12),
                        Mealtrait(
                          icon: Icons.attach_money,
                          label: meal.affordabilityText,
                        ),
                        SizedBox(width: 12),
                        Mealtrait(icon: Icons.work, label: meal.complexityText),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
