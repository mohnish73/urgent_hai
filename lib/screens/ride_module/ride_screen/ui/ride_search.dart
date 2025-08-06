import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:urgenthai/custom_widgets/custom_bounce.dart';
import 'package:urgenthai/resoures/app_text_theme.dart';
import 'package:urgenthai/custom_widgets/back_button.dart';

import '../../../../custom_widgets/ride_location_card.dart';
import '../../../../resoures/app_strings.dart';
import '../../../../routes/routes_name_app.dart';
import '../provider/ride_provider.dart';

class RideSearch extends StatefulWidget {
  const RideSearch({super.key});

  @override
  State<RideSearch> createState() => _RideSearchState();
}
TextEditingController dropController = TextEditingController();

class _RideSearchState extends State<RideSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding:   EdgeInsets.only(left: 22.w,right: 22.w),
          child: ListView(children: [
            Row(
              children: [
                backButton(context: context),

                SizedBox(width: 10.w,),
                SizedBox(width: 10.w,),

                Text(
                  AppStrings.bookARide,
                  style: Theme.of(context).textTheme.urbanistTitle30.copyWith(fontSize: 24.sp),
                ),
              ],
            ),

            SizedBox(height: 18.h,),

            CustomBounce(onPressed: () {

              Provider.of<RideProvider>(context,listen: false).rideBookFun();

             context.pop();

            },
              child: RideLocationCard(
                destinationAddress: "44A, Palam Vihar, Sector 9, Gurugram",
                pickupAddress: '32A, Radisson Blu, NH-8, Gurugram',
                dropAddressController: dropController,
                onDropChanged: (value) {
                  print('Drop address changed: $value');
                },
              ),
            )



          ],),
        ),
      ),

    );
  }
}
