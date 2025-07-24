import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:urgenthai/resoures/app_colors.dart';
import 'package:urgenthai/resoures/app_images.dart';
import 'package:urgenthai/resoures/app_text_theme.dart';

import '../../../custom_widgets/custom_app_button.dart';
import '../../../resoures/app_strings.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _controller = PageController();
  int currentIndex = 0;

  final List<IntroData> _pages = [
    IntroData(
      image: AppImages.introIcon1,
      title: AppStrings.introTitle1,
      subtitle: AppStrings.introSubtitle1,
      skip: AppStrings.skip,
      next: AppStrings.continueText,
    ),
    IntroData(
      image: AppImages.introIcon2,
      title: AppStrings.introTitle2,
      subtitle: AppStrings.introSubtitle2,
      skip: AppStrings.skip,
      next: AppStrings.continueText,
    ),
    IntroData(
      image: AppImages.introIcon3,
      title: AppStrings.introTitle3,
      subtitle: AppStrings.introSubtitle3,
      skip: '',
      next: AppStrings.letsGetStarted,
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            height: 530.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: primaryDark,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(100),
                bottomRight: Radius.circular(100),
              ),
            ),
          ),

          Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _controller,
                  onPageChanged: (index) =>
                      setState(() => currentIndex = index),
                  itemCount: _pages.length,
                  itemBuilder: (context, index) {
                    return IntroPage(data: _pages[index]);
                  },
                ),
              ),
              SmoothPageIndicator(
                controller: _controller,
                count: _pages.length,
                effect: WormEffect(
                  activeDotColor: primaryDark,
                  dotColor: primaryLight,
                  dotHeight: 10.w,
                  dotWidth: 10.w,
                ),
              ),
              SizedBox(height: 40.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (_pages[currentIndex].skip.isNotEmpty)
                      Expanded(
                        child: CustomAppButton(
                          textColor: primaryDark,
                          color: primaryLight,
                          title: _pages[currentIndex].skip,
                          onPressed: () {},
                        ),
                      )
                    else
                      const SizedBox(width: 0.005), // to align with button


                    SizedBox(width: 20.h),

                    Expanded(
                      child: CustomAppButton(

                        title: _pages[currentIndex].next,
                        onPressed: () {
                          if (currentIndex == _pages.length - 1) {
                            // Navigate to home or login
                          } else {
                            _controller.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ],
      ),
    );
  }
}

class IntroData {
  final String image;
  final String title;
  final String subtitle;
  final String skip;
  final String next;

  IntroData({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.skip,
    required this.next,
  });
}

class IntroPage extends StatelessWidget {
  final IntroData data;

  const IntroPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20.h),
        Expanded(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Image.asset(data.image),

              Container(
                height: 300.h,
                width: double.infinity,

                color: Colors.white,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 60.h),
                    Text(
                      data.title,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.urbanistTitle30,
                    ),
                    SizedBox(height: 10.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.w),
                      child: Text(
                        data.subtitle,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.urbanistLabel15
                            .copyWith(color: textGray, fontSize: 16.sp),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
