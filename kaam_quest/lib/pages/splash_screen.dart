import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      color: Colors.grey[200],
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.waving_hand_rounded,
              size: 100,
            ),
            SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                backgroundColor: Colors.grey,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
