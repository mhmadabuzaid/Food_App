import 'package:flutter/material.dart';
import 'package:resturant/models/catagory.dart';

class CatagoryGridItem extends StatelessWidget {
  const CatagoryGridItem({super.key, required this.catagory,required this.onselect});
  final Catagory catagory;
  final void Function() onselect;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onselect,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [catagory.color, catagory.color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(
          catagory.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ),
    );
  }
}
