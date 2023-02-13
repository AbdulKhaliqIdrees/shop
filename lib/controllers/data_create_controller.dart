import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class DataCreateController extends GetxController {
  TextEditingController productname = TextEditingController();
  TextEditingController productdescription = TextEditingController();
  TextEditingController productprice = TextEditingController();
  // ignore: non_constant_identifier_names
  String downloadurl = '';
  // ignore: non_constant_identifier_names
  var Productpic = File('').obs;
  var picture = false.obs;
  createData() async {
    try {
      String id = DateTime.now().millisecondsSinceEpoch.toString();
      String uid = FirebaseAuth.instance.currentUser!.uid;
      await FirebaseFirestore.instance.collection("Shopp").doc(id).set({
        "Name": productname.text,
        "Description": productdescription.text,
        "Price": productprice.text,
        "Image": downloadurl,
        "uid": uid,
      });
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  selectImage() async {
    try {
      XFile? selectedimage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (selectedimage != null) {
        File convertedfile = File(selectedimage.path);
        picture.value = true;
        Productpic.value = convertedfile;
        log("Image Selected");
      } else {
        log("No Image Selected!");
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  // ignore: non_constant_identifier_names
  Future uploadImage() async {
    try {
      String id = DateTime.now().millisecondsSinceEpoch.toString();
      UploadTask uploadtask = FirebaseStorage.instance
          .ref()
          .child("Shopp")
          .child(id)
          .putFile(Productpic.value);
      TaskSnapshot taskSnapshot = await uploadtask;
      downloadurl = await taskSnapshot.ref.getDownloadURL();
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }
}
