import 'package:flutter/material.dart';
import 'package:flutter_finance_app_ui_animation/view/landing_screen/landing_widget.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image or illustration at the top
              Expanded(
                child: Center(
                  child: Image.asset(
                    'assets/images/3.png',
                    height: 300,
                  ),
                ),
              ),
              // ignore: prefer_const_constructors
              SizedBox(height: 20),

              // Title text
              const Text(
                'Understand your financial habits',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),

              // Subtitle text
              Text(
                'Analyze your finance with beautiful, simple and easy to understand.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),

              // Page indicator and Next button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Skip button
                  TextButton(
                    onPressed: () {
                      // Handle Skip action
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return const LandingWidget();
                        },
                      ));
                    },
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                  ),

                  // Page indicator
                  Row(
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                          shape: BoxShape.circle,
                        ),
                      ),
                      Container(
                        width: 8,
                        height: 8,
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                          shape: BoxShape.circle,
                        ),
                      ),
                      Container(
                        width: 8,
                        height: 8,
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          color: Colors.grey[800],
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ),

                  // Next button
                  ElevatedButton(
                    onPressed: () {
                      // Handle Next action
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return const LandingWidget();
                        },
                      ));
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      backgroundColor: Colors.grey[300],
                      padding: const EdgeInsets.all(12), // Button color
                    ),
                    child: const Icon(
                      Icons.arrow_forward,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
