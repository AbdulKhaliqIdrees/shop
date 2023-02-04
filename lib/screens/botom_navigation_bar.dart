import 'package:flutter/material.dart';
import 'package:shop/screens/add_products.dart';
import 'package:shop/screens/profile.dart';

class BotomNavigationBar extends StatelessWidget {
  const BotomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 380,
          color: const Color(0xffFFFFFF),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {},
                child: Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Icon(
                      Icons.production_quantity_limits,
                      size: 25,
                      color: Colors.green,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "Products",
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: ((context) {
                      return const Profile();
                    })),
                  );
                },
                child: Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Icon(
                      Icons.person,
                      size: 25,
                      color: Colors.black,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "Profile",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: ((context) {
                      return AddProducts();
                    })),
                  );
                },
                child: Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Icon(
                      Icons.add,
                      size: 25,
                      color: Colors.black,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "Add More",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
