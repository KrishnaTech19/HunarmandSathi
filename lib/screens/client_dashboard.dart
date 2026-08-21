import 'package:flutter/material.dart';
import 'my_request_screen.dart';
import 'worker_details_screen.dart';

class ClientDashboard extends StatefulWidget {
  const ClientDashboard({super.key});

  @override
  State<ClientDashboard> createState() => _ClientDashboardState();
}

class _ClientDashboardState extends State<ClientDashboard> {
  String selectedSkill = "All";

  final List<String> skills = [
    "All",
    "Plumber",
    "Electrician",
    "Carpenter",
    "Painter",
    "Mason",
  ];

  final List<Map<String, dynamic>> workers = [
    {
      "name": "Rajesh Kumar",
      "skill": "Plumber",
      "experience": "6 Years",
      "rating": "4.8",
      "distance": "1.8 km",
      "location": "Gomti Nagar",
      "phone": "9876543210",
      "icon": Icons.plumbing_rounded,
    },
    {
      "name": "Amit Verma",
      "skill": "Electrician",
      "experience": "5 Years",
      "rating": "4.7",
      "distance": "2.4 km",
      "location": "Aliganj",
      "phone": "9876543211",
      "icon": Icons.electrical_services_rounded,
    },
    {
      "name": "Suresh Yadav",
      "skill": "Carpenter",
      "experience": "8 Years",
      "rating": "4.9",
      "distance": "3.1 km",
      "location": "Indira Nagar",
      "phone": "9876543212",
      "icon": Icons.handyman_rounded,
    },
    {
      "name": "Mohit Singh",
      "skill": "Painter",
      "experience": "4 Years",
      "rating": "4.6",
      "distance": "4.2 km",
      "location": "Hazratganj",
      "phone": "9876543213",
      "icon": Icons.format_paint_rounded,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final filteredWorkers = selectedSkill == "All"
        ? workers
        : workers
        .where(
          (worker) => worker["skill"] == selectedSkill,
    )
        .toList();

    return Scaffold(
      backgroundColor: const Color(0xffF7F9FA),

      // ================= APP BAR =================

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
              "Find skilled workers",
              style: TextStyle(
                color: Color(0xff7B858B),
                fontSize: 12,
              ),
            ),
          ],
        ),

        actions: [

          // MY REQUESTS
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                  const MyRequestsScreen(),
                ),
              );
            },

            icon: const Icon(
              Icons.assignment_outlined,
              color: Color(0xff1D2D44),
            ),

            tooltip: "My Requests",
          ),

          // NOTIFICATION
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    "No new notifications",
                  ),
                ),
              );
            },

            icon: const Icon(
              Icons.notifications_none_rounded,
              color: Color(0xff1D2D44),
            ),
          ),

          const SizedBox(width: 8),
        ],
      ),

      // ================= BODY =================

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            // ================= GREETING =================

            const Text(
              "What work do you need? 👋",

              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w800,
                color: Color(0xff1D2D44),
              ),
            ),

            const SizedBox(height: 6),

            const Text(
              "Find trusted professionals near your location.",

              style: TextStyle(
                fontSize: 13,
                color: Color(0xff6C757D),
              ),
            ),

            const SizedBox(height: 20),

            // ================= SEARCH =================

            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),

                border: Border.all(
                  color: const Color(0xffE2E7E9),
                ),
              ),

              child: const TextField(
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.search_rounded,
                    color: Color(0xff0F4C5C),
                  ),

                  hintText:
                  "Search plumber, electrician...",

                  border: InputBorder.none,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // ================= LOCATION =================

            GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      "GPS location detection coming next",
                    ),
                  ),
                );
              },

              child: Container(
                padding: const EdgeInsets.all(15),

                decoration: BoxDecoration(
                  color: const Color(0xffEAF3F5),
                  borderRadius:
                  BorderRadius.circular(17),
                ),

                child: const Row(
                  children: [

                    Icon(
                      Icons.location_on_rounded,
                      color: Color(0xff0F4C5C),
                    ),

                    SizedBox(width: 10),

                    Expanded(
                      child: Text(
                        "Showing workers near your location",

                        style: TextStyle(
                          color: Color(0xff1D2D44),
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                        ),
                      ),
                    ),

                    Icon(
                      Icons.my_location_rounded,
                      color: Color(0xffE36414),
                      size: 20,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 25),

            // ================= MY REQUESTS CARD =================

            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                    const MyRequestsScreen(),
                  ),
                );
              },

              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                  BorderRadius.circular(18),

                  border: Border.all(
                    color: const Color(0xffE2E7E9),
                  ),
                ),

                child: Row(
                  children: [

                    Container(
                      height: 46,
                      width: 46,

                      decoration: BoxDecoration(
                        color:
                        const Color(0xffEAF3F5),
                        borderRadius:
                        BorderRadius.circular(13),
                      ),

                      child: const Icon(
                        Icons.assignment_outlined,
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
                            "My Hire Requests",

                            style: TextStyle(
                              fontWeight:
                              FontWeight.w800,
                              color:
                              Color(0xff1D2D44),
                            ),
                          ),

                          SizedBox(height: 4),

                          Text(
                            "Check your worker requests",

                            style: TextStyle(
                              fontSize: 11,
                              color:
                              Color(0xff7B858B),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 16,
                      color: Color(0xff7B858B),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 25),

            // ================= SERVICE =================

            const Text(
              "Choose a service",

              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: Color(0xff1D2D44),
              ),
            ),

            const SizedBox(height: 12),

            // ================= SKILL FILTER =================

            SizedBox(
              height: 42,

              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: skills.length,

                itemBuilder: (context, index) {
                  final skill = skills[index];

                  final isSelected =
                      selectedSkill == skill;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedSkill = skill;
                      });
                    },

                    child: Container(
                      margin:
                      const EdgeInsets.only(
                        right: 10,
                      ),

                      padding:
                      const EdgeInsets.symmetric(
                        horizontal: 17,
                        vertical: 10,
                      ),

                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color(0xff0F4C5C)
                            : Colors.white,

                        borderRadius:
                        BorderRadius.circular(22),

                        border: Border.all(
                          color: isSelected
                              ? const Color(
                            0xff0F4C5C,
                          )
                              : const Color(
                            0xffE2E7E9,
                          ),
                        ),
                      ),

                      child: Text(
                        skill,

                        style: TextStyle(
                          color: isSelected
                              ? Colors.white
                              : const Color(
                            0xff1D2D44,
                          ),

                          fontWeight:
                          FontWeight.w700,

                          fontSize: 12,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 25),

            // ================= WORKER TITLE =================

            Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,

              children: [

                Text(
                  selectedSkill == "All"
                      ? "Nearby Workers"
                      : "$selectedSkill Workers",

                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: Color(0xff1D2D44),
                  ),
                ),

                Text(
                  "${filteredWorkers.length} found",

                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xff7B858B),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 14),

            // ================= WORKER LIST =================

            if (filteredWorkers.isEmpty)

              const Center(
                child: Padding(
                  padding: EdgeInsets.all(30),

                  child: Column(
                    children: [

                      Icon(
                        Icons.search_off_rounded,
                        size: 55,
                        color: Color(0xffAAB4B8),
                      ),

                      SizedBox(height: 10),

                      Text(
                        "No workers found",

                        style: TextStyle(
                          fontWeight:
                          FontWeight.w700,
                          color:
                          Color(0xff7B858B),
                        ),
                      ),
                    ],
                  ),
                ),
              )

            else

              ...filteredWorkers.map(
                    (worker) => _workerCard(
                  context,
                  worker,
                ),
              ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // ================= WORKER CARD =================

  Widget _workerCard(
      BuildContext context,
      Map<String, dynamic> worker,
      ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),

      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius:
        BorderRadius.circular(20),

        border: Border.all(
          color: const Color(0xffE2E7E9),
        ),
      ),

      child: Column(
        children: [

          // WORKER TOP
          Row(
            children: [

              Container(
                height: 58,
                width: 58,

                decoration: BoxDecoration(
                  color: const Color(0xffEAF3F5),

                  borderRadius:
                  BorderRadius.circular(16),
                ),

                child: Icon(
                  worker["icon"],
                  color: const Color(0xff0F4C5C),
                  size: 30,
                ),
              ),

              const SizedBox(width: 13),

              Expanded(
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,

                  children: [

                    Text(
                      worker["name"],

                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight:
                        FontWeight.w800,
                        color:
                        Color(0xff1D2D44),
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      worker["skill"],

                      style: const TextStyle(
                        color:
                        Color(0xffE36414),
                        fontWeight:
                        FontWeight.w700,
                        fontSize: 12,
                      ),
                    ),

                    const SizedBox(height: 5),

                    Text(
                      "${worker["experience"]} • ${worker["distance"]}",

                      style: const TextStyle(
                        color:
                        Color(0xff7B858B),
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),

              Row(
                children: [

                  const Icon(
                    Icons.star_rounded,
                    color: Color(0xffE36414),
                    size: 18,
                  ),

                  const SizedBox(width: 3),

                  Text(
                    worker["rating"],

                    style: const TextStyle(
                      fontWeight:
                      FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 15),

          // ================= VIEW PROFILE =================

          SizedBox(
            width: double.infinity,
            height: 44,

            child: ElevatedButton(
              onPressed: () {

                Navigator.push(
                  context,

                  MaterialPageRoute(
                    builder: (context) =>
                        WorkerDetailsScreen(
                          worker: worker,
                        ),
                  ),
                );
              },

              style:
              ElevatedButton.styleFrom(
                backgroundColor:
                const Color(0xff0F4C5C),

                foregroundColor: Colors.white,

                elevation: 0,

                shape:
                RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.circular(13),
                ),
              ),

              child: const Text(
                "View Profile",

                style: TextStyle(
                  fontWeight:
                  FontWeight.w800,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}