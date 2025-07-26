import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:urgenthai/custom_widgets/custom_text_form_field.dart';
import 'package:urgenthai/resoures/app_colors.dart';
import 'package:urgenthai/resoures/app_images.dart';
import 'package:urgenthai/resoures/app_strings.dart';
import 'package:urgenthai/resoures/app_text_theme.dart';

import 'component/app_service_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding:   EdgeInsets.all(19.w),
          child: Column(children: [
            Padding(
              padding:   EdgeInsets.only(left: 12.w),
              child: Row(
                children: [
                  Image.asset(AppImages.locationGreenIcon,height: 32.w,width: 32.w,),
                  SizedBox(width: 5.w,),
                  Text("Gurgaon\nIndia",
                  style: Theme.of(context).textTheme.urbanistParagraph20,
                  ),


                ],
              ),
            ),
            SizedBox(height: 25.h,),
            Padding(
              padding:   EdgeInsets.only(right: 31.w),
              child: CustomTextFormField(filledColor: primaryLight,


              hintText: AppStrings.search,

                       contentHorizontalPadding: 38.w,
                hintColor: primaryDark,
                borderRadius: 35.r,
                suffixIcon: Padding(
                  padding:   EdgeInsets.only(right: 13.w),
                  child: IconButton(onPressed: () {

                  }, icon: Image.asset(AppImages.greenSearchIcon,height: 28.w,width: 28.w,)),
                ),
              ),
            ),
            SizedBox(height: 25.h,),

            Padding(
              padding:   EdgeInsets.only(left: 13.w),
              child: Row(
                children: [
                  Text(
                    AppStrings.welcomePratham,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.urbanistTitle30,
                  ),
                  SizedBox(width: 5.w,),
                  Image.asset(AppImages.waveEmoji,height: 32.w,width: 32.w,),

                ],
              ),
            ),
            SizedBox(height: 16.h,),


            Padding(
              padding:   EdgeInsets.only(left: 20.w),
              child: Text(
                AppStrings.homeMsg,
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.urbanistLabel18
                    .copyWith(color: Color(0xFF3E3E3E),

                ),
              ),
            ),

            SizedBox(height: 52.h,),

            Wrap(
              spacing: 16, // Horizontal space between cards
              runSpacing: 16, // Vertical space when it wraps
              children: [
                appServiceCard(
                  context: context,
                  serviceName: 'RIDE',
                  serviceTitle: 'Get a ride',
                  serviceImage: AppImages.rideIcon,
                  imageHeight: 76,
                  imageWidth: 108,
                ),
                SizedBox(width: 10.w,),
                appServiceCard(
                  context: context,
                  serviceName: 'PARCEL',
                  serviceTitle: 'Send a parcel',
                  serviceImage: AppImages.parcelIcon,
                  imageHeight: 105,
                  imageWidth: 86,
                ),
                appServiceCard(
                  context: context,
                  serviceName: 'Store',
                  serviceTitle: 'Grocery',
                  serviceImage: AppImages.storeIcon,
                  imageHeight: 98,
                  imageWidth: 95,
                ),
              ],
            )




          ],),
        ),
      ),

    );
  }
}
