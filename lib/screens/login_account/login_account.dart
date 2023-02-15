import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/controllers/account_login_controller/account_login_controller.dart';
import 'package:shop/widgets/reuse_textfield/reuse_textfield.dart';

class LoginAccount extends StatelessWidget {
  LoginAccount({Key? key}) : super(key: key);
  final logincontroller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Login Account"),
          backgroundColor: Colors.green,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ReuseTextfield(logincontroller.emailcontroller, "Email"),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ReuseTextfield(
                  logincontroller.passwordcontroller, "Password"),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  color: Colors.yellow,
                  child: const Text("Login Account"),
                  onPressed: () {
                    logincontroller.loginAccount();
                    logincontroller.emailcontroller.clear();
                    logincontroller.passwordcontroller.clear();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
