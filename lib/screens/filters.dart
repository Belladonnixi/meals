import 'package:flutter/material.dart';
import 'package:meals_2/widgets/filter_switch_tile.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFreeFilterSet = false;
  bool _lactoseFreeFilterSet = false;
  bool _vegetarianFilterSet = false;
  bool _veganFilterSet = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      // alternative navigation behavior
      // drawer: MainDrawer(onSelectScreen: (identifier) {
      //   Navigator.of(context).pop();
      //   if (identifier == 'meals') {
      //     Navigator.of(context).pushReplacement(
      //       MaterialPageRoute(
      //         builder: (ctx) => const FilterScreen(),
      //       ),
      //     );
      //   }
      // }),
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
