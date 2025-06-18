import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marrige_app/config/config.dart';
import 'package:marrige_app/config/manager_height.dart';
import 'package:marrige_app/config/manager_width.dart';
import 'package:marrige_app/config/responsive/screen_util_new.dart';
import '../../../config/app_colors.dart';
import '../../../config/manager_font_size.dart';

class UpgradeOfferCard extends StatelessWidget {
  const UpgradeOfferCard({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtilNew.init(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w16),
      child: Container(
        width: double.infinity,
        height: ManagerHeight.h132,
        decoration: BoxDecoration(
          color:
          Theme
              .of(context)
              .brightness == Brightness.dark
              ? AppColors.purpleGradaint
              : AppColors.primaryLightPurple,
          borderRadius: BorderRadius.circular(18.r),
        ),
        child: Stack(
          children: [
            Positioned(
              right: 0,
              top: ManagerHeight.h20,
              child: Image.asset(
                "${AppConfig.baseImagePath}/upgrade_widget_light.png",
                height: ManagerHeight.h92,
                width: ManagerWidth.w64,
                fit: BoxFit.fill,
              ),
            ),
            // Positioned(
            //   top:
            //       MediaQuery.of(context).orientation == Orientation.portrait
            //           ? 50.h
            //           : 77.h,
            //   right:
            //       MediaQuery.of(context).orientation == Orientation.portrait
            //           ? 16.w
            //           : 16.w,
            //
            //   child: Container(
            //     decoration: BoxDecoration(
            //       color:
            //           Theme.of(context).brightness == Brightness.dark
            //               ? AppColors.purpleGradaint
            //               : AppColors.primaryToLightPurple,
            //
            //       borderRadius: BorderRadius.circular(15.r),
            //     ),
            //     padding: EdgeInsets.all(8.r),
            //     child: Icon(
            //       Icons.open_in_new,
            //       color: Colors.white,
            //       size: 20.sp,
            //     ),
            //   ),
            // ),
            Positioned(
                top: ManagerHeight.h12,
                left: ManagerWidth.w32,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset("${AppConfig.baseImagePath}/gift_icon.png",
                          width: ManagerWidth.w26, height: ManagerHeight.h39,),
                        SizedBox(width: ManagerWidth.w5,),
                        Text(
                          'Upgrade Offer',
                          style: TextStyle(
                            fontSize:
                            ManagerFontSize.s18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: ManagerWidth.w230,
                      child: Text(
                        'Get 50% discount if you buy upgrade now',
                        style: TextStyle(
                          fontSize:
                          ManagerFontSize.s14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                  ],
                ))
            // Padding(
            //   padding: EdgeInsets.only(
            //     right: 85.w,
            //     left: 16.w,
            //     top: 16.h,
            //     bottom: 16.h,
            //   ),
            //   child: Row(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Icon(Icons.card_giftcard, color: Colors.white, size: 40.sp),
            //       SizedBox(width: 12.w),
            //       Expanded(
            //         child: Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             Text(
            //               'Upgrade Offer',
            //               style: TextStyle(
            //                 fontSize:
            //                     MediaQuery.of(context).orientation ==
            //                             Orientation.portrait
            //                         ? 18.sp
            //                         : 14.sp,
            //                 fontWeight: FontWeight.bold,
            //                 color: Colors.white,
            //               ),
            //             ),
            //             SizedBox(height: 4.h),
            //             Text(
            //               'Get 50% discount if you buy upgrade now',
            //               style: TextStyle(
            //                 fontSize:
            //                     MediaQuery.of(context).orientation ==
            //                             Orientation.portrait
            //                         ? 16.sp
            //                         : 11.sp,
            //                 color: Colors.white,
            //               ),
            //               overflow: TextOverflow.ellipsis,
            //               maxLines: 2,
            //             ),
            //           ],
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
