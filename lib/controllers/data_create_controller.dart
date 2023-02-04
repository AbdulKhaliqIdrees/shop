import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DataCreateController extends GetxController {
  TextEditingController productname = TextEditingController();
  TextEditingController productdescription = TextEditingController();
  TextEditingController productprice = TextEditingController();
  createData() async {
    try {
      String id = DateTime.now().millisecondsSinceEpoch.toString();
      await FirebaseFirestore.instance.collection("Store").doc(id).set({
        "Name": productname.text,
        "Description": productdescription.text,
        "Price": productprice.text,
      });
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }
}
