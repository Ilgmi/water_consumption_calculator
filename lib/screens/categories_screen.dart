import 'package:flutter/material.dart';
import 'package:water_consumption_calculator/models/catalog.dart';
import 'package:water_consumption_calculator/screens/products_screen.dart';
import 'package:provider/provider.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var catalog = context.read<CatalogModel>();
    return Scaffold(
        appBar: AppBar(
          title: Text("Kategorien"),
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(10),
            child: ListView.builder(
              itemCount: catalog.categories.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('${catalog.categories[index].displayName}'),
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductsScreen(
                            name: catalog.categories[index].displayName,
                            items: catalog.categories[index].items),
                      )),
                );
              },
            ),
          ),
        ));
  }
}
