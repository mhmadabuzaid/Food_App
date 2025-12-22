import 'package:flutter/material.dart';

enum Filter { glutenfree, lactosefree, veganfree, vegeterainfree }

class Filters extends StatefulWidget {
  const Filters({super.key, required this.currentFilter});
  final Map<Filter, bool> currentFilter;

  @override
  State<Filters> createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  var _glutenfree = false;
  var _veganfree = false;

  var _vegeterainfree = false;

  var _lactosefree = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _glutenfree = widget.currentFilter[Filter.glutenfree]!;
    _veganfree = widget.currentFilter[Filter.veganfree]!;
    _vegeterainfree = widget.currentFilter[Filter.vegeterainfree]!;
    _lactosefree = widget.currentFilter[Filter.lactosefree]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your filters')),
      body: PopScope(
        // 1. DISABLE the automatic system back logic
        canPop: false,

        // 2. Handle the pop manually
        onPopInvokedWithResult: (bool didPop, dynamic result) {
          // If the screen already popped (e.g. by code elsewhere), do nothing.
          if (didPop) return;

          // 3. Manually pop the screen with your data
          Navigator.of(context).pop({
            Filter.glutenfree: _glutenfree,
            Filter.lactosefree: _lactosefree,
            Filter.veganfree: _veganfree,
            Filter.vegeterainfree: _vegeterainfree,
          });
        },
        child: Column(
          children: [
            SwitchListTile(
              title: Text(
                'Gluten-Free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              subtitle: Text(
                'Only include gluten free meals ',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              activeThumbColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: EdgeInsets.only(left: 34, right: 22),
              value: _glutenfree,
              onChanged: (isChecked) {
                setState(() {
                  _glutenfree = isChecked;
                });
              },
            ),
            SwitchListTile(
              title: Text(
                'Lactose-Free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              subtitle: Text(
                'Only include Lactose free meals ',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              activeThumbColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: EdgeInsets.only(left: 34, right: 22),
              value: _lactosefree,
              onChanged: (isChecked) {
                setState(() {
                  _lactosefree = isChecked;
                });
              },
            ),
            SwitchListTile(
              title: Text(
                'Vegeterain-Free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              subtitle: Text(
                'Only include vegeterain free meals ',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              activeThumbColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: EdgeInsets.only(left: 34, right: 22),
              value: _vegeterainfree,
              onChanged: (isChecked) {
                setState(() {
                  _vegeterainfree = isChecked;
                });
              },
            ),
            SwitchListTile(
              title: Text(
                'Vegan-Free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              subtitle: Text(
                'Only include Vegan free meals ',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              activeThumbColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: EdgeInsets.only(left: 34, right: 22),
              value: _veganfree,
              onChanged: (isChecked) {
                setState(() {
                  _veganfree = isChecked;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
