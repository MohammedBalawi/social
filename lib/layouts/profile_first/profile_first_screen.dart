import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marrige_app/config/app_colors.dart';
import 'package:marrige_app/config/app_config.dart';
import 'package:marrige_app/config/manager_font_size.dart';
import 'package:marrige_app/config/manager_height.dart';
import 'package:marrige_app/config/manager_width.dart';
import 'package:marrige_app/config/responsive/screen_util_new.dart';
import '../../controller/profile_first/cubit/profile_first_cubit.dart';
import '../../models/profile_first/profile_model.dart';

class ProfileFirstScreen extends StatelessWidget {
  const ProfileFirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtilNew.init(context);
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return BlocProvider(
      create: (_) => ProfileCubit()..loadProfile(),
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          final profile = state.profile!;

          return Scaffold(
            body: SafeArea(
              bottom: false,
              child: SingleChildScrollView(
                child: Stack(
                  children: [
                    _buildTopImageSection(profile, isDarkMode),
                    Padding(
                      padding: EdgeInsets.only(top: ManagerHeight.h348),
                      child: _buildDetailsSection(profile, isDarkMode),
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

  Widget _buildTopImageSection(ProfileModel profile, bool isDarkMode) {
    return SizedBox(
      width: double.infinity,
      height: ManagerHeight.h440,
      child: Stack(
        children: [
          CachedNetworkImage(
            imageUrl:
            "https://plus.unsplash.com/premium_photo-1673792686302-7555a74de717?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
            fit: BoxFit.cover,
            width: double.infinity,
            height: ManagerHeight.h440,
            placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          Positioned(
            top: ManagerHeight.h8,
            left: ManagerWidth.w8,
            child: _buildBackButton(isDarkMode),
          ),
          Positioned(
            top: ManagerHeight.h8,
            right: ManagerWidth.w8,
            child: _buildVipBadge(),
          ),
          Positioned(
            bottom: ManagerHeight.h105,
            left: 0,
            right: 0,
            child: _buildUserInfo(profile),
          ),
        ],
      ),
    );
  }

  Widget _buildBackButton(bool isDarkMode) {
    return Container(
      padding: EdgeInsets.all(ManagerHeight.h6),
      decoration: BoxDecoration(
        color: AppColors.unActiveColorScroll.withOpacity(0.5),
      ),
      child: Container(
        padding: EdgeInsets.all(ManagerHeight.h6),
        decoration: BoxDecoration(
          color: isDarkMode ? AppColors.black : AppColors.purple,
        ),
        child: const Icon(Icons.arrow_back_ios, color: AppColors.white, size: 14),
      ),
    );
  }

  Widget _buildVipBadge() {
    return Container(
      height: ManagerHeight.h38,
      width: ManagerWidth.w100,
      decoration: BoxDecoration(
        color: AppColors.white.withOpacity(0.5),
      ),
      child: Row(
        children: [
          Image.asset("${AppConfig.baseImagePath}/vip.png",
              width: ManagerWidth.w65, height: ManagerHeight.h28),
          Container(
            height: ManagerHeight.h20,
            width: ManagerWidth.w20,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.greenColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserInfo(ProfileModel profile) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w32),
      child: Container(
        height: ManagerHeight.h84,
        width: ManagerWidth.w375,
        color: AppColors.white.withOpacity(0.5),
        padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w16),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  profile.name,
                  style: TextStyle(
                    fontSize: ManagerFontSize.s20,
                    fontFamily: "Acme",
                    color: AppColors.white,
                  ),
                ),
                Row(
                  children: [
                    Image.asset("${AppConfig.baseImagePath}/nationality_icon.png",
                        height: ManagerHeight.h14),
                    SizedBox(width: ManagerWidth.w4),
                    Text("Nationality ${profile.nationality}",
                        style: TextStyle(
                            fontSize: ManagerFontSize.s10,
                            fontFamily: "Acme",
                            color: AppColors.white)),
                  ],
                ),
                SizedBox(height: ManagerHeight.h4,),
                Row(
                  children: [
                    Image.asset("${AppConfig.baseImagePath}/location_icon.png",
                        height: ManagerHeight.h14),
                    SizedBox(width: ManagerWidth.w4),
                    Text("Location ${profile.location}",
                        style: TextStyle(
                            fontSize: ManagerFontSize.s10,
                            fontFamily: "Acme",
                            color: AppColors.white)),
                  ],
                ),
              ],
            ),
            const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(profile.age,
                    style: TextStyle(
                        fontSize: ManagerFontSize.s12,
                        fontFamily: "Acme",
                        color: AppColors.white)),
                Text(profile.types,
                    style: TextStyle(
                        fontSize: ManagerFontSize.s10,
                        fontFamily: "Acme",
                        color: AppColors.white)),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildDetailsSection(ProfileModel profile, bool isDarkMode) {
    return Container(
      height: ManagerHeight.h469,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(32.r)),
        color: isDarkMode ? AppColors.black : AppColors.backgroundLight,
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: ManagerHeight.h24),
            _buildActionIcons(isDarkMode),
            SizedBox(height: ManagerHeight.h8),
            _buildTextSection("I want my partner to be", profile.bio, isDarkMode),
            SizedBox(height: ManagerHeight.h14),
            _buildTextSection("More information about him/her", profile.moreInfo, isDarkMode),
            SizedBox(height: ManagerHeight.h14),
            _buildWidgetSoicalMedia(profile.socialIcons, isDarkMode),
            ...profile.personalInfo.map((e) => _buildPersonalInfoCard(e, isDarkMode)),
            SizedBox(height: ManagerHeight.h230),
            _buildBlockUserAndReport(Icons.block, 'Block this user'),
            SizedBox(height: ManagerHeight.h16),
            _buildBlockUserAndReport(Icons.report, "Report Admin about this user"),
            SizedBox(height: ManagerHeight.h64),
          ],
        ),
      ),
    );
  }

  Widget _buildActionIcons(bool isDarkMode) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w16),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: ManagerHeight.h24,
          vertical: ManagerHeight.h14,
        ),
        height: ManagerHeight.h90,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40.r),
          color:
          isDarkMode
              ? AppColors.backgroundDark
              : AppColors.borderColor,
        ),
        child: Stack(
          children: [
            Center(
              child: Container(
                height: ManagerHeight.h90,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40.r),
                  color:
                  isDarkMode
                      ? AppColors.black
                      : AppColors.backgroundLight,
                ),
              ),
            ),
            Center(
              child: Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "${AppConfig.baseImagePath}/sms_icon.png",
                    height: ManagerHeight.h50,
                    width: ManagerWidth.w50,
                  ),
                  Image.asset(
                    "${AppConfig.baseImagePath}/messages_icon.png",
                    height: ManagerHeight.h50,
                    width: ManagerWidth.w50,
                  ),
                  Image.asset(
                    "${AppConfig.baseImagePath}/heart_circle_icon.png",
                    height: ManagerHeight.h50,
                    width: ManagerWidth.w50,
                  ),
                  Image.asset(
                    "${AppConfig.baseImagePath}/inbox_circle_icon.png",
                    height: ManagerHeight.h50,
                    width: ManagerWidth.w50,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextSection(String title, String content, bool isDarkMode) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w16),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: isDarkMode ? AppColors.backgroundDark : AppColors.borderColor,
        ),
        padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w8, vertical: ManagerHeight.h4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: TextStyle(
                    color: isDarkMode
                        ? AppColors.white.withOpacity(0.5)
                        : AppColors.black.withOpacity(0.5),
                    fontSize: ManagerFontSize.s16,
                    fontFamily: "Acme")),
            Text(content,
                style: TextStyle(
                    color: isDarkMode ? AppColors.white : AppColors.black,
                    fontSize: ManagerFontSize.s16,
                    fontFamily: "Acme")),
          ],
        ),
      ),
    );
  }

  Widget _buildWidgetSoicalMedia(List<String> icons, bool isDarkMode) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w16),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: isDarkMode ? AppColors.backgroundDark : AppColors.borderColor,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w8, vertical: ManagerHeight.h8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("This member wishes to be contacted directly on",
                style: TextStyle(
                  color: isDarkMode
                      ? AppColors.white.withOpacity(0.6)
                      : AppColors.black.withOpacity(0.6),
                  fontSize: ManagerFontSize.s14,
                  fontFamily: "Acme",
                )),
            SizedBox(height: ManagerHeight.h8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: icons.map((iconPath) {
                return Container(
                  height: ManagerHeight.h34,
                  width: ManagerWidth.w27,
                  decoration: BoxDecoration(color: Colors.pink.shade100),
                  child: Center(
                    child: Image.asset(
                      iconPath,
                      width: 24,
                      height: 24,
                      fit: BoxFit.contain,
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPersonalInfoCard(Map<String, String> info, bool isDarkMode) {
    final key = info.keys.first;
    final value = info.values.first;

    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: ManagerWidth.w16, vertical: ManagerHeight.h8),
      child: Container(
        decoration: BoxDecoration(
          color: isDarkMode ? AppColors.backgroundDark : AppColors.borderColor,
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: ManagerHeight.h8,
                left: ManagerWidth.w16,
                right: ManagerWidth.w16
              ),
              child: Container(
                height: ManagerHeight.h31,
                width: double.infinity,
                color: isDarkMode
                    ? AppColors.titleContainerProfileFirst
                    : AppColors.titleContainerProfileFirstLight,
                child: Center(
                  child: Text("Personal Info",
                      style: TextStyle(
                          color: isDarkMode ? AppColors.white : AppColors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                      textAlign: TextAlign.center),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(key,
                      style: TextStyle(
                          color: isDarkMode ? AppColors.white : AppColors.black,
                          fontSize: ManagerFontSize.s14)),
                  Text(value,
                      style: TextStyle(
                          color: isDarkMode ? AppColors.white : AppColors.black,
                          fontSize: ManagerFontSize.s14)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBlockUserAndReport(IconData icon, String title) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w16),
      child: Container(
        height: ManagerHeight.h51,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.r),
          color: AppColors.purple,
        ),
        padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w16),
        child: Row(
          children: [
            Icon(icon, color: AppColors.white),
            SizedBox(width: ManagerWidth.w8),
            Text(title,
                style: TextStyle(
                    color: AppColors.white,
                    fontSize: ManagerFontSize.s20,
                    fontFamily: "Afacad")),
          ],
        ),
      ),
    );
  }
}
