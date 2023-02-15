import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/controllers/reset_password_controller/reset_password_controller.dart';
import 'package:shop/widgets/reuse_textfield/reuse_textfield.dart';

class ReSetPassWord extends StatelessWidget {
  ReSetPassWord({Key? key}) : super(key: key);
  final resetcontroller = Get.put(ResetController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Reset PassWord Screen"),
          backgroundColor: Colors.green,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                "Write the Email that's Password you Forget!",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ReuseTextfield(resetcontroller.resetcontroller, "Email"),
            ),
            MaterialButton(
              color: Colors.yellow,
              child: const Text("Reset"),
              onPressed: () {
                resetcontroller.reset();
                resetcontroller.resetcontroller.clear();
              },
            ),
          ],
        ),
      ),
    );
  }
}
