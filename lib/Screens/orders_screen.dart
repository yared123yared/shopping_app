import 'package:flutter/material.dart';
import '../Providers/orders.dart' show Orders;
import 'package:provider/provider.dart';
import '../Widgets/order_item.dart';

class OrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ordersData=Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Orders"),

      ),
      body: ListView.builder(
        itemCount: ordersData.orders.length,
          itemBuilder: (ctx, i) => OrderItem( ordersData.orders[i]),
      ),
    );
  }
}
