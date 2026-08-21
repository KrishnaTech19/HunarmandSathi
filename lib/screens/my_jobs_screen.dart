import 'package:flutter/material.dart';

class MyJobsScreen extends StatelessWidget {
  const MyJobsScreen({super.key});

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
          "My Jobs",
          style: TextStyle(
            color: Color(0xff1D2D44),
            fontWeight: FontWeight.w800,
          ),
        ),
      ),

      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [

          const Text(
            "Your Jobs",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: Color(0xff1D2D44),
            ),
          ),

          const SizedBox(height: 6),

          const Text(
            "Manage your applied and accepted jobs.",
            style: TextStyle(
              color: Color(0xff6C757D),
            ),
          ),

          const SizedBox(height: 22),

          _jobCard(
            title: "Bathroom Plumbing Work",
            location: "Gomti Nagar",
            status: "Applied",
            statusColor: const Color(0xffE36414),
            icon: Icons.plumbing_rounded,
          ),

          _jobCard(
            title: "House Painting",
            location: "Aliganj",
            status: "Accepted",
            statusColor: Colors.green,
            icon: Icons.format_paint_rounded,
          ),

          _jobCard(
            title: "Electrical Repair",
            location: "Indira Nagar",
            status: "Completed",
            statusColor: const Color(0xff0F4C5C),
            icon: Icons.electrical_services_rounded,
          ),
        ],
      ),
    );
  }

  Widget _jobCard({
    required String title,
    required String location,
    required String status,
    required Color statusColor,
    required IconData icon,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: const Color(0xffE5E9EB),
        ),
      ),

      child: Row(
        children: [

          Container(
            height: 52,
            width: 52,

            decoration: BoxDecoration(
              color: const Color(0xffEAF3F5),
              borderRadius: BorderRadius.circular(14),
            ),

            child: Icon(
              icon,
              color: const Color(0xff0F4C5C),
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
                    fontWeight: FontWeight.w800,
                    color: Color(0xff1D2D44),
                  ),
                ),

                const SizedBox(height: 6),

                Row(
                  children: [

                    const Icon(
                      Icons.location_on_outlined,
                      size: 15,
                      color: Color(0xff7B858B),
                    ),

                    const SizedBox(width: 4),

                    Text(
                      location,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xff7B858B),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),

                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.10),
                    borderRadius: BorderRadius.circular(20),
                  ),

                  child: Text(
                    status,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: statusColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}