import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marrige_app/config/app_colors.dart';
import 'package:marrige_app/config/app_config.dart';
import 'package:marrige_app/config/manager_font_size.dart';
import 'package:marrige_app/config/manager_height.dart';
import 'package:marrige_app/config/manager_width.dart';

import '../../../config/responsive/screen_util_new.dart';

class MyAccountItem extends StatelessWidget {
  String title;
  String pathIconLight;
  String pathIconDark;
  double heightIcon;
  double widthIcon;
  bool delete;

  MyAccountItem({
    super.key,
    required this.title,
    required this.pathIconLight,
    required this.pathIconDark,
    required this.heightIcon,
    required this.widthIcon,
    this.delete=false,
  });

  @override
  Widget build(BuildContext context) {
    ScreenUtilNew.init(context);
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    ///spolight_icon
    ///addtional_icon
    ///camera_icon
    ///settings
    ///sccessfull_story
    ///help_and_support_icon
    ///disable_and_close
    ///logout_icon
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w16),
      child: Container(
        height: ManagerHeight.h64,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: isDarkMode?AppColors.backgroundDark:AppColors.white,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w16),
          child: Row(
            children: [
              Image.asset(
                isDarkMode?pathIconDark:pathIconLight,
                height: heightIcon,
                width: widthIcon,
                fit: BoxFit.contain,
              ),
              SizedBox(width: ManagerWidth.w12),
              Text(
                title,
                style: TextStyle(color:isDarkMode? AppColors.white:AppColors.colorItemInMyAccountText,
                fontFamily: "Afacad",
                fontWeight: FontWeight.w400,
                fontSize: ManagerFontSize.s14),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              Expanded(child: SizedBox()),
              delete?  SizedBox():Icon(
                Icons.arrow_forward_ios,
                color: AppColors.colorItemInMyAccountIcon,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
