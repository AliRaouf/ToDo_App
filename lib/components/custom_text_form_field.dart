import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  String? hint;

  TextEditingController? controller;

  CustomTextFormField({super.key,required this.hint,required this.controller});
  @override
  Widget build(BuildContext context) {
    return TextFormField(controller: controller,
      decoration: InputDecoration(hintText: hint,
          focusedBorder:
          OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.grey)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.grey))),
    );
  }
}