import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final nameController =
  TextEditingController(text: "Worker Name");

  final phoneController =
  TextEditingController(text: "+91 XXXXX XXXXX");

  final experienceController =
  TextEditingController(text: "5");

  String selectedSkill = "Plumber";

  final List<String> skills = [
    "Plumber",
    "Electrician",
    "Carpenter",
    "Painter",
    "Mason",
    "Other",
  ];

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    experienceController.dispose();
    super.dispose();
  }

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
          "Edit Profile",
          style: TextStyle(
            color: Color(0xff1D2D44),
            fontWeight: FontWeight.w800,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // PROFILE PHOTO
            Center(
              child: Stack(
                children: [

                  Container(
                    height: 95,
                    width: 95,

                    decoration: const BoxDecoration(
                      color: Color(0xffEAF3F5),
                      shape: BoxShape.circle,
                    ),

                    child: const Icon(
                      Icons.person_rounded,
                      size: 58,
                      color: Color(0xff0F4C5C),
                    ),
                  ),

                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      height: 32,
                      width: 32,

                      decoration: const BoxDecoration(
                        color: Color(0xffE36414),
                        shape: BoxShape.circle,
                      ),

                      child: const Icon(
                        Icons.camera_alt_rounded,
                        size: 17,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),

            const Text(
              "Full Name",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Color(0xff1D2D44),
              ),
            ),

            const SizedBox(height: 8),

            TextField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: "Enter your name",
                prefixIcon: const Icon(
                  Icons.person_outline_rounded,
                ),
                filled: true,
                fillColor: Colors.white,

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 18),

            const Text(
              "Mobile Number",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Color(0xff1D2D44),
              ),
            ),

            const SizedBox(height: 8),

            TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,

              decoration: InputDecoration(
                hintText: "Enter mobile number",
                prefixIcon: const Icon(
                  Icons.phone_outlined,
                ),
                filled: true,
                fillColor: Colors.white,

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 18),

            const Text(
              "Your Skill",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Color(0xff1D2D44),
              ),
            ),

            const SizedBox(height: 8),

            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),

              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: selectedSkill,
                  isExpanded: true,

                  items: skills.map(
                        (skill) {
                      return DropdownMenuItem<String>(
                        value: skill,
                        child: Text(skill),
                      );
                    },
                  ).toList(),

                  onChanged: (value) {
                    setState(() {
                      selectedSkill = value!;
                    });
                  },
                ),
              ),
            ),

            const SizedBox(height: 18),

            const Text(
              "Experience",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Color(0xff1D2D44),
              ),
            ),

            const SizedBox(height: 8),

            TextField(
              controller: experienceController,
              keyboardType: TextInputType.number,

              decoration: InputDecoration(
                hintText: "Years of experience",
                prefixIcon: const Icon(
                  Icons.work_outline_rounded,
                ),
                suffixText: "Years",
                filled: true,
                fillColor: Colors.white,

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 30),

            // SAVE BUTTON
            SizedBox(
              width: double.infinity,
              height: 54,

              child: ElevatedButton(
                onPressed: () {
                  if (nameController.text.trim().isEmpty ||
                      phoneController.text.trim().isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          "Please fill all required details",
                        ),
                      ),
                    );

                    return;
                  }

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        "Profile updated successfully!",
                      ),
                    ),
                  );

                  Navigator.pop(context);
                },

                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff0F4C5C),
                  foregroundColor: Colors.white,
                  elevation: 0,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),

                child: const Text(
                  "Save Changes",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
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