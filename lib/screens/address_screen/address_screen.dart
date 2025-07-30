import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:urgenthai/resoures/app_images.dart';
import 'package:urgenthai/resoures/app_strings.dart';
import 'package:urgenthai/resoures/app_text_theme.dart';

import '../../custom_widgets/address_appbar.dart';
import '../../custom_widgets/address_widget.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AddressAppbar(isProfileImageShow: true,),
      body: Padding(
        padding:   EdgeInsets.only(left: 20.w,right: 20.w),
        child: Column(children: [
          SizedBox(height: 10.h,),

          Row(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [


            Row(
              children: [
                Image.asset(AppImages.favIcon,height: 32.h,width: 32.w,),
                SizedBox(width: 10.w,),
                Text(
                  AppStrings.myFavourites,
                  style: Theme.of(context).textTheme.urbanistTitle16,

                ),
              ],
            ),

              SizedBox(height: 10.h,),



              Image.asset(AppImages.addAddressIcon,height: 23.w,width: 23.w,),

          ],),

          SizedBox(height: 20.h,),

          addressWidget(context: context,
              title: 'Manali 43A',
              subTitle: 'PLot no, 12, Phase IV, Udyog Vihar, Sector 18, Gurugram, Haryana 122015',
              icon: AppImages.homeAddress),







        ],),
      ),
    );
  }
}
