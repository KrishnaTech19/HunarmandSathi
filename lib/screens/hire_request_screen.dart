import 'package:flutter/material.dart';
import 'my_request_screen.dart';

class HireRequestScreen extends StatefulWidget {
  final Map<String, dynamic> worker;

  const HireRequestScreen({
    super.key,
    required this.worker,
  });

  @override
  State<HireRequestScreen> createState() => _HireRequestScreenState();
}

class _HireRequestScreenState extends State<HireRequestScreen> {
  final TextEditingController workController =
  TextEditingController();

  final TextEditingController addressController =
  TextEditingController();

  final TextEditingController budgetController =
  TextEditingController();

  String selectedDate = "Select date";

  @override
  void dispose() {
    workController.dispose();
    addressController.dispose();
    budgetController.dispose();
    super.dispose();
  }

  // ================= SAFE STRING =================

  String getWorkerValue(String key, String defaultValue) {
    final value = widget.worker[key];

    if (value == null) {
      return defaultValue;
    }

    return value.toString();
  }

  // ================= DATE =================

  Future<void> selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        const Duration(days: 365),
      ),
      initialDate: DateTime.now(),
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate =
        "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
      });
    }
  }

  // ================= SEND REQUEST =================

  void sendRequest() {
    if (workController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please enter work details"),
        ),
      );
      return;
    }

    if (addressController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please enter work location"),
        ),
      );
      return;
    }

    if (selectedDate == "Select date") {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please select a date"),
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          "Hire request sent successfully!",
        ),
      ),
    );

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const MyRequestsScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F9FA),

      // ================= APP BAR =================

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
          "Hire Worker",
          style: TextStyle(
            color: Color(0xff1D2D44),
            fontWeight: FontWeight.w800,
          ),
        ),
      ),

      // ================= BODY =================

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            // ================= WORKER CARD =================

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),

                border: Border.all(
                  color: const Color(0xffE2E7E9),
                ),
              ),

              child: Row(
                children: [

                  // WORKER ICON

                  Container(
                    height: 58,
                    width: 58,

                    decoration: BoxDecoration(
                      color: const Color(0xffEAF3F5),
                      borderRadius:
                      BorderRadius.circular(16),
                    ),

                    child: Icon(
                      widget.worker["icon"] is IconData
                          ? widget.worker["icon"]
                          : Icons.person_rounded,

                      color: const Color(0xff0F4C5C),
                      size: 30,
                    ),
                  ),

                  const SizedBox(width: 14),

                  // WORKER DETAILS

                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,

                      children: [

                        Text(
                          getWorkerValue(
                            "name",
                            "Worker",
                          ),

                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w800,
                            color: Color(0xff1D2D44),
                          ),
                        ),

                        const SizedBox(height: 5),

                        Text(
                          getWorkerValue(
                            "skill",
                            "Skilled Worker",
                          ),

                          style: const TextStyle(
                            color: Color(0xffE36414),
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                          ),
                        ),

                        const SizedBox(height: 5),

                        Text(
                          "${getWorkerValue("experience", "2 Years")} • ${getWorkerValue("distance", "Nearby")}",

                          style: const TextStyle(
                            color: Color(0xff7B858B),
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // ================= WORK DETAILS =================

            const Text(
              "Work Details",

              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: Color(0xff1D2D44),
              ),
            ),

            const SizedBox(height: 6),

            const Text(
              "Tell the worker what kind of work you need.",

              style: TextStyle(
                fontSize: 12,
                color: Color(0xff7B858B),
              ),
            ),

            const SizedBox(height: 18),

            // ================= WORK REQUIRED =================

            const Text(
              "Work Required *",

              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: Color(0xff1D2D44),
              ),
            ),

            const SizedBox(height: 8),

            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),

                border: Border.all(
                  color: const Color(0xffE2E7E9),
                ),
              ),

              child: TextField(
                controller: workController,
                maxLines: 4,

                decoration: const InputDecoration(
                  hintText:
                  "Example: Bathroom tap repair...",

                  border: InputBorder.none,

                  contentPadding:
                  EdgeInsets.all(15),
                ),
              ),
            ),

            const SizedBox(height: 18),

            // ================= LOCATION =================

            const Text(
              "Work Location *",

              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: Color(0xff1D2D44),
              ),
            ),

            const SizedBox(height: 8),

            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),

                border: Border.all(
                  color: const Color(0xffE2E7E9),
                ),
              ),

              child: TextField(
                controller: addressController,

                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.location_on_outlined,
                    color: Color(0xff0F4C5C),
                  ),

                  hintText:
                  "Enter work address",

                  border: InputBorder.none,
                ),
              ),
            ),

            const SizedBox(height: 18),

            // ================= DATE =================

            const Text(
              "Preferred Date *",

              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: Color(0xff1D2D44),
              ),
            ),

            const SizedBox(height: 8),

            GestureDetector(
              onTap: selectDate,

              child: Container(
                width: double.infinity,

                padding:
                const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 16,
                ),

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

                    const Icon(
                      Icons.calendar_month_outlined,
                      color: Color(0xff0F4C5C),
                    ),

                    const SizedBox(width: 12),

                    Text(
                      selectedDate,

                      style: TextStyle(
                        color:
                        selectedDate ==
                            "Select date"
                            ? const Color(
                          0xff7B858B,
                        )
                            : const Color(
                          0xff1D2D44,
                        ),

                        fontWeight:
                        FontWeight.w600,
                      ),
                    ),

                    const Spacer(),

                    const Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: Color(0xff7B858B),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 18),

            // ================= BUDGET =================

            const Text(
              "Estimated Budget",

              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: Color(0xff1D2D44),
              ),
            ),

            const SizedBox(height: 8),

            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                BorderRadius.circular(15),

                border: Border.all(
                  color: const Color(0xffE2E7E9),
                ),
              ),

              child: TextField(
                controller: budgetController,

                keyboardType:
                TextInputType.number,

                decoration:
                const InputDecoration(
                  prefixIcon: Icon(
                    Icons.currency_rupee_rounded,
                    color: Color(0xff0F4C5C),
                  ),

                  hintText:
                  "Enter your budget",

                  border: InputBorder.none,
                ),
              ),
            ),

            const SizedBox(height: 30),

            // ================= SEND REQUEST =================

            SizedBox(
              width: double.infinity,
              height: 55,

              child: ElevatedButton.icon(
                onPressed: sendRequest,

                icon: const Icon(
                  Icons.send_rounded,
                ),

                label: const Text(
                  "Send Hire Request",

                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),

                style:
                ElevatedButton.styleFrom(
                  backgroundColor:
                  const Color(0xff0F4C5C),

                  foregroundColor:
                  Colors.white,

                  elevation: 0,

                  shape:
                  RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(16),
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
}