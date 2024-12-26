import 'package:flutter/material.dart';
import 'package:meals_2/widgets/filter_switch_tile.dart';

/// Enum representing different filters for meals.
enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

/// A screen for managing filters for meals.
class FiltersScreen extends StatefulWidget {
  /// Constructs a [FiltersScreen] with the given [currentFilters].
  const FiltersScreen({super.key, required this.currentFilters});

  /// The current filters for meals.
  final Map<Filter, bool> currentFilters;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

/// The state of the [FiltersScreen].
class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFreeFilterSet = false;
  bool _lactoseFreeFilterSet = false;
  bool _vegetarianFilterSet = false;
  bool _veganFilterSet = false;

  /// Initializes the state of the Filters screen.
  ///
  /// This method is called when the widget is inserted into the tree and
  /// creates the initial state of the widget. It sets the values of the
  /// filter variables based on the current filters passed to the widget.
  @override
  void initState() {
    super.initState();
    _glutenFreeFilterSet = widget.currentFilters[Filter.glutenFree] ?? false;
    _lactoseFreeFilterSet = widget.currentFilters[Filter.lactoseFree] ?? false;
    _vegetarianFilterSet = widget.currentFilters[Filter.vegetarian] ?? false;
    _veganFilterSet = widget.currentFilters[Filter.vegan] ?? false;
  }

  /// Handles the action when the back button is pressed and returns the selected filters.
  Future<bool> onPopInvokedWithResult() async {
    Navigator.of(context).pop({
      Filter.glutenFree: _glutenFreeFilterSet,
      Filter.lactoseFree: _lactoseFreeFilterSet,
      Filter.vegetarian: _vegetarianFilterSet,
      Filter.vegan: _veganFilterSet,
    });
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => onPopInvokedWithResult(),
        ),
      ),
      body: Column(
        children: [
          FilterSwitchTile(
            title: 'Gluten-Free',
            subtitle: 'Only include gluten-free meals',
            value: _glutenFreeFilterSet,
            onChanged: (isChecked) {
              setState(() {
                _glutenFreeFilterSet = isChecked;
              });
            },
          ),
          FilterSwitchTile(
            title: 'Lactose-Free',
            subtitle: 'Only include lactose-free meals',
            value: _lactoseFreeFilterSet,
            onChanged: (isChecked) {
              setState(() {
                _lactoseFreeFilterSet = isChecked;
              });
            },
          ),
          FilterSwitchTile(
            title: 'Vegetarian',
            subtitle: 'Only include vegetarian meals',
            value: _vegetarianFilterSet,
            onChanged: (isChecked) {
              setState(() {
                _vegetarianFilterSet = isChecked;
              });
            },
          ),
          FilterSwitchTile(
            title: 'Vegan',
            subtitle: 'Only include vegan meals',
            value: _veganFilterSet,
            onChanged: (isChecked) {
              setState(() {
                _veganFilterSet = isChecked;
              });
            },
          ),
        ],
      ),
    );
  }
}
