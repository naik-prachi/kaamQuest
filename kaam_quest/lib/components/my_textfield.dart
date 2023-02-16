import 'dart:async';

import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final controller; // to access what the user typed in
  final String hintText;
  final bool obscureText;
  final tfIcon;

  MyTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obscureText,
      required this.tfIcon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Container(
        /*decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          spreadRadius: 7,
                          offset: const Offset(1, 1),
                          color: Colors.grey.withOpacity(0.2),
                        ),
                      ],
                    ),*/
        child: TextField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            prefixIcon: tfIcon,

            // when the textfield is in focus
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Colors.grey,
                width: 1.0,
              ),
            ),

            // when the textfield is not int focus
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Color.fromARGB(255, 41, 38, 67),
                width: 1.0,
              ),
            ),

            fillColor: Color.fromARGB(255, 68, 67, 111),
            filled: true,
            hintStyle: TextStyle(
              color: Colors.grey[500],
            ),

            /*border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),*/
          ),
        ),
      ),
    );
  }
}
