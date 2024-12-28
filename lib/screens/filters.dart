import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_2/providers/filters_provider.dart';
import 'package:meals_2/widgets/filter_switch_tile.dart';

/// A screen that allows the user to set filters for meal preferences.
class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Retrieve the active filters from the filtersProvider
    final activeFilters = ref.watch(filtersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: Column(
        children: [
          FilterSwitchTile(
            title: 'Gluten-Free',
            subtitle: 'Only include gluten-free meals',
            value: activeFilters[Filter.glutenFree]!,
            onChanged: (isChecked) {
              // Update the filter value for gluten-free meals
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.glutenFree, isChecked);
            },
          ),
          FilterSwitchTile(
            title: 'Lactose-Free',
            subtitle: 'Only include lactose-free meals',
            value: activeFilters[Filter.lactoseFree]!,
            onChanged: (isChecked) {
              // Update the filter value for lactose-free meals
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.lactoseFree, isChecked);
            },
          ),
          FilterSwitchTile(
            title: 'Vegetarian',
            subtitle: 'Only include vegetarian meals',
            value: activeFilters[Filter.vegetarian]!,
            onChanged: (isChecked) {
              // Update the filter value for vegetarian meals
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegetarian, isChecked);
            },
          ),
          FilterSwitchTile(
            title: 'Vegan',
            subtitle: 'Only include vegan meals',
            value: activeFilters[Filter.vegan]!,
            onChanged: (isChecked) {
              // Update the filter value for vegan meals
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegan, isChecked);
            },
          ),
        ],
      ),
    );
  }
}
