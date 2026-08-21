import 'package:flutter/material.dart';

class NearbyJobsScreen extends StatelessWidget {
  const NearbyJobsScreen({super.key});

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
          "Nearby Jobs",
          style: TextStyle(
            color: Color(0xff1D2D44),
            fontWeight: FontWeight.w800,
          ),
        ),
      ),

      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [

          // LOCATION
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xffEAF3F5),
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Row(
              children: [
                Icon(
                  Icons.location_on_rounded,
                  color: Color(0xff0F4C5C),
                  size: 28,
                ),

                SizedBox(width: 12),

                Expanded(
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Jobs near you",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                          color: Color(0xff1D2D44),
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Showing available jobs in your area",
                        style: TextStyle(
                          fontSize: 11,
                          color: Color(0xff6C757D),
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
            "Available Jobs",
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w800,
              color: Color(0xff1D2D44),
            ),
          ),

          const SizedBox(height: 15),

          _jobCard(
            context,
            icon: Icons.plumbing_rounded,
            skill: "Plumber Required",
            location: "Gomti Nagar, Lucknow",
            salary: "₹800 / Day",
            time: "Today • 10:00 AM",
          ),

          const SizedBox(height: 15),

          _jobCard(
            context,
            icon: Icons.electrical_services_rounded,
            skill: "Electrician Required",
            location: "Aliganj, Lucknow",
            salary: "₹1,000 / Day",
            time: "Tomorrow • 9:00 AM",
          ),

          const SizedBox(height: 15),

          _jobCard(
            context,
            icon: Icons.format_paint_rounded,
            skill: "Painter Required",
            location: "Indira Nagar, Lucknow",
            salary: "₹900 / Day",
            time: "Today • 2:00 PM",
          ),

          const SizedBox(height: 15),

          _jobCard(
            context,
            icon: Icons.handyman_rounded,
            skill: "Carpenter Required",
            location: "Hazratganj, Lucknow",
            salary: "₹1,200 / Day",
            time: "Tomorrow • 11:00 AM",
          ),
        ],
      ),
    );
  }

  static Widget _jobCard(
      BuildContext context, {
        required IconData icon,
        required String skill,
        required String location,
        required String salary,
        required String time,
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

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            children: [
              Container(
                height: 52,
                width: 52,

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
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    Text(
                      skill,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: Color(0xff1D2D44),
                      ),
                    ),

                    const SizedBox(height: 5),

                    Text(
                      location,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xff6C757D),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 15),

          Row(
            children: [
              const Icon(
                Icons.currency_rupee_rounded,
                size: 18,
                color: Color(0xffE36414),
              ),

              const SizedBox(width: 5),

              Text(
                salary,
                style: const TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Color(0xff1D2D44),
                ),
              ),

              const Spacer(),

              const Icon(
                Icons.access_time_rounded,
                size: 17,
                color: Color(0xff6C757D),
              ),

              const SizedBox(width: 5),

              Text(
                time,
                style: const TextStyle(
                  fontSize: 11,
                  color: Color(0xff6C757D),
                ),
              ),
            ],
          ),

          const SizedBox(height: 15),

          SizedBox(
            width: double.infinity,
            height: 45,

            child: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      "$skill selected",
                    ),
                  ),
                );
              },

              style: ElevatedButton.styleFrom(
                backgroundColor:
                const Color(0xff0F4C5C),
                foregroundColor: Colors.white,
                elevation: 0,

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13),
                ),
              ),

              child: const Text(
                "View Job",
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}