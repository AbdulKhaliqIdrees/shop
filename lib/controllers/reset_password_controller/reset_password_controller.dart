import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/screens/create_account/create_account.dart';

class ResetController extends GetxController {
  TextEditingController resetcontroller = TextEditingController();
  void reset() async {
    try {
      String email = resetcontroller.text.trim();
      if (email == "") {
        Get.snackbar(
          "Error!",
          "Please Fill all the details!",
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        FirebaseAuth.instance.sendPasswordResetEmail(email: email).then(
              ((value) => Get.to(CreateAccount())),
            );
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }
}
