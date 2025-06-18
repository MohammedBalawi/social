import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import '../../../config/app_colors.dart';
import '../../../config/app_config.dart';
import '../../../config/manager_font_size.dart';
import '../../../config/manager_height.dart';
import '../../../config/manager_width.dart';
import '../../../config/responsive/screen_util_new.dart';
import '../../../controller/base_widgets/base_scaffold.dart';
import '../../../controller/base_widgets/button_app.dart';
import '../../controller/verfiy_email/cubit/verify_email_cubit.dart';
import '../../controller/verfiy_email/cubit/verify_email_state.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtilNew.init(context);
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return BlocProvider(
      create: (context) => VerifyEmailCubit()..loadVerifyEmailData(),
      child: BlocBuilder<VerifyEmailCubit, VerifyEmailState>(
        builder: (context, state) {
          if (state is VerifyEmailLoading) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          } else if (state is VerifyEmailLoaded) {
            final data = state.data;

            return BaseScaffold(
              backgroundColor: isDarkMode ? AppColors.black : AppColors.backgroundLight,
              appBar: _buildAppBar(context),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: ManagerHeight.h24),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w24),
                      child: Container(
                        height: ManagerHeight.h413,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          color: isDarkMode ? AppColors.backgroundDark : AppColors.white,
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: ManagerHeight.h160),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w24),
                              child: Text(
                                data.message,
                                style: TextStyle(
                                  fontFamily: "Afacad",
                                  color: isDarkMode ? AppColors.white : AppColors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: ManagerFontSize.s14,
                                ),
                              ),
                            ),
                            SizedBox(height: ManagerHeight.h41),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w16),
                              child: Align(
                                alignment: Alignment.topRight,
                                child: Text(
                                  "Edit email",
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Afacad',
                                    color: AppColors.purple,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: ManagerHeight.h8),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w16),
                              child: Container(
                                height: ManagerHeight.h44,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.r),
                                  color: AppColors.colorEmailVerfiy,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w16),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      data.email,
                                      style: TextStyle(
                                        color: AppColors.colorEmailVerfiyText,
                                        fontFamily: "Afacad",
                                        fontSize: ManagerFontSize.s18,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: ManagerHeight.h8),
                            GestureDetector(
                              onTap: () {
                                // Action for Save & Resend
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w24),
                                child: Text(
                                  "Save and resend code",
                                  style: TextStyle(
                                    fontFamily: "Afacad",
                                    color: isDarkMode ? AppColors.white : AppColors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: ManagerFontSize.s18,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: ManagerHeight.h24),
                    Pinput(
                      length: 4,
                      defaultPinTheme: PinTheme(
                        width: ManagerWidth.w64,
                        height: ManagerHeight.h64,
                        textStyle: TextStyle(
                          fontSize: ManagerFontSize.s20,
                          fontWeight: FontWeight.w600,
                          color: AppColors.black,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          color: AppColors.white,
                          border: Border.all(color: AppColors.purple),
                        ),
                      ),
                    ),
                    SizedBox(height: ManagerHeight.h24),
                    GestureDetector(
                      onTap: () {
                        final snackBar = SnackBar(
                          content: const Text("Email verified successfully",style: TextStyle(
                            color: AppColors.white
                          ),),
                          backgroundColor: isDarkMode ? AppColors.purpleDark : AppColors.purple,
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      child: ButtonApp(title: "Confirm Email", paddingWidth: ManagerWidth.w42),
                    ),
                    SizedBox(height: ManagerHeight.h8),
                    Text(
                      "Resend Code with 30 seconds",
                      style: TextStyle(
                        color: isDarkMode ? AppColors.colorEmailVerfiyText : AppColors.purple,
                        fontFamily: "Afacad",
                        fontSize: ManagerFontSize.s14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) => SizedBox(
    height: ManagerHeight.h99,
    child: Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(top: ManagerHeight.h35),
          child: Center(
            child: Text(
              "Verify Email",
              style: TextStyle(
                fontSize: ManagerFontSize.s18,
                color: AppColors.white,
                fontFamily: "ADLaMDisplay",
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Padding(
            padding: EdgeInsets.only(
              top: ManagerHeight.h47,
              left: ManagerWidth.w24,
            ),
            child: Image.asset(
              "${AppConfig.baseImagePath}/back_button.png",
              height: ManagerHeight.h40,
              width: ManagerWidth.w40,
            ),
          ),
        ),
      ],
    ),
  );
}
