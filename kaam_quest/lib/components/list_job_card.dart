import 'package:flutter/material.dart';

class ListJobCard extends StatelessWidget {
  final String companyName;
  final String jobTitle;
  final String logoImagePath;
  final int hourlyRate;

  const ListJobCard({
    super.key,
    required this.companyName,
    required this.hourlyRate,
    required this.jobTitle,
    required this.logoImagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 119, 100, 130),
          //border: Border.all(color: const Color.fromARGB(255, 187, 171, 184)),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // logo
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    height: 50,
                    color: const Color.fromARGB(255, 187, 171, 184), //shadyLady
                    child: Image.asset(logoImagePath),
                  ),
                ),

                const SizedBox(width: 15),

                // jobTile & companyName
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // job title
                    Text(
                      jobTitle,
                      style: const TextStyle(
                        fontSize: 16.5,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(height: 4),

                    // company name
                    Text(
                      companyName,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Container(
                padding: const EdgeInsets.all(7),
                color: Colors.green[300],
                child: Text(
                  "₹$hourlyRate/hr",
                  style: const TextStyle(
                    color: Colors.white,
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
