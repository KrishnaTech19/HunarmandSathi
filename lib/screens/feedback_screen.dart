import 'package:flutter/material.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  final TextEditingController feedbackController =
  TextEditingController();

  int rating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F9FA),

      appBar: AppBar(
        backgroundColor: const Color(0xffF7F9FA),
        title: const Text(
          "Feedback & Complaint",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xff1D2D44),
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              "Rate Your Experience",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                5,
                    (index) => IconButton(
                  onPressed: () {
                    setState(() {
                      rating = index + 1;
                    });
                  },
                  icon: Icon(
                    Icons.star,
                    size: 35,
                    color: index < rating
                        ? Colors.amber
                        : Colors.grey.shade300,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 25),

            TextField(
              controller: feedbackController,
              maxLines: 5,
              decoration: InputDecoration(
                hintText:
                "Write your feedback or complaint here...",
                border: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(15),
                ),
              ),
            ),

            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(
                    const SnackBar(
                      content: Text(
                        "Feedback Submitted Successfully",
                      ),
                    ),
                  );

                  feedbackController.clear();

                  setState(() {
                    rating = 0;
                  });
                },
                child: const Text(
                  "Submit",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
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