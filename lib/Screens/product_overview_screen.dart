import 'package:flutter/material.dart';
import '../Providers/products.dart';
import 'package:provider/provider.dart';
import '../Screens/product_grid.dart';
import '../Providers/product.dart';
import '../Widgets/product_item.dart';
enum FiltrOptions{
  Favorites,
  All
}

class ProductOverviewScreen extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    final productsContainer=Provider.of<Products>(context, listen: false);
    return Scaffold(
      appBar:AppBar(
        title: Text(
          'My App'
        ),
        actions: [
          PopupMenuButton(
            onSelected: (FiltrOptions selectedValue){
//               this will be the selected value
           if(selectedValue==FiltrOptions.Favorites){
             productsContainer.showFavoriteOnly();
           }
           else productsContainer.showAll();
            },
            icon: Icon(Icons.more_vert),
            itemBuilder:(_) => [
              PopupMenuItem(
                child: Text('Only Favorite'),
                value: FiltrOptions.Favorites,


              ),
              PopupMenuItem(
                child: Text('Show All'),
                value: FiltrOptions.All,


              ),
            ]
          )
        ],
      ),
      body: ProductsGrid(),
    );
  }
}
