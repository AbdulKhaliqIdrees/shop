import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shop/screens/create_account/create_account.dart';
import 'package:shop/screens/products/products.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(
      const Duration(milliseconds: 200),
      () {
        final user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => const Products(),
            ),
          );
        } else {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => CreateAccount(),
            ),
          );
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.yellow,
        child: const Center(
          child: Text(
            "WELCOME",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 80,
            ),
          ),
        ),
      ),
    );
  }
}
