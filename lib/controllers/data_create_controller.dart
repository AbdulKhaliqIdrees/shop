import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
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
  String id = DateTime.now().millisecondsSinceEpoch.toString();
  createData() async {
    try {
      await FirebaseFirestore.instance.collection("Storee").doc(id).set({
        "Name": productname.text,
        "Description": productdescription.text,
        "Price": productprice.text,
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

  uploadImage() async {
    try {
      UploadTask uploadtask = FirebaseStorage.instance
          .ref()
          .child("Storee")
          .child(id)
          .putFile(Productpic.value);
      TaskSnapshot taskSnapshot = await uploadtask;
      downloadurl = await taskSnapshot.ref.getDownloadURL();
      FirebaseFirestore.instance.collection("Storee").add({
        "Image": downloadurl,
      });
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }
}
