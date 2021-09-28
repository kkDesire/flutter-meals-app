import 'dart:ffi';

import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static final routeName = '/filters';

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  Widget _buildSwitchListTile(
    String title,
    String description,
    bool currentValue,
    Function(bool) updateValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(
        description,
      ),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal.',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchListTile(
                  'Gluten-free',
                  'Only inglude gluten-free meals.',
                  _glutenFree,
                  (newValue){
                    setState(
                    () {
                      _glutenFree = newValue;
                    },
                  );
                  }
                ),
                _buildSwitchListTile(
                  'Lactose-free',
                  'Only inglude lactose-free meals.',
                  _lactoseFree,
                  (newValue){
                    setState(
                    () {
                      _lactoseFree = newValue;
                    },
                  );
                  }
                ),
                _buildSwitchListTile(
                  'Vegetarian',
                  'Only inglude vegetarian meals.',
                  _vegetarian,
                  (newValue){
                    setState(
                    () {
                      _vegetarian = newValue;
                    },
                  );
                  }
                ),
                _buildSwitchListTile(
                  'Vegan',
                  'Only inglude vegan meals.',
                  _vegan,
                  (newValue){
                    setState(
                    () {
                      _vegan = newValue;
                    },
                  );
                  }
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
