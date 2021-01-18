import 'package:flutter/material.dart';
import 'package:new_shopping_app/Providers/cart.dart';
import '../Providers/product.dart';
import 'package:new_shopping_app/Screens/product_detail_screen.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final product=Provider.of<Product>(context);
    final cart=Provider.of<Cart>(context);
    return GestureDetector(
      onTap: (){
        Navigator.of(context).pushNamed(ProductDetailScreen.routeName,arguments: product.id);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTile(
            child: Image.network(product.imageUrl,fit: BoxFit.cover,),
          footer: GridTileBar(
            title: Text(product.title,textAlign: TextAlign.center,),
            backgroundColor: Colors.black87,
            leading: IconButton(
              color: Theme.of(context).accentColor,
              icon: product.isFavorite ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
              onPressed: (){
                      product.toggleFavoriteStatus();
              },

            ),
            trailing: IconButton(
              color: Theme.of(context).accentColor,
              icon: Icon(Icons.shopping_cart),
              onPressed:(){
                cart.addItem(
                  product.id,
                  product.price,
                  product.title
                );
              }
            ),
          ),
        ),
      ),
    );
  }
}
