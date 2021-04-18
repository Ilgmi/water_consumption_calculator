import 'dart:convert';


class Item {
  final String name;
  final double waterPerLiter;

  Item(this.name, this.waterPerLiter);

  Item.fromJson(Map<String, dynamic> json)
      : this.name = json['name'],
        this.waterPerLiter = double.parse(json['waterPerLiter']);
}
