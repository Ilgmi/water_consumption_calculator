import 'package:flutter/material.dart';
import 'package:water_consumption_calculator/models/cart.dart';
import 'package:provider/provider.dart';
import 'package:water_consumption_calculator/screens/categories_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cart = context.watch<CartModel>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Wasserverbrauch Rechner"),
      ),
      body: Center(
          child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Center(
                    child: Text("${context.watch<CartModel>().calculateWaterConsumption()}"),
                  ),
                  Expanded(
                      child: ListView.builder(
                    itemCount: cart.items.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text('${cart.items[index].name}'),
                        subtitle: Text('${cart.items[index].waterPerLiter}'),
                      );
                    },
                  ))
                ],
              ))),
      floatingActionButton: FloatingActionButton(
        key: const Key("selectItem_floatingActionButton"),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => CategoriesScreen()));
        },
        tooltip: "Add Item",
        child: const Icon(Icons.add),
      ),
    );
  }
}
