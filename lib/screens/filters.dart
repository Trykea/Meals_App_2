import 'package:flutter/material.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegan,
  vegetarian,
}

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, required this.currentFilters});
  final Map<Filter,bool> currentFilters;
  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFreeFilterSet = false;
  bool _lactoseFreeFilterSet = false;
  bool _veganFilterSet = false;
  bool _vegetarianFilterSet = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _glutenFreeFilterSet= widget.currentFilters[Filter.glutenFree]!;
    _lactoseFreeFilterSet= widget.currentFilters[Filter.lactoseFree]!;
    _vegetarianFilterSet= widget.currentFilters[Filter.vegetarian]!;
    _veganFilterSet= widget.currentFilters[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your  Filters'),
      ),
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) return;
          Navigator.of(context).pop({
            Filter.glutenFree: _glutenFreeFilterSet,
            Filter.lactoseFree: _lactoseFreeFilterSet,
            Filter.vegetarian: _vegetarianFilterSet,
            Filter.vegan: _veganFilterSet,
          });
        },
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
