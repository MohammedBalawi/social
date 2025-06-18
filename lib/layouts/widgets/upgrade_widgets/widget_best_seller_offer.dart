import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marrige_app/config/app_colors.dart';
import 'package:marrige_app/config/manager_font_size.dart';
import 'package:marrige_app/config/manager_height.dart';
import 'package:marrige_app/config/manager_width.dart';

import '../../../models/upgrade_model/upgrade_plan_model.dart';
class WidgetBestSellerOffer extends StatelessWidget {
  final UpgradePlanModel plan;

  const WidgetBestSellerOffer({super.key, required this.plan});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ManagerHeight.h220,
      width: ManagerWidth.w110,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.grad1Color, AppColors.grad2Color],
        ),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10.r),
          topLeft: Radius.circular(10.r),
          bottomLeft: Radius.circular(5.r),
          bottomRight: Radius.circular(5.r),
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: ManagerHeight.h4),
          Text(
            "Best Seller",
            style: TextStyle(
              fontFamily: "Afacad",
              color: AppColors.white,
              fontSize: ManagerFontSize.s14,
              fontWeight: FontWeight.w400,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: ManagerWidth.w2,
                vertical: ManagerHeight.h2,
              ),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5.r),
                    bottomRight: Radius.circular(5.r),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(plan.title,
                        style: _style(AppColors.black, ManagerFontSize.s10)),
                    Text("Get a subscription for",
                        style: _style(AppColors.subTitleInOffer, ManagerFontSize.s8)),
                    Text("${plan.days} days",
                        style: _style(AppColors.black, ManagerFontSize.s14)),
                    Text("(${plan.months})",
                        style: _style(AppColors.subTitleInOfferOpcity, ManagerFontSize.s8)),
                    Text(plan.weeklyPrice,
                        style: _style(AppColors.purple, ManagerFontSize.s20)),
                    Text("Dirham / Weekly",
                        style: _style(AppColors.purple, ManagerFontSize.s8)),
                    Text(plan.fullPrice,
                        style: _style(AppColors.subTitleInOfferOpcity2, ManagerFontSize.s5)),
                    Text(plan.saving,
                        style: _style(AppColors.black, ManagerFontSize.s8)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  TextStyle _style(Color color, double size) {
    return TextStyle(
      fontFamily: "Afacad",
      color: color,
      fontSize: size,
      fontWeight: FontWeight.w400,
    );
  }
}
