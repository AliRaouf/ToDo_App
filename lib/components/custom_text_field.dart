import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  String? label;
  Icon? icon;
  TextEditingController? controller;
  void Function()? onTap;

  CustomTextField({super.key,required this.label,required this.controller,required this.icon,this.onTap});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(controller: widget.controller,onTap:widget.onTap ,
      decoration: InputDecoration(labelText: widget.label,labelStyle: TextStyle(color: Colors.grey[800]),
          prefixIcon: widget.icon,prefixIconColor: Colors.grey,
          focusedBorder:
          OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.purpleAccent)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.grey))),
    );
  }
}