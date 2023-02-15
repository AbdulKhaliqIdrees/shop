import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/widgets/reuse_textfield/reuse_textfield.dart';

import '../../controllers/data_create_controller/data_create_controller.dart';

class AddProducts extends StatelessWidget {
  AddProducts({Key? key}) : super(key: key);
  final datacreatecontroller = DataCreateController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Add Products"),
          backgroundColor: Colors.green,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ReuseTextfield(datacreatecontroller.productname, "Name"),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ReuseTextfield(
                    datacreatecontroller.productdescription, "Description"),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child:
                    ReuseTextfield(datacreatecontroller.productprice, "Price"),
              ),
              InkWell(
                onTap: () {
                  datacreatecontroller.selectImage();
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                      color: const Color(0xffFFFFFF),
                      border: Border.all(
                        width: 1,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Obx((() => (datacreatecontroller.picture.value == true)
                            ? Expanded(
                                child: Image.file(
                                datacreatecontroller.Productpic.value,
                                fit: BoxFit.cover,
                              ))
                            : Container())),
                        const Icon(Icons.photo_camera),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text("Image Picker"),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              MaterialButton(
                color: Colors.yellow,
                child: const Text("Add Product"),
                onPressed: () async {
                  await datacreatecontroller.uploadImage(context);
                  // ignore: use_build_context_synchronously
                  await datacreatecontroller.createData(context);
                  // ignore: use_build_context_synchronously
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
