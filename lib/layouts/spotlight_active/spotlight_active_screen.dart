import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marrige_app/controller/base_widgets/base_scaffold.dart';
import 'package:marrige_app/layouts/widgets/spotlight_widgets/spotlight_offer.dart';

import '../../config/app_colors.dart';
import '../../config/app_config.dart';
import '../../config/manager_font_size.dart';
import '../../config/manager_height.dart';
import '../../config/manager_width.dart';
import '../../config/responsive/screen_util_new.dart';
import '../widgets/spotlight_widgets/best_seller.dart';

class SpotlightActiveScreen extends StatefulWidget {
  const SpotlightActiveScreen({super.key});

  @override
  State<SpotlightActiveScreen> createState() => _SpotlightActiveScreenState();
}

class _SpotlightActiveScreenState extends State<SpotlightActiveScreen> {
  @override
  Widget build(BuildContext context) {
    ScreenUtilNew.init(context);
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return BaseScaffold(
      backgroundColor: isDarkMode ? AppColors.black : AppColors.backgroundLight,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: ManagerHeight.h32),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w16),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w8,vertical:ManagerHeight.h8,),
                height: ManagerHeight.h320,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: isDarkMode ? AppColors.backgroundDark : AppColors.white,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.black.withOpacity(0.25),
                      offset: Offset(0, 4),
                      spreadRadius: 0,
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w16),
                  child: Text(
                    " Put your profile in the light with Spotlight!  Do you want your profile to be seen by the highest number of interested members, increasing your chances of marriage and making it happen faster? The Spotlight service gives you the chance to boost interaction and receive more messages and likes by featuring your profile in prominent areas of the website and apps for a specific duration. ",
                    style: TextStyle(
                      color: isDarkMode ? AppColors.white : AppColors.black,
                      fontFamily: "Afacad",
                      fontSize: ManagerFontSize.s16,
                      fontWeight: FontWeight.w400
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: ManagerHeight.h32),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w16),
            child: Container(
              // height: ManagerHeight.h489,
              width: double.infinity,
              decoration: BoxDecoration(
                color: isDarkMode ? AppColors.backgroundDark : AppColors.white,
                borderRadius: BorderRadius.circular(8.r),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.black.withOpacity(0.10),
                    offset: Offset(0, 4),
                    spreadRadius: 2,
                    blurRadius: 20,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: ManagerHeight.h8,
                    decoration: BoxDecoration(
                      color: AppColors.purple,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(14.r),
                        topRight: Radius.circular(14.r),
                      ),
                    ),
                  ),
                  SizedBox(height: ManagerHeight.h10),

                  // العنوان
                  Text(
                    "The available Spotlights for you",
                    style: TextStyle(
                      color: isDarkMode ? AppColors.white : AppColors.black,
                      fontFamily: "Afacad",
                      fontSize: ManagerFontSize.s16,
                    ),
                  ),

                  SizedBox(height: ManagerHeight.h16),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w16),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.r),
                      child: LinearProgressIndicator(
                        value: 0.1,
                        minHeight: ManagerHeight.h8,
                        backgroundColor: Colors.grey.shade300,
                        valueColor: AlwaysStoppedAnimation(AppColors.greenColor),
                      ),
                    ),
                  ),

                  SizedBox(height: ManagerHeight.h8),

                  // النصوص الجانبية
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Remaining Spotlights 45",
                            style: TextStyle(fontSize: ManagerFontSize.s12,
                            color: isDarkMode?AppColors.white:AppColors.black,
                            fontFamily: "Afacad"),
                        overflow: TextOverflow.ellipsis,),
                        Spacer(),
                        Expanded(
                          child: Text("Used Spotlights 5",
                            style: TextStyle(fontSize: ManagerFontSize.s12,
                                color: isDarkMode?AppColors.white:AppColors.black,
                                fontFamily: "Afacad"),
                            overflow: TextOverflow.ellipsis,),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: ManagerHeight.h24),

                  Container(
                    padding: EdgeInsets.all(ManagerWidth.w16),
                    margin: EdgeInsets.symmetric(horizontal: ManagerWidth.w20),
                    decoration: BoxDecoration(
                      color: AppColors.greenColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Column(
                      children: [
                        Icon(Icons.check_circle, color: AppColors.greenColor, size: 32.r),
                        SizedBox(height: ManagerHeight.h10),
                        Text(
                          "Your profile is now appearing alternately in the spotlight list with other members, but you will receive the full duration of visibility, even if it takes longer.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: ManagerFontSize.s14,
                            height: 1.4,
                            color: isDarkMode?AppColors.white:AppColors.black
                          ),
                        ),
                        SizedBox(height: ManagerHeight.h16),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              width: 60.r,
                              height: 60.r,
                              child: CircularProgressIndicator(
                                value: 0.96, // 58 من 60 ثانية كمثال
                                strokeWidth: 6,
                                backgroundColor: Colors.grey.shade300,
                                valueColor:
                                AlwaysStoppedAnimation(AppColors.purple),
                              ),
                            ),
                            Text(
                              "00:58",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColors.purple,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: ManagerHeight.h16),
                ],
              ),
            ),
          ),
          SizedBox(height: ManagerHeight.h32),
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w16),
            //   child: Image.asset("${AppConfig.baseImagePath}/spolight_image.png",
            //   height: ManagerHeight.h489,
            //   width: double.infinity,),
            // ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SpotlightOffer(),
                  SizedBox(width: ManagerWidth.w4,),
                  BestSeller(),
                  SizedBox(width: ManagerWidth.w4,),
                  SpotlightOffer()
                ],
              ),
            ),
            SizedBox(height: ManagerHeight.h14,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SpotlightOffer(),
                  SizedBox(width: ManagerWidth.w4,),
                  BestSeller(),
                  SizedBox(width: ManagerWidth.w4,),
                  SpotlightOffer()
                ],
              ),
            ),
            SizedBox(height: ManagerHeight.h14,),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar() => SizedBox(
    height: ManagerHeight.h99,
    child: Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(top: ManagerHeight.h38),
          child: Center(
            child: Column(
                children:[
                Text(
                  "Spotlight",
                  style: TextStyle(
                    fontSize: ManagerFontSize.s18,
                    color: AppColors.white,
                    fontFamily: "ADLaMDisplay",
                  ),
                ),
                Text(
                  "Enhance your chances of marriage",
                  style: TextStyle(
                    fontSize: ManagerFontSize.s10,
                    color: AppColors.white,
                    fontFamily: "Afacad",
                  ),
                ),
              ]
            )
          ),
        ),
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Padding(
            padding: EdgeInsets.only(
              top: ManagerHeight.h38,
              left: ManagerWidth.w24,
            ),
            child: Image.asset(
              "${AppConfig.baseImagePath}/close_icon.png",
              height: ManagerHeight.h40,
              width: ManagerWidth.w40,
            ),
          ),
        ),
      ],
    ),
  );
}
