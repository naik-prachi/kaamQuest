import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:kaam_quest/components/bottom_nav_bar.dart';

import 'package:kaam_quest/services/google_auth_service.dart';
import 'package:get/get.dart';

import '../components/my_button.dart';

class WelcomePage extends StatelessWidget {
  String email;
  WelcomePage({required this.email, super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      //resizeToAvoidBottomInset: false,

      body: Column(
        children: [
          //image container
          Container(
            width: w,
            height: h * 0.33,
            decoration: const BoxDecoration(
                /*image: DecorationImage(
                image: AssetImage(
                  "assets/images/signup.png",
                ),
                fit: BoxFit.cover,
              ),*/
                ),
            child: Column(
              children: [
                SizedBox(height: h * 0.16),
                const CircleAvatar(
                  backgroundColor: Color.fromRGBO(233, 158, 118, 0.9),
                  radius: 60,
                  backgroundImage: AssetImage(
                    "assets/images/profile1.png",
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(
            height: 10,
          ),

          Container(
            width: w,
            margin: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AutoSizeText(
                  "Welcome",
                  style: TextStyle(
                    fontSize: 36,
                  ),
                ),
                AutoSizeText(
                  email,
                  style: TextStyle(
                    fontSize: 18,
                    color: Color.fromARGB(255, 233, 158, 118),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(
            height: 200,
          ),

          //homepage button
          MyButton(
            btnText: "Continue",
            onTap: () => Get.to(
              () => NavBar(
                email: email,
              ),
            ),
          ),

          const SizedBox(
            height: 10,
          ),

          //sign out button
          MyButton(
            btnText: "Sign Out",
            onTap: () {
              //AuthController.instance.logOut();
              GoogleAuthService().signOut();
            },
          ),
        ],
      ),
    );
  }
}
