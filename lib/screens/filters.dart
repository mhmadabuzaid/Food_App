import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resturant/provider/filtersprovider.dart'; // Make sure this import is correct

// 1. Change to ConsumerStatefulWidget
class Filters extends ConsumerWidget {
  const Filters({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(FiltersProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Your filters')),
      body: Column(
        children: [
          SwitchListTile(
            title: Text(
              'Gluten-Free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            subtitle: Text(
              'Only include gluten free meals',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
            value: activeFilters[Filter.glutenfree]?? false,
            onChanged: (isChecked) {
              ref
                  .read(FiltersProvider.notifier)
                  .setFilter(Filter.glutenfree, isChecked);
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
              'Only include lactose free meals',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
           value: activeFilters[Filter.lactosefree] ?? false,
            onChanged: (isChecked) {
              ref
                  .read(FiltersProvider.notifier)
                  .setFilter(Filter.lactosefree, isChecked);
            },
          ),
          SwitchListTile(
            title: Text(
              'Vegetarian',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            subtitle: Text(
              'Only include vegetarian meals',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
           value: activeFilters[Filter.vegeterainfree] ?? false,
            onChanged: (isChecked) {
              ref
                  .read(FiltersProvider.notifier)
                  .setFilter(Filter.vegeterainfree, isChecked);
            },
          ),
          SwitchListTile(
            title: Text(
              'Vegan',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            subtitle: Text(
              'Only include vegan meals',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
            value: activeFilters[Filter.veganfree] ?? false,
            onChanged: (isChecked) {
              ref
                  .read(FiltersProvider.notifier)
                  .setFilter(Filter.veganfree, isChecked);
            },
          ),
        ],
      ),
    );
  }
}
