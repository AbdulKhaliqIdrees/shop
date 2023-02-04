import 'package:flutter/material.dart';
import 'package:shop/screens/botom_navigation_bar.dart';
import 'package:shop/screens/read_data.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({Key? key}) : super(key: key);

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
            const Expanded(child: ReadData()),
            const BotomNavigationBar(),
          ],
        ),
      ),
    );
  }
}
