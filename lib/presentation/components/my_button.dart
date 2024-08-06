import 'package:flutter/material.dart';

class MyButton extends StatelessWidget{
  final void Function()? onTap;
  final String text;
  const MyButton({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap ,
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          textAlign: TextAlign.center,
          text ,style:const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),
        ),
      ),
    );
  }
  
}