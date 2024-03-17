import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ShoeCard extends StatelessWidget {
  const ShoeCard({
    super.key,
    required this.title,
    required this.price,
    required this.imageString,
  });

  final String title;
  final double price;
  final String imageString;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
        top: 20,
        bottom: 20,
      ),
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            color: Color.fromARGB(255, 200, 228, 240)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              Text(
                "\$$price",
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    imageString,
                    height: 150,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
