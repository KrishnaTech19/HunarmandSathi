import 'package:flutter/material.dart';
import 'worker_details_screen.dart';

class ClientScreen extends StatefulWidget {
  const ClientScreen({super.key});

  @override
  State<ClientScreen> createState() => _ClientScreenState();
}

class _ClientScreenState extends State<ClientScreen> {
  String selectedSkill = "ALL";

  final TextEditingController searchController =
  TextEditingController();

  final List<String> skills = [
    "ALL",
    "Plumber",
    "Electrician",
    "Carpenter",
    "Painter",
    "Mason",
  ];

  final List<Map<String, dynamic>> workers = [
    {
      "name": "Ravi Kumar",
      "skill": "Plumber",
      "experience": 5,
      "location": "Gomti Nagar",
      "phone": "9876543210",
      "rating": 4.8,
    },
    {
      "name": "Amit Singh",
      "skill": "Electrician",
      "experience": 6,
      "location": "Aliganj",
      "phone": "9876543211",
      "rating": 4.7,
    },
    {
      "name": "Rahul Verma",
      "skill": "Carpenter",
      "experience": 4,
      "location": "Indira Nagar",
      "phone": "9876543212",
      "rating": 4.6,
    },
    {
      "name": "Suresh Yadav",
      "skill": "Painter",
      "experience": 7,
      "location": "Hazratganj",
      "phone": "9876543213",
      "rating": 4.9,
    },
    {
      "name": "Manoj Kumar",
      "skill": "Mason",
      "experience": 8,
      "location": "Faizabad Road",
      "phone": "9876543214",
      "rating": 4.8,
    },
  ];

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filteredWorkers =
    selectedSkill == "ALL"
        ? workers
        : workers
        .where(
          (worker) =>
      worker["skill"] == selectedSkill,
    )
        .toList();

    final searchText =
    searchController.text.toLowerCase();

    if (searchText.isNotEmpty) {
      filteredWorkers = filteredWorkers
          .where(
            (worker) =>
        worker["name"]
            .toString()
            .toLowerCase()
            .contains(searchText) ||
            worker["skill"]
                .toString()
                .toLowerCase()
                .contains(searchText) ||
            worker["location"]
                .toString()
                .toLowerCase()
                .contains(searchText),
      )
          .toList();
    }

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
          "Find Experts",
          style: TextStyle(
            color: Color(0xff1D2D44),
            fontWeight: FontWeight.w800,
          ),
        ),
      ),

      body: Column(
        children: [

          // SEARCH BAR
          Padding(
            padding: const EdgeInsets.fromLTRB(
              20,
              10,
              20,
              12,
            ),

            child: Container(
              height: 55,

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),

              child: TextField(
                controller: searchController,

                onChanged: (value) {
                  setState(() {});
                },

                decoration: InputDecoration(
                  hintText:
                  "Search worker, skill or location",

                  prefixIcon: const Icon(
                    Icons.search_rounded,
                    color: Color(0xff0F4C5C),
                  ),

                  border: OutlineInputBorder(
                    borderRadius:
                    BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),

                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            ),
          ),

          // SKILL FILTER
          SizedBox(
            height: 45,

            child: ListView.builder(
              scrollDirection: Axis.horizontal,

              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),

              itemCount: skills.length,

              itemBuilder: (context, index) {
                final skill = skills[index];

                final isSelected =
                    selectedSkill == skill;

                return Padding(
                  padding: const EdgeInsets.only(
                    right: 10,
                  ),

                  child: ChoiceChip(
                    label: Text(skill),

                    selected: isSelected,

                    onSelected: (value) {
                      setState(() {
                        selectedSkill = skill;
                      });
                    },

                    selectedColor:
                    const Color(0xff0F4C5C),

                    backgroundColor: Colors.white,

                    labelStyle: TextStyle(
                      color: isSelected
                          ? Colors.white
                          : const Color(0xff1D2D44),

                      fontWeight: FontWeight.w700,
                    ),

                    shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(12),

                      side: BorderSide(
                        color: isSelected
                            ? const Color(0xff0F4C5C)
                            : const Color(0xffE2E7E9),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 15),

          // WORKER COUNT
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),

            child: Row(
              children: [

                Text(
                  "${filteredWorkers.length} Experts Found",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: Color(0xff1D2D44),
                  ),
                ),

                const Spacer(),

                const Icon(
                  Icons.location_on_outlined,
                  size: 18,
                  color: Color(0xffE36414),
                ),

                const SizedBox(width: 3),

                const Text(
                  "Nearby",
                  style: TextStyle(
                    color: Color(0xff6C757D),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          // WORKER LIST
          Expanded(
            child: filteredWorkers.isEmpty
                ? const Center(
              child: Text(
                "No workers found",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff6C757D),
                ),
              ),
            )

                : ListView.builder(
              padding: const EdgeInsets.fromLTRB(
                20,
                5,
                20,
                25,
              ),

              itemCount:
              filteredWorkers.length,

              itemBuilder: (context, index) {
                final worker =
                filteredWorkers[index];

                return _workerCard(
                  context,
                  worker,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _workerCard(
      BuildContext context,
      Map<String, dynamic> worker,
      ) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 16,
      ),

      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),

      child: Column(
        children: [

          // TOP
          Row(
            crossAxisAlignment:
            CrossAxisAlignment.start,

            children: [

              CircleAvatar(
                radius: 30,

                backgroundColor:
                const Color(0xffEAF3F5),

                child: const Icon(
                  Icons.person_rounded,
                  size: 36,
                  color: Color(0xff0F4C5C),
                ),
              ),

              const SizedBox(width: 14),

              Expanded(
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,

                  children: [

                    Text(
                      worker["name"],
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w800,
                        color: Color(0xff1D2D44),
                      ),
                    ),

                    const SizedBox(height: 5),

                    Text(
                      worker["skill"],
                      style: const TextStyle(
                        color: Color(0xffE36414),
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    const SizedBox(height: 7),

                    Row(
                      children: [

                        const Icon(
                          Icons.location_on_outlined,
                          size: 15,
                          color: Color(0xff7B858B),
                        ),

                        const SizedBox(width: 3),

                        Expanded(
                          child: Text(
                            worker["location"],
                            style: const TextStyle(
                              fontSize: 12,
                              color: Color(0xff7B858B),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // RATING
              Column(
                children: [

                  const Icon(
                    Icons.star_rounded,
                    color: Colors.orange,
                    size: 20,
                  ),

                  const SizedBox(height: 2),

                  Text(
                    worker["rating"].toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 16),

          // EXPERIENCE
          Row(
            children: [

              const Icon(
                Icons.work_outline_rounded,
                size: 18,
                color: Color(0xff0F4C5C),
              ),

              const SizedBox(width: 6),

              Text(
                "${worker["experience"]} years experience",
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xff6C757D),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),

          const SizedBox(height: 15),

          // VIEW PROFILE
          SizedBox(
            width: double.infinity,
            height: 45,

            child: OutlinedButton.icon(
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

              icon: const Icon(
                Icons.person_outline_rounded,
                size: 19,
              ),

              label: const Text(
                "View Profile",
              ),

              style: OutlinedButton.styleFrom(
                foregroundColor:
                const Color(0xff0F4C5C),

                side: const BorderSide(
                  color: Color(0xff0F4C5C),
                ),

                shape: RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.circular(12),
                ),

                textStyle: const TextStyle(
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),

          const SizedBox(height: 10),

          // HIRE + CONTACT
          Row(
            children: [

              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(
                      SnackBar(
                        content: Text(
                          "Hire request sent to ${worker["name"]}",
                        ),
                      ),
                    );
                  },

                  icon: const Icon(
                    Icons.handshake_outlined,
                    size: 18,
                  ),

                  label: const Text(
                    "Hire",
                  ),

                  style:
                  ElevatedButton.styleFrom(
                    backgroundColor:
                    const Color(0xff0F4C5C),

                    foregroundColor: Colors.white,

                    elevation: 0,

                    shape:
                    RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 10),

              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(
                      SnackBar(
                        content: Text(
                          "Contact: ${worker["phone"]}",
                        ),
                      ),
                    );
                  },

                  icon: const Icon(
                    Icons.phone_outlined,
                    size: 18,
                  ),

                  label: const Text(
                    "Contact",
                  ),

                  style:
                  OutlinedButton.styleFrom(
                    foregroundColor:
                    const Color(0xff0F4C5C),

                    side: const BorderSide(
                      color: Color(0xff0F4C5C),
                    ),

                    shape:
                    RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}