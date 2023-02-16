import 'dart:ui';

import 'package:flutter/material.dart';

class JobCard extends StatelessWidget {
  final String companyName;
  final String jobTitle;
  final String logoImagePath;
  final int hourlyRate;

  const JobCard({
    super.key,
    required this.companyName,
    required this.hourlyRate,
    required this.jobTitle,
    required this.logoImagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: 220,
          padding: const EdgeInsets.all(10),
          color: Color.fromARGB(255, 119, 100, 130),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // logo container
                  SizedBox(
                    height: 45,
                    child: Image.asset(logoImagePath),
                  ),

                  // "part Time" container
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      color: Color.fromARGB(255, 68, 67, 111),
                      child: const Text(
                        "Part Time",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  jobTitle,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
              Text(
                "₹$hourlyRate/hr",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
