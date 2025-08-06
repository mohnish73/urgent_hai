import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:urgenthai/core/provider_location/location_provider.dart';
import 'package:urgenthai/resoures/app_colors.dart';
import 'package:urgenthai/resoures/app_strings.dart';
import 'package:urgenthai/resoures/app_text_theme.dart';

class RideLocationCard extends StatelessWidget {
  final String pickupAddress;
  final String destinationAddress;
  final TextEditingController dropAddressController;
  final Function(String)? onDropChanged;

  const RideLocationCard({
    super.key,
    required this.pickupAddress,
    required this.dropAddressController,
    this.onDropChanged, required this.destinationAddress,
  });

  @override
  Widget build(BuildContext context) {
    dropAddressController.text=destinationAddress.toString();
    return Consumer<LocationProvider>(builder: (context, value, child) =>
        Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Material(
            elevation: 1,
            borderRadius: BorderRadius.circular(12.r),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 14.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  )
                ],
              ),
              child: Column(
                children: [
                  _buildPickupRow(context, primaryDark, value.addressForLocationCard??""),
                  Divider(height: 16.h),
                  _buildEditableDropRow(context, appRed, dropAddressController),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildPickupRow(BuildContext context, Color dotColor, String address) {
    return Row(
      children: [
        Container(
          width: 10.w,
          height: 10.h,
          decoration: BoxDecoration(color: dotColor, shape: BoxShape.circle),
        ),
        SizedBox(width: 15.w),
        Expanded(
          child: Text(
            address,
            style: Theme.of(context).textTheme.urbanistLabel18,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildEditableDropRow(BuildContext context, Color dotColor, TextEditingController controller) {
    return Row(
      children: [
        Container(
          width: 10.w,
          height: 10.h,
          decoration: BoxDecoration(color: dotColor, shape: BoxShape.circle),
        ),
        SizedBox(width: 15.w),
        Expanded(
          child: TextFormField(
            controller: controller,
            onChanged: onDropChanged,
            style: Theme.of(context).textTheme.urbanistLabel18,
            decoration: InputDecoration(
              hintText: AppStrings.enterDestination,
              isDense: true,
              hintStyle: TextStyle(color: textGray),
              border: InputBorder.none,
              contentPadding: EdgeInsets.zero,
            ),
          ),
        ),
      ],
    );
  }
}
