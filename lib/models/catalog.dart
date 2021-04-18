import 'item.dart';

class CatalogModel{

  List<Category> _categories = [
    new Category('food', 'Lebensmittel', [
      new Item("Banane", 5),
    ]),
    new Category('cloth', 'Kleidung', [
      new Item("Jeans", 50)
    ]),
    new Category('technical', "Technik", [
      new Item("IPhone", 50)
    ])
  ];

  List<Category> get categories {
    return List.unmodifiable(_categories);
  }

  Item? getItemByName(String name){
    for (var category in _categories) {
      if(category.hasItemWithName(name)){
        return category.items.firstWhere((element) => element.name == name);
      }
    }
    return null;
  }


}


class Category {
  final String name;
  final String displayName;

  List<Item> _items = new List.empty();

  List<Item> get items {
    return List.unmodifiable(_items);
  }

  Category(this.name, this.displayName, List<Item> items) : _items = List.of(items);

  bool hasItemWithName(String name){
    return _items.any((element) => element.name == name);
  }



}
