import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:kaam_quest/pages/chat_page.dart';
import 'package:kaam_quest/pages/home_page.dart';
import 'package:kaam_quest/pages/job_desc_page.dart';
import 'package:kaam_quest/pages/onboarding_screen.dart';
import 'package:kaam_quest/pages/search_page.dart';

import 'search_bar.dart';

// You can pass any object to the arguments parameter.
// In this example, create a class that contains both
// a customizable title and message.
class ScreenArguments {
  final String email;

  ScreenArguments(this.email);
}

class NavBar extends StatefulWidget {
  String email;
  NavBar({
    super.key,
    required this.email,
  });

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  // nav pages
  List pages = const [
    HomePage(),
    JobDescription(),
    SearchPage(),
    ChatPage(),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: pages[currentIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 8.0,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(42),
          child: Container(
            color: const Color.fromARGB(255, 41, 38, 67),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 7.0,
                vertical: 7,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(32),
                child: GNav(
                  selectedIndex: currentIndex,

                  //rippleColor: Color.fromARGB(255, 119, 100, 130),

                  hoverColor: const Color.fromARGB(255, 187, 171, 184),

                  backgroundColor: const Color.fromARGB(255, 41, 38, 67),

                  //Color.fromARGB(255, 41, 38, 67),

                  color: const Color.fromARGB(255, 187, 171, 184),

                  activeColor: Colors.white,

                  tabBackgroundColor: const Color.fromARGB(255, 119, 100, 130),

                  padding: const EdgeInsets.all(20),

                  gap: 10,

                  onTabChange: (index) {
                    setState(() {
                      // when a certain item from navbar is clicked,
                      // that item's index will be passed to index of onTap function
                      // and that value is assigned to currentIndex
                      currentIndex = index;
                    });
                  },

                  tabs: const [
                    GButton(
                      icon: Icons.home,
                      text: 'Home',
                    ),
                    GButton(
                      icon: CupertinoIcons.square_stack_fill,
                      text: 'Projects',
                    ),
                    GButton(
                      icon: CupertinoIcons.search,
                      text: 'Search',
                    ),
                    GButton(
                      icon: //Icons.email_rounded,
                          CupertinoIcons.envelope_fill,
                      text: 'Messages',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/*return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.pink.withOpacity(0.5),
        showSelectedLabels: false,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(CupertinoIcons.app),
          ),
          BottomNavigationBarItem(
            label: 'Bar',
            icon: Icon(CupertinoIcons.bars),
          ),
          BottomNavigationBarItem(
            label: 'Search',
            icon: Icon(CupertinoIcons.search),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(CupertinoIcons.person),
          ),
        ],
      ),
    );
  }
}*/

/*
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

void main() => runApp(MaterialApp(
    builder: (context, child) {
      return Directionality(textDirection: TextDirection.ltr, child: child!);
    },
    title: 'GNav',
    theme: ThemeData(
      primaryColor: Colors.grey[800],
    ),
    home: Example()));

class Example extends StatefulWidget {
  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Home',
      style: optionStyle,
    ),
    Text(
      'Likes',
      style: optionStyle,
    ),
    Text(
      'Search',
      style: optionStyle,
    ),
    Text(
      'Profile',
      style: optionStyle,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 20,
        title: const Text('GoogleNavBar'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.black,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey[100]!,
              color: Colors.black,
              tabs: [
                GButton(
                  icon: LineIcons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: LineIcons.heart,
                  text: 'Likes',
                ),
                GButton(
                  icon: LineIcons.search,
                  text: 'Search',
                ),
                GButton(
                  icon: LineIcons.user,
                  text: 'Profile',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
*/
