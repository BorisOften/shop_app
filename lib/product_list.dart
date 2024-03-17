import 'package:flutter/material.dart';
import 'package:shop_app/global_variables.dart';
import 'package:shop_app/pages/product_detail_page.dart';
import 'package:shop_app/shoe_card.dart';

class ProductList extends StatefulWidget {
  ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final textController = TextEditingController();

  final searchTextBorder = const OutlineInputBorder(
      borderSide: BorderSide(color: Color.fromARGB(255, 40, 40, 36)),
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(45), bottomLeft: Radius.circular(45)));

  final List<String> filters = const ["All", "Addidas", "Nike", "Batta"];
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "Shoes\nCollection",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                ),
              ),
              Expanded(
                child: TextField(
                  controller: textController,
                  decoration: InputDecoration(
                    hintText: "Search",
                    prefixIcon: const Icon(Icons.search),
                    border: searchTextBorder,
                    enabledBorder: searchTextBorder,
                    focusedBorder: searchTextBorder,
                  ),
                  style: const TextStyle(),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 50,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Chip(
                      label: Text(
                        filters[index],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      padding: const EdgeInsets.all(15),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(25),
                        ),
                      ),
                      backgroundColor: selectedIndex == index
                          ? Colors.yellow
                          : const Color.fromARGB(255, 235, 231, 231),
                    ),
                  ),
                );
              },
              itemCount: filters.length,
              scrollDirection: Axis.horizontal,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                final product = products[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return ProductDetailPage(product: product);
                    }));
                  },
                  child: ShoeCard(
                      title: product["title"] as String,
                      price: product["price"] as double,
                      imageString: product["imageUrl"] as String),
                );
              },
              itemCount: products.length,
            ),
          )
        ],
      ),
    );
  }
}
