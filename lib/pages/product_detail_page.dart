import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/cart_provider.dart';

class ProductDetailPage extends StatefulWidget {
  final Map<String, Object> product;
  const ProductDetailPage({super.key, required this.product});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
      ),
      body: Column(
        children: [
          Text(
            widget.product["title"] as String,
            style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 75,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Image.asset(widget.product["imageUrl"] as String),
          ),
          const Spacer(),
          Container(
            color: Color.fromARGB(255, 208, 230, 241),
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                Text(
                  "\$${widget.product["price"] as double}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 30),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Chip(
                        label: Text("9"),
                      ),
                      Chip(
                        label: Text("9"),
                      ),
                      Chip(
                        label: Text("9"),
                      ),
                      Chip(
                        label: Text("9"),
                      )
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Provider.of<CartProvider>(context, listen: false)
                        .addProduct(widget.product);

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("shoe added to cart")),
                    );
                  },
                  child: Container(
                    height: 40,
                    decoration: const BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.shopping_cart),
                        Text("Add to Cart"),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
