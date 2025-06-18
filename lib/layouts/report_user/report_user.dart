import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marrige_app/controller/base_widgets/base_scaffold.dart';

import '../../config/app_colors.dart';
import '../../config/app_config.dart';
import '../../config/manager_font_size.dart';
import '../../config/manager_height.dart';
import '../../config/manager_width.dart';
import '../../config/responsive/screen_util_new.dart';
import '../../controller/report_a_violation/cubit/report_a_violation_cubit.dart';
import '../../models/report_model/report_model.dart';
import '../widgets/text_field_with_gradiant.dart';

class ReportUser extends StatefulWidget {
  const ReportUser({super.key});

  @override
  State<ReportUser> createState() => _ReportUserState();
}

class _ReportUserState extends State<ReportUser> {
  final _placeController = TextEditingController();
  final _typeController = TextEditingController();
  final _detailsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ScreenUtilNew.init(context);
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return BlocProvider(
      create: (_) => ReportCubit(),
      child: BlocConsumer<ReportCubit, ReportState>(
        listener: (context, state) {
          if (state.isSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: isDarkMode ? AppColors.white : AppColors.black,
                content: Text(
                  'Report submitted successfully!',
                  style: TextStyle(
                    color: isDarkMode ? AppColors.black : AppColors.white,
                    fontSize: ManagerFontSize.s14,
                    fontFamily: "Afacad",
                    fontWeight: FontWeight.w500,
                  ),
                ),
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                duration: const Duration(seconds: 3),
              ),
            );
          }
        },
        builder: (context, state) {
          return BaseScaffold(
            backgroundColor: isDarkMode ? AppColors.black : AppColors.backgroundLight,
            appBar: SizedBox(
              height: ManagerHeight.h99,
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: ManagerHeight.h35),
                    child: Center(
                      child: Text(
                        "Report a violation",
                        style: TextStyle(
                          fontSize: ManagerFontSize.s20,
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
                        right: ManagerWidth.w24,
                      ),
                      child: Image.asset(
                        "${AppConfig.baseImagePath}/back_button.png",
                        height: ManagerHeight.h40,
                        width: ManagerWidth.w40,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: ManagerWidth.w16,
                vertical: ManagerHeight.h20,
              ),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header Row
                    Container(
                      height: ManagerHeight.h50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: isDarkMode ? AppColors.black : AppColors.white,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Report about",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: ManagerFontSize.s16,
                              fontFamily: "Afacad",
                              color: isDarkMode ? AppColors.white : AppColors.black,
                            ),
                          ),
                          Text(
                            "Username",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: ManagerFontSize.s16,
                              fontFamily: "Afacad",
                              color: isDarkMode ? AppColors.white : AppColors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: ManagerHeight.h16),

                    // TextFields
                    TextFieldWithGradiant(
                      hintText: "Where is the violation",
                      controller: _placeController,
                    ),
                    SizedBox(height: ManagerHeight.h12),
                    TextFieldWithGradiant(
                      hintText: "What is the violation",
                      controller: _typeController,
                    ),
                    SizedBox(height: ManagerHeight.h12),

                    // Big TextArea
                    Container(
                      padding: EdgeInsets.all(12.r),
                      decoration: BoxDecoration(
                        color: isDarkMode ? AppColors.backgroundDark : AppColors.white,
                        borderRadius: BorderRadius.circular(12.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.05),
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: TextField(
                        controller: _detailsController,
                        maxLines: 5,
                        style: TextStyle(
                          color: AppColors.colorItemInMyAccountIcon,
                          fontFamily: "Acme",
                          fontSize: ManagerFontSize.s14,
                          fontWeight: FontWeight.w400,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: isDarkMode ? AppColors.backgroundDark : AppColors.white,
                          border: InputBorder.none,
                          hintText: "Explain more details that will help us understand the violation.",
                          hintStyle: TextStyle(
                            color: AppColors.colorItemInMyAccountIcon,
                            fontFamily: "Acme",
                            fontSize: ManagerFontSize.s14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: ManagerHeight.h16),

                    // Submit Button
                    Center(
                      child: InkWell(
                        onTap: state.isSubmitting
                            ? null
                            : () {
                          final report = ReportModel(
                            reportUsername: "Username",
                            placeOfViolation: _placeController.text,
                            typeOfViolation: _typeController.text,
                            details: _detailsController.text,
                          );
                          context.read<ReportCubit>().submitReport(report);
                        },
                        child: Container(
                          width: ManagerHeight.h170,
                          height: ManagerHeight.h44,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.r),
                            gradient: LinearGradient(
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
                              'Report a violation',
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
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
