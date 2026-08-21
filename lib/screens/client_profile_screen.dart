import 'package:flutter/material.dart';

class ClientProfileScreen extends StatelessWidget {
  const ClientProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F9FA),

      appBar: AppBar(
        backgroundColor: const Color(0xffF7F9FA),
        elevation: 0,

        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
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

            // ================= PROFILE CARD =================

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(22),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
                border: Border.all(
                  color: const Color(0xffE2E7E9),
                ),
              ),

              child: Column(
                children: [

                  Container(
                    height: 85,
                    width: 85,

                    decoration: BoxDecoration(
                      color: const Color(0xffEAF3F5),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color(0xff0F4C5C),
                        width: 2,
                      ),
                    ),

                    child: const Icon(
                      Icons.person_rounded,
                      size: 50,
                      color: Color(0xff0F4C5C),
                    ),
                  ),

                  const SizedBox(height: 14),

                  const Text(
                    "Client User",
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w800,
                      color: Color(0xff1D2D44),
                    ),
                  ),

                  const SizedBox(height: 5),

                  const Text(
                    "KaamConnect Member",
                    style: TextStyle(
                      fontSize: 13,
                      color: Color(0xff7B858B),
                    ),
                  ),

                  const SizedBox(height: 18),

                  SizedBox(
                    width: double.infinity,
                    height: 45,

                    child: OutlinedButton.icon(
                      onPressed: () {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(
                          const SnackBar(
                            content: Text(
                              "Edit Profile coming soon",
                            ),
                          ),
                        );
                      },

                      icon: const Icon(
                        Icons.edit_rounded,
                        size: 18,
                      ),

                      label: const Text(
                        "Edit Profile",
                      ),

                      style: OutlinedButton.styleFrom(
                        foregroundColor:
                        const Color(0xff0F4C5C),

                        side: const BorderSide(
                          color: Color(0xff0F4C5C),
                        ),

                        shape:
                        RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(13),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // ================= ACCOUNT =================

            const Align(
              alignment: Alignment.centerLeft,

              child: Text(
                "Account",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: Color(0xff1D2D44),
                ),
              ),
            ),

            const SizedBox(height: 12),

            _optionTile(
              context,
              Icons.person_outline_rounded,
              "Personal Information",
              "Name, phone number and details",
            ),

            _optionTile(
              context,
              Icons.location_on_outlined,
              "Saved Locations",
              "Manage your saved addresses",
            ),

            _optionTile(
              context,
              Icons.history_rounded,
              "Hire History",
              "View your previous work requests",
            ),

            _optionTile(
              context,
              Icons.notifications_none_rounded,
              "Notifications",
              "Manage notification preferences",
            ),

            const SizedBox(height: 20),

            // ================= SUPPORT =================

            const Align(
              alignment: Alignment.centerLeft,

              child: Text(
                "Support",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: Color(0xff1D2D44),
                ),
              ),
            ),

            const SizedBox(height: 12),

            _optionTile(
              context,
              Icons.help_outline_rounded,
              "Help & Support",
              "Get help with your account",
            ),

            _optionTile(
              context,
              Icons.info_outline_rounded,
              "About HunarmandSathi",
              "Learn more about the app",
            ),

            const SizedBox(height: 20),

            // ================= LOGOUT =================

            SizedBox(
              width: double.infinity,
              height: 50,

              child: OutlinedButton.icon(
                onPressed: () {
                  _showLogoutDialog(context);
                },

                icon: const Icon(
                  Icons.logout_rounded,
                  color: Colors.red,
                ),

                label: const Text(
                  "Logout",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w800,
                  ),
                ),

                style: OutlinedButton.styleFrom(
                  side: const BorderSide(
                    color: Colors.red,
                  ),

                  shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(14),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "HunarmandSathi • Trusted Local Services",
              style: TextStyle(
                fontSize: 11,
                color: Color(0xffAAB4B8),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ================= OPTION TILE =================

  Widget _optionTile(
      BuildContext context,
      IconData icon,
      String title,
      String subtitle,
      ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xffE2E7E9),
        ),
      ),

      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 5,
        ),

        leading: Container(
          height: 42,
          width: 42,

          decoration: BoxDecoration(
            color: const Color(0xffEAF3F5),
            borderRadius: BorderRadius.circular(12),
          ),

          child: Icon(
            icon,
            color: const Color(0xff0F4C5C),
            size: 21,
          ),
        ),

        title: Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w800,
            color: Color(0xff1D2D44),
          ),
        ),

        subtitle: Text(
          subtitle,
          style: const TextStyle(
            fontSize: 11,
            color: Color(0xff7B858B),
          ),
        ),

        trailing: const Icon(
          Icons.arrow_forward_ios_rounded,
          size: 15,
          color: Color(0xffAAB4B8),
        ),

        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("$title selected"),
            ),
          );
        },
      ),
    );
  }

  // ================= LOGOUT DIALOG =================

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,

      builder: (dialogContext) {
        return AlertDialog(
          title: const Text(
            "Logout?",
          ),

          content: const Text(
            "Are you sure you want to logout from your account?",
          ),

          actions: [

            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
              },
              child: const Text(
                "Cancel",
              ),
            ),

            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);

                ScaffoldMessenger.of(context)
                    .showSnackBar(
                  const SnackBar(
                    content: Text(
                      "Logout functionality will be connected later",
                    ),
                  ),
                );
              },

              child: const Text(
                "Logout",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}