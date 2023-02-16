import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:get/get.dart';
import 'package:kaam_quest/services/auth_controller.dart';

import '../components/my_button.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  //to accept email & paswword during sign in
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    /*List images = [
      "g.png",
      "t.png",
      "f.png",
    ];*/

    //double w = MediaQuery.of(context).size.width;
    //double h = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 41, 38, 67),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //image container
          Container(
            //width: w,
            //height: h * 0.33,

            /*decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "images/signup.png",
                ),
                fit: BoxFit.cover,
              ),
            ),*/

            child: Column(
              children: const [
                SizedBox(
                  height: 45, //h * 0.16,
                ),
                CircleAvatar(
                  backgroundColor: Colors.white70,
                  radius: 60,
                  backgroundImage: AssetImage(
                    "assets/images/profile.png",
                  ),
                ),
              ],
            ),
          ),

          //text & textfield container
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            //width: w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 50,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Email",
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.grey[700],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                //TextField for password
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Password",
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.grey[700],
                        ),
                      ),
                    ),
                  ),
                ),

/*
                //TextField for username
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        spreadRadius: 7,
                        offset: const Offset(1, 1),
                        color: Colors.grey.withOpacity(0.2),
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: "Email",
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.orangeAccent,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 1.0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 1.0,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),

                //TextField for password
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        spreadRadius: 7,
                        offset: const Offset(1, 1),
                        color: Colors.grey.withOpacity(0.2),
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Password",
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.orangeAccent,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 1.0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 1.0,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
*/
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),

          const SizedBox(
            height: 10,
          ),

          //sign up button
          MyButton(
            btnText: "Sign Up",
            onTap: () {
              AuthController.instance.register(
                emailController.text.trim(),
                passwordController.text.trim(),
              );
            },
          ),

          const SizedBox(
            height: 10,
          ),

          //have an account?
          RichText(
            text: TextSpan(
              recognizer: TapGestureRecognizer()..onTap = () => Get.back(),
              text: "Have an account?",
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey[700],
              ),
            ),
          ),

          /*SizedBox(
            height: w * 0.2,
          ),

          //sign up using
          AutoSizeText(
            "Sign up using one of the following methods",
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[700],
            ),
          ),

          Wrap(
            children: List<Widget>.generate(
              3,
              (index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.grey[500],
                    child: CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage(
                        "assets/images/" + images[index],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),*/
        ],
      ),
    );
  }
}
