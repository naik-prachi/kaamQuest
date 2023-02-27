import 'package:flutter/material.dart';

import 'package:kaam_quest/data/recently_added_projects.dart';

import '../components/list_job_card.dart';
import '../components/search_bar.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,

      // can wrap scaffold in safearea too

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        //mainAxisSize: MainAxisSize.min,
        children: [
          //const SizedBox(height: 60),

          const SizedBox(height: 40),

          //const SizedBox(height: 15),

// search bar
          const SizedBox(
            height: 86,
            child: SearchBar(),
          ),
          // search bar
          /*Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 68, 67, 111),
                      /*border: Border.all(
                        color: Color.fromARGB(255, 187, 171, 184),
                      ),*/
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: SizedBox(
                            height: 30,
                            child: Image.asset(
                              "assets/images/search-2-line.png",
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Search for a job..",
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 15),

                // filter icon
                Container(
                  height: 40,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 68, 67, 111),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Image.asset(
                    "assets/images/equalizer-fill.png",
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
*/
          const SizedBox(height: 70),

          // recently added -> job tiles
          const Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              "Recently Added",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 187, 171, 184),
                fontSize: 15,
              ),
            ),
          ),

          const SizedBox(height: 20),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: ListView.builder(
                itemCount: RecentlyAddedProjects.recentlyAddedProjects.length,
                itemBuilder: (context, index) {
                  return ListJobCard(
                    companyName:
                        RecentlyAddedProjects.recentlyAddedProjects[index][0],
                    jobTitle: RecentlyAddedProjects.recentlyAddedProjects[index]
                        [1],
                    logoImagePath:
                        RecentlyAddedProjects.recentlyAddedProjects[index][2],
                    hourlyRate:
                        RecentlyAddedProjects.recentlyAddedProjects[index][3],
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

      // nav bar
      //bottomNavigationBar: const NavBar(),
    );
  }
}
