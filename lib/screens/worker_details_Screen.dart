import 'package:flutter/material.dart';
import 'hire_request_screen.dart';

class WorkerDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> worker;

  const WorkerDetailsScreen({
    super.key,
    required this.worker,
  });

  @override
  Widget build(BuildContext context) {
    final String workerName =
        worker["name"]?.toString() ?? "Worker";

    final String workerSkill =
        worker["skill"]?.toString() ?? "Skilled Worker";

    final String workerRating =
        worker["rating"]?.toString() ?? "4.8";

    final String workerExperience =
        worker["experience"]?.toString() ?? "Not available";

    final String workerLocation =
        worker["location"]?.toString() ?? "Nearby";

    final String workerPhone =
        worker["phone"]?.toString() ?? "Not available";

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
          "Worker Details",
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
              ),

              child: Column(
                children: [

                  CircleAvatar(
                    radius: 45,
                    backgroundColor: const Color(0xffEAF3F5),

                    child: Icon(
                      worker["icon"] is IconData
                          ? worker["icon"]
                          : Icons.person_rounded,
                      size: 50,
                      color: const Color(0xff0F4C5C),
                    ),
                  ),

                  const SizedBox(height: 15),

                  Text(
                    workerName,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: Color(0xff1D2D44),
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    workerSkill,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Color(0xffE36414),
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  const SizedBox(height: 12),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      const Icon(
                        Icons.star_rounded,
                        color: Colors.orange,
                        size: 20,
                      ),

                      const SizedBox(width: 4),

                      Text(
                        "$workerRating Rating",
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Color(0xff1D2D44),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 18),

            // ================= INFORMATION =================

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const Text(
                    "Worker Information",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: Color(0xff1D2D44),
                    ),
                  ),

                  const SizedBox(height: 18),

                  _infoRow(
                    Icons.work_outline_rounded,
                    "Skill",
                    workerSkill,
                  ),

                  const SizedBox(height: 15),

                  _infoRow(
                    Icons.timeline_rounded,
                    "Experience",
                    workerExperience,
                  ),

                  const SizedBox(height: 15),

                  _infoRow(
                    Icons.location_on_outlined,
                    "Location",
                    workerLocation,
                  ),

                  const SizedBox(height: 15),

                  _infoRow(
                    Icons.phone_outlined,
                    "Mobile",
                    workerPhone,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 18),

            // ================= ABOUT =================

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),

              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    "About Worker",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: Color(0xff1D2D44),
                    ),
                  ),

                  SizedBox(height: 10),

                  Text(
                    "Experienced and reliable skilled worker. "
                        "Available for local work and projects.",
                    style: TextStyle(
                      fontSize: 13,
                      height: 1.5,
                      color: Color(0xff6C757D),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // ================= HIRE BUTTON =================

            SizedBox(
              width: double.infinity,
              height: 55,

              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HireRequestScreen(
                        worker: worker,
                      ),
                    ),
                  );
                },

                icon: const Icon(
                  Icons.handshake_rounded,
                ),

                label: const Text(
                  "Hire This Worker",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),

                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff0F4C5C),
                  foregroundColor: Colors.white,
                  elevation: 0,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 12),

            // ================= CONTACT BUTTON =================

            SizedBox(
              width: double.infinity,
              height: 52,

              child: OutlinedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        "Call $workerName at $workerPhone",
                      ),
                    ),
                  );
                },

                icon: const Icon(
                  Icons.phone_rounded,
                  color: Color(0xff0F4C5C),
                ),

                label: const Text(
                  "Contact Worker",
                  style: TextStyle(
                    color: Color(0xff0F4C5C),
                    fontWeight: FontWeight.w800,
                  ),
                ),

                style: OutlinedButton.styleFrom(
                  side: const BorderSide(
                    color: Color(0xff0F4C5C),
                  ),

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // ================= INFO ROW =================

  static Widget _infoRow(
      IconData icon,
      String title,
      String value,
      ) {
    return Row(
      children: [

        Container(
          height: 42,
          width: 42,

          decoration: BoxDecoration(
            color: const Color(0xffEAF3F5),
            borderRadius: BorderRadius.circular(12),
          ),

          child: Icon(
            icon,
            color: const Color(0xff0F4C5C),
          ),
        ),

        const SizedBox(width: 12),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(
                title,
                style: const TextStyle(
                  fontSize: 11,
                  color: Color(0xff7B858B),
                ),
              ),

              const SizedBox(height: 3),

              Text(
                value,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff1D2D44),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}