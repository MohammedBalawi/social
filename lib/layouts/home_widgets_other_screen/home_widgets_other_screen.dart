import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marrige_app/config/app_colors.dart';
import 'package:marrige_app/config/config.dart';
import 'package:marrige_app/config/manager_font_size.dart';
import 'package:marrige_app/config/manager_height.dart';
import 'package:marrige_app/config/manager_width.dart';
import 'package:marrige_app/layouts/widgets/other_widget_in_home/list_story_rectangle.dart';

import '../../config/responsive/screen_util_new.dart';

class HomeWidgetsOtherScreen extends StatefulWidget {
  const HomeWidgetsOtherScreen({super.key});

  @override
  State<HomeWidgetsOtherScreen> createState() => _HomeWidgetsOtherScreenState();
}

class _HomeWidgetsOtherScreenState extends State<HomeWidgetsOtherScreen> {
  final List<String> imageUrls = const [
    'https://plus.unsplash.com/premium_photo-1673792686302-7555a74de717?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://plus.unsplash.com/premium_photo-1673792686302-7555a74de717?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://plus.unsplash.com/premium_photo-1673792686302-7555a74de717?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  ];
  bool isFilledHeart = true;
  bool isFilledMessage = true;

  @override
  Widget build(BuildContext context) {
    ScreenUtilNew.init(context);

    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: ManagerHeight.h24),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w16),
              child: Center(
                child: SizedBox(
                  height: ManagerHeight.h492,
                  width: double.infinity,
                  child: CardSwiper(
                    cardsCount: imageUrls.length,
                    numberOfCardsDisplayed: 2,
                    padding: const EdgeInsets.all(0),
                    cardBuilder: (context, index, percentX, percentY) {
                      return buildProfileCard(imageUrls[index]);
                    },
                  ),
                ),
              ),
            ),
            SizedBox(height: ManagerHeight.h32),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w16),
              child: Container(
                height: ManagerHeight.h85,
                padding: EdgeInsets.symmetric(
                  horizontal: ManagerWidth.w24,
                  vertical: ManagerHeight.h14,
                ),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.getOfferInHomeColor,
                  borderRadius: BorderRadius.circular(50.r),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      "${AppConfig.baseImagePath}/gift_icon.png",
                      height: ManagerHeight.h53,
                      width: ManagerWidth.w44,
                    ),
                    SizedBox(width: ManagerWidth.w13,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Get your special offer",
                        style: TextStyle(
                          color: AppColors.white,
                          fontFamily: "Afacad",
                          fontSize: ManagerFontSize.s18,
                          fontWeight: FontWeight.w400,
                        ),),
                        Text("Expires in  00:17:11",
                          style: TextStyle(
                            color: AppColors.white,
                            fontFamily: "Afacad",
                            fontSize: ManagerFontSize.s14,
                            fontWeight: FontWeight.w400,
                          ),),
                      ],
                    ),
                    Expanded(child: SizedBox()),
                    Icon(Icons.arrow_forward,color: AppColors.white,)
                  ],
                ),
              ),
            ),
            SizedBox(height: ManagerHeight.h32,),
            NearbyProfilesList(),
            SizedBox(height: ManagerHeight.h32,)
          ],
        ),
      ),
    );
  }

  Widget buildProfileCard(String imageUrl) {
    ScreenUtilNew.init(context);

    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    String iconHeartPath =
        isFilledHeart
            ? "${AppConfig.baseImagePath}/heart_fill.png"
            : "${AppConfig.baseImagePath}/heart_fill_not.png";
    String iconMessagePath =
        isFilledMessage
            ? "${AppConfig.baseImagePath}/mail_fill.png"
            : "${AppConfig.baseImagePath}/mail_fill_not.png";
    return Container(
      height: ManagerHeight.h492,
      width: double.infinity,
      decoration: BoxDecoration(
        color: isDarkMode?AppColors.black:AppColors.white,
        borderRadius: BorderRadius.circular(24.r),
        border:isDarkMode? Border.all(
          color: AppColors.purple,
          width: 5
        ):null,
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.25),
            offset: Offset(0, 4),
            spreadRadius: 0,
            blurRadius: 20,
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: ManagerWidth.w8,
              right: ManagerWidth.w8,
              top: ManagerHeight.h8,
            ),
            child: SizedBox(
              height: ManagerHeight.h380,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(24.r),
                    child: CachedNetworkImage(
                      imageUrl: imageUrl,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: ManagerHeight.h380,
                      placeholder:
                          (context, url) =>
                              const Center(child: CircularProgressIndicator()),
                      errorWidget:
                          (context, url, error) => const Icon(Icons.error),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(24.r),
                      child: Image.asset(
                        "${AppConfig.baseImagePath}/forground_image_child_home.png",
                        width: double.infinity,
                        height: ManagerHeight.h380,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      children: [
                        Expanded(child: SizedBox()),
                        Text(
                          "Miranda Kehlani",
                          style: TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: ManagerFontSize.s16,
                            fontFamily: "Afacad",
                          ),
                        ),
                        Text(
                          "Mysar , Normal",
                          style: TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: ManagerFontSize.s8,
                            fontFamily: "Afacad",
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Saudi ariabia",
                              style: TextStyle(
                                color: AppColors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: ManagerFontSize.s8,
                                fontFamily: "Afacad",
                              ),
                            ),
                            Text(
                              " 44 year",
                              style: TextStyle(
                                color: AppColors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: ManagerFontSize.s8,
                                fontFamily: "Afacad",
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: ManagerHeight.h8),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: ManagerHeight.h16,
                      left: ManagerWidth.w16,
                    ),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Image.asset(
                        "${AppConfig.baseImagePath}/vip.png",
                        height: ManagerHeight.h28,
                        width: ManagerWidth.w71,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: ManagerHeight.h24),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w72),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  child: _circlePurpleButton(iconMessagePath),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _circlePurpleButton(String icon) {
    return Container(
      height: ManagerHeight.h56,
      width: ManagerWidth.w56,
      decoration: BoxDecoration(
        color: AppColors.purple,
        shape: BoxShape.circle,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: ManagerWidth.w14,
        vertical: ManagerHeight.h14,
      ),
      child: Image.asset(icon, height: ManagerHeight.h24, fit: BoxFit.contain),
    );
  }
}
