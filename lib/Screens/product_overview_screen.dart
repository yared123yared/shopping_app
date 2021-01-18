import 'package:flutter/material.dart';
import '../Screens/product_grid.dart';
import '../Providers/product.dart';
import '../Widgets/product_item.dart';
class ProductOverviewScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text(
          'My App'
        ),
      ),
      body: ProductsGrid(),
    );
  }
}
