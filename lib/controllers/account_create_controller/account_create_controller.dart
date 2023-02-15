import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/screens/products/products.dart';

class CreateController extends GetxController {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  void createAccount(BuildContext context) async {
    try {
      String email = emailcontroller.text.trim();
      String password = passwordcontroller.text.trim();
      if (email == "" || password == "") {
        Get.snackbar(
          "Error!",
          "Please Fill all the details!",
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM,
        );
      } else if (password.length < 8) {
        Get.snackbar(
          "Error!",
          "Password must be 8 characters",
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        // Get.delete

        // ignore: use_build_context_synchronously
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => const Products(),
          ),
        );
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }
}
