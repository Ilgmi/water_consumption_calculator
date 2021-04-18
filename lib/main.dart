import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:water_consumption_calculator/common/theme.dart';
import 'package:water_consumption_calculator/models/cart.dart';
import 'package:water_consumption_calculator/models/catalog.dart';
import 'package:water_consumption_calculator/screens/cart_screen.dart';

void main() {
  runApp(
      MyApp()
  );
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider(create: (context) => CatalogModel(),),
          ChangeNotifierProxyProvider<CatalogModel, CartModel>(
            create: (context) {
              return CartModel();
            },
            update: (context, catalog, cart) {
              if (cart == null) throw ArgumentError.notNull('cart');
              cart.catalogModel = catalog;
              return cart;
            },
          ),
        ],
      child: MaterialApp(
        title: 'Wasserverbrauch Rechner',
        theme: appTheme,
        initialRoute: '/',
        routes: {
          '/': (context) => CartScreen()
        },
      ),
    );
  }
}

