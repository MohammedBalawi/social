import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../config/app_colors.dart';
import '../../../config/manager_font_size.dart';
import '../../../config/manager_height.dart';
import '../../../config/manager_width.dart';
import '../../../config/responsive/screen_util_new.dart';

class ContactToggleItemWithCheckboxes extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;
  final TextEditingController controller;
  final List<CheckboxOption> options;

  const ContactToggleItemWithCheckboxes({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
    required this.controller,
    required this.options,
  });

  @override
  Widget build(BuildContext context) {
    ScreenUtilNew.init(context);
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: EdgeInsets.only(
        left: ManagerWidth.w16,
        right: ManagerWidth.w16,
        bottom: ManagerHeight.h12,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: isDarkMode ? AppColors.backgroundDark : AppColors.backgroundColorSwitch,
          // borderRadius: BorderRadius.circular(12.r),
        ),
        padding: EdgeInsets.symmetric(vertical: 12.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w16),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: ManagerFontSize.s14,
                        fontFamily: "Afacad",
                        fontWeight: FontWeight.w400,
                        color: isDarkMode ? AppColors.white : AppColors.black,
                      ),
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
            SizedBox(height: 8.h),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w16),
              child: Container(
                height: ManagerHeight.h32,
                decoration: BoxDecoration(
                  color: isDarkMode ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: TextField(
                  controller: controller,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: isDarkMode ? AppColors.white : AppColors.black,
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 12),
                  ),
                ),
              ),
            ),
            SizedBox(height: ManagerHeight.h12),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w12),
              child: Column(
                children: options.map((option) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 6.h),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Transform.scale(
                          scale: 1.1,
                          child: Checkbox(
                            value: option.checked,
                            onChanged: (v) => option.onChanged(v ?? false),
                            activeColor: Colors.green,
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            visualDensity: VisualDensity.compact,
                          ),
                        ),
                        if (option.iconPath != null)
                          Padding(
                            padding: EdgeInsets.only(right: ManagerWidth.w6),
                            child: Image.asset(
                              option.iconPath!,
                              width: 18,
                              height: 18,
                            ),
                          ),
                        Expanded(
                          child: Text(
                            option.text,
                            style: TextStyle(
                              fontSize: ManagerHeight.h12,
                              // height: 1.2,
                              color: isDarkMode ? Colors.white : AppColors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CheckboxOption {
  final String text;
  final String? iconPath;
  final bool checked;
  final ValueChanged<bool> onChanged;

  CheckboxOption({
    required this.text,
    this.iconPath,
    required this.checked,
    required this.onChanged,
  });
}
