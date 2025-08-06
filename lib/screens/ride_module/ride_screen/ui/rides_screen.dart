import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:urgenthai/custom_widgets/address_appbar.dart';
import 'package:urgenthai/custom_widgets/custom_bounce.dart';
import 'package:urgenthai/resoures/app_text_theme.dart';
import 'package:urgenthai/routes/routes_name_app.dart';
import 'package:urgenthai/screens/ride_module/ride_screen/provider/ride_provider.dart';

import '../../../../custom_widgets/address_widget.dart';
import '../../../../custom_widgets/custom_text_form_field.dart';
import '../../../../resoures/app_colors.dart';
import '../../../../resoures/app_images.dart';
import '../../../../resoures/app_strings.dart';

class RidesScreen extends StatefulWidget {
  const RidesScreen({super.key});

  @override
  State<RidesScreen> createState() => _RidesScreenState();
}

class _RidesScreenState extends State<RidesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AddressAppbar(),
      body: Padding(
        padding: EdgeInsets.only(right: 20.w, left: 29.w),
        child: ListView(
          children: [
            CustomTextFormField(
              filledColor: primaryLight,

              hintText: AppStrings.destination,
              contentHorizontalPadding: 38.w,
              hintColor: primaryDark,
              borderRadius: 35.r,
              suffixIcon: Padding(
                padding: EdgeInsets.only(right: 13.w),
                child: IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    AppImages.greenSearchIcon,
                    height: 28.w,
                    width: 28.w,
                  ),
                ),
              ),
            ),

            SizedBox(height: 10.h),

            Row(
              children: [
                Image.asset(AppImages.favIcon, height: 32.h, width: 32.w),
                SizedBox(width: 10.w),
                Text(
                  AppStrings.myFavourites,
                  style: Theme.of(context).textTheme.urbanistTitle16,
                ),
              ],
            ),

            SizedBox(height: 20.h),

            CustomBounce(
              onPressed: () {
                context.pushNamed(AppRouteConstants.rideSearchName);
              },
              child: addressWidget(
                context: context,
                title: 'Manali 43A',
                subTitle:
                    'PLot no, 12, Phase IV, Udyog Vihar, Sector 18, Gurugram, Haryana 122015',
                icon: AppImages.homeAddress,
              ),
            ),

            SizedBox(height: 20.h),

            addressWidget(
              context: context,
              title: 'Manali 43A',
              subTitle:
                  'PLot no, 12, Phase IV, Udyog Vihar, Sector 18, Gurugram, Haryana 122015',
              icon: AppImages.officeAddress,
            ),
          ],
        ),
      ),
    );
  }
}
