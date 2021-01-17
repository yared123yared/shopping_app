import 'package:flutter/material.dart';
import 'package:new_shopping_app/Providers/products.dart';
import '../Models/product.dart';
import 'package:provider/provider.dart';

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
