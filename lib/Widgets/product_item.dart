import 'package:flutter/material.dart';
import 'package:new_shopping_app/Screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  ProductItem(this.id, this.title, this.imageUrl);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).pushNamed(ProductDetailScreen.routeName,arguments: id);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTile(
            child: Image.network(imageUrl,fit: BoxFit.cover,),
          footer: GridTileBar(
            title: Text(title,textAlign: TextAlign.center,),
            backgroundColor: Colors.black87,
            leading: IconButton(
              color: Theme.of(context).accentColor,
              icon: Icon(Icons.favorite_border),
              onPressed: (){},

            ),
            trailing: IconButton(
              color: Theme.of(context).accentColor,
              icon: Icon(Icons.shopping_cart),
              onPressed:(){}
            ),
          ),
        ),
      ),
    );
  }
}
