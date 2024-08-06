import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget{

  final TextEditingController? controller;
  final String hintText;
  final bool obscureText;
  const MyTextField({super.key, this.controller, required this.hintText, required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only( top: 10.0, left: 20.0, right: 20.0,bottom: 10),
      child: TextFormField(
        validator: (value){
          if(value==null || value.isEmpty){
            return "Please input field";
          }
          return null;
        },
        controller: controller,
        obscureText: obscureText,
         decoration: InputDecoration(
          enabledBorder:const  OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white)
          ),
            focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400)
          ),
          fillColor: Colors.white,
          filled: true,
          hintText: hintText,hintStyle: TextStyle(color: Colors.grey[400]),
        ),
      ),
    );
  } 
}