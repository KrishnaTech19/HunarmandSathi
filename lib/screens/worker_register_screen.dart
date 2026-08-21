import 'package:flutter/material.dart';
import 'package:kaam_connect/screens/worker_dashboard.dart';

class WorkerRegisterScreen extends StatefulWidget {
  const WorkerRegisterScreen({super.key});

  @override
  State<WorkerRegisterScreen> createState() =>
      _WorkerRegisterScreenState();
}

class _WorkerRegisterScreenState
    extends State<WorkerRegisterScreen> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final experienceController = TextEditingController();

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
          "Worker Registration",
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

            // HEADER
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: const Color(0xffEAF3F5),
                borderRadius: BorderRadius.circular(20),
              ),

              child: const Row(
                children: [

                  Icon(
                    Icons.engineering_rounded,
                    size: 45,
                    color: Color(0xff0F4C5C),
                  ),

                  SizedBox(width: 15),

                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,

                      children: [
                        Text(
                          "Create your profile",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: Color(0xff1D2D44),
                          ),
                        ),

                        SizedBox(height: 5),

                        Text(
                          "Let clients find you for their work.",
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xff6C757D),
                          ),
                        ),
                      ],
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

                  icon: const Icon(
                    Icons.keyboard_arrow_down_rounded,
                  ),

                  items: skills.map(
                        (skill) {
                      return DropdownMenuItem(
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
                hintText: "Example: 5 years",
                prefixIcon: const Icon(
                  Icons.work_outline_rounded,
                ),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 22),

            // LOCATION
            Container(
              padding: const EdgeInsets.all(16),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
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

                    child: const Icon(
                      Icons.location_on_rounded,
                      color: Color(0xff0F4C5C),
                    ),
                  ),

                  const SizedBox(width: 12),

                  const Expanded(
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,

                      children: [
                        Text(
                          "Your Location",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Color(0xff1D2D44),
                          ),
                        ),

                        SizedBox(height: 4),

                        Text(
                          "Location will be detected using GPS",
                          style: TextStyle(
                            fontSize: 11,
                            color: Color(0xff7B858B),
                          ),
                        ),
                      ],
                    ),
                  ),

                  TextButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(
                        const SnackBar(
                          content: Text(
                            "GPS integration coming next",
                          ),
                        ),
                      );
                    },

                    child: const Text(
                      "Detect",
                      style: TextStyle(
                        color: Color(0xffE36414),
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // REGISTER BUTTON
            SizedBox(
              width: double.infinity,
              height: 54,

              child: ElevatedButton(
                onPressed: () {
                  if (nameController.text.isEmpty ||
                      phoneController.text.isEmpty) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(
                      const SnackBar(
                        content: Text(
                          "Please fill all required details",
                        ),
                      ),
                    );

                    return;
                  }

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const
                        WorkerDashboard(),
                  ),
                  );
                },

                style: ElevatedButton.styleFrom(
                  backgroundColor:
                  const Color(0xff0F4C5C),

                  foregroundColor: Colors.white,

                  elevation: 0,

                  shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(15),
                  ),
                ),

                child: const Text(
                  "Create My Profile",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Center(
              child: Text(
                "Your information is safe with HunarmandSathi",
                style: TextStyle(
                  fontSize: 11,
                  color: Color(0xff8A949A),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}