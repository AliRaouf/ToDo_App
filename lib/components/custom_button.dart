import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  double width;
  double height;
  Function()? onPressed;

  String text;

 CustomButton({
    super.key,required this.width,required this.height,required this.onPressed,required this.text});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed,style: ButtonStyle(
        backgroundColor: const MaterialStatePropertyAll(Colors.purple),shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))
        ,fixedSize: MaterialStatePropertyAll(Size(width,height))), child: Text(text));
  }
}