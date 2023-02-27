import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../screens/intro/intro_page_1.dart';
import '../screens/intro/intro_page_2.dart';
import '../screens/intro/intro_page_3.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  // controller to keep track of which page we're on
  final PageController _controller = PageController();

  // keep track of if we are on the last page or not
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2);
              });
            },
            children: const [
              // page 1
              IntroPage1(),

              // page 2
              IntroPage2(),

              // page 3
              IntroPage3(),
            ],
          ),
          Container(
            alignment: const Alignment(0, 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // skip
                GestureDetector(
                  onTap: () {
                    _controller.jumpToPage(2);
                  },
                  child: const Text(
                    "Skip",
                  ),
                ),

                // dot indicator
                SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                ),

                // next or done
                //if last page, then show 'done' text
                onLastPage
                    ? GestureDetector(
                        onTap: () => Get.to(
                          () => null,
                        ),
                        child: const Text(
                          "Done",
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn,
                          );
                        },
                        child: const Text(
                          "Next",
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
