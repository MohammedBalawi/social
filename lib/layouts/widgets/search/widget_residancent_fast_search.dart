import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marrige_app/config/app_colors.dart';
import 'package:marrige_app/config/manager_font_size.dart';
import 'package:marrige_app/config/manager_height.dart';
import 'package:marrige_app/config/manager_width.dart';

import '../../../config/responsive/screen_util_new.dart';

class WidgetResidancentFastSearch extends StatelessWidget {
  const WidgetResidancentFastSearch({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtilNew.init(context);
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w16),
      child: Container(
        height: ManagerHeight.h66,
        width: double.infinity,
        decoration: BoxDecoration(
          color: isDarkMode?AppColors.backgroundDark:AppColors.white,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: isDarkMode?AppColors.backgroundDark:AppColors.borderColor, width: 1.5),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w16),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: ManagerHeight.h4),
                  Text(
                    "Resident in",
                    style: TextStyle(
                      fontSize: ManagerFontSize.s16,
                      fontWeight: FontWeight.w400,
                      color:isDarkMode? AppColors.white:AppColors.black,
                    ),
                  ),
                  // nonSelectedInFastSearchColor
                  Text(
                    "Not selectedS",
                    style: TextStyle(
                      fontSize: ManagerFontSize.s14,
                      fontWeight: FontWeight.w400,
                      color:isDarkMode? AppColors.white:AppColors.black,
                    ),
                  ),
                ],
              ),
              Expanded(child: SizedBox()),
              Icon(Icons.arrow_forward_ios, color: isDarkMode? AppColors.white:AppColors.black),
            ],
          ),
        ),
      ),
    );
  }
}
