import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kaam_quest/data/job_desc_data.dart';

class JobDescription extends StatefulWidget {
  const JobDescription({super.key});

  @override
  State<JobDescription> createState() => _JobDescriptionState();
}

class _JobDescriptionState extends State<JobDescription> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        resizeToAvoidBottomInset: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
              child: Container(
                color: Colors.grey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Container(
                        child: Row(
                          children: [
                            // back button
                            Icon(CupertinoIcons.back),
                          ],
                        ),
                      ),
                    ),

                    Placeholder(
                      fallbackHeight: 200,
                    ),

                    const SizedBox(height: 20),

                    // job title
                    Padding(
                        padding: EdgeInsets.only(left: 17, right: 17),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              child: Text(
                                "UI/UX Designer",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                ),
                              ),
                            ),

                            const SizedBox(height: 10),
                            // hourly rate
                            Row(
                              children: [
                                Text(
                                  "₹40/hour",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                  ),
                                ),

                                const SizedBox(width: 20),

                                // "part Time" container
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Container(
                                    padding: const EdgeInsets.all(5),
                                    color: Colors.grey[800],
                                    //Color.fromARGB(255, 68, 67, 111),
                                    child: Text(
                                      "Full Time",
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 30),

                            // company logo
                            Row(
                              children: [
                                SizedBox(
                                  height: 45,
                                  child:
                                      Image.asset("assets/images/google.png"),
                                ),
                                Text("Google LLC.")
                              ],
                            ),
                          ],
                        )),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 50),

            // tags

            // job description
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Container(
                  color: Colors.grey,
                  child: Column(
                    children: [
                      Text(
                        "Qualifications",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(JobDescriptionData.jobDetail[1])
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
