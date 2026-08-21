import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> notifications = [
      {
        "title": "Request Accepted",
        "message":
        "Amit Verma has accepted your hire request.",
        "time": "10 min ago",
        "icon": Icons.check_circle_rounded,
        "type": "accepted",
      },
      {
        "title": "New Hire Request",
        "message":
        "Your request for Bathroom tap repair is pending.",
        "time": "1 hour ago",
        "icon": Icons.assignment_rounded,
        "type": "pending",
      },
      {
        "title": "Worker Available",
        "message":
        "Rajesh Kumar is available for your requested work.",
        "time": "Yesterday",
        "icon": Icons.person_rounded,
        "type": "worker",
      },
      {
        "title": "Request Reminder",
        "message":
        "Your scheduled work is coming up on 25/08/2026.",
        "time": "Yesterday",
        "icon": Icons.notifications_active_rounded,
        "type": "reminder",
      },
    ];

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
          "Notifications",
          style: TextStyle(
            color: Color(0xff1D2D44),
            fontWeight: FontWeight.w800,
          ),
        ),

        actions: [
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    "All notifications marked as read",
                  ),
                ),
              );
            },
            icon: const Icon(
              Icons.done_all_rounded,
              color: Color(0xff0F4C5C),
            ),
          ),
        ],
      ),

      // ================= BODY =================

      body: notifications.isEmpty
          ? const Center(
        child: Column(
          mainAxisAlignment:
          MainAxisAlignment.center,
          children: [
            Icon(
              Icons.notifications_none_rounded,
              size: 70,
              color: Color(0xffAAB4B8),
            ),

            SizedBox(height: 12),

            Text(
              "No notifications",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w700,
                color: Color(0xff7B858B),
              ),
            ),

            SizedBox(height: 5),

            Text(
              "You're all caught up!",
              style: TextStyle(
                fontSize: 13,
                color: Color(0xffAAB4B8),
              ),
            ),
          ],
        ),
      )
          : ListView.builder(
        padding: const EdgeInsets.all(20),

        itemCount: notifications.length,

        itemBuilder: (context, index) {
          final notification =
          notifications[index];

          return _notificationCard(
            context,
            notification,
          );
        },
      ),
    );
  }

  // ================= NOTIFICATION CARD =================

  Widget _notificationCard(
      BuildContext context,
      Map<String, dynamic> notification,
      ) {
    final String type =
        notification["type"]?.toString() ?? "";

    Color iconBackground;

    if (type == "accepted") {
      iconBackground = const Color(0xffE8F5E9);
    } else if (type == "pending") {
      iconBackground = const Color(0xfffff3e0);
    } else if (type == "worker") {
      iconBackground = const Color(0xffEAF3F5);
    } else {
      iconBackground = const Color(0xffFFF0E6);
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 14),

      padding: const EdgeInsets.all(15),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(18),

        border: Border.all(
          color: const Color(0xffE2E7E9),
        ),
      ),

      child: Row(
        crossAxisAlignment:
        CrossAxisAlignment.start,

        children: [
          // ================= ICON =================

          Container(
            height: 48,
            width: 48,

            decoration: BoxDecoration(
              color: iconBackground,

              borderRadius:
              BorderRadius.circular(14),
            ),

            child: Icon(
              notification["icon"],
              color: const Color(0xff0F4C5C),
              size: 25,
            ),
          ),

          const SizedBox(width: 13),

          // ================= TEXT =================

          Expanded(
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,

              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        notification["title"],
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight:
                          FontWeight.w800,
                          color:
                          Color(0xff1D2D44),
                        ),
                      ),
                    ),

                    Container(
                      height: 8,
                      width: 8,

                      decoration:
                      const BoxDecoration(
                        color:
                        Color(0xffE36414),
                        shape:
                        BoxShape.circle,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 6),

                Text(
                  notification["message"],
                  style: const TextStyle(
                    fontSize: 12,
                    height: 1.4,
                    color:
                    Color(0xff7B858B),
                    fontWeight:
                    FontWeight.w500,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  notification["time"],
                  style: const TextStyle(
                    fontSize: 10,
                    color:
                    Color(0xffAAB4B8),
                    fontWeight:
                    FontWeight.w600,
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