import 'package:flutter/material.dart';
import 'package:shop/screens/botom_navigation_bar/botom_navigation_bar.dart';
import 'package:shop/screens/read_products/read_products.dart';

class Products extends StatelessWidget {
  const Products({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Products"),
          backgroundColor: Colors.green,
        ),
        body: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const Expanded(
                child: Padding(
              padding: EdgeInsets.all(8.0),
              child: ReadProducts(),
            )),
            const BotomNavigationBar(),
          ],
        ),
      ),
    );
  }
}
