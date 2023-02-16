// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaam_quest/components/my_button.dart';
import 'package:kaam_quest/components/my_textfield.dart';
import 'package:kaam_quest/services/auth_controller.dart';
import 'package:kaam_quest/pages/signup_page.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kaam_quest/services/google_auth_service.dart';
import '../components/square_tile.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //to accept email & paswword during sign in
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //double w = MediaQuery.of(context).size.width;
    //double h = MediaQuery.of(context).size.height;
    //final GoogleSignIn _googleSignIn = GoogleSignIn();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(255, 41, 38, 67),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //image container
          /*Container(
            width: w,
            height: h * 0.289,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/images/loginimg.png",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),*/

          // Icon
          const Icon(
            Icons.lock,
            size: 100,
            color: Color.fromARGB(255, 233, 158, 118),
          ),

          const SizedBox(height: 65),

          //text & textfield container
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            //width: w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*
                //HELLO
                Center(
                  child: AutoSizeText(
                    "Hello",
                    style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                */

                //sign into your account
                const Center(
                  child: AutoSizeText(
                    "Welcome, please log in to continue!",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                //TextField for username
                MyTextField(
                  controller: emailController,
                  hintText: "Email",
                  obscureText: false,
                  tfIcon: Icon(
                    Icons.email,
                    color: Colors.grey[700],
                  ),
                ),

                const SizedBox(height: 5),

                //TextField for password
                MyTextField(
                  controller: passwordController,
                  hintText: "Password",
                  obscureText: true,
                  tfIcon: Icon(
                    Icons.lock,
                    color: Colors.grey[700],
                  ),
                ),

                const SizedBox(height: 20),

                //forgot your password
                Padding(
                  padding: const EdgeInsets.only(right: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AutoSizeText(
                        "Forgot your password?",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),
              ],
            ),
          ),

          //sign in button container
          MyButton(
            btnText: "Sign In",
            onTap: () {
              AuthController.instance.login(
                emailController.text.trim(),
                passwordController.text.trim(),
              );
            },
          ),
          /*GestureDetector(
            
            },
            child: Container(
              /*width: w * 0.5, becomes responsible based on the screen size
              height: h * 0.08,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: const DecorationImage(
                  image: AssetImage(
                    "assets/images/loginbtn.png",
                  ),
                  fit: BoxFit.cover,
                ),
              ),*/
              child: const Center(
                child: AutoSizeText(
                  "Sign in",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),*/

          const SizedBox(height: 30),

          //or continue with
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              children: [
                Expanded(
                  child: Divider(
                    thickness: 0.5,
                    color: Colors.grey[600],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'Or continue with',
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                ),
                Expanded(
                  child: Divider(
                    thickness: 0.5,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // google sign in buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //google button
              SquareTile(
                onTap: () {
                  GoogleAuthService().signInWithGoogle();
                  /*_googleSignIn.signIn().then((value) {
                    String userName = value!.displayName!;
                    String profilePicture = value.photoUrl!;
                    print(userName);
                  });*/
                },
                imagePath: "assets/images/google.png",
              ),
            ],
          ),

          const SizedBox(height: 30 /*w * 0.06*/),

          //Don't have an account? Create.
          //works like inline style
          RichText(
            text: TextSpan(
              text: "Don't have an account?",
              style: TextStyle(
                color: Colors.grey[800],
                fontSize: 15,
              ),

              //the section of the text that is be designed
              //different, will come inside children
              children: [
                TextSpan(
                  text: " Create.",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => Get.to(
                          () => const SignUpPage(),
                          // This is how you give transitions.
                          transition: Transition.leftToRightWithFade,
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
