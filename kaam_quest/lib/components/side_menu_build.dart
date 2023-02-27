import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kaam_quest/components/side_menu_tile.dart';

import '../services/google_auth_service.dart';

class buildMenu extends StatelessWidget {
  const buildMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 50.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 26.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // circle avatar
                const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30,
                ),

                const SizedBox(height: 20.0),

                // name
                Text(
                  "Prachi Naik".toUpperCase(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),

                const SizedBox(height: 10.0),

                // job title
                Text(
                  "Student".toUpperCase(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 25),

          // divider
          const Padding(
            padding: EdgeInsets.only(left: 24, right: 80),
            child: Divider(
              color: Color.fromARGB(255, 233, 158, 118),
              //height: 5,
            ),
          ),

          // HOME
          const SideMenuTile(
            label: "Profile",
            icon: Icon(Icons.person),
            onTap: null,
          ),

          // ALL PROJECTS
          const SideMenuTile(
            label: "All Projects",
            icon: Icon(CupertinoIcons.square_stack_3d_down_right),
            onTap: null,
          ),

          // STARRED PROJECTS
          const SideMenuTile(
            label: "Starred Projects",
            icon: Icon(Icons.star_rounded),
            onTap: null,
          ),

          // SETTINGS
          const SideMenuTile(
            label: "Settings",
            icon: Icon(Icons.settings),
            onTap: null,
          ),

          // PAYMENT HISTORY
          const SideMenuTile(
            label: "Payment History",
            icon: Icon(Icons.verified_user_rounded),
            onTap: null,
          ),

          const SizedBox(height: 70),

          // THEME
          //Switch.adaptive(value: true, onChanged: null),

          // LOG OUT
          SideMenuTile(
            label: "LOG OUT",
            icon: const Icon(Icons.logout_rounded),
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
