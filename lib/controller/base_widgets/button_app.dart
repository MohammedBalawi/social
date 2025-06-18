import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marrige_app/config/app_colors.dart';
import 'package:marrige_app/config/manager_font_size.dart';
import 'package:marrige_app/config/manager_height.dart';
import 'package:marrige_app/config/manager_width.dart';

class ButtonApp extends StatelessWidget {
  String title;
  double paddingWidth;

  ButtonApp({super.key, required this.title,required this.paddingWidth});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: paddingWidth),
      child: Container(
        height: ManagerHeight.h56,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.r),
          gradient: LinearGradient(
            colors: [AppColors.grad1Color, AppColors.grad2Color],
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: AppColors.white,
              fontWeight: FontWeight.w400,
              fontSize: ManagerFontSize.s14,
              fontFamily: "Afacad"
            ),
          ),
        ),
      ),
    );
  }
}
