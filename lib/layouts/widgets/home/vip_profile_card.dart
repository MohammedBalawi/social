import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marrige_app/config/config.dart';
import 'package:marrige_app/config/manager_height.dart';
import 'package:marrige_app/config/manager_width.dart';
import 'package:marrige_app/config/responsive/screen_util_new.dart';
import '../../../config/app_colors.dart';
import '../../../config/manager_font_size.dart';

class VipProfileCard extends StatefulWidget {
  const VipProfileCard({super.key});

  @override
  State<VipProfileCard> createState() => _VipProfileCardState();
}

class _VipProfileCardState extends State<VipProfileCard> {
  bool isFilledHeart = true;

  bool isFilledMessage=true;

  @override
  Widget build(BuildContext context) {
    ScreenUtilNew.init(context);
    String iconHeartPath =
    isFilledHeart
        ? "${AppConfig.baseImagePath}/heart_fill.png"
        : "${AppConfig.baseImagePath}/heart_fill_not.png";
    String iconMessagePath =
    isFilledMessage
        ? "${AppConfig.baseImagePath}/mail_fill.png"
        : "${AppConfig.baseImagePath}/mail_fill_not.png";

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w16),
      child: Container(
        width: double.infinity,
        height: ManagerHeight.h204,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 4.r,
              spreadRadius: 0,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(
          horizontal: ManagerWidth.w4,
          vertical: ManagerHeight.h4,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(18.r),
          child: Stack(
            children: [
              ///This Widget IF You Want Add Image
              // Positioned.fill(
              //   child: CachedNetworkImage(
              //     imageUrl: "https://plus.unsplash.com/premium_photo-1673792686302-7555a74de717?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
              //     fit: BoxFit.cover,
              //     placeholder:
              //         (context, url) => Container(
              //       color: Colors.grey.shade200,
              //       child: const Center(
              //         child: CircularProgressIndicator(strokeWidth: 2),
              //       ),
              //     ),
              //     errorWidget:
              //         (context, url, error) => Container(
              //       color: Colors.grey.shade300,
              //       child: Icon(Icons.error, color: AppColors.redColor),
              //     ),
              //   ),
              // ),
              // forground_vip.png
              Positioned.fill(
                child: Image.asset(
                  "${AppConfig.baseImagePath}/forground_vip.png",
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: ManagerHeight.h5,
                left: ManagerWidth.w11,
                child: Container(
                  height: ManagerHeight.h20,
                  width: ManagerWidth.w20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.greenColor,
                  ),
                ),
              ),
              Positioned(
                top: ManagerHeight.h4half57,
                right: 0,
                child: Image.asset(
                  "${AppConfig.baseImagePath}/vip.png",
                  height: ManagerHeight.h16,
                  width: ManagerWidth.w71,
                ),
              ),
              Positioned(
                top: ManagerHeight.h24,
                right: 0,
                child: Stack(
                  children: [
                    Image.asset(
                      "${AppConfig.baseImagePath}/vip_image_light.png",
                      height: ManagerHeight.h109,
                      width: ManagerWidth.w64,
                      fit: BoxFit.fill,
                    ),
                    Positioned(
                      top: ManagerHeight.h13,
                      right: ManagerWidth.w8,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isFilledHeart = !isFilledHeart;
                              });
                            },
                            child: _circlePurpleButton(iconHeartPath),
                          ),
                          SizedBox(height: ManagerHeight.h4),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isFilledMessage = !isFilledMessage;
                              });
                            },
                            child: _circlePurpleButton(
                              iconMessagePath,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: ManagerHeight.h136,
                left: ManagerWidth.w18,
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Miranda Kehlani',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: ManagerFontSize.s18,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: ManagerHeight.h2),
                    Text(
                      'Mysar , Normal  / 44 year',
                      style: TextStyle(
                        fontSize: ManagerFontSize.s14,
                        color: Colors.white70,
                      ),
                    ),

                  ],
                ),
              ),
              Positioned(
                bottom: ManagerHeight.h6,
                right: ManagerWidth.w18,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Saudi ariabia",
                      style:  TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: ManagerFontSize.s13,
                        color: AppColors.offWhite,
                      ),
                    ),
                    SizedBox(height: ManagerHeight.h4),
                    Image.asset("${AppConfig.baseImagePath}/whats_app_icon.png",height: ManagerHeight.h18,width: ManagerWidth.w18,fit: BoxFit.contain,)
                  ],
                ),
              ),
            ],
          ),
        ),

        //   child: Container(
        //     decoration: BoxDecoration(
        //   color: Theme.of(context).brightness == Brightness.dark
        // ? Colors.black
        // : AppColors.purpleWhite,
        //
        //       borderRadius: BorderRadius.circular(18.r),
        //       boxShadow: [
        //         BoxShadow(
        //           color: Colors.white.withOpacity(0.4),
        //           blurRadius: 20.r,
        //           spreadRadius: 2.r,
        //           offset: const Offset(0, 0),
        //         ),
        //       ],
        //     ),
        //     child: ClipRRect(
        //       borderRadius: BorderRadius.circular(18.r),
        //       child: Stack(
        //         children: [
        //
        //           Positioned(
        //             right: 0,
        //             top:  MediaQuery.of(context).orientation == Orientation.portrait ? 55.h :50.h,
        //             bottom: 33.h,
        //             child: ClipRRect(
        //               borderRadius: BorderRadius.only(
        //                 topLeft: Radius.circular(30.r),
        //                 bottomLeft: Radius.circular(30.r),
        //               ),
        //               child: BackdropFilter(
        //                 filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        //                 child: Container(
        //                   width:  MediaQuery.of(context).orientation == Orientation.portrait ? 66.w :44.sp,
        //                   decoration: BoxDecoration(
        //                     color: AppColors.primarywhiteWithOpacity,
        //                     borderRadius: BorderRadius.only(
        //                       topLeft: Radius.circular(30.r),
        //                       bottomLeft: Radius.circular(30.r),
        //                     ),
        //                   ),
        //                   child: Column(
        //                     mainAxisAlignment: MainAxisAlignment.center,
        //                     children: [
        //                       _circlePurpleButton(Icons.favorite_border),
        //                       SizedBox(height: 15.h),
        //                       _circlePurpleButton(Icons.mail_outline),
        //                     ],
        //                   ),
        //                 ),
        //               ),
        //             ),
        //           ),
        //
        //
        //           Positioned(
        //             top: 6,
        //             right: 0,
        //             child: Image.asset("assets/images/vip.png", height:  MediaQuery.of(context).orientation == Orientation.portrait ? 24.h :33.h),
        //           ),
        //
        //
        //           Padding(
        //             padding: EdgeInsets.only(right: 122.w, left: 12.w, top: 12.h, bottom: 12.h),
        //             child: Column(
        //               children: [
        //                 Row(
        //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                   children: [
        //                     Container(
        //                       width: 20.w,
        //                       height: 20.h,
        //                       decoration: BoxDecoration(
        //                         color: AppColors.greenColor,
        //                         shape: BoxShape.circle,
        //                       ),
        //                     ),
        //                   ],
        //                 ),
        //                 SizedBox(height: 8.h),
        //                 Expanded(
        //                   child: Column(
        //                     mainAxisAlignment: MainAxisAlignment.end,
        //                     crossAxisAlignment: CrossAxisAlignment.start,
        //                     children: [
        //                       Text(
        //                         'Miranda Kehlani',
        //                         style: TextStyle(
        //                           fontWeight: FontWeight.bold,
        //                           fontSize: MediaQuery.of(context).orientation == Orientation.portrait ? 18.sp :10.sp,
        //                           color: Colors.white,
        //                         ),
        //                       ),
        //                       SizedBox(height: 5.h),
        //                       Text(
        //                         'Mysar , Normal  / 44 year',
        //                         style: TextStyle(
        //                           fontSize:  MediaQuery.of(context).orientation == Orientation.portrait ? 14.sp :8.sp,
        //                           color: Colors.white70,
        //                         ),
        //                       ),
        //                     ],
        //                   ),
        //                 ),
        //               ],
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //   ),
      ),
    );
  }

  Widget _circlePurpleButton(String icon) {
    return Container(
      height: ManagerHeight.h40,
      width: ManagerWidth.w40,
      decoration: BoxDecoration(
        color: AppColors.purple,
        shape: BoxShape.circle,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: ManagerWidth.w10,
        vertical: ManagerHeight.h8,
      ),
      child: Image.asset(icon, height: ManagerHeight.h24, fit: BoxFit.contain),
    );
  }

}
