import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/screens/products.dart';

class CreateController extends GetxController {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  void createAccount() async {
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
            .createUserWithEmailAndPassword(email: email, password: password);
        Get.to(const AllProducts());
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }
}
