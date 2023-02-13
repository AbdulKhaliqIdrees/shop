import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/screens/products.dart';

class LoginController extends GetxController {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  void loginAccount() async {
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
      } else {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
        Get.to(const Products());
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar(
          "Error!",
          "No User found for that email!",
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM,
        );
      } else if (e.code == 'wrong-password') {
        Get.snackbar(
          "Error!",
          "Password is wrong for that user!",
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    }
  }
}
