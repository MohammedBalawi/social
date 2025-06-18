import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/app_colors.dart';
import '../../config/manager_font_size.dart';
import '../../config/manager_height.dart';
import '../../config/manager_width.dart';
class TextFieldWithGradiant extends StatelessWidget {
  String hintText;
  TextEditingController controller;
   TextFieldWithGradiant({super.key,required this.hintText,required this.controller});

  @override
  Widget build(BuildContext context) {
       final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Container(
      decoration: BoxDecoration(
        color: isDarkMode ? AppColors.backgroundDark : Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          if (!isDarkMode)
            BoxShadow(
              color: Colors.grey.withOpacity(0.05),
              blurRadius: 5,
            )
        ],
      ),
      child: Row(
        children: [
          Container(
            width: ManagerWidth.w6,
            height: ManagerHeight.h50,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.grad1Color, AppColors.grad2Color],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.r),
                bottomLeft: Radius.circular(12.r),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w12),
              child: TextField(
                controller: controller,
                style: TextStyle(
                  color: isDarkMode ? Colors.white : AppColors.colorItemInMyAccountIcon,
                  fontFamily: "Acme",
                  fontSize: ManagerFontSize.s14,
                  fontWeight: FontWeight.w400,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hintText,
                  hintStyle: TextStyle(
                    color: isDarkMode ? Colors.white70 : AppColors.colorItemInMyAccountIcon,
                    fontFamily: "Acme",
                    fontSize: ManagerFontSize.s14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
