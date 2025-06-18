import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import '../../config/app_colors.dart';
import '../../config/app_config.dart';
import '../../config/manager_font_size.dart';
import '../../config/manager_height.dart';
import '../../config/manager_width.dart';
import '../../controller/base_widgets/base_scaffold.dart';
import '../../controller/base_widgets/button_app.dart';
import '../../controller/confrim_mobile/cubit/confirm_mobile_cubit.dart';
import '../../controller/confrim_mobile/cubit/confirm_mobile_state.dart';

class ConfirmMobileScreen extends StatelessWidget {
  const ConfirmMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    final TextEditingController pinController = TextEditingController();
    final FocusNode pinFocusNode = FocusNode();

    return BlocProvider(
      create: (context) => ConfirmMobileCubit()..loadDataFromJson(),
      child: BlocBuilder<ConfirmMobileCubit, ConfirmMobileState>(
        builder: (context, state) {
          if (state is ConfirmMobileLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ConfirmMobileLoaded) {
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
                        height: ManagerHeight.h340,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          color: isDarkMode ? AppColors.backgroundDark : AppColors.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: ManagerHeight.h190),
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
                            SizedBox(height: ManagerHeight.h16),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w24),
                              child: Row(
                                children: [
                                  Text(
                                    data.phone,
                                    style: TextStyle(
                                      color: isDarkMode ? AppColors.white : AppColors.dialogBackgroundDark,
                                      fontWeight: FontWeight.bold,
                                      fontSize: ManagerFontSize.s14,
                                      fontFamily: "Afacad",
                                    ),
                                  ),
                                  SizedBox(width: ManagerWidth.w16),
                                  Text(
                                    "Edit number",
                                    style: TextStyle(
                                      color: AppColors.purple,
                                      fontWeight: FontWeight.bold,
                                      fontSize: ManagerFontSize.s16,
                                      fontFamily: "Afacad",
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: ManagerHeight.h24),
                    Pinput(
                      controller: pinController,
                      focusNode: pinFocusNode,
                      length: 4,
                      defaultPinTheme: PinTheme(
                        width: ManagerWidth.w64,
                        height: ManagerHeight.h64,
                        textStyle: TextStyle(
                          fontSize: ManagerFontSize.s20,
                          fontWeight: FontWeight.w600,
                          color:  AppColors.black ,
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
                          content:  Text("Code confirmed successfully",style: TextStyle(
                            color: AppColors.white
                          ),),
                          backgroundColor: isDarkMode ? AppColors.purpleDark : AppColors.purple,
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      child: ButtonApp(
                        title: "Confirm Email",
                        paddingWidth: ManagerWidth.w42,
                      ),
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
          } else if (state is ConfirmMobileError) {
            return Center(child: Text(state.message));
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
              "Confirm Mobile",
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
