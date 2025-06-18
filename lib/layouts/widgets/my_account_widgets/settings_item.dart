import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marrige_app/config/manager_font_size.dart';
import 'package:marrige_app/config/manager_height.dart';
import 'package:marrige_app/config/manager_width.dart';

import '../../../config/app_colors.dart';
import '../../../config/app_config.dart';
import '../../../config/responsive/screen_util_new.dart';

class ExpandableSettingsItem extends StatefulWidget {
  const ExpandableSettingsItem({super.key});

  @override
  State<ExpandableSettingsItem> createState() => _ExpandableSettingsItemState();
}

class _ExpandableSettingsItemState extends State<ExpandableSettingsItem> with TickerProviderStateMixin {
  // bool _expanded = false;
  //
  // void _toggleExpansion() {
  //   setState(() {
  //     _expanded = !_expanded;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    ScreenUtilNew.init(context);
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w16),
      child: ClipRRect( // حل overflow مع animation
        borderRadius: BorderRadius.circular(16.r),
        child: AnimatedSize(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w16),
            decoration: BoxDecoration(
              color: isDarkMode?AppColors.backgroundDark:Colors.white,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Column(
              children: [
                SizedBox(height: ManagerHeight.h20),
                // GestureDetector(
                //   onTap: _toggleExpansion,
                //   child:
                  Row(
                    children: [
                      Image.asset(
                        "${AppConfig.baseImagePath}/settings.png",
                        height: ManagerHeight.h24,
                        width: ManagerWidth.w24,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(width: ManagerWidth.w12),
                      Text(
                        "Settings",
                        style: TextStyle(
                          color:isDarkMode?AppColors.white: AppColors.colorItemInMyAccountText,
                          fontSize: ManagerFontSize.s14,
                        ),
                      ),
                      const Spacer(),
                      // Icon(
                      //   _expanded
                      //       ? Icons.keyboard_arrow_down
                      //       : Icons.arrow_forward_ios,
                      //   color: AppColors.colorItemInMyAccountIcon,
                      // ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.colorItemInMyAccountIcon,
                      ),
                    ],
                  ),
                // ),
                SizedBox(height: ManagerHeight.h20),
                // if (_expanded) ...[
                  _buildSettingItem("Edit Login data & age",isDarkMode),
                  _buildSettingItem("Edit personal information",isDarkMode),
                  _buildSettingItem("Notification Management",isDarkMode),
                  _buildSettingItem("Language", trailingText: "English",isDarkMode),
                  SizedBox(height: ManagerHeight.h12),
                // ]
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSettingItem(String title, bool isDarkMode,{String? trailingText}) {
    return Column(
      children: [
        const SizedBox(height: 10),
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(
            title,
            style: TextStyle(
              color: isDarkMode?AppColors.white:AppColors.black,
              fontSize: ManagerFontSize.s14,
              fontWeight: FontWeight.w400,
            ),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (trailingText != null)
                Text(
                  trailingText,
                  style: TextStyle(
                    color:isDarkMode?AppColors.white:AppColors.colorItemInMyAccountIcon,
                    fontWeight: FontWeight.w400,
                    fontSize: ManagerFontSize.s16,
                  ),
                ),
              const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
            ],
          ),
          onTap: () {
            // Handle tap
          },
        ),
      ],
    );
  }
}
