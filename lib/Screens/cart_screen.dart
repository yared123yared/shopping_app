import 'package:flutter/material.dart';
import 'package:new_shopping_app/Providers/cart.dart' show Cart;
import 'package:new_shopping_app/Providers/orders.dart';
import '../Widgets/cart_item.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  static const routeName='/cart';


  @override
  Widget build(BuildContext context) {



    final cart =Provider.of<Cart>(context);

    return Scaffold(
      appBar:AppBar(
        title: Text("Your cart"),
      ),
      body: Column(
       children: [
         Card(
           margin: EdgeInsets.all(15),
           child: Padding(
              padding: EdgeInsets.all(8),
             child: Row(
               mainAxisAlignment:MainAxisAlignment.spaceBetween,
               children: [
                 Text('Total' , style: TextStyle(
                   fontSize: 20
                 ),),
                 SizedBox(width: 10,),
                 Spacer(),
                 FittedBox(
                   child: Container(
                     width: MediaQuery.of(context).size.width * 0.3,
                     child: Chip(

                       label: Text('\$${cart.totalAmount}' , style: TextStyle(
                         color: Theme.of(context).primaryTextTheme.headline6.color
                       ),),
                       backgroundColor: Theme.of(context).primaryColor,
                     ),
                   ),
                 ),
                 FlatButton(
                   onPressed: (){
                      Provider.of<Orders>(context,listen: false).addOrder(
                          cart.items.values.toList(),
                          cart.totalAmount);
                      cart.clear();


                 },
                   child: Text('ORDER NOW'),
                   textColor: Theme.of(context).primaryColor,)
               ],


             ),

           ),



         ),
         SizedBox(height:10),
         Expanded(child: ListView.builder(
           itemCount: cart.items.length,
             itemBuilder:(ctx,i) =>  CartItem(
                   id: cart.items.values.toList()[i].id,
                   price: cart.items.values.toList()[i].price,
                  productId: cart.items.keys.toList()[i],
                  title: cart.items.values.toList()[i].title,
                   quantity: cart.items.values.toList()[i].quantity,
         )
         )
         )
       ],

      ),
    );
  }
}
