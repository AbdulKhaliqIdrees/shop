import 'package:flutter/material.dart';

class ReuseTextfield extends StatelessWidget {
  const ReuseTextfield(this.controller, this.label, {Key? key})
      : super(key: key);
  final TextEditingController controller;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          fillColor: Colors.white,
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blue,
              width: 2.0,
            ),
          ),
        ),
      ),
    );
  }
}
