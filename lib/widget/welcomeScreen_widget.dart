import 'dart:math';
import 'package:flutter/material.dart';
import 'package:urgent_hai/helper/dxWidget/dx_text.dart';
import '../helper/app_utilities/app_theme.dart';

class WelcomeScreenWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imageAsset;
  final VoidCallback onSkip;
  final VoidCallback onContinue;
  final int currentPage;
  final int totalPages;

  const WelcomeScreenWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imageAsset,
    required this.onSkip,
    required this.onContinue,
    required this.currentPage,
    required this.totalPages,
  });

  @override
  Widget build(BuildContext context) {
    final bool isLastPage = currentPage == totalPages - 1;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: primaryDarkColor,
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(40),
                    ),
                  ),
                ),
                Positioned(
                  left: 17,
                  right: 0,
                  child: Transform.rotate(
                    angle: -pi / 18,
                    child: Image.asset(
                      imageAsset,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  DxTextBlack(
                    title,
                    mSize: 32,
                    mBold: true,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  DxText(
                    subtitle,
                    mSize: 20,
                    textColor: Colors.grey,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                  ),
                  const SizedBox(height: 24),

                  // Dots
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      totalPages,
                          (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: CircleAvatar(
                          radius: 4,
                          backgroundColor: index == currentPage
                              ? primaryDarkColor
                              : Colors.grey[200],
                        ),
                      ),
                    ),
                  ),

                  const Spacer(),

                  Row(
                    children: [
                      if (!isLastPage)
                        Expanded(
                          child: OutlinedButton(
                            onPressed: onSkip,
                            style: OutlinedButton.styleFrom(
                              foregroundColor: primaryDarkColor,
                              side: BorderSide(color: primaryDarkColor),
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: DxTextPrimary("Skip", mSize: 18, mBold: true),
                          ),
                        ),
                      if (!isLastPage) const SizedBox(width: 12),
                      Expanded(
                        flex: isLastPage ? 2 : 1,
                        child: ElevatedButton(
                          onPressed: onContinue,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryDarkColor,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: DxTextWhite(
                            isLastPage ? "Let's Get Started" : "Continue",
                            mSize: 18,
                            mBold: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
