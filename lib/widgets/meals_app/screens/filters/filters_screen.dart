import 'package:first_flutter_app/widgets/meals_app/providers/filters/filters_provider.dart';
import 'package:first_flutter_app/widgets/meals_app/widgets/filters/custom_switch_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: Column(
        children: [
          CustomSwitchListTile(
            value: activeFilters[Filter.glutenFree]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.glutenFree, isChecked);
            },
            title: 'Gluten-free',
            subtitle: 'Only include gluten-free meals.',
          ),
          CustomSwitchListTile(
            value: activeFilters[Filter.lactoseFree]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.lactoseFree, isChecked);
            },
            title: 'Lactose-free',
            subtitle: 'Only include lactose-free meals.',
          ),
          CustomSwitchListTile(
            value: activeFilters[Filter.vegetarian]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegetarian, isChecked);
            },
            title: 'Vegetarian',
            subtitle: 'Only include vegetarian meals.',
          ),
          CustomSwitchListTile(
            value: activeFilters[Filter.vegan]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegan, isChecked);
            },
            title: 'Vegan',
            subtitle: 'Only include vegan meals.',
          ),
        ],
      ),
    );
  }
}
