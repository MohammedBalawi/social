import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marrige_app/config/app_colors.dart';
import 'package:marrige_app/config/app_config.dart';
import 'package:marrige_app/config/manager_font_size.dart';
import 'package:marrige_app/config/manager_height.dart';
import 'package:marrige_app/config/manager_width.dart';
import 'package:marrige_app/config/responsive/screen_util_new.dart';
import 'package:marrige_app/controller/base_widgets/base_scaffold.dart';
import 'package:marrige_app/controller/base_widgets/button_app.dart';
import 'package:marrige_app/layouts/widgets/addtional_ways_to_contact_widgets/contact_toggleItem_with_checkboxes.dart';
import 'package:marrige_app/layouts/widgets/addtional_ways_to_contact_widgets/item_addtional_ways_to_contact.dart';
import 'package:marrige_app/layouts/widgets/my_account_widgets/error_account_widget.dart';
import '../../controller/additional_contact_cubit/cubit/additional_contact_cubit.dart';

class AddtionalWaysToContactScreen extends StatelessWidget {
  const AddtionalWaysToContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtilNew.init(context);
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return BlocProvider(
      create: (_) => AdditionalContactCubit()..loadContactSettings(),
      child: BlocBuilder<AdditionalContactCubit, AdditionalContactState>(
        builder: (context, state) {
          final data = state.settings;

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
                        "Additional ways to contact",
                        style: TextStyle(
                          fontSize: ManagerFontSize.s16,
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
            body: state.isLoading || data == null
                ? const Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(height: ManagerHeight.h12),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w16),
                    child: Container(
                      height: ManagerHeight.h107,
                      decoration: BoxDecoration(
                        color: AppColors.colorRedWithOpcity,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: ManagerHeight.h14),
                          if (!data.confirmEmail)
                            ErrorAccountWidget(title: "You have to confirm your email"),
                          if (!data.confirmPhone)
                            ErrorAccountWidget(title: "You need to confirm your mobile number"),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: ManagerHeight.h6),
                  ContactToggleItem(
                    title: "Show my email to everyone?",
                    value: data.showEmail,
                    onChanged: (_) {},
                    controller: TextEditingController(),
                  ),
                  ContactToggleItemWithCheckboxes(
                    title: "Connect with me via social apps",
                    value: true,
                    onChanged: (_) {},
                    controller: TextEditingController(),
                    options: [
                      CheckboxOption(
                        text: " I have a WhatsApp on the same number.",
                        checked: data.whatsapp,
                        onChanged: (val) {}, // ← أضف هذا
                      ),
                      CheckboxOption(
                        text: "  I have a Viber on the same number.",
                        iconPath: "assets/images/vipe.png",
                        checked: data.viber,
                        onChanged: (val) {}, // ← أضف هذا
                      ),
                      CheckboxOption(
                        text: "I have a Tango on the same number",
                        checked: data.tango,
                        onChanged: (val) {}, // ← أضف هذا
                      ),
                      CheckboxOption(
                        text: "I have a WeChat on the same number",
                        checked: data.wechat,
                        onChanged: (val) {}, // ← أضف هذا
                      ),

                    ],
                  ),
                  ContactToggleItem(title: "Facebook or Messenger - publish it", value: data.facebook, onChanged: (_) {}, controller: TextEditingController()),
                  ContactToggleItem(title: "Twitter - I want to publish it.", value: data.twitter, onChanged: (_) {}, controller: TextEditingController()),
                  ContactToggleItem(
                    title: "Instagram - I want to publish it",
                    value: data.instagram,
                    iconPath: "${AppConfig.baseImagePath}/instagram_icon.png",
                    heightIcon: ManagerHeight.h28,
                    widthIcon: ManagerWidth.w28,
                    onChanged: (_) {},
                    controller: TextEditingController(),
                  ),
                  ContactToggleItem(
                    title: "Skype - I want to publish it",
                    value: data.skype,
                    iconPath: "${AppConfig.baseImagePath}/skype_icon.png",
                    heightIcon: ManagerHeight.h28,
                    widthIcon: ManagerWidth.w28,
                    onChanged: (_) {},
                    controller: TextEditingController(),
                  ),
                  ContactToggleItem(
                    title: "Telegram - I want to publish it",
                    value: data.telegram,
                    iconPath: "${AppConfig.baseImagePath}/telegram_icon.png",
                    heightIcon: ManagerHeight.h20,
                    widthIcon: ManagerWidth.w20,
                    onChanged: (_) {},
                    controller: TextEditingController(),
                  ),
                  ContactToggleItem(
                    title: "My account BB is - I want to publish",
                    value: data.bb,
                    iconPath: "${AppConfig.baseImagePath}/bb_icon.png",
                    heightIcon: ManagerHeight.h20,
                    widthIcon: ManagerWidth.w20,
                    onChanged: (_) {},
                    controller: TextEditingController(),
                  ),
                  ContactToggleItem(
                    title: " Snapchat - I want to publish it",
                    value: data.snapchat,
                    onChanged: (_) {},
                    controller: TextEditingController(),
                  ),
                  SizedBox(height: ManagerHeight.h48),
                  ButtonApp(title: "Save", paddingWidth: ManagerWidth.w32),
                  SizedBox(height: ManagerHeight.h16),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
