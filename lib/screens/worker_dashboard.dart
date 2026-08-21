import 'package:flutter/material.dart';
import 'package:kaam_connect/screens/my_jobs_screen.dart';
import 'package:kaam_connect/screens/nearby_jobs_screen.dart';
import 'package:kaam_connect/screens/worker_profile_screen.dart';

class WorkerDashboard extends StatelessWidget {
  const WorkerDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F9FA),

      appBar: AppBar(
        backgroundColor: const Color(0xffF7F9FA),
        elevation: 0,
        automaticallyImplyLeading: false,

        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "HunarmandSathi",
              style: TextStyle(
                color: Color(0xff1D2D44),
                fontSize: 21,
                fontWeight: FontWeight.w800,
              ),
            ),
            Text(
              "Worker Dashboard",
              style: TextStyle(
                color: Color(0xff7B858B),
                fontSize: 12,
              ),
            ),
          ],
        ),

        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_none_rounded,
              color: Color(0xff1D2D44),
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // PROFILE CARD
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: const Color(0xff0F4C5C),
                borderRadius: BorderRadius.circular(22),
              ),

              child: Row(
                children: [

                  Container(
                    height: 65,
                    width: 65,

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                    ),

                    child: const Icon(
                      Icons.engineering_rounded,
                      size: 38,
                      color: Color(0xff0F4C5C),
                    ),
                  ),

                  const SizedBox(width: 15),

                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text(
                          "Welcome, Worker 👋",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                          ),
                        ),

                        SizedBox(height: 5),

                        Text(
                          "Your profile is ready",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              "Find Work",
              style: TextStyle(
                color: Color(0xff1D2D44),
                fontSize: 19,
                fontWeight: FontWeight.w800,
              ),
            ),

            const SizedBox(height: 14),

            // NEARBY JOBS
            _dashboardCard(
              icon: Icons.location_on_rounded,
              title: "Nearby Jobs",
              subtitle: "Find work opportunities near you",
              buttonText: "Find Jobs",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const
                      NearbyJobsScreen(),
                ),
                );
              },
            ),

            const SizedBox(height: 15),

            // MY JOBS
            _dashboardCard(
              icon: Icons.work_outline_rounded,
              title: "My Jobs",
              subtitle: "View your active and completed jobs",
              buttonText: "View Jobs",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const
                      MyJobsScreen(),
                ),
                );
              },
            ),

            const SizedBox(height: 25),

            const Text(
              "Quick Actions",
              style: TextStyle(
                color: Color(0xff1D2D44),
                fontSize: 19,
                fontWeight: FontWeight.w800,
              ),
            ),

            const SizedBox(height: 14),

            Row(
              children: [

                Expanded(
                  child: _quickCard(
                    icon: Icons.person_outline_rounded,
                    title: "My Profile",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const
                            WorkerProfileScreen(),
                      ),
                      );
                    },
                  ),
                ),

                const SizedBox(width: 14),

                Expanded(
                  child: _quickCard(
                    icon: Icons.location_searching_rounded,
                    title: "Location",
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("GPS coming next"),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),

            const SizedBox(height: 25),

            // INFO
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),

              decoration: BoxDecoration(
                color: const Color(0xffEAF3F5),
                borderRadius: BorderRadius.circular(18),
              ),

              child: const Row(
                children: [

                  Icon(
                    Icons.lightbulb_outline_rounded,
                    color: Color(0xffE36414),
                    size: 30,
                  ),

                  SizedBox(width: 12),

                  Expanded(
                    child: Text(
                      "Keep your profile updated to get better job opportunities.",
                      style: TextStyle(
                        color: Color(0xff1D2D44),
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // BOTTOM NAVIGATION
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,

        selectedItemColor: const Color(0xff0F4C5C),
        unselectedItemColor: const Color(0xff8A949A),

        type: BottomNavigationBarType.fixed,

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work_outline_rounded),
            label: "Jobs",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_rounded),
            label: "Profile",
          ),
        ],
      ),
    );
  }

  static Widget _dashboardCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required String buttonText,
    required VoidCallback onTap,
  }) {
    return Container(
      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xffE2E7E9),
        ),
      ),

      child: Row(
        children: [

          Container(
            height: 55,
            width: 55,

            decoration: BoxDecoration(
              color: const Color(0xffEAF3F5),
              borderRadius: BorderRadius.circular(15),
            ),

            child: Icon(
              icon,
              color: const Color(0xff0F4C5C),
              size: 28,
            ),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xff1D2D44),
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Color(0xff7B858B),
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),

          TextButton(
            onPressed: onTap,
            child: Text(
              buttonText,
              style: const TextStyle(
                color: Color(0xffE36414),
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget _quickCard({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,

      borderRadius: BorderRadius.circular(18),

      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 22,
          horizontal: 10,
        ),

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: const Color(0xffE2E7E9),
          ),
        ),

        child: Column(
          children: [

            Icon(
              icon,
              size: 30,
              color: const Color(0xff0F4C5C),
            ),

            const SizedBox(height: 8),

            Text(
              title,
              style: const TextStyle(
                color: Color(0xff1D2D44),
                fontWeight: FontWeight.w700,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}