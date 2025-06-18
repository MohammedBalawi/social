import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:marrige_app/config/app_colors.dart';
import 'package:marrige_app/config/app_config.dart';
import 'package:marrige_app/config/manager_font_size.dart';
import 'package:marrige_app/config/manager_height.dart';
import 'package:marrige_app/config/manager_width.dart';
import 'package:marrige_app/config/responsive/screen_util_new.dart';
import 'package:marrige_app/controller/base_widgets/base_scaffold.dart';
import 'package:marrige_app/layouts/widgets/upgrade_widgets/feature_comparison_card.dart';
import 'package:marrige_app/layouts/widgets/upgrade_widgets/offer_cards.dart';
import 'package:marrige_app/layouts/widgets/upgrade_widgets/plan_balance_item.dart';
import 'package:marrige_app/layouts/widgets/upgrade_widgets/widget_best_seller_offer.dart';

import '../../controller/upgrade_plan/cubit/upgrade_plan_cubit.dart';
import '../../models/upgrade_model/upgrade_plan_model.dart';
import '../widgets/upgrade_widgets/offer_card_with_out_special.dart';
import '../widgets/upgrade_widgets/widget_speacil_offer.dart';

class UpgradeOneScreen extends StatelessWidget {
  const UpgradeOneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtilNew.init(context);
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return BlocProvider(
      create: (_) => UpgradeCubit()..loadUpgradePlans(),
      child: BlocBuilder<UpgradeCubit, UpgradeState>(
        builder: (context, state) {
          if (state.isLoading || state.userActivePlan == null || state.userDaysRemaining == null) {
            return  Center(child: CircularProgressIndicator(
              color: AppColors.purple,
            ));
          }
          final plan = state.userActivePlan!;
          final String planName = plan.title;
          final int totalDays = int.tryParse(plan.days) ?? 0;
          final int daysRemaining = state.userDaysRemaining!;
          final int daysUsed = totalDays - daysRemaining;
          final DateTime endDate = DateTime.now().add(Duration(days: daysRemaining));
          return BaseScaffold(
            backgroundColor:
                isDarkMode ? AppColors.black : AppColors.backgroundLight,
            appBar: _buildAppBar(),
            body:
                state.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          SizedBox(height: ManagerHeight.h64),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Subscription Progress",
                                  style: TextStyle(
                                    fontSize: ManagerFontSize.s14,
                                    fontWeight: FontWeight.bold,
                                    color: isDarkMode ? AppColors.white : AppColors.black,
                                  ),
                                ),
                                SizedBox(height: ManagerHeight.h8),

                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8.r),
                                  child: LinearProgressIndicator(
                                    value: daysUsed / totalDays,
                                    minHeight: 10.h,
                                    backgroundColor: Colors.grey.shade300,
                                    valueColor: AlwaysStoppedAnimation(AppColors.purple),
                                  ),
                                ),

                                SizedBox(height: ManagerHeight.h8),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.star, size: 18.r, color: AppColors.greenColor),
                                        SizedBox(width: 6.w),
                                        Text(
                                          "$planName Plan",
                                          style: TextStyle(
                                            fontSize: ManagerFontSize.s12,
                                            color: isDarkMode ? AppColors.white : AppColors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.calendar_today, size: 18.r, color: AppColors.purple),
                                        SizedBox(width: 6.w),
                                        Text(
                                          "Ends: ${DateFormat('dd/MM/yyyy').format(endDate)}",
                                          style: TextStyle(
                                            fontSize: ManagerFontSize.s12,
                                            color: isDarkMode ? AppColors.white : AppColors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),

                                SizedBox(height: ManagerHeight.h4),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Remaining: $daysRemaining days",
                                      style: TextStyle(
                                        fontSize: ManagerFontSize.s12,
                                        color: isDarkMode ? AppColors.white : Colors.black54,
                                      ),
                                    ),
                                    Text(
                                      "Used: $daysUsed days",
                                      style: TextStyle(
                                        fontSize: ManagerFontSize.s12,
                                        color: isDarkMode ? AppColors.white : Colors.black54,
                                      ),
                                    ),
                                    Text(
                                      "Total: $totalDays days",
                                      style: TextStyle(
                                        fontSize: ManagerFontSize.s12,
                                        color: isDarkMode ? AppColors.white : Colors.black54,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: ManagerHeight.h24),

                          GestureDetector(
                            onTap: (){
                              showPaymentDialog(context);
                            },
                              child: _buildPlanBalanceSection(isDarkMode)),
                          SizedBox(height: ManagerHeight.h16),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: ManagerWidth.w16,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                WidgetSpeacilOffer(
                                  plan: state.plans[1],
                                  secondOffer: false,
                                ),
                                WidgetBestSellerOffer(plan: state.plans[1]),
                                OfferCardWithOutSpecial(plan: state.plans[1]),
                              ],
                            ),
                          ),
                          SizedBox(height: ManagerHeight.h16),
                          OfferCards(plans: state.plans),
                          SizedBox(height: ManagerHeight.h49),
                          const FeatureComparisonCard(),
                        ],
                      ),
                    ),
          );
        },
      ),
    );
  }

  Widget _buildAppBar() {
    return SizedBox(
      height: ManagerHeight.h99,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(
            left: ManagerWidth.w66,
            top: ManagerHeight.h34,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Unlock All",
                  style: TextStyle(
                    fontSize: ManagerFontSize.s24,
                    fontWeight: FontWeight.w400,
                    color: AppColors.white,
                  ),
                ),
                Text(
                  "Upgrade your membership ",
                  style: TextStyle(
                    fontSize: ManagerFontSize.s10,
                    fontWeight: FontWeight.w400,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: ManagerHeight.h14,
            left: ManagerWidth.w14,
            child: GestureDetector(
              onTap: () {
                // Navigator.pop(null);
              },
              child: Image.asset(
                "${AppConfig.baseImagePath}/close_icon.png",
                height: ManagerHeight.h40,
                width: ManagerWidth.w40,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlanBalanceSection(bool isDarkMode) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w16),
      child: Container(
        height: ManagerHeight.h142,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color:
              isDarkMode
                  ? AppColors.colorUnlockDarK
                  : AppColors.backgroundColorChooseAPlan,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: ManagerHeight.h4,
                left: ManagerWidth.w16,
              ),
              child: Text(
                "Choose what you want to get",
                style: TextStyle(
                  color:
                      isDarkMode
                          ? AppColors.white
                          : AppColors.backgroundColorChooseTextTitle,
                  fontSize: ManagerFontSize.s10,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(height: ManagerHeight.h12),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PlanBalanceItem(title: 'Silver', onTap: () {}),
                  SizedBox(width: ManagerWidth.w8),
                  PlanBalanceItem(title: 'Golden', onTap: () {}),
                  SizedBox(width: ManagerWidth.w8),
                  PlanBalanceItem(title: 'Diamond', onTap: () {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  void showPaymentDialog(BuildContext context) {
    final paymentMethods = [
      "Visa & Mastercard",
      "PayPal",
      "Apple Pay",
      "Google Pay",
      "Bank Transfer",
      "Cash on Delivery",
    ];

    String selectedMethod = "";

    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return Dialog(
          insetPadding: EdgeInsets.all(16.w),
          backgroundColor: AppColors.dialogInUpgradeScree,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
          child: StatefulBuilder(
            builder: (context, setState) {
              return Padding(
                padding: EdgeInsets.all(16.w),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "How you want to Pay",
                        style: TextStyle(
                          fontSize: ManagerFontSize.s16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.dialogInUpgradeScree1,
                        ),
                      ),
                      SizedBox(height: ManagerHeight.h8),
                  
                      // وصف العرض
                      Text(
                        "Get Offer1 with 150 days for 202 Dirham",
                        style: TextStyle(
                          fontSize: ManagerFontSize.s14,
                          color: AppColors.dialogInUpgradeScree1,
                        ),
                      ),
                      SizedBox(height: ManagerHeight.h16),
                  
                      // الشبكة: Grid من الخيارات
                      GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: paymentMethods.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 12.h,
                          crossAxisSpacing: 12.w,
                          childAspectRatio: 1,
                        ),
                        itemBuilder: (context, index) {
                          final method = paymentMethods[index];
                          final isSelected = method == selectedMethod;
                  
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedMethod = method;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: isSelected ? Colors.brown[300] : Colors.white,
                                borderRadius: BorderRadius.circular(10.r),
                                border: Border.all(
                                  color: isSelected ? Colors.brown : Colors.grey.shade300,
                                  width: 2,
                                ),
                              ),
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  method,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: ManagerFontSize.s12,
                                    fontWeight: FontWeight.w500,
                                    color: isSelected ? Colors.white : Colors.black87,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

}
