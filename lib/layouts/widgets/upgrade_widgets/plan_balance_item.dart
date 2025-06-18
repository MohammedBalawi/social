import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marrige_app/config/app_colors.dart';
import 'package:marrige_app/config/manager_font_size.dart';
import 'package:marrige_app/config/manager_height.dart';
import 'package:marrige_app/config/manager_width.dart';
import 'package:marrige_app/config/responsive/screen_util_new.dart';

class PlanBalanceItem extends StatelessWidget {
  String title;
  void Function()? onTap;

  PlanBalanceItem({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    ScreenUtilNew.init(context);
    return Expanded(
      child: Container(
        // width: ManagerWidth.w93,
        height: ManagerHeight.h90,
        decoration: BoxDecoration(
          color: AppColors.backgroundColorChoosePlanBalance,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Column(
          children: [
            SizedBox(height: ManagerHeight.h8),
            Text(
              title,
              style: TextStyle(
                color: AppColors.backgroundColorChooseTextTitle,
                fontSize: ManagerFontSize.s14,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: ManagerHeight.h13),
            Container(
              height: ManagerHeight.h23,
              width: ManagerWidth.w59,
              decoration: BoxDecoration(
                color: AppColors.colorSelect,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Center(
                child: Text(
                  "Select",
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: ManagerFontSize.s10,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(height: ManagerHeight.h16),

          ],
        ),
      ),
    );
  }
}
