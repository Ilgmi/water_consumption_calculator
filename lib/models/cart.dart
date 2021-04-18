
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:water_consumption_calculator/models/catalog.dart';

import 'package:water_consumption_calculator/models/item.dart';

class CartModel with ChangeNotifier {

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  CatalogModel? catalogModel;
  List<Item> _items = [];


  CartModel(){
    _prefs.then((pref) => pref.getStringList('selections')!.forEach((element) {
      addItem(catalogModel!.getItemByName(element)!);
    }));
  }

  List<Item> get items{
    return List.unmodifiable(_items);
  }


  void addItem(Item item){
    _items.add(item);

    _prefs.then((prefs) => prefs.setStringList('selections', _items.map((e) => e.name).toList()));
    notifyListeners();
  }

  double calculateWaterConsumption(){
    double consumption = 0;
    for (var value in _items) {
      consumption += value.waterPerLiter;
    }
    return consumption;
  }
}