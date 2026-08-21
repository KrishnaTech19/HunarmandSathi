import 'package:flutter/material.dart';

class MyRequestsScreen extends StatelessWidget {
  const MyRequestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> requests = [
      {
        "worker": "Rajesh Kumar",
        "skill": "Plumber",
        "work": "Bathroom tap repair",
        "location": "Gomti Nagar",
        "date": "25/08/2026",
        "budget": "₹800",
        "status": "Pending",
      },
      {
        "worker": "Amit Verma",
        "skill": "Electrician",
        "work": "Fan and switch repair",
        "location": "Aliganj",
        "date": "27/08/2026",
        "budget": "₹1200",
        "status": "Accepted",
      },
    ];

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
          "My Hire Requests",
          style: TextStyle(
            color: Color(0xff1D2D44),
            fontWeight: FontWeight.w800,
          ),
        ),
      ),

      body: requests.isEmpty
          ? const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.assignment_outlined,
              size: 65,
              color: Color(0xffAAB4B8),
            ),
            SizedBox(height: 12),
            Text(
              "No hire requests yet",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w700,
                color: Color(0xff7B858B),
              ),
            ),
          ],
        ),
      )
          : ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: requests.length,
        itemBuilder: (context, index) {
          final request = requests[index];

          return _requestCard(
            context,
            request,
          );
        },
      ),
    );
  }

  Widget _requestCard(
      BuildContext context,
      Map<String, dynamic> request,
      ) {
    final String status =
        request["status"]?.toString() ?? "Pending";

    final bool isAccepted = status == "Accepted";

    final String worker =
        request["worker"]?.toString() ?? "Worker";

    final String skill =
        request["skill"]?.toString() ?? "Skilled Worker";

    final String work =
        request["work"]?.toString() ?? "Work not specified";

    final String location =
        request["location"]?.toString() ??
            "Location not specified";

    final String date =
        request["date"]?.toString() ?? "Date not specified";

    final String budget =
        request["budget"]?.toString() ??
            "Budget not specified";

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
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

          // ================= WORKER =================

          Row(
            children: [
              Container(
                height: 52,
                width: 52,

                decoration: BoxDecoration(
                  color: const Color(0xffEAF3F5),
                  borderRadius: BorderRadius.circular(15),
                ),

                child: const Icon(
                  Icons.person_rounded,
                  color: Color(0xff0F4C5C),
                  size: 30,
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    Text(
                      worker,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: Color(0xff1D2D44),
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      skill,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xffE36414),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),

              // ================= STATUS =================

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),

                decoration: BoxDecoration(
                  color: isAccepted
                      ? const Color(0xffE8F5E9)
                      : const Color(0xfffff3e0),

                  borderRadius:
                  BorderRadius.circular(20),
                ),

                child: Text(
                  status,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                    color: isAccepted
                        ? Colors.green.shade700
                        : Colors.orange.shade700,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          const Divider(
            color: Color(0xffE2E7E9),
          ),

          const SizedBox(height: 14),

          // ================= WORK =================

          _infoRow(
            Icons.work_outline_rounded,
            "Work",
            work,
          ),

          const SizedBox(height: 12),

          // ================= LOCATION =================

          _infoRow(
            Icons.location_on_outlined,
            "Location",
            location,
          ),

          const SizedBox(height: 12),

          // ================= DATE =================

          _infoRow(
            Icons.calendar_month_outlined,
            "Date",
            date,
          ),

          const SizedBox(height: 12),

          // ================= BUDGET =================

          _infoRow(
            Icons.currency_rupee_rounded,
            "Budget",
            budget,
          ),

          const SizedBox(height: 18),

          // ================= VIEW REQUEST BUTTON =================

          SizedBox(
            width: double.infinity,
            height: 44,

            child: OutlinedButton(
              onPressed: () {

                // Open Request Details Screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        RequestDetailsScreen(
                          request: request,
                        ),
                  ),
                );
              },

              style: OutlinedButton.styleFrom(
                side: const BorderSide(
                  color: Color(0xff0F4C5C),
                ),

                shape: RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.circular(13),
                ),
              ),

              child: const Text(
                "View Request",
                style: TextStyle(
                  color: Color(0xff0F4C5C),
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ================= INFO ROW =================

  Widget _infoRow(
      IconData icon,
      String title,
      String value,
      ) {
    return Row(
      children: [

        Icon(
          icon,
          size: 20,
          color: const Color(0xff0F4C5C),
        ),

        const SizedBox(width: 10),

        Text(
          "$title: ",
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xff7B858B),
            fontWeight: FontWeight.w600,
          ),
        ),

        Expanded(
          child: Text(
            value.toString(),
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xff1D2D44),
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}


// ======================================================
// REQUEST DETAILS SCREEN
// ======================================================

class RequestDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> request;

  const RequestDetailsScreen({
    super.key,
    required this.request,
  });

  @override
  Widget build(BuildContext context) {

    final String status =
        request["status"]?.toString() ?? "Pending";

    final bool isAccepted = status == "Accepted";

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
          "Request Details",
          style: TextStyle(
            color: Color(0xff1D2D44),
            fontWeight: FontWeight.w800,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,

          children: [

            // ================= WORKER CARD =================

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                BorderRadius.circular(20),
                border: Border.all(
                  color: const Color(0xffE2E7E9),
                ),
              ),

              child: Row(
                children: [

                  Container(
                    height: 65,
                    width: 65,

                    decoration: BoxDecoration(
                      color: const Color(0xffEAF3F5),
                      borderRadius:
                      BorderRadius.circular(18),
                    ),

                    child: const Icon(
                      Icons.person_rounded,
                      size: 38,
                      color: Color(0xff0F4C5C),
                    ),
                  ),

                  const SizedBox(width: 15),

                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,

                      children: [

                        Text(
                          request["worker"]
                              ?.toString() ??
                              "Worker",

                          style: const TextStyle(
                            fontSize: 19,
                            fontWeight:
                            FontWeight.w800,
                            color:
                            Color(0xff1D2D44),
                          ),
                        ),

                        const SizedBox(height: 5),

                        Text(
                          request["skill"]
                              ?.toString() ??
                              "Skilled Worker",

                          style: const TextStyle(
                            fontSize: 14,
                            color:
                            Color(0xffE36414),
                            fontWeight:
                            FontWeight.w700,
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
              "Work Information",
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w800,
                color: Color(0xff1D2D44),
              ),
            ),

            const SizedBox(height: 15),

            _detailBox(
              Icons.work_outline_rounded,
              "Work",
              request["work"]?.toString() ??
                  "Not specified",
            ),

            _detailBox(
              Icons.location_on_outlined,
              "Location",
              request["location"]?.toString() ??
                  "Not specified",
            ),

            _detailBox(
              Icons.calendar_month_outlined,
              "Date",
              request["date"]?.toString() ??
                  "Not specified",
            ),

            _detailBox(
              Icons.currency_rupee_rounded,
              "Budget",
              request["budget"]?.toString() ??
                  "Not specified",
            ),

            const SizedBox(height: 10),

            const Text(
              "Request Status",
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w800,
                color: Color(0xff1D2D44),
              ),
            ),

            const SizedBox(height: 15),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),

              decoration: BoxDecoration(
                color: isAccepted
                    ? const Color(0xffE8F5E9)
                    : const Color(0xfffff3e0),

                borderRadius:
                BorderRadius.circular(15),
              ),

              child: Row(
                children: [

                  Icon(
                    isAccepted
                        ? Icons.check_circle_rounded
                        : Icons.pending_actions_rounded,

                    color: isAccepted
                        ? Colors.green.shade700
                        : Colors.orange.shade700,
                  ),

                  const SizedBox(width: 12),

                  Text(
                    isAccepted
                        ? "Request Accepted"
                        : "Request Pending",

                    style: TextStyle(
                      fontSize: 15,
                      fontWeight:
                      FontWeight.w800,
                      color: isAccepted
                          ? Colors.green.shade700
                          : Colors.orange.shade700,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // ================= CANCEL =================

            SizedBox(
              width: double.infinity,
              height: 50,

              child: OutlinedButton(
                onPressed: () {

                  showDialog(
                    context: context,

                    builder: (dialogContext) {

                      return AlertDialog(
                        title: const Text(
                          "Cancel Request?",
                        ),

                        content: const Text(
                          "Are you sure you want to cancel this hire request?",
                        ),

                        actions: [

                          TextButton(
                            onPressed: () {
                              Navigator.pop(
                                dialogContext,
                              );
                            },

                            child: const Text(
                              "No",
                            ),
                          ),

                          TextButton(
                            onPressed: () {

                              Navigator.pop(
                                dialogContext,
                              );

                              Navigator.pop(
                                context,
                              );

                              ScaffoldMessenger.of(
                                context,
                              ).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    "Request cancelled successfully",
                                  ),
                                ),
                              );
                            },

                            child: const Text(
                              "Yes, Cancel",
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight:
                                FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },

                style: OutlinedButton.styleFrom(
                  side: const BorderSide(
                    color: Colors.red,
                  ),

                  shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(13),
                  ),
                ),

                child: const Text(
                  "Cancel Request",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w800,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ================= DETAIL BOX =================

  Widget _detailBox(
      IconData icon,
      String title,
      String value,
      ) {
    return Container(
      width: double.infinity,

      margin: const EdgeInsets.only(bottom: 12),

      padding: const EdgeInsets.all(15),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
        BorderRadius.circular(15),
        border: Border.all(
          color: const Color(0xffE2E7E9),
        ),
      ),

      child: Row(
        children: [

          Icon(
            icon,
            color: const Color(0xff0F4C5C),
            size: 22,
          ),

          const SizedBox(width: 13),

          Expanded(
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,

              children: [

                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 12,
                    color:
                    Color(0xff7B858B),
                    fontWeight:
                    FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 15,
                    color:
                    Color(0xff1D2D44),
                    fontWeight:
                    FontWeight.w700,
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