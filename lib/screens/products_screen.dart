import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:water_consumption_calculator/models/cart.dart';
import 'package:water_consumption_calculator/models/item.dart';

class ProductsScreen extends StatelessWidget {
  final String name;
  final List<Item> items;

  const ProductsScreen({Key? key, required this.name, required this.items})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(10),
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) => ListTile(
              title: Text(items[index].name),
              onTap: () {
                context.read<CartModel>().addItem(items[index]);
                Navigator.popUntil(context, (route) => route.isFirst);
              },
            ),
          ),
        ),
      ),
    );
  }
}

