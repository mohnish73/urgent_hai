import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:urgenthai/core/provider_location/location_provider.dart';
import 'package:urgenthai/resoures/app_images.dart';
import 'package:urgenthai/resoures/app_text_theme.dart';

class AddressAppbar extends StatelessWidget implements PreferredSizeWidget {

  bool isProfileImageShow;
    AddressAppbar({super.key, this.isProfileImageShow = true});

  @override
  Size get preferredSize => Size.fromHeight(80.h); // AppBar height

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      elevation: 0,
      titleSpacing: 0,
      flexibleSpace: Container(
        height: 80.h,
        // color: Colors.red,
        child: Consumer<LocationProvider>(
          builder: (context, value, child) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          AppImages.locationGreenIcon,
                          height: 32.w,
                          width: 32.w,
                        ),
                        SizedBox(width: 6.w),
                        ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: 220.w),
                          child: Text(
                            value.address ?? "Fetching address...",
                            style: Theme.of(context).textTheme.urbanistParagraph20,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    isProfileImageShow==true?

                    ClipRRect(
                      borderRadius: BorderRadius.circular(22.5.r),
                      child: Image.asset(
                        AppImages.demoProfile,
                        height: 45.w,
                        width: 45.w,
                        fit: BoxFit.cover,
                      ),
                    ):SizedBox(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
