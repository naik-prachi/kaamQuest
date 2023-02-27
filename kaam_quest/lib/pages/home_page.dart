//import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kaam_quest/services/google_auth_service.dart';

import 'package:kaam_quest/components/side_menu_tile.dart';
import 'package:kaam_quest/data/current_projects.dart';

import 'package:shrink_sidemenu/shrink_sidemenu.dart';

import '../components/job_card.dart';

import '../components/search_bar.dart';
import '../components/side_menu_build.dart';
import '../data/for_you.dart';

class HomePage extends StatefulWidget {
  //String email;
  const HomePage({
    Key? key,
    // required this.email,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isOpened = false;

  final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();
  final GlobalKey<SideMenuState> _endSideMenuKey = GlobalKey<SideMenuState>();

  toggleMenu([bool end = false]) {
    if (end) {
      final _state = _endSideMenuKey.currentState!;
      if (_state.isOpened) {
        _state.closeSideMenu();
      } else {
        _state.openSideMenu();
      }
    } else {
      final _state = _sideMenuKey.currentState!;
      if (_state.isOpened) {
        _state.closeSideMenu();
      } else {
        _state.openSideMenu();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SideMenu(
      key: _endSideMenuKey,
      //inverse: true, // end side menu
      type: SideMenuType.shrinkNSlide,
      menu: Padding(
        padding: const EdgeInsets.only(left: 25.0),
        child: buildMenu(),
      ),
      onChange: (_isOpened) {
        setState(() => isOpened = _isOpened);
      },
      child: SideMenu(
        key: _sideMenuKey,
        background: Color.fromARGB(255, 41, 38, 67),
        menu: buildMenu(),
        type: SideMenuType.shrinkNSlide,
        onChange: (_isOpened) {
          setState(() => isOpened = _isOpened);
        },
        child: IgnorePointer(
          ignoring: isOpened,

          // ----- SCAFFOLD -----
          child: Scaffold(
            extendBody: true,
            resizeToAvoidBottomInset: false,

            // can wrap scaffold in safearea too

            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 60),

                  Padding(
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => toggleMenu(),
                          child: const Icon(
                            Icons.menu,
                            size: 35,

                            //shadows: [Shadow(color: Colors.grey, blurRadius: 15.0)],
                          ),
                        ),

                        //GoogleUserCircleAvatar(identity: GoogleIdentity().photoUrl),
                        // circle avatar
                        const CircleAvatar(
                          backgroundColor: Color.fromRGBO(233, 158, 118, 0.9),
                          radius: 30,
                          backgroundImage: AssetImage(
                            "assets/images/profile1.png",
                          ),
                        ),
                      ],
                    ),
                  ),
                  // app bar
                  /*Padding(
                padding: const EdgeInsets.only(left: 10),
                child: GestureDetector(
                  onTap: () => Get.to(
                    () => SideMenuDrawer(
                      title: '',
                    ),
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
          */
                  const SizedBox(height: 40),

                  // hello, name
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: RichText(
                      text: const TextSpan(
                        text: "Good Morning ",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey,
                          //fontWeight: FontWeight.bold,
                        ),

                        //the section of the text that is be designed
                        //different, will come inside children
                        children: [
                          TextSpan(
                            text: "Prachi",
                            style: TextStyle(
                              color: Color.fromARGB(255, 233, 158, 118),
                              fontSize: 20,
                              //fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // discover your next project
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: RichText(
                      text: const TextSpan(
                        text: "Discover your \nnext",
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),

                        //the section of the text that is be designed
                        //different, will come inside children
                        children: [
                          TextSpan(
                            text: " Project",
                            style: TextStyle(
                              color: Color.fromARGB(255, 233, 158, 118),
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // search bar
                  const SizedBox(
                    height: 86,
                    child: SearchBar(),
                  ),

                  const SizedBox(height: 70),

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
                    child: SizedBox(
                      height: 140,
                      // color: Colors.blue[200],
                      child: ListView.builder(
                          itemCount: CurrentProjects.currentProjects.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return JobCard(
                              companyName:
                                  CurrentProjects.currentProjects[index][0],
                              jobTitle: CurrentProjects.currentProjects[index]
                                  [1],
                              jobType: CurrentProjects.currentProjects[index]
                                  [2],
                              logoImagePath:
                                  CurrentProjects.currentProjects[index][3],
                              hourlyRate: CurrentProjects.currentProjects[index]
                                  [4],
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
                    child: SizedBox(
                      height: 140,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: ProjectsForYou.projectsForYou.length,
                        itemBuilder: (context, index) {
                          return JobCard(
                            companyName: ProjectsForYou.projectsForYou[index]
                                [0],
                            jobTitle: ProjectsForYou.projectsForYou[index][1],
                            jobType: ProjectsForYou.projectsForYou[index][2],
                            logoImagePath: ProjectsForYou.projectsForYou[index]
                                [3],
                            hourlyRate: ProjectsForYou.projectsForYou[index][4],
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
                    child: SizedBox(
                      height: 140,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: ProjectsForYou.projectsForYou.length,
                        itemBuilder: (context, index) {
                          return JobCard(
                            companyName: ProjectsForYou.projectsForYou[index]
                                [0],
                            jobTitle: ProjectsForYou.projectsForYou[index][1],
                            jobType: ProjectsForYou.projectsForYou[index][2],
                            logoImagePath: ProjectsForYou.projectsForYou[index]
                                [3],
                            hourlyRate: ProjectsForYou.projectsForYou[index][4],
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
                    child: SizedBox(
                      height: 140,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: ProjectsForYou.projectsForYou.length,
                        itemBuilder: (context, index) {
                          return JobCard(
                            companyName: ProjectsForYou.projectsForYou[index]
                                [0],
                            jobTitle: ProjectsForYou.projectsForYou[index][1],
                            jobType: CurrentProjects.currentProjects[index][2],
                            logoImagePath: ProjectsForYou.projectsForYou[index]
                                [3],
                            hourlyRate: ProjectsForYou.projectsForYou[index][4],
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
          ),
        ),
      ),
    );
  }
}
