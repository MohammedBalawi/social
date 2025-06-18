import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:marrige_app/config/config.dart';
import 'package:marrige_app/config/manager_height.dart';
import 'package:marrige_app/config/manager_width.dart';
import 'package:marrige_app/config/responsive/screen_util_new.dart';
import 'package:marrige_app/controller/home/cubit/home_cubit.dart';

import '../../../config/app_colors.dart';
import '../../../config/manager_font_size.dart';

class ProfileCard extends StatefulWidget {
  final SpotlightUser user;

  const ProfileCard({super.key, required this.user});

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
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

    return Container(
      width: double.infinity,
      height: ManagerHeight.h357,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 4.r,
            spreadRadius: 0,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: ManagerWidth.w4,
          vertical: ManagerHeight.h4,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(18.r),
          child: Stack(
            children: [
              Positioned.fill(
                child: CachedNetworkImage(
                  imageUrl: widget.user.profileImage,
                  fit: BoxFit.cover,
                  placeholder:
                      (context, url) => Container(
                        color: Colors.grey.shade200,
                        child: const Center(
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                      ),
                  errorWidget:
                      (context, url, error) => Container(
                        color: Colors.grey.shade300,
                        child: Icon(Icons.error, color: AppColors.redColor),
                      ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Image.asset(
                  "${AppConfig.baseImagePath}/forground_image_child_home.png",
                  height: ManagerHeight.h343,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: ManagerHeight.h9,
                left: ManagerWidth.w13,
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
                top: ManagerHeight.h12,
                right: 0,
                child: Image.asset(
                  "${AppConfig.baseImagePath}/vip.png",
                  height: ManagerHeight.h28,
                  width: ManagerWidth.w71,
                ),
              ),
              Positioned(
                top: ManagerHeight.h75,
                right: 0,
                child: Stack(
                  children: [
                    Image.asset(
                      "assets/images/base_light.png",
                      height: ManagerHeight.h136,
                      width: ManagerWidth.w64,
                      fit: BoxFit.fill,
                    ),
                    Positioned(
                      top: ManagerHeight.h20,
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
                          SizedBox(height: ManagerHeight.h12),
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
                top: ManagerHeight.h280,
                left: ManagerWidth.w18,
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.user.userName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: ManagerFontSize.s18,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: ManagerHeight.h2),
                    Text(
                      '${widget.user.country} / ${widget.user.age}',
                      style: TextStyle(
                        fontSize: ManagerFontSize.s14,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: ManagerHeight.h16,
                right: ManagerWidth.w18,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.user.country,
                      style:  TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: ManagerFontSize.s12,
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
      ),
    );

    //   Center(
    //   child: Container(
    //     width: double.infinity,
    //
    //     // width:
    //     //     MediaQuery.of(context).orientation == Orientation.portrait
    //     //         ? 354.w
    //     //         : 288.w,
    //     height: ManagerHeight.h357,
    //     decoration: BoxDecoration(
    //       color: Colors.white,
    //       borderRadius: BorderRadius.circular(22.r),
    //       boxShadow: [
    //         BoxShadow(
    //           color: AppColors.purpleGradaint.withOpacity(0.3),
    //           blurRadius: 25.r,
    //           spreadRadius: 2.r,
    //           offset: const Offset(0, 10),
    //         ),
    //       ],
    //     ),
    //     padding: EdgeInsets.only(left:ManagerWidth.w6,right: ManagerWidth.w6,top: ManagerHeight.h8,bottom: ManagerHeight.h8),
    //     child: Container(
    //       decoration: BoxDecoration(
    //         color: Colors.white,
    //         borderRadius: BorderRadius.circular(18.r),
    //         boxShadow: [
    //           BoxShadow(
    //             color: Colors.white.withOpacity(0.4),
    //             blurRadius: 20.r,
    //             spreadRadius: 2.r,
    //             offset: const Offset(0, 0),
    //           ),
    //         ],
    //       ),
    //       child: ClipRRect(
    //         borderRadius: BorderRadius.circular(18.r),
    //         child: Stack(
    //           children: [
    //             Positioned.fill(
    //               child: CachedNetworkImage(
    //                 imageUrl: user.profileImage,
    //                 fit: BoxFit.cover,
    //                 placeholder: (context, url) => Container(
    //                   color: Colors.grey.shade200,
    //                   child: const Center(
    //                     child: CircularProgressIndicator(strokeWidth: 2),
    //                   ),
    //                 ),
    //                 errorWidget: (context, url, error) => Container(
    //                   color: Colors.grey.shade300,
    //                   child: Icon(Icons.error,color: AppColors.redColor,),
    //                 ),
    //               ),
    //             ),
    //
    //             Positioned(
    //               bottom: 0,
    //               left: 0,
    //               right: 0,
    //               // height: 177.h,
    //               child: Image.asset("assets/images/forground_image_child_home.png",height: ManagerHeight.h343,width: double.infinity,fit: BoxFit.cover,)
    //               // Container(
    //               //   decoration: const BoxDecoration(
    //               //     gradient: LinearGradient(
    //               //       begin: Alignment(0, -0.1),
    //               //       end: Alignment.bottomCenter,
    //               //       colors: [Color(0x004B164C), Color(0xFF5633CB)],
    //               //     ),
    //               //   ),
    //               // ),
    //             ),
    //
    //             Positioned(
    //               top: ManagerHeight.h9,
    //               left: ManagerWidth.w13,
    //               child: CircleAvatar(
    //                 radius: 8.r,
    //                 backgroundColor: AppColors.greenColor,
    //               ),
    //             ),
    //
    //             Positioned(
    //               top: 12,
    //               right: 0,
    //               child: Container(
    //                 padding: EdgeInsets.symmetric(
    //                   horizontal: 10.w,
    //                   vertical: 4.h,
    //                 ),
    //                 child: Image.asset("assets/images/vip.png"),
    //               ),
    //             ),
    //
    //             Positioned(
    //               right: 1,
    //               top: 100,
    //               child: Container(
    //                 // width:
    //                 //     MediaQuery.of(context).orientation ==
    //                 //             Orientation.portrait
    //                 //         ? 60.w
    //                 //         : 66.h,
    //                 // height: 130.h,
    //                 // decoration: BoxDecoration(
    //                 //   color: Colors.white.withOpacity(0.3), // خلفية شفافة
    //                 //   borderRadius: BorderRadius.only(
    //                 //     topLeft: Radius.circular(20.r),
    //                 //     bottomLeft: Radius.circular(20.r),
    //                 //   ),
    //                 // ),
    //                 child: Column(
    //                   mainAxisAlignment: MainAxisAlignment.center,
    //                   children: [
    //                     _circlePurpleButton(Icons.favorite),
    //                     SizedBox(height: 15.h),
    //                     _circlePurpleButton(Icons.mail),
    //                   ],
    //                 ),
    //               ),
    //             ),
    //
    //
    //             Positioned(
    //               bottom: 12,
    //               left: 15,
    //               child: Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   Text(
    //                     user.userName,
    //                     style: TextStyle(
    //                       fontWeight: FontWeight.bold,
    //                       fontSize: 18.sp,
    //                       color: Colors.white,
    //                     ),
    //                   ),
    //                   SizedBox(height: 5.h),
    //                   Text(
    //                     '${user.country} / ${user.age}',
    //                     style: TextStyle(
    //                       fontSize: 14.sp,
    //                       color: Colors.white70,
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //
    //
    //             Positioned(
    //               bottom: 10,
    //               right: 15,
    //               child: Column(
    //                 crossAxisAlignment: CrossAxisAlignment.end,
    //                 children: [
    //                   Text(
    //                     user.country,
    //                     style: const TextStyle(
    //                       fontWeight: FontWeight.w500,
    //                       fontSize: 13,
    //                       color: AppColors.offWhite,
    //                     ),
    //                   ),
    //                   const SizedBox(height: 5),
    //
    //                   Align(
    //                     alignment: Alignment.centerLeft,
    //                     child: CircleAvatar(
    //                       radius: 12,
    //                       backgroundColor: Colors.black,
    //                       child: FaIcon(
    //                         FontAwesomeIcons.whatsapp,
    //                         color: Colors.white,
    //                         size: 14,
    //                       ),
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // );
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
