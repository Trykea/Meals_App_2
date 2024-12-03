import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals_app/providers/filters_provider.dart';

class FiltersScreen extends ConsumerStatefulWidget {
  const FiltersScreen({super.key,});
  @override
  ConsumerState<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends ConsumerState<FiltersScreen> {
  bool _glutenFreeFilterSet = false;
  bool _lactoseFreeFilterSet = false;
  bool _veganFilterSet = false;
  bool _vegetarianFilterSet = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final activeFilters = ref.read(filtersProvider);
    _glutenFreeFilterSet= activeFilters[Filter.glutenFree]!;
    _lactoseFreeFilterSet= activeFilters[Filter.lactoseFree]!;
    _vegetarianFilterSet= activeFilters[Filter.vegetarian]!;
    _veganFilterSet= activeFilters[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your  Filters'),
      ),
      body: PopScope(
        onPopInvokedWithResult: (didPop, result) {
          ref.read(filtersProvider.notifier).setFilters({
            Filter.glutenFree: _glutenFreeFilterSet,
            Filter.lactoseFree: _lactoseFreeFilterSet,
            Filter.vegetarian: _vegetarianFilterSet,
            Filter.vegan: _veganFilterSet,
          });
        },
        canPop: true,
        child: Column(
          children: [
            SwitchListTile(
              value: _glutenFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _glutenFreeFilterSet = isChecked;
                });
              },
              title: Text('Gluten-free'),
              subtitle: Text('Only include gluten-free meals'),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            ),
            SwitchListTile(
              value: _lactoseFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _lactoseFreeFilterSet = isChecked;
                });
              },
              title: Text('Lactose-free'),
              subtitle: Text('Only include lactose-free meals'),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            ),
            SwitchListTile(
              value: _vegetarianFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _vegetarianFilterSet = isChecked;
                });
              },
              title: Text('Vegetarian'),
              subtitle: Text('Only include vegetarian meals'),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            ),
            SwitchListTile(
              value: _veganFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _veganFilterSet = isChecked;
                });
              },
              title: Text('Vegan'),
              subtitle: Text('Only include vegan meals'),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            ),
          ],
        ),
      ),
    );
  }
}
