import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/app_colors.dart';
import '../../config/manager_font_size.dart';
import '../../config/manager_height.dart';
import '../../config/manager_width.dart';
import '../../config/responsive/screen_util_new.dart';
import '../../controller/rate_us/cubit/rate_us_cubit.dart';
import '../../models/rate/rate_us_model.dart';

class RateUsScreen extends StatelessWidget {
  const RateUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtilNew.init(context);
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final TextEditingController controller = TextEditingController();

    return BlocProvider(
      create: (_) => RateUsCubit(),
      child: BlocConsumer<RateUsCubit, RateUsState>(
        listener: (context, state) {
          if (state.isSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: isDarkMode ? AppColors.white : AppColors.black,
                content: Text(
                  'Thank you for your feedback!',
                  style: TextStyle(
                    color: isDarkMode ? AppColors.black : AppColors.white,
                    fontFamily: "Afacad",
                    fontSize: ManagerFontSize.s14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: isDarkMode
                ? AppColors.darkBackgroundCool
                : AppColors.backgroundLight,
            body: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom + 16,
                  ),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minHeight: constraints.maxHeight),
                    child: IntrinsicHeight(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Header
                          Container(
                            height: ManagerHeight.h218,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: isDarkMode
                                  ? AppColors.purpleDark
                                  : AppColors.purple,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(50.r),
                              ),
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  top: ManagerHeight.h138,
                                  left: ManagerWidth.w67,
                                  child: Text(
                                    "Rate us",
                                    style: TextStyle(
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w400,
                                      fontSize: ManagerFontSize.s40,
                                      fontFamily: "Afacad",
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Body
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: ManagerWidth.w16,
                              vertical: ManagerHeight.h24,
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height: ManagerHeight.h422,
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: isDarkMode ? AppColors.black : AppColors.white,
                                    border: Border.all(
                                      color: isDarkMode
                                          ? Colors.transparent
                                          : AppColors.borderColor,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(16),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        blurRadius: 10,
                                        offset: const Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                  child: TextField(
                                    controller: controller,
                                    expands: true,
                                    maxLines: null,
                                    minLines: null,
                                    style: TextStyle(
                                      color: isDarkMode ? AppColors.white : AppColors.black,
                                      fontFamily: "Afacad",
                                      fontWeight: FontWeight.w400,
                                      fontSize: ManagerFontSize.s16,
                                    ),
                                    keyboardType: TextInputType.multiline,
                                    decoration: InputDecoration(
                                      hintText: 'Enter Your Rate',
                                      hintStyle: TextStyle(
                                        color: isDarkMode
                                            ? AppColors.white
                                            : AppColors.black,
                                        fontFamily: "Afacad",
                                        fontWeight: FontWeight.w400,
                                        fontSize: ManagerFontSize.s16,
                                      ),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                                SizedBox(height: ManagerHeight.h16),

                                InkWell(
                                  onTap: state.isSubmitting
                                      ? null
                                      : () {
                                    final rateModel = RateUsModel(
                                      message: controller.text,
                                    );
                                    context.read<RateUsCubit>().submitRating(rateModel);
                                  },
                                  child: Container(
                                    width: ManagerHeight.h170,
                                    height: ManagerHeight.h44,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25.r),
                                      gradient: const LinearGradient(
                                        colors: [
                                          AppColors.grad1Color,
                                          AppColors.grad2Color,
                                        ],
                                      ),
                                    ),
                                    child: Center(
                                      child: state.isSubmitting
                                          ? const SizedBox(
                                        width: 20,
                                        height: 20,
                                        child: CircularProgressIndicator(
                                          color: Colors.white,
                                          strokeWidth: 2,
                                        ),
                                      )
                                          : Text(
                                        'Rate and Continue',
                                        style: TextStyle(
                                          color: AppColors.white,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Afacad",
                                          fontSize: ManagerFontSize.s14,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 16),
                              ],
                            ),
                          ),

                          // Later button
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: ManagerWidth.w24,
                            ),
                            child: GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: Text(
                                "Later",
                                style: TextStyle(
                                  color: AppColors.colorLater,
                                  fontFamily: "Afacad",
                                  fontSize: ManagerFontSize.s16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
