import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:urgenthai/resoures/app_images.dart';
import 'package:urgenthai/resoures/app_strings.dart';
import 'package:urgenthai/screens/home_screen/home_screen.dart';
import 'package:urgenthai/screens/ride_module/ride_bottom_nav/ride_bottom_tab.dart';
import 'package:urgenthai/screens/ride_module/ride_screen/provider/ride_provider.dart';
import 'package:urgenthai/screens/ride_module/ride_screen/ui/ride_book.dart';
import 'package:urgenthai/screens/ride_module/ride_screen/ui/rides_screen.dart';

import '../../../custom_widgets/custom_bounce.dart';
import '../../../resoures/app_colors.dart';
import '../../bottom_nav/components/mobile_bottom_tab.dart';



class RideBottomNav extends StatefulWidget {
  const RideBottomNav({super.key});

  @override
  State<RideBottomNav> createState() => _RideBottomNavState();
}

class _RideBottomNavState extends State<RideBottomNav> {
  int _curr = 1;
  DateTime? lastPressed;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {


    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) async {
        if (_curr != 0) {
          setState(() {
            _curr = 0;
          });
          return;
        } else {
          // At home (index 0) → go back to previous screen
          if (context.canPop()) {
            // context.pop();
          } else {
            // Optional: use SystemNavigator.pop() only if you want to force-close the app
            // SystemNavigator.pop();
          }
        }
      },
      canPop: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Consumer<RideProvider>(builder: (context, value, child) =>
          SafeArea(
            child: IndexedStack(
              index: _curr,
              children:   [
                Text(""),
               value.isRideBookShow ==false?RidesScreen():RideBookScreen(),
                Text("aefwefwef"),


              ],
            ),
          ),
        ),
        bottomNavigationBar: SafeArea(
          bottom: true,
          child: ClipRect(
            child: Padding(
              padding: EdgeInsets.only(bottom: 5.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 0.5.h,
                    width: double.infinity,
                    color: primaryLight,
                  ),
                  Container(
                    height: 70.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [


                        CustomBounce(
                          onPressed: () {
                            setState(() {
                              _curr = 0;
                            });
                            context.pop();

                          },
                          child: RideBottomTab(
                            image: AppImages.homeArrow,
                            title: AppStrings.home,
                            isSelected: _curr == 0,
                          ),

                        ),

                        CustomBounce(
                          onPressed: () {
                            setState(() {
                              _curr = 1;
                            });
                          },
                          child: RideBottomTab(
                            image: AppImages.rideUnselected,
                            title: AppStrings.ride,
                            isSelected: _curr == 1,
                          ),

                        ),

                        CustomBounce(
                          onPressed: () {
                            setState(() {
                              _curr = 2;
                            });
                          },
                          child: RideBottomTab(
                            image: AppImages.activityUnselected,
                            title: AppStrings.activity,
                            isSelected: _curr == 2,
                          ),

                        ),


                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
