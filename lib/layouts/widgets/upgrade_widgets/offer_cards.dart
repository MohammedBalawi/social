
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marrige_app/config/app_colors.dart';
import 'package:marrige_app/config/manager_font_size.dart';
import 'package:marrige_app/config/manager_height.dart';
import 'package:marrige_app/config/manager_width.dart';
import '../../../models/upgrade_model/upgrade_plan_model.dart';
import 'offer_card_with_out_special.dart';
import 'widget_speacil_offer.dart';

class OfferCards extends StatelessWidget {
  final List<UpgradePlanModel> plans;

  const OfferCards({super.key, required this.plans});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: List.generate(plans.length, (index) {
          final plan = plans[index];
          if (index == 1 && plan.isSpecial) {
            return WidgetSpeacilOffer(plan: plan, secondOffer: false);
          } else {
            return OfferCardWithOutSpecial(plan: plan);
          }
        }),
      ),
    );
  }
}
