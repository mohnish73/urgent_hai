import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:urgenthai/custom_widgets/address_appbar.dart';
import 'package:urgenthai/custom_widgets/custom_app_button.dart';
import 'package:urgenthai/custom_widgets/custom_bounce.dart';
import 'package:urgenthai/resoures/app_colors.dart';
import 'package:urgenthai/resoures/app_images.dart';
import 'package:urgenthai/resoures/app_strings.dart';
import 'package:urgenthai/screens/ride_module/ride_screen/provider/ride_provider.dart';
import 'package:urgenthai/screens/ride_module/ride_screen/ui/ride_search.dart';

import '../../../../custom_widgets/ride_location_card.dart';
import '../../../../custom_widgets/ride_option_card.dart';

class RideBookScreen extends StatefulWidget {
  const RideBookScreen({super.key});

  @override
  State<RideBookScreen> createState() => _RideBookScreenState();
}

class _RideBookScreenState extends State<RideBookScreen> {


  final List<RideOption> rideOptions = [
    RideOption(
      imagePath: AppImages.bike,
      title: 'Bike',
      subtitle: 'Beat the traffic in a blaze!',
      price: '99',
    ),
    RideOption(
      imagePath: AppImages.auto,
      title: 'Bike',
      subtitle: 'Quicker hassle-free ride!',
      price: '149',
    ),
    RideOption(
      imagePath: AppImages.cabs,
      title: 'Cabs',
      subtitle: 'Comfy cabs to chill!',
      price: '199',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AddressAppbar(),
      body: Consumer<RideProvider>(builder: (context, value, child) =>
       Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 22.w, right: 22.w,top: 5.h),
              child: Column(
                children: [
                  RideLocationCard(
                    destinationAddress: "44A, Palam Vihar, Sector 9, Gurugram",
                    pickupAddress: '32A, Radisson Blu, NH-8, Gurugram',
                    dropAddressController: dropController,
                    onDropChanged: (value) {
                      print('Drop address changed: $value');
                    },
                  ),
                ],
              ),
            ),

                SizedBox(height: 22.h,),

                Container(
                  height: 36.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: primaryLight
                  ),
                  child: Center(
                    child: Row(
                      children: [
                        SizedBox(width: 22.w,),
                        Text(
                          AppStrings.recommendedOptions,
                          style: TextStyle(
                            color: const Color(0xFF1E232C),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            height: 1.30,
                            letterSpacing: -0.14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: rideOptions.length,
                itemBuilder: (context, index) {
                return   CustomBounce(
                  onPressed: () {
                    value.recommendedCardSelectedIndexFun(index);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(left: 22.w, right: 22.w,top: 15.h),
                    child: RideOptionCard(
                      imagePath: rideOptions[index].imagePath ,
                      title: rideOptions[index].title ,
                      subtitle: rideOptions[index].subtitle ,

                      price: rideOptions[index].price ,
                      index: index,
                    ),
                  ),
                );
              },),
            ),

            value.recommendedCardSelectedIndex==-1?SizedBox():
            Padding(
              padding:   EdgeInsets.all(15.0.w),
              child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Text(
                      AppStrings.bookRideText,
                      style: TextStyle(
                        color: const Color(0xFF1E232C),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        height: 1.30,
                        letterSpacing: -0.14,
                      ),
                    ),
                  ),

                  Expanded(
                    flex: 2,

                    child: CustomAppButton(
                       buttonWidth: 114.w,
                      buttonHeight: 39.h,
                      title: AppStrings.book, onPressed: () {

                    },),
                  )

                ],
              ),
            ),




          ],
        ),
      ), // Add your body here
    );
  }
}


class RideOption {
  final String imagePath;
  final String title;
  final String subtitle;
  final String price;

  RideOption({
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.price,
  });
}
