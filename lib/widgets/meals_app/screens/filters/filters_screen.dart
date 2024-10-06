// import 'package:first_flutter_app/widgets/meals_app/screens/tabs/tabs_screen.dart';
// import 'package:first_flutter_app/widgets/meals_app/widgets/drawers/main_drawer.dart';
import 'package:first_flutter_app/widgets/meals_app/widgets/filters/custom_switch_list_tile.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _gluttenFreeFilterSet = false;
  var _lactoseFreeFilterSet = false;
  var _vegetarianFilterSet = false;
  var _veganFilterSet = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      // drawer: MainDrawer(
      //   onSelectScreen: (identifier) {
      //     Navigator.of(context).pop();
      //     if (identifier == 'meals') {
      //       Navigator.of(context).pushReplacement(
      //         MaterialPageRoute(
      //           builder: (ctx) => const TabsScreen(),
      //         ),
      //       );
      //     }
      //   },
      // ),
      body: Column(
        children: [
          CustomSwitchListTile(
            value: _gluttenFreeFilterSet,
            onChanged: (isChecked) {
              setState(() {
                _gluttenFreeFilterSet = isChecked;
              });
            },
            title: 'Gluten-free',
            subtitle: 'Only include gluten-free meals.',
          ),
          CustomSwitchListTile(
            value: _lactoseFreeFilterSet,
            onChanged: (isChecked) {
              setState(() {
                _lactoseFreeFilterSet = isChecked;
              });
            },
            title: 'Lactose-free',
            subtitle: 'Only include lactose-free meals.',
          ),
          CustomSwitchListTile(
            value: _vegetarianFilterSet,
            onChanged: (isChecked) {
              setState(() {
                _vegetarianFilterSet = isChecked;
              });
            },
            title: 'Vegetarian',
            subtitle: 'Only include vegetarian meals.',
          ),
          CustomSwitchListTile(
            value: _veganFilterSet,
            onChanged: (isChecked) {
              setState(() {
                _veganFilterSet = isChecked;
              });
            },
            title: 'Vegan',
            subtitle: 'Only include vegan meals.',
          ),
        ],
      ),
    );
  }
}
