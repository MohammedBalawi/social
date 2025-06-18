import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marrige_app/config/app_colors.dart';
import 'package:marrige_app/config/manager_font_size.dart';
import 'package:marrige_app/config/manager_height.dart';
import 'package:marrige_app/config/manager_width.dart';
import '../../config/responsive/screen_util_new.dart';
import '../../controller/speical_offer/cubit/speical_offer_cubit.dart';

class SpecialOfferScreen extends StatelessWidget {
  const SpecialOfferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtilNew.init(context);
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return BlocProvider(
      create: (_) => SpecialOfferCubit()..loadOffer(),
      child: BlocBuilder<SpecialOfferCubit, SpecialOfferState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator(
                color: AppColors.purple,
              )),
            );
          }

          final offer = state.offer!;
          return WillPopScope(
            onWillPop: () async {
              SystemChrome.setPreferredOrientations([
                DeviceOrientation.portraitUp,
                DeviceOrientation.portraitDown,
                DeviceOrientation.landscapeLeft,
                DeviceOrientation.landscapeRight,
              ]);
              return true;
            },
            child: Scaffold(
              body: Stack(
                children: [
                  Container(
                    height: ManagerHeight.h496,
                    width: double.infinity,
                    decoration: BoxDecoration(color: AppColors.backgroundOfferScreen),
                    child: Column(
                      children: [
                        SizedBox(height: ManagerHeight.h38),
                        Container(
                          height: ManagerHeight.h225,
                          width: ManagerWidth.w225,
                          decoration: const BoxDecoration(
                            color: AppColors.black,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              "SALE",
                              style: TextStyle(
                                color: AppColors.white,
                                fontFamily: "Lato",
                                fontSize: ManagerFontSize.s64,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: ManagerHeight.h38),
                        Text(
                          offer.discount,
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: ManagerFontSize.s44,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Lato",
                          ),
                        ),
                        Text(
                          "Get this exclusive limited offer!",
                          style: TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: ManagerFontSize.s16,
                            fontFamily: "Lato",
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      const Expanded(child: SizedBox()),
                      Container(
                        height: ManagerHeight.h364,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: isDarkMode ? AppColors.black : AppColors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24.r),
                            topRight: Radius.circular(24.r),
                          ),
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: ManagerHeight.h24),
                            Text(
                              "SELECT YOUR PLAN",
                              style: TextStyle(
                                color: isDarkMode ? AppColors.white : AppColors.black,
                                fontFamily: "Lato",
                                fontSize: ManagerFontSize.s15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: ManagerHeight.h18),
                            SizedBox(
                              height: ManagerHeight.h80,
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: SizedBox(
                                      height: ManagerHeight.h70,
                                      child: Stack(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w24),
                                            child: Container(
                                              height: ManagerHeight.h70,
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(4.r),
                                                gradient: LinearGradient(
                                                  colors: [
                                                    AppColors.gradOfferOneColor,
                                                    AppColors.gradOfferTwoColor,
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w28),
                                            child: Center(
                                              child: Container(
                                                height: ManagerHeight.h62,
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: AppColors.backgroundOfferCard,
                                                ),
                                                child: Stack(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Padding(
                                                          padding: EdgeInsets.only(
                                                            top: ManagerHeight.h8,
                                                            left: ManagerWidth.w20,
                                                          ),
                                                          child: Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              Text(
                                                                offer.title,
                                                                style: TextStyle(
                                                                  color: AppColors.black,
                                                                  fontWeight: FontWeight.w900,
                                                                  fontFamily: "Lato",
                                                                  fontSize: ManagerFontSize.s14,
                                                                ),
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Text(
                                                                    "\$${offer.price}",
                                                                    style: TextStyle(
                                                                      color: AppColors.textColorOffer,
                                                                      fontWeight: FontWeight.w900,
                                                                      fontFamily: "Lato",
                                                                      fontSize: ManagerFontSize.s14,
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    "/ ${offer.currency}",
                                                                    style: TextStyle(
                                                                      color: AppColors.black,
                                                                      fontWeight: FontWeight.w400,
                                                                      fontFamily: "Lato",
                                                                      fontSize: ManagerFontSize.s14,
                                                                    ),
                                                                  ),
                                                                  SizedBox(width: ManagerWidth.w18),
                                                                  Text(
                                                                    offer.usdPrice,
                                                                    style: TextStyle(
                                                                      color: AppColors.textSubColorOffer,
                                                                      fontWeight: FontWeight.w400,
                                                                      fontFamily: "Lato",
                                                                      fontSize: ManagerFontSize.s12,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Align(
                                                      alignment: Alignment.bottomRight,
                                                      child: Container(
                                                        height: ManagerHeight.h26,
                                                        width: ManagerWidth.w44,
                                                        decoration: BoxDecoration(
                                                          color: AppColors.colorOffer,
                                                          borderRadius: BorderRadius.only(
                                                            topLeft: Radius.circular(4.r),
                                                          ),
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            offer.discount,
                                                            style: TextStyle(
                                                              fontFamily: "Lato",
                                                              fontSize: ManagerFontSize.s15,
                                                              fontWeight: FontWeight.bold,
                                                              color: AppColors.white,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: ManagerWidth.w44),
                                    child: Align(
                                      alignment: Alignment.topRight,
                                      child: Container(
                                        height: ManagerHeight.h26,
                                        width: ManagerWidth.w107,
                                        decoration: BoxDecoration(
                                          color: AppColors.textColorOffer,
                                          borderRadius: BorderRadius.circular(6.r),
                                        ),
                                        child: Center(
                                          child: Text(
                                            offer.details,
                                            style: TextStyle(
                                              color:  AppColors.white,
                                              fontFamily: "Lato",
                                              fontSize: ManagerFontSize.s14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: ManagerHeight.h86),
                            _buildWidgetButtonOffer(),
                            SizedBox(height: ManagerHeight.h12),
                            Text(
                              "No thanks",
                              style: TextStyle(
                                color: AppColors.textColorOffer,
                                fontFamily: "Lato",
                                fontSize: ManagerFontSize.s15,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                                decorationColor: AppColors.textColorOffer,
                                decorationThickness: 0.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildWidgetButtonOffer() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w16),
      child: Container(
        height: ManagerHeight.h54,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          gradient: LinearGradient(
            colors: [AppColors.gradOfferOneColor, AppColors.gradOfferTwoColor],
          ),
        ),
        child: Center(
          child: Text(
            "Get the offer",
            style: TextStyle(
              color: AppColors.white,
              fontFamily: "Lato",
              fontSize: ManagerFontSize.s15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
