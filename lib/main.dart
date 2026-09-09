import 'package:flutter/material.dart';

import 'screens/client_screen.dart';
import 'screens/worker_register_screen.dart';
import 'screens/worker_dashboard.dart';
import 'screens/nearby_jobs_screen.dart';
import 'screens/my_jobs_screen.dart';
import 'screens/worker_profile_screen.dart';
import 'screens/edit_profile_screen.dart';
import 'screens/client_dashboard.dart';
import 'screens/worker_details_Screen.dart';
import 'screens/notifications_screen.dart';
import 'screens/client_profile_screen.dart';
import 'screens/splash_Screen.dart';

void main() {
  runApp(const HunarmandSathi());
}

class HunarmandSathi extends StatelessWidget {
  const HunarmandSathi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HunarmandSathi',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0F4C5C),
          primary: const Color(0xFF0F4C5C),
          secondary: const Color(0xFFE36414),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFF4F7F6),
              Color(0xFFEAEFF2),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // =========================
                // TOP BAR
                // =========================

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // LOGO + NAME
                    Row(
                      children: [
                        Container(
                          height: 48,
                          width: 48,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xFF0F4C5C),
                                Color(0xFF1F7A8C),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFF0F4C5C)
                                    .withOpacity(0.3),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.handyman_rounded,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),

                        const SizedBox(width: 12),

                        RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: 'Hunarmand',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800,
                                  color: Color(0xFF0F4C5C),
                                  letterSpacing: -0.5,
                                ),
                              ),
                              TextSpan(
                                text: 'Sathi',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800,
                                  color: Color(0xFFE36414),
                                  letterSpacing: -0.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    // TOP RIGHT ICONS
                    Row(
                      children: [
                        // NOTIFICATION
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                const NotificationsScreen(),
                              ),
                            );
                          },
                          child: Container(
                            height: 44,
                            width: 44,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(14),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.04),
                                  blurRadius: 12,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                const Icon(
                                  Icons.notifications_none_rounded,
                                  color: Color(0xFF2B2D42),
                                  size: 22,
                                ),
                                Positioned(
                                  top: 11,
                                  right: 12,
                                  child: Container(
                                    height: 8,
                                    width: 8,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFFE36414),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(width: 10),

                        // PROFILE
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                const ClientProfileScreen(),
                              ),
                            );
                          },
                          child: Container(
                            height: 44,
                            width: 44,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(14),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.04),
                                  blurRadius: 12,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.person_outline_rounded,
                              color: Color(0xFF0F4C5C),
                              size: 23,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                // =========================
                // BADGE
                // =========================

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0F4C5C).withOpacity(0.08),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    '⚡ #1 On-Demand Local Services',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF0F4C5C),
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                // =========================
                // MAIN HEADING
                // =========================

                const Text(
                  'Find the right expert\nfor your daily tasks.',
                  style: TextStyle(
                    fontSize: 30,
                    height: 1.2,
                    fontWeight: FontWeight.w900,
                    letterSpacing: -0.8,
                    color: Color(0xFF1D2D44),
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  'Connect with verified local skilled professionals in seconds.',
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.4,
                    color: Color(0xFF6C757D),
                  ),
                ),

                const SizedBox(height: 24),

                // =========================
                // LOCATION BAR
                // =========================

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.03),
                        blurRadius: 15,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 36,
                        width: 36,
                        decoration: BoxDecoration(
                          color: const Color(0xFF0F4C5C).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.near_me_rounded,
                          color: Color(0xFF0F4C5C),
                          size: 18,
                        ),
                      ),

                      const SizedBox(width: 12),

                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'CURRENT LOCATION',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFA0AAB2),
                                letterSpacing: 0.5,
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              'Detecting live location...',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF1D2D44),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const Icon(
                        Icons.my_location_rounded,
                        color: Color(0xFFE36414),
                        size: 20,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 28),

                // =========================
                // CHOOSE YOUR PATH
                // =========================

                const Text(
                  'Choose your path',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF1D2D44),
                  ),
                ),

                const SizedBox(height: 14),

                // =========================
                // CLIENT CARD
                // =========================

                RoleCard(
                  icon: Icons.search_rounded,
                  title: 'I want to Hire',
                  subtitle:
                  'Browse certified plumbers, electricians, painters & more.',
                  buttonText: 'Find Experts',
                  isPrimary: true,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ClientScreen(),
                      ),
                    );
                  },
                ),

                const SizedBox(height: 16),

                // =========================
                // WORKER CARD
                // =========================

                RoleCard(
                  icon: Icons.business_center_rounded,
                  title: 'I want to Work',
                  subtitle:
                  'Get local job leads, earn daily, and grow your service network.',
                  buttonText: 'Join as Professional',
                  isPrimary: false,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                        const WorkerRegisterScreen(),
                      ),
                    );
                  },
                ),

                const SizedBox(height: 28),

                // =========================
                // FOOTER
                // =========================

                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.verified_user_rounded,
                        size: 16,
                        color: Color(0xFF0F4C5C),
                      ),
                      SizedBox(width: 6),
                      Text(
                        '100% Trusted & Verified Community',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF8D99AE),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// =====================================================
// MODERN ROLE CARD WIDGET
// =====================================================

class RoleCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String buttonText;
  final bool isPrimary;
  final VoidCallback onTap;

  const RoleCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.isPrimary,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: isPrimary
              ? const Color(0xFF0F4C5C).withOpacity(0.2)
              : Colors.transparent,
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // CARD ICON
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  color: isPrimary
                      ? const Color(0xFF0F4C5C).withOpacity(0.1)
                      : const Color(0xFFE36414).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(
                  icon,
                  color: isPrimary
                      ? const Color(0xFF0F4C5C)
                      : const Color(0xFFE36414),
                  size: 24,
                ),
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 16,
                color: Colors.grey.shade400,
              ),
            ],
          ),

          const SizedBox(height: 16),

          // TITLE
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: Color(0xFF1D2D44),
            ),
          ),

          const SizedBox(height: 6),

          // SUBTITLE
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 13,
              height: 1.4,
              color: Color(0xFF6C757D),
            ),
          ),

          const SizedBox(height: 18),

          // BUTTON
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed: onTap,
              style: ElevatedButton.styleFrom(
                backgroundColor: isPrimary
                    ? const Color(0xFF0F4C5C)
                    : const Color(0xFF1D2D44),
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: Text(
                buttonText,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}