import 'package:flutter/material.dart';
import 'package:new_shopping_app/Providers/products.dart';
import 'package:provider/provider.dart';
import './Screens/product_overview_screen.dart';
import 'Providers/cart.dart';
import 'Providers/orders.dart';
import 'Screens/cart_screen.dart';
import 'Screens/orders_screen.dart';
import 'Screens/product_detail_screen.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => Products(),),
        ChangeNotifierProvider(create: (ctx) => Cart(),),
        ChangeNotifierProvider(create: (ctx)=> Orders(),)
      ],
      child: ChangeNotifierProvider.value(

      value:Products(),
        child: MaterialApp(
          title: 'MyShop',
          theme: ThemeData(
            primarySwatch: Colors.purple,
            accentColor: Colors.deepOrange,
            fontFamily: 'Lato',
          ),
          home: ProductOverviewScreen(),
          routes: {
            ProductDetailScreen.routeName:(ctx)=>ProductDetailScreen(),
            CartScreen.routeName:(ctx)=>CartScreen(),
            OrdersScreen.routeName:(ctx)=>OrdersScreen(),
          },
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
      ),
      body: Center(
        child: Text('Let\'s build a shop!'),
      ),
    );
  }
}
