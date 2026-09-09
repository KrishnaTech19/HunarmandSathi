import 'package:flutter/material.dart';
import 'feedback_screen.dart';

class ClientProfileScreen extends StatelessWidget {
  const ClientProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F9FA),

      appBar: AppBar(
        backgroundColor: const Color(0xffF7F9FA),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "My Profile",
          style: TextStyle(
            color: Color(0xff1D2D44),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            // ================= PROFILE IMAGE =================

            const CircleAvatar(
              radius: 55,
              backgroundColor: Color(0xff0F4C5C),
              child: Icon(
                Icons.person,
                size: 60,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 15),

            const Text(
              "Krishna",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xff1D2D44),
              ),
            ),

            const SizedBox(height: 5),

            const Text(
              "krishna@email.com",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 25),

            // ================= EDIT PROFILE BUTTON =================

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.edit),
                label: const Text("Edit Profile"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff0F4C5C),
                  foregroundColor: Colors.white,
                ),
              ),
            ),

            const SizedBox(height: 25),

            // ================= DETAILS =================

            Card(
              child: Column(
                children: [

                  ListTile(
                    leading: const Icon(Icons.phone),
                    title: const Text("Phone"),
                    subtitle: const Text("+91 9876543210"),
                  ),

                  const Divider(height: 1),

                  ListTile(
                    leading: const Icon(Icons.location_on),
                    title: const Text("Location"),
                    subtitle: const Text("Lucknow"),
                  ),

                  const Divider(height: 1),

                  ListTile(
                    leading: const Icon(Icons.work),
                    title: const Text("Total Hires"),
                    subtitle: const Text("12"),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // ================= MENU OPTIONS =================

            Card(
              child: Column(
                children: [

                  ListTile(
                    leading: const Icon(
                      Icons.feedback_outlined,
                    ),
                    title: const Text(
                      "Feedback & Complaint",
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                          const FeedbackScreen(),
                        ),
                      );
                    },
                  ),

                  const Divider(height: 1),

                  ListTile(
                    leading: const Icon(
                      Icons.settings,
                    ),
                    title: const Text(
                      "Settings",
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                    ),
                    onTap: () {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(
                        const SnackBar(
                          content: Text(
                            "Settings Screen Coming Soon",
                          ),
                        ),
                      );
                    },
                  ),

                  const Divider(height: 1),

                  ListTile(
                    leading: const Icon(
                      Icons.logout,
                      color: Colors.red,
                    ),
                    title: const Text(
                      "Logout",
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                    onTap: () {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(
                        const SnackBar(
                          content: Text(
                            "Logged Out",
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}