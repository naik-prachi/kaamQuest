import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kaam_quest/components/side_menu_tile.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
        child: Container(
          width: 288,
          height: double.infinity,
          color: const Color.fromARGB(255, 41, 38, 67),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                SizedBox(height: 50),
                InfoCard(
                  name: "Prachi Naik",
                  profession: "Student",
                ),
                SizedBox(height: 50),
                SideMenuTile(
                  label: "Home",
                  icon: Icon(Icons.home_filled),
                ),
                SideMenuTile(
                  label: "All Projects",
                  icon: Icon(CupertinoIcons.square_stack_fill),
                ),
                SideMenuTile(
                  label: "Starred",
                  icon: Icon(CupertinoIcons.star_fill),
                ),
                SideMenuTile(
                  label: "Settings",
                  icon: Icon(Icons.settings),
                ),
                SideMenuTile(
                  label: "Log Out",
                  icon: Icon(Icons.logout_rounded),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String name, profession;
  const InfoCard({
    Key? key,
    required this.name,
    required this.profession,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundColor: Color.fromARGB(255, 233, 158, 118),
        child: Icon(
          CupertinoIcons.person,
          color: Color.fromARGB(255, 41, 38, 67),
        ),
      ),
      title: Text(
        name,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        profession,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
