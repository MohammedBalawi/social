import 'package:flutter/material.dart';
import 'package:marrige_app/controller/base_widgets/base_scaffold.dart';

import '../../config/app_colors.dart';
import '../../config/app_config.dart';
import '../../config/manager_font_size.dart';
import '../../config/manager_height.dart';
import '../../config/manager_width.dart';
import '../../config/responsive/screen_util_new.dart';

class MainHelpScreen extends StatefulWidget {
  const MainHelpScreen({super.key});

  @override
  State<MainHelpScreen> createState() => _MainHelpScreenState();
}

class _MainHelpScreenState extends State<MainHelpScreen> {
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
                  "Help !",
                  style: TextStyle(
                    fontSize: ManagerFontSize.s20,
                    color: AppColors.white,
                    fontFamily: "ADLaMDisplay",
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
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
      body: Column(
        children: [
          SizedBox(height: ManagerHeight.h16,),
          Wrap(
            spacing: ManagerWidth.w16,
            runSpacing: ManagerHeight.h16,
            children: [
              _buildSupportCard(
                "${AppConfig.baseImagePath}/info_icon.png",
                'Send Email',
                isDarkMode
              ),
              _buildSupportCard(
                "${AppConfig.baseImagePath}/chat_support.png",
                'Chat Support',
                  isDarkMode
              ),
              _buildSupportCard(
                "${AppConfig.baseImagePath}/send_email_icon.png",
                'FAQ',
                  isDarkMode
              ),
              _buildSupportCard(
                "${AppConfig.baseImagePath}/support_wibsite_icon.png",
                'Support via Website',
                  isDarkMode
              ),
            ],
          ),
          const Spacer(),
          versionNumberContainer(isDarkMode),
          SizedBox(
            height: ManagerHeight.h32,
          ),
        ],
      ),
    );
  }

  Widget _buildSupportCard(String iconPath, String label,bool isDarkMode) {
    return Container(
      width: ManagerWidth.w106,
      height: ManagerHeight.h101,
      decoration: BoxDecoration(
        color: isDarkMode?AppColors.backgroundDark:AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.08),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            iconPath,
            height: ManagerHeight.h39,
            width: ManagerWidth.w34,
          ),
          SizedBox(height: ManagerHeight.h6),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: ManagerFontSize.s14,
              fontFamily: "Afacad",
              color: isDarkMode?AppColors.white:AppColors.black
            ),
          ),
        ],
      ),
    );
  }
  Widget versionNumberContainer(bool isDarkMode) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w16),
      child: Container(
        height: ManagerHeight.h28,
        width: double.infinity,
        decoration: BoxDecoration(
          color: isDarkMode?AppColors.backgroundDark:AppColors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children:  [
            SizedBox(width: ManagerWidth.w8,),
            Text(
              "Version number",
              style: TextStyle(
                fontSize: 14,
                color: isDarkMode?AppColors.white:AppColors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(width: 8),
            Text(
              "2.2.1",
              style: TextStyle(
                fontSize: 14,
                color: isDarkMode?AppColors.white:AppColors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
