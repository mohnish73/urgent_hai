import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
 import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:urgenthai/resoures/app_images.dart';
import 'package:urgenthai/resoures/app_strings.dart';
import 'package:urgenthai/screens/home_screen/home_screen.dart';

import '../../core/provider_location/location_provider.dart';
import '../../custom_widgets/custom_bounce.dart';

import '../../resoures/app_colors.dart';
import '../address_screen/address_screen.dart';
import '../profile_screen/profile_screen.dart';
import 'components/mobile_bottom_tab.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _curr = 0;
  DateTime? lastPressed;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {

      final pro = Provider.of<LocationProvider>(context, listen: false);
      await pro.fetchCurrentLocation();

      print("LAT-->> ${pro.latitude}");
      print("Long-->> ${pro.longitude}");
      print("Address-->> ${pro.address}");
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
          final now = DateTime.now();
          final maxDuration = Duration(seconds: 2);
          final isWarning = lastPressed == null || now.difference(lastPressed!) > maxDuration;

          if (isWarning) {
            lastPressed = DateTime.now();
            Fluttertoast.showToast(msg: 'Press back again to exit');
            return;
          } else {
            SystemNavigator.pop();
          }
        }
      },
      canPop: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: IndexedStack(
            index: _curr,
            children:   [
             HomeScreen(),
              AddressScreen(),
              ProfileScreen()
          
             ],
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
                          },
                          child: MobileBottomTab(
                            image: AppImages.prathamGreenIcon,
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
                          child: MobileBottomTab(
                            image: AppImages.addressUnselected,
                            title: AppStrings.address,
                            isSelected: _curr == 1,
                          ),

                        ),

                        CustomBounce(
                          onPressed: () {
                            setState(() {
                              _curr = 2;
                            });
                          },
                          child: MobileBottomTab(
                            image: AppImages.profileUnselected,
                            title: AppStrings.profile,
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
