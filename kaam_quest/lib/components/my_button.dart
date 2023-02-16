import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String btnText;
  Function()? onTap;

  MyButton({
    super.key,
    required this.btnText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 233, 158, 118),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: AutoSizeText(
            btnText,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
