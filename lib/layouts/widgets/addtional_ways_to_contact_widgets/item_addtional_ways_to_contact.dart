import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marrige_app/config/app_colors.dart';
import 'package:marrige_app/config/manager_font_size.dart';
import 'package:marrige_app/config/manager_height.dart';
import 'package:marrige_app/config/manager_width.dart';

import '../../../config/responsive/screen_util_new.dart';
import 'contact_toggleItem_with_checkboxes.dart';

class ContactToggleItem extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;
  final TextEditingController controller;
  final String? iconPath;
  final double? heightIcon;
  final double? widthIcon;
  final List<CheckboxOption>? options; // ✅ هنا الإضافة الجديدة

  const ContactToggleItem({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
    required this.controller,
    this.iconPath,
    this.heightIcon,
    this.widthIcon,
    this.options,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: EdgeInsets.only(
        left: ManagerWidth.w16,
        right: ManagerWidth.w16,
        bottom: ManagerHeight.h8,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        decoration: BoxDecoration(
          color: isDarkMode
              ? AppColors.backgroundDark
              : AppColors.backgroundColorSwitch,
          // borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w16),
              child: Row(
                children: [
                  if (iconPath != null &&
                      heightIcon != null &&
                      widthIcon != null)
                    Image.asset(iconPath!,
                        width: widthIcon, height: heightIcon),
                  if (iconPath != null) SizedBox(width: ManagerWidth.w8),
                  Expanded(
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: ManagerFontSize.s14,
                        fontFamily: "Afacad",
                        fontWeight: FontWeight.w400,
                        color: isDarkMode ? AppColors.white : AppColors.black,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Switch(
                    value: value,
                    onChanged: onChanged,
                    activeColor: AppColors.purple,
                    activeTrackColor: AppColors.unActiveSwitch,
                    inactiveThumbColor: AppColors.purpleDark,
                    inactiveTrackColor: AppColors.unActiveSwitch,
                    splashRadius: 0,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ],
              ),
            ),

            /// TextField
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: ManagerWidth.w16, vertical: 10.h),
              child: Container(
                height: ManagerHeight.h32,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: isDarkMode ? AppColors.black : Colors.white,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: TextField(
                  controller: controller,
                  style: const TextStyle(fontSize: 14),
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 12),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),

            /// قائمة الخيارات (checkbox + icon + text)
            if (options != null) ...[
              Padding(
                padding: EdgeInsets.only(top: 4.h),
                child: Column(
                  children: options!.map((option) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: ManagerWidth.w16, vertical: 6.h),
                      child: Row(
                        children: [
                          Checkbox(
                            value: option.checked,
                            onChanged:  (v) => option.onChanged(v ?? false),
                            activeColor: AppColors.purple,
                          ),
                          if (option.iconPath != null)
                            Padding(
                              padding: const EdgeInsets.only(right: 6),
                              child: Image.asset(option.iconPath!,
                                  width: 18, height: 18),
                            ),
                          Expanded(
                            child: Text(
                              option.text,
                              style: TextStyle(
                                fontSize: 13.sp,
                                color: isDarkMode
                                    ? Colors.white
                                    : AppColors.black,
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  }).toList(),
                ),
              )
            ],
          ],
        ),
      ),
    );
  }
}
