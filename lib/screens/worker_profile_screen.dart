import 'package:flutter/material.dart';
import 'package:kaam_connect/screens/edit_profile_screen.dart';

class WorkerProfileScreen extends StatelessWidget {
  const WorkerProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F9FA),

      appBar: AppBar(
        backgroundColor: const Color(0xffF7F9FA),
        elevation: 0,

        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Color(0xff1D2D44),
          ),
        ),

        title: const Text(
          "My Profile",
          style: TextStyle(
            color: Color(0xff1D2D44),
            fontWeight: FontWeight.w800,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            // PROFILE HEADER
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(22),

              decoration: BoxDecoration(
                color: const Color(0xff0F4C5C),
                borderRadius: BorderRadius.circular(22),
              ),

              child: Column(
                children: [

                  Container(
                    height: 85,
                    width: 85,

                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),

                    child: const Icon(
                      Icons.person_rounded,
                      size: 50,
                      color: Color(0xff0F4C5C),
                    ),
                  ),

                  const SizedBox(height: 12),

                  const Text(
                    "Worker Name",
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(height: 5),

                  const Text(
                    "Plumber • 5 Years Experience",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 13,
                    ),
                  ),

                  const SizedBox(height: 15),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 7,
                    ),

                    decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(20),
                    ),

                    child: const Text(
                      "Available for Work",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 22),

            // CONTACT INFO
            _infoCard(
              icon: Icons.phone_outlined,
              title: "Mobile Number",
              value: "+91 XXXXX XXXXX",
            ),

            _infoCard(
              icon: Icons.location_on_outlined,
              title: "Location",
              value: "Lucknow, Uttar Pradesh",
            ),

            _infoCard(
              icon: Icons.work_outline_rounded,
              title: "Skill",
              value: "Plumber",
            ),

            _infoCard(
              icon: Icons.star_outline_rounded,
              title: "Rating",
              value: "4.8 ⭐",
            ),

            const SizedBox(height: 10),

            // EDIT PROFILE
            SizedBox(
              width: double.infinity,
              height: 54,

              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const
                            EditProfileScreen(),
                  ),
                  );
                },

                icon: const Icon(
                  Icons.edit_rounded,
                ),

                label: const Text(
                  "Edit Profile",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                  ),
                ),

                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffE36414),
                  foregroundColor: Colors.white,
                  elevation: 0,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 15),

            const Text(
              "Your profile helps clients find you easily.",
              style: TextStyle(
                fontSize: 11,
                color: Color(0xff8A949A),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoCard({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
        border: Border.all(
          color: const Color(0xffE2E7E9),
        ),
      ),

      child: Row(
        children: [

          Container(
            height: 45,
            width: 45,

            decoration: BoxDecoration(
              color: const Color(0xffEAF3F5),
              borderRadius: BorderRadius.circular(13),
            ),

            child: Icon(
              icon,
              color: const Color(0xff0F4C5C),
            ),
          ),

          const SizedBox(width: 13),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(
                title,
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xff7B858B),
                ),
              ),

              const SizedBox(height: 4),

              Text(
                value,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Color(0xff1D2D44),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}