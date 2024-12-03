import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/screens/filters.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegan,
  vegetarian,
}

class FiltersNotifer extends StateNotifier<Map<Filter, bool>>{
  FiltersNotifer() : super({
    Filter.glutenFree: false,
    Filter.lactoseFree: false,
    Filter.vegan: false,
    Filter.vegetarian: false,

  });
  void  setFilters (Map<Filter,bool> chosenFilters) {
    state= chosenFilters;
  }
  void setFilter (Filter filter, bool isActive){
    state = {
      ...state,
      filter: isActive,
    };
  }
}

final filtersProvider = StateNotifierProvider<FiltersNotifer, Map<Filter, bool>>((ref) {
  return FiltersNotifer();
});