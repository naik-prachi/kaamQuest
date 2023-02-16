//import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaam_quest/components/search_bar.dart';
import 'package:kaam_quest/components/side_menu_drawer.dart';
import 'package:kaam_quest/data/current_projects.dart';
import 'package:kaam_quest/pages/onboarding_screen.dart';
import 'package:kaam_quest/pages/welcome_page.dart';

import '../components/bottom_nav_bar.dart';
import '../components/job_card.dart';
import '../components/list_job_card.dart';
import '../components/my_button.dart';
import '../data/for_you.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      // can wrap scaffold in safearea too
      backgroundColor: Color.fromARGB(255, 41, 38, 67),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 60),
            // app bar
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: GestureDetector(
                onTap: () => Get.to(
                  () => const SideMenu(),
                ),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey[200],
                  ),
                  child: Image.asset(
                    "assets/images/menu-2-line.png",
                    color: Colors.grey[800],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 40),

            // discover a new path
            /*const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                "Discover a New Path",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
        
            const SizedBox(height: 15),
        
            // search bar
            const SizedBox(
              height: 50,
              child: SearchBar(),
            ),
        
            const SizedBox(height: 50),*/

            // for you
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                "Current Projects",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Color.fromARGB(255, 233, 158, 118),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // current project job cards
            Flexible(
              flex: 1,
              fit: FlexFit.loose,
              child: Container(
                height: 140,
                // color: Colors.blue[200],
                child: ListView.builder(
                    itemCount: CurrentProjects.currentProjects.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return JobCard(
                        companyName: CurrentProjects.currentProjects[index][0],
                        jobTitle: CurrentProjects.currentProjects[index][1],
                        logoImagePath: CurrentProjects.currentProjects[index]
                            [2],
                        hourlyRate: CurrentProjects.currentProjects[index][3],
                      );
                    }),
              ),
            ),

            const SizedBox(height: 50),

            // recently added -> job tiles
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                "Recently Added",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Color.fromARGB(255, 233, 158, 118),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Flexible(
              flex: 1,
              fit: FlexFit.loose,
              child: Container(
                height: 140,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: ProjectsForYou.projectsForYou.length,
                  itemBuilder: (context, index) {
                    return JobCard(
                      companyName: ProjectsForYou.projectsForYou[index][0],
                      jobTitle: ProjectsForYou.projectsForYou[index][1],
                      logoImagePath: ProjectsForYou.projectsForYou[index][2],
                      hourlyRate: ProjectsForYou.projectsForYou[index][3],
                    );
                  },
                ),
              ),
            ),

            const SizedBox(height: 50),

            //crad row 3
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                "Recently Added",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Color.fromARGB(255, 233, 158, 118),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Flexible(
              flex: 1,
              fit: FlexFit.loose,
              child: Container(
                height: 140,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: ProjectsForYou.projectsForYou.length,
                  itemBuilder: (context, index) {
                    return JobCard(
                      companyName: ProjectsForYou.projectsForYou[index][0],
                      jobTitle: ProjectsForYou.projectsForYou[index][1],
                      logoImagePath: ProjectsForYou.projectsForYou[index][2],
                      hourlyRate: ProjectsForYou.projectsForYou[index][3],
                    );
                  },
                ),
              ),
            ),

            const SizedBox(height: 50),

            // recently added -> job tiles
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                "Recently Added",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Color.fromARGB(255, 233, 158, 118),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Flexible(
              flex: 1,
              fit: FlexFit.loose,
              child: Container(
                height: 140,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: ProjectsForYou.projectsForYou.length,
                  itemBuilder: (context, index) {
                    return JobCard(
                      companyName: ProjectsForYou.projectsForYou[index][0],
                      jobTitle: ProjectsForYou.projectsForYou[index][1],
                      logoImagePath: ProjectsForYou.projectsForYou[index][2],
                      hourlyRate: ProjectsForYou.projectsForYou[index][3],
                    );
                  },
                ),
              ),
            ),

            /*MyButton(
              btnText: "Back",
              onTap: () {
                Navigator.pop(context);
              },
            ),*/
          ],
        ),
      ),

      // nav bar

      //const NavBar(),
    );
  }
}
