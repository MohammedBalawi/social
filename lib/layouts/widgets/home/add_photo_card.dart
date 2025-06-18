import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marrige_app/config/manager_height.dart';
import 'package:marrige_app/config/manager_width.dart';
import 'package:marrige_app/config/responsive/screen_util_new.dart';
import '../../../config/app_colors.dart';
import '../../../config/app_config.dart';
import '../../../config/manager_font_size.dart';

class AddPhotoCard extends StatelessWidget {
  const AddPhotoCard({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtilNew.init(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w16),
      child: Container(
        width: double.infinity,
        height: ManagerHeight.h204,
        decoration: BoxDecoration(
          color: AppColors.purpleTwo,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Stack(
          children: [
            Positioned(
              right: 0,
              top: ManagerHeight.h35,
              child: Image.asset(
                "${AppConfig.baseImagePath}/add_your_photo_light_widget.png",
                height: ManagerHeight.h109,
                width: ManagerWidth.w64,
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
                top: ManagerHeight.h12,
                left: ManagerWidth.w18,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset("${AppConfig.baseImagePath}/camera_add_photo_widget.png",
                          width: ManagerWidth.w40, height: ManagerHeight.h60,),
                        SizedBox(width: ManagerWidth.w5,),
                        Text(
                          'Add your photo',
                          style: TextStyle(
                            fontSize:
                            ManagerFontSize.s24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: ManagerWidth.w250,
                      child: Text(
                        'Add a photo to your profile now to boost your chances of finding a match! Including a photo increases the visibility of your profile to all members.',
                        style: TextStyle(
                          fontSize:
                          ManagerFontSize.s14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 5,
                      ),
                    ),
                  ],
                ))
            //
            //
            // Padding(
            //   padding: EdgeInsets.only(right: 85.w, left: 16.w, top: 16.h, bottom: 16.h),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Row(
            //         children: [
            //           Icon(Icons.photo_camera, color: Colors.white, size: MediaQuery.of(context).orientation == Orientation.portrait ?40.sp :28.sp),
            //           SizedBox(width: 12.w),
            //           Expanded(
            //             child: Text(
            //               'Add your photo',
            //               style: TextStyle(
            //                 fontSize:MediaQuery.of(context).orientation == Orientation.portrait ?18.sp :14.sp,
            //                 fontWeight: FontWeight.bold,
            //                 color: Colors.white,
            //               ),
            //               overflow: TextOverflow.ellipsis,
            //             ),
            //           ),
            //         ],
            //       ),
            //       SizedBox(height: 12.h),
            //       Text(
            //         'Add a photo to your profile now to boost your chances of finding a match! Including a photo increases the visibility of your profile to all members.',
            //         style: TextStyle(
            //           fontSize: MediaQuery.of(context).orientation == Orientation.portrait ?16.sp :11.sp,
            //           color: Colors.white,
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
