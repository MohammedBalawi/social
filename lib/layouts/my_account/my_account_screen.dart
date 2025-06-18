import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marrige_app/config/app_colors.dart';
import 'package:marrige_app/config/manager_font_size.dart';
import 'package:marrige_app/config/manager_height.dart';
import 'package:marrige_app/config/manager_width.dart';
import 'package:marrige_app/config/responsive/screen_util_new.dart';
import 'package:marrige_app/controller/my_account/cubit/my_account_cubit.dart';
import 'package:marrige_app/layouts/widgets/my_account_widgets/error_account_widget.dart';
import 'package:marrige_app/layouts/widgets/my_account_widgets/my_account_item.dart';
import 'package:marrige_app/layouts/widgets/my_account_widgets/settings_item.dart';
import 'package:marrige_app/config/app_config.dart';
import '../upgrade/upgrade_one_screen.dart';

class MyAccountScreen extends StatelessWidget {
  const MyAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtilNew.init(context);
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return BlocProvider(
      create: (_) => MyAccountCubit()..loadMyAccountFromJson(),
      child: BlocBuilder<MyAccountCubit, MyAccountState>(
        builder: (context, state) {
          if (state is MyAccountLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is MyAccountLoaded) {
            final data = state.myAccountModel;

            return Scaffold(
              backgroundColor: isDarkMode ? AppColors.black : AppColors.backgroundLight,
              body: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(
                      height: ManagerHeight.h318,
                      child: Stack(
                        children: [
                          Container(
                            height: ManagerHeight.h294,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: isDarkMode
                                  ? AppColors.purpleDark
                                  : AppColors.backGroundWidgetOne,
                            ),
                            child: Column(
                              children: [
                                SizedBox(height: ManagerHeight.h44),
                                SizedBox(
                                  height: ManagerHeight.h111,
                                  width: ManagerWidth.w111,
                                  child: Stack(
                                    children: [
                                      Center(
                                        child: ClipOval(
                                          child: CachedNetworkImage(
                                            imageUrl: data.imageUrl,
                                            height: ManagerHeight.h84,
                                            width: ManagerWidth.w79,
                                            fit: BoxFit.cover,
                                            placeholder: (context, url) =>
                                                Container(color: Colors.grey.shade200, child: const Center(child: CircularProgressIndicator(strokeWidth: 2))),
                                            errorWidget: (context, url, error) =>
                                                Container(color: Colors.grey.shade300, child: const Icon(Icons.error, color: Colors.red)),
                                          ),
                                        ),
                                      ),
                                      Center(
                                        child: Image.asset(
                                          "${AppConfig.baseImagePath}/my_account_image_picker.png",
                                          height: ManagerHeight.h108,
                                          width: ManagerWidth.w111,
                                          fit: BoxFit.fitHeight,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: ManagerHeight.h14),
                                Text(
                                  "${data.username}, ${data.age}",
                                  style: TextStyle(
                                    color: isDarkMode ? AppColors.white : AppColors.black,
                                    fontSize: ManagerFontSize.s24,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  data.location,
                                  style: TextStyle(
                                    color: isDarkMode ? AppColors.white : AppColors.semiTransparentBlueGray,
                                    fontSize: ManagerFontSize.s14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: ManagerWidth.w16,
                              right: ManagerWidth.w16,
                              top: ManagerHeight.h240,
                            ),
                            child: Container(
                              height: ManagerHeight.h74,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.r),
                                color: isDarkMode ? AppColors.purpleTwo : AppColors.purple,
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w12),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "${AppConfig.baseImagePath}/quen.png",
                                      height: ManagerHeight.h24,
                                      width: ManagerWidth.w24,
                                    ),
                                    SizedBox(width: ManagerWidth.w16),
                                    SizedBox(
                                      width: ManagerWidth.w164,
                                      child: Text(
                                        "Upgrade your membership type and unluck all feauters",
                                        maxLines: 2,
                                        style: TextStyle(
                                          color: AppColors.white,
                                          fontSize: ManagerFontSize.s12,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Expanded(child: SizedBox()),
                                    Container(
                                      height: ManagerHeight.h36,
                                      width: ManagerWidth.w111,
                                      decoration: BoxDecoration(
                                        color: AppColors.colorButtonInUpgrade,
                                        borderRadius: BorderRadius.circular(32.r),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Upgrade",
                                          style: TextStyle(
                                            color: AppColors.white,
                                            fontSize: ManagerFontSize.s14,
                                            fontWeight: FontWeight.w400,
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
                    SizedBox(height: ManagerHeight.h16),
                    if (!data.hasCompletedAccount || !data.hasConfirmedPhone)
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w16),
                        child: Container(
                          height: ManagerHeight.h107,
                          decoration: BoxDecoration(
                            color: AppColors.colorRedWithOpcity,
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w12),
                            child: Column(
                              children: [
                                if (!data.hasCompletedAccount)
                                  ErrorAccountWidget(title: "You have to complete your account"),
                                if (!data.hasConfirmedPhone)
                                  ErrorAccountWidget(title: "You need to confirm your mobile number"),
                              ],
                            ),
                          ),
                        ),
                      ),
                    SizedBox(height: ManagerHeight.h16),
                    MyAccountItem(
                      title: 'Spotlight - Make your profile on top',
                      pathIconLight: "${AppConfig.baseImagePath}/spolight_icon.png",
                      pathIconDark: "${AppConfig.baseImagePath}/spolight_icon.png",
                      heightIcon: ManagerHeight.h30,
                      widthIcon: ManagerWidth.w20,
                    ),
                    SizedBox(height: ManagerHeight.h16),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => const UpgradeOneScreen()));
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w16),
                        child: Container(
                          width: double.infinity,
                          height: ManagerHeight.h91,
                          decoration: BoxDecoration(
                            color: isDarkMode ? AppColors.purpleGradaint : AppColors.primaryLightPurple,
                            borderRadius: BorderRadius.circular(18.r),
                          ),
                          child: Stack(
                            children: [
                              Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w8),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        "${AppConfig.baseImagePath}/gift_icon.png",
                                        width: ManagerWidth.w40,
                                        height: ManagerHeight.h60,
                                      ),
                                      SizedBox(width: ManagerWidth.w5),
                                      Text(
                                        'Upgrade Account - Special offer',
                                        style: TextStyle(
                                          fontSize: ManagerFontSize.s14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Expanded(child: SizedBox()),
                                      Icon(Icons.arrow_forward_ios, color: AppColors.white),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                right: ManagerWidth.w24,
                                top: ManagerHeight.h6,
                                child: Text(
                                  "-50%",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: ManagerFontSize.s14,
                                    color: AppColors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: ManagerHeight.h16),
                    MyAccountItem(
                      title: 'Additional ways to communicate',
                      pathIconLight: "${AppConfig.baseImagePath}/addtional_icon.png",
                      pathIconDark: "${AppConfig.baseImagePath}/spolight_icon.png",
                      heightIcon: ManagerHeight.h30,
                      widthIcon: ManagerWidth.w20,
                    ),
                    SizedBox(height: ManagerHeight.h16),
                    MyAccountItem(
                      title: 'My photo and album photos',
                      pathIconLight: "${AppConfig.baseImagePath}/camera_icon.png",
                      pathIconDark: "${AppConfig.baseImagePath}/spolight_icon.png",
                      heightIcon: ManagerHeight.h30,
                      widthIcon: ManagerWidth.w23,
                    ),
                    SizedBox(height: ManagerHeight.h16),
                    ExpandableSettingsItem(),
                    SizedBox(height: ManagerHeight.h16),
                    MyAccountItem(
                      title: 'Successful stories',
                      pathIconLight: "${AppConfig.baseImagePath}/sccessfull_story.png",
                      pathIconDark: "${AppConfig.baseImagePath}/spolight_icon.png",
                      heightIcon: ManagerHeight.h30,
                      widthIcon: ManagerWidth.w23,
                    ),
                    SizedBox(height: ManagerHeight.h16),
                    MyAccountItem(
                      title: 'Help  & Support',
                      pathIconLight: "${AppConfig.baseImagePath}/help_and_support_icon.png",
                      pathIconDark: "${AppConfig.baseImagePath}/spolight_icon.png",
                      heightIcon: ManagerHeight.h30,
                      widthIcon: ManagerWidth.w23,
                    ),
                    SizedBox(height: ManagerHeight.h16),
                    MyAccountItem(
                      title: 'Disable and close my account',
                      pathIconLight: "${AppConfig.baseImagePath}/disable_and_close.png",
                      pathIconDark: "${AppConfig.baseImagePath}/spolight_icon.png",
                      heightIcon: ManagerHeight.h30,
                      widthIcon: ManagerWidth.w23,
                    ),
                    SizedBox(height: ManagerHeight.h16),
                    MyAccountItem(
                      title: 'Logout',
                      pathIconLight: "${AppConfig.baseImagePath}/logout_icon.png",
                      pathIconDark: "${AppConfig.baseImagePath}/spolight_icon.png",
                      heightIcon: ManagerHeight.h30,
                      widthIcon: ManagerWidth.w23,
                    ),
                    SizedBox(height: ManagerHeight.h108),
                  ],
                ),
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
