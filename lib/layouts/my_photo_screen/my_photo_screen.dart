import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marrige_app/layouts/widgets/my_account_widgets/my_account_item.dart';
import '../../config/app_colors.dart';
import '../../config/app_config.dart';
import '../../config/manager_font_size.dart';
import '../../config/manager_height.dart';
import '../../config/manager_width.dart';
import '../../config/responsive/screen_util_new.dart';
import '../../controller/base_widgets/base_scaffold.dart';

class MyPhotoScreen extends StatefulWidget {
  const MyPhotoScreen({super.key});

  @override
  State<MyPhotoScreen> createState() => _MyPhotoScreenState();
}

class _MyPhotoScreenState extends State<MyPhotoScreen> {
  bool hideImage = false;
  bool isOn = false;

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
                  "My Photo",
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
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: ManagerHeight.h67),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w16),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: ManagerWidth.w24,
                  vertical: ManagerHeight.h14,
                ),
                decoration: BoxDecoration(
                  color:  isDarkMode ? AppColors.backgroundDark : AppColors.white,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.camera_alt,
                      color: isDarkMode ? AppColors.white : AppColors.purple,
                      size: 42.r,
                    ),
                    SizedBox(width: ManagerWidth.w16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: ManagerHeight.h8),
                        Text(
                          "Add new image",
                          style: TextStyle(
                            color: isDarkMode?AppColors.white:AppColors.black,
                            fontFamily: "Afacad",
                            fontSize: ManagerFontSize.s24,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "Hide my image",
                              style: TextStyle(
                                color: isDarkMode?AppColors.white:AppColors.black,
                                fontFamily: "Afacad",
                                fontSize: ManagerFontSize.s18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(width: ManagerWidth.w21),
                            Switch(
                              value: isOn,
                              onChanged: (value) {
                                setState(() {
                                  isOn = value;
                                });
                              },
                              activeColor: AppColors.purple,
                              activeTrackColor: AppColors.unActiveSwitch,
                              inactiveThumbColor: AppColors.purpleDark,
                              inactiveTrackColor: AppColors.unActiveSwitch,
                              splashRadius: 0,
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: ManagerHeight.h14),
            MyAccountItem(
              title: "Change My Avatar",
              pathIconLight: "${AppConfig.baseImagePath}/person_avatar.png",
              pathIconDark: "${AppConfig.baseImagePath}/dark_icon_person.png",
              heightIcon: ManagerHeight.h30,
              widthIcon: ManagerWidth.w20,
            ),
            SizedBox(height: ManagerHeight.h14),
            MyAccountItem(
              title: "Delete Photo",
              pathIconLight: "${AppConfig.baseImagePath}/delete_photo.png",
              pathIconDark: "${AppConfig.baseImagePath}/delete_photo_dark.png",
              heightIcon: ManagerHeight.h30,
              widthIcon: ManagerWidth.w20,
              delete: true,
            ),
          ],
        ),
      ),
    );
  }
}
