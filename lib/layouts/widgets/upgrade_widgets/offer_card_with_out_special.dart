
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marrige_app/config/app_colors.dart';
import 'package:marrige_app/config/manager_font_size.dart';
import 'package:marrige_app/config/manager_height.dart';
import 'package:marrige_app/config/manager_width.dart';
import '../../../models/upgrade_model/upgrade_plan_model.dart';

class OfferCardWithOutSpecial extends StatelessWidget {
  final UpgradePlanModel plan;

  const OfferCardWithOutSpecial({super.key, required this.plan});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ManagerHeight.h200,
      width: ManagerWidth.w110,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.grad1Color, AppColors.grad2Color],
        ),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(ManagerHeight.h2),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: _buildCardContent(),
        ),
      ),
    );
  }

  Widget _buildCardContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(plan.title, style: _style(AppColors.black, ManagerFontSize.s8)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w2),
          child: Text("Get a subscription for",
              style: _style(AppColors.subTitleInOffer, ManagerFontSize.s8),
              maxLines: 1,
              overflow: TextOverflow.ellipsis),
        ),
        Text("${plan.days} days", style: _style(AppColors.black, ManagerFontSize.s14)),
        Text("(${plan.months})", style: _style(AppColors.subTitleInOfferOpcity, ManagerFontSize.s8)),
        Text(plan.weeklyPrice, style: _style(AppColors.purple, ManagerFontSize.s20)),
        Text("Dirham / Weekly", style: _style(AppColors.purple, ManagerFontSize.s8)),
        Text(plan.fullPrice, style: _style(AppColors.subTitleInOfferOpcity2, ManagerFontSize.s5)),
        Text(plan.saving, style: _style(AppColors.black, ManagerFontSize.s8)),
      ],
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
