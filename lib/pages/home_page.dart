import 'package:flutter/material.dart';
import 'package:shop_app/pages/card_page.dart';
import 'package:shop_app/product_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentPage = 0;

  List<Widget> tabBarPages = [ProductList(), const CardPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 35,
        currentIndex: currentPage,
        onTap: (selectedIndex) {
          setState(() {
            currentPage = selectedIndex;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: "Cart")
        ],
      ),
      body: IndexedStack(
        index: currentPage,
        children: tabBarPages,
      ),
    );
  }
}
