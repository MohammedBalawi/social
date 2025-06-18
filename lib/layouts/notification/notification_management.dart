import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marrige_app/config/manager_height.dart';
import 'package:marrige_app/controller/base_widgets/base_scaffold.dart';
import 'package:marrige_app/controller/base_widgets/button_app.dart';

import '../../config/app_colors.dart';
import '../../config/app_config.dart';
import '../../config/manager_font_size.dart';
import '../../config/manager_width.dart';
import '../../config/responsive/screen_util_new.dart';
import '../widgets/text_field_with_gradiant.dart';

class NotificationManagement extends StatefulWidget {
  const NotificationManagement({super.key});

  @override
  State<NotificationManagement> createState() => _NotificationManagementState();
}

class _NotificationManagementState extends State<NotificationManagement> {
  // حفظ الحالة باستخدام Map
  final Map<int, bool> _switchStates = {
    0: true,
    1: true,
    2: true,
    3: true,
    4: true,
    5: true,
    6: true,
  };

  @override
  Widget build(BuildContext context) {
    ScreenUtilNew.init(context);
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

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
                  "Notification Management",
                  style: TextStyle(
                    fontSize: ManagerFontSize.s18,
                    color: AppColors.white,
                    fontFamily: "ADLaM Display",
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
          vertical: ManagerHeight.h16,
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  _settingTile(
                    index: 0,
                    title: "Receive notifications from the application",
                    isDarkMode: isDarkMode,
                  ),
                  _settingTile(
                    index: 1,
                    title:
                        "Allow members to send SMS to my mobile without knowing my number.",
                    subtitle:
                        "No one will be able to know your mobile number. The sending will be direct through our website and in secret.",
                    isDarkMode: isDarkMode,
                  ),
                  _settingTile(
                    index: 2,
                    title:
                        "Email me all new members suitable for me, periodically",
                    isDarkMode: isDarkMode,
                  ),
                  _settingTile(
                    index: 3,
                    title: "Notify me when someone visits my profile by email",
                    isDarkMode: isDarkMode,
                  ),
                  _settingTile(
                    index: 4,
                    title:
                        "Notify me via email when a member whose I added to my favorite list adds a new photo",
                    isDarkMode: isDarkMode,
                  ),
                  _settingTile(
                    index: 5,
                    title:
                        "Allowing to receive various types of messages on my e-mail, such as new incoming messages, and all types of messages",
                    isDarkMode: isDarkMode,
                  ),
                  _settingTile(
                    index: 6,
                    title:
                        "Allow receiving SMS (short messages) on my mobile to notify me of notifications such as receiving new messages for me, alerts or messages from members and others of various kinds",
                    isDarkMode: isDarkMode,
                  ),
                  SizedBox(height: ManagerHeight.h24),
                  ButtonApp(title: "Save", paddingWidth: ManagerWidth.w32),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _settingTile({
    required int index,
    required String title,
    String? subtitle,
    required bool isDarkMode,
  }) {
    final isOn = _switchStates[index] ?? false;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      decoration: BoxDecoration(
        color: isDarkMode?AppColors.backgroundDark:AppColors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style:  TextStyle(
                      fontSize: ManagerFontSize.s14,
                      fontFamily: "Afacad",
                      fontWeight: FontWeight.w400,
                      color: isDarkMode?AppColors.white:AppColors.black,
                    ),
                  ),
                  if (subtitle != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Text(
                        subtitle,
                        style:TextStyle(
                          fontSize: ManagerFontSize.s8,
                          fontFamily: "Afacad",
                          fontWeight: FontWeight.w400,
                          color: isDarkMode?AppColors.white:AppColors.black,
                        ),
                      ),
                    ),
                ],
              ),
            ),

            Container(
              width: 64,
              height: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: ManagerWidth.w8,
                vertical: ManagerHeight.h8,
              ),
              decoration: BoxDecoration(
                color: AppColors.backgroundColorSwitch,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Transform.scale(
                scale: 0.8,
                child: Switch(
                  value: isOn,
                  onChanged: (value) {
                    setState(() {
                      _switchStates[index] = value;
                    });
                  },
                  activeColor: AppColors.purple,
                  activeTrackColor: AppColors.unActiveSwitch,
                  inactiveThumbColor: AppColors.purpleDark,
                  inactiveTrackColor: AppColors.unActiveSwitch,
                  splashRadius: 0,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
