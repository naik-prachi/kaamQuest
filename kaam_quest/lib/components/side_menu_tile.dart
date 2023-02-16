import 'package:flutter/material.dart';

class SideMenuTile extends StatelessWidget {
  final String label;
  final Widget icon;
  const SideMenuTile({
    Key? key,
    required this.label,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24, right: 24),
          child: Divider(
            color: Color.fromARGB(255, 233, 158, 118),
            //height: 5,
          ),
        ),
        ListTile(
          onTap: () {},
          leading: icon,
          iconColor: Color.fromARGB(255, 233, 158, 118),
          title: Text(
            label,
            style: TextStyle(
              color: Color.fromARGB(255, 233, 158, 118),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
