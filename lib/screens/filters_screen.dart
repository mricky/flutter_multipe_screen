import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.currentFilters,this.saveFilters);
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFee = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lacatoseFree = false;

  @override
  void initState() {
    _glutenFee = widget.currentFilters['gluten'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _vegan = widget.currentFilters['vegan'];
    _lacatoseFree = widget.currentFilters['lactose'];

    super.initState();
  }
  
  void updateValue(){

  }
  Widget _buildSwitchListTile(String title, String description, bool currenctValue, Function updateValue){
    return SwitchListTile(
            title: Text(
              title),
            value: currenctValue, 
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
        title: Text('Your Filter'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.save),
           onPressed: () {
            final selectedFilters = {
                'gluten': _glutenFee,
                'lactose':_lacatoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
            };
            widget.saveFilters(selectedFilters);
            },)
        ],
      ),
      drawer: MainDrawer(),
      body: Column(children: <Widget>[
        Container(
          padding: EdgeInsets.all(20),
          child: Text(
            'Adjust your meal selection',
            style: Theme.of(context).textTheme.title,
          ),
        ),
        Expanded(
          child: ListView(
            children: <Widget>[
             _buildSwitchListTile(
               'Gluten-free',
               'Only include gluten-free meals.',
                _glutenFee,
                (newValue){
                  setState(() {
                    _glutenFee = newValue;
                  });
                }
              ),
              _buildSwitchListTile(
               'Lactose-free',
               'Only include lactose-free meals.',
                _lacatoseFree,
                (newValue){
                  setState(() {
                    _lacatoseFree = newValue;
                  });
                }
              ),
              _buildSwitchListTile(
               'Vegetarian',
               'Only include vegetarian meals.',
                _vegetarian,
                (newValue){
                  setState(() {
                    _vegetarian = newValue;
                  });
                }
              ),
              _buildSwitchListTile(
               'Vegan',
               'Only include vegan meals.',
                _vegan,
                (newValue){
                  setState(() {
                    _vegan = newValue;
                  });
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