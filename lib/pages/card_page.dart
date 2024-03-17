import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/cart_provider.dart';

class CardPage extends StatelessWidget {
  const CardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = (Provider.of<CartProvider>(context).cart);
    return Scaffold(
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          final item = cart[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(item['imageUrl'] as String),
              radius: 30,
            ),
            title: Text(
              item["title"] as String,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Delete Item"),
                        content: Text(
                            "Are you sure you want to remove the product from cart"),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("NO")),
                          TextButton(
                              onPressed: () {
                                Provider.of<CartProvider>(context,
                                        listen: false)
                                    .removeProduct(item);

                                Navigator.of(context).pop();
                              },
                              child: Text("YES")),
                        ],
                      );
                    });
              },
            ),
          );
        },
      ),
    );
  }
}
