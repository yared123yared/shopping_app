import 'package:flutter/material.dart';

import '../Providers/products.dart';
import 'package:provider/provider.dart';
//
class ProductDetailScreen extends StatelessWidget {
   static const routeName='product_detail';
//  final String title;
//  ProductDetailScreen(this.title);
  @override
  Widget build(BuildContext context) {

    final productId=ModalRoute.of(context).settings.arguments as String;
    final loadedProduct=Provider.of<Products>(context).findById(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
      ),
    );
  }
}
