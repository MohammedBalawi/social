import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/app_colors.dart';
import '../../config/app_config.dart';
import '../../config/manager_font_size.dart';
import '../../config/manager_height.dart';
import '../../config/manager_width.dart';
import '../../config/responsive/screen_util_new.dart';
import '../../controller/base_widgets/base_scaffold.dart';
import '../../controller/email_support/cubit/email_support_cubit.dart';
import '../../models/email_support/email_support_model.dart';
import '../widgets/text_field_with_gradiant.dart';

class EmailSupport extends StatefulWidget {
  const EmailSupport({super.key});

  @override
  State<EmailSupport> createState() => _EmailSupportState();
}

class _EmailSupportState extends State<EmailSupport> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ScreenUtilNew.init(context);
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return BlocProvider(
      create: (_) => EmailSupportCubit(),
      child: BlocConsumer<EmailSupportCubit, EmailSupportState>(
        listener: (context, state) {
          if (state.isSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: isDarkMode ? AppColors.white : AppColors.black,
                content: Text(
                  'Email sent successfully!',
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
              ),
            );
          }
        },
        builder: (context, state) {
          return BaseScaffold(
            backgroundColor:
            isDarkMode ? AppColors.black : AppColors.backgroundLight,
            appBar: SizedBox(
              height: ManagerHeight.h99,
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: ManagerHeight.h35),
                    child: Center(
                      child: Text(
                        "Email Support",
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
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: ManagerHeight.h48),

                    /// Name
                    TextFieldWithGradiant(
                      hintText: " Write your name here ",
                      controller: _nameController,
                    ),
                    SizedBox(height: ManagerHeight.h16),

                    /// Email
                    TextFieldWithGradiant(
                      hintText: " Write your email here ",
                      controller: _emailController,
                    ),
                    SizedBox(height: ManagerHeight.h12),

                    /// Message
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
                        controller: _messageController,
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
                          hintText: "",
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

                    /// Send Button
                    Center(
                      child: InkWell(
                        onTap: state.isSending
                            ? null
                            : () {
                          final model = EmailSupportModel(
                            name: _nameController.text,
                            email: _emailController.text,
                            message: _messageController.text,
                          );
                          context.read<EmailSupportCubit>().sendEmail(model);
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
                            child: state.isSending
                                ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              ),
                            )
                                : Text(
                              'Send Email',
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

                    SizedBox(height: ManagerHeight.h52),

                    /// Support by Website
                    Container(
                      width: ManagerWidth.w90,
                      height: ManagerHeight.h65,
                      decoration: BoxDecoration(
                        color: isDarkMode ? AppColors.backgroundDark : AppColors.white,
                        borderRadius: BorderRadius.circular(10.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "${AppConfig.baseImagePath}/support_wibsite_icon.png",
                            width: ManagerWidth.w18,
                            height: ManagerHeight.h23,
                          ),
                          SizedBox(height: ManagerHeight.h4),
                          Text(
                            'Support via Website',
                            style: TextStyle(
                              color: isDarkMode ? AppColors.white : AppColors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: ManagerFontSize.s8,
                              fontFamily: "Afacad",
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
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
