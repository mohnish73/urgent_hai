import 'package:flutter/material.dart';
import 'package:urgent_hai/helper/app_utilities/app_images.dart';

import '../../widget/welcomeScreen_widget.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> onboardingData = [
    {
      'title': "Welcome to Pratham’s",
      'subtitle': "Your one-stop solution for rides and doorstep deliveries.",
      'imageAsset': AppImages.b1,
    },
    {
      'title': "Book a Ride Instantly",
      'subtitle': "Get a cab with a tap at your fingertips at the earliest.",
      'imageAsset': AppImages.b2,
    },
    {
      'title': "Shop from Nearby Stores",
      'subtitle': "Groceries & essentials, delivered from local shops!",
      'imageAsset': AppImages.b3,
    },
  ];

  void _onSkip() {
    _pageController.jumpToPage(onboardingData.length - 1);
  }

  void _onContinue() {
    if (_currentPage < onboardingData.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // Navigator.pushReplacement(...);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body: PageView.builder(
          controller: _pageController,
          itemCount: onboardingData.length,
          onPageChanged: (index) {
            setState(() {
              _currentPage = index;
            });
          },
          itemBuilder: (context, index) {
            final data = onboardingData[index];
            return WelcomeScreenWidget(
              title: data['title']!,
              subtitle: data['subtitle']!,
              imageAsset: data['imageAsset']!,
              onSkip: _onSkip,
              onContinue: _onContinue,
              currentPage: _currentPage,
              totalPages: onboardingData.length,
            );
      
          },
        ),
      ),
    );
  }
}
