import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:urgenthai/resoures/app_colors.dart';
import 'package:urgenthai/resoures/app_text_theme.dart';
import 'package:urgenthai/screens/ride_module/ride_screen/provider/ride_provider.dart';

class RideOptionCard extends StatelessWidget {
  final String imagePath; // asset or network image
  final String title;
  final String subtitle;
  final String price;
  final int index;

  const RideOptionCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.price, required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<RideProvider>(builder: (context, value, child) =>
       Container(
        decoration: BoxDecoration(
          color: value.recommendedCardSelectedIndex==index?primaryLight:Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: value.recommendedCardSelectedIndex==index?primaryDark:Colors.white,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            )
          ],
        ),
        child: Padding(
          padding:   EdgeInsets.symmetric(horizontal: 14.w, vertical: 15.h),
          child: Row(
            children: [
              // Vehicle Image
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  imagePath,
                  height: 48.h,
                  width: 56.w,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(width: 12),
              // Title & Subtitle
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title,
                          style: Theme.of(context).textTheme.urbanistTitle16,
                        ),

                        Text(
                          '₹ $price',
                          style: Theme.of(context).textTheme.urbanistTitle16,

                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: Theme.of(context).textTheme.urbanistParagraph15Med.copyWith(
                     color:      Color(0xFF3E3E3E)
                      ),

                    ),
                  ],
                ),
              ),
              // Price

            ],
          ),
        ),
      ),
    );
  }
}
