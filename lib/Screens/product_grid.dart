import 'package:flutter/material.dart';
import 'package:new_shopping_app/Providers/products.dart';
import '../Widgets/product_item.dart';
import 'package:provider/provider.dart';

class ProductsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsData =Provider.of<Products>(context);
    final products=productsData.items;
    return  GridView.builder(
      padding:const  EdgeInsets.all(10.0),
      itemCount: products.length,
      itemBuilder: (ctx, i)=>ChangeNotifierProvider(
       create: (c) => products[i],
          child: ProductItem()
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,

        childAspectRatio: 3/2,
        mainAxisSpacing: 10,
      ),

    );
  }
}
