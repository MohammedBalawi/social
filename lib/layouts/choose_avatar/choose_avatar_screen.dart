import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marrige_app/controller/base_widgets/button_app.dart';

import '../../config/app_colors.dart';
import '../../config/app_config.dart';
import '../../config/manager_font_size.dart';
import '../../config/manager_height.dart';
import '../../config/manager_width.dart';
import '../../config/responsive/screen_util_new.dart';
import '../../controller/avatar/cubit/avatar_cubit.dart';
import '../../controller/base_widgets/base_scaffold.dart';

class ChooseAvatarScreen extends StatefulWidget {
  const ChooseAvatarScreen({super.key});

  @override
  State<ChooseAvatarScreen> createState() => _ChooseAvatarScreenState();
}

class _ChooseAvatarScreenState extends State<ChooseAvatarScreen> {
  int selectedIndex = -1;
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    ScreenUtilNew.init(context);
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return BlocProvider(
      create: (_) => AvatarCubit()..loadAvatars(),
      child: BlocBuilder<AvatarCubit, AvatarState>(
        builder: (context, state) {
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
                        "Choose your avatar",
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
            body: Column(
              children: [
                SizedBox(height: ManagerHeight.h21),
                Expanded(
                  child: Container(
                    color: isDarkMode ? AppColors.black : AppColors.backgroundColorSwitch,
                    child: state.isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : RawScrollbar(
                      controller: _scrollController,
                      thumbVisibility: true,
                      minThumbLength: 40,
                      radius: const Radius.circular(10),
                      thickness: 4,
                      trackColor: AppColors.redColor,
                      trackBorderColor: AppColors.unActiveColorScroll,
                      thumbColor: isDarkMode ? AppColors.white : AppColors.black,
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        controller: _scrollController,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: ManagerWidth.w16,
                            vertical: ManagerHeight.h16,
                          ),
                          child: GridView.builder(
                            itemCount: state.avatars.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisSpacing: 12,
                              crossAxisSpacing: 12,
                              childAspectRatio: 1,
                            ),
                            itemBuilder: (context, index) {
                              final isSelected = index == selectedIndex;
                              final imageUrl = state.avatars[index];

                              return GestureDetector(
                                onTap: () => setState(() => selectedIndex = index),
                                child: isSelected
                                    ? Container(
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      colors: [AppColors.grad1Color, AppColors.grad1Color],
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(3),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: isDarkMode ? AppColors.backgroundDark : AppColors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: CachedNetworkImage(
                                          imageUrl: imageUrl,
                                          fit: BoxFit.cover,
                                          placeholder: (context, url) => const Center(
                                              child: CircularProgressIndicator()),
                                          errorWidget: (context, url, error) =>
                                          const Icon(Icons.error),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                                    : DottedBorder(
                                  color: AppColors.mainSecondaryColor,
                                  borderType: BorderType.RRect,
                                  dashPattern: const [4, 3],
                                  radius: const Radius.circular(12),
                                  strokeWidth: 1.5,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: isDarkMode
                                          ? AppColors.backgroundDark
                                          : AppColors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: CachedNetworkImage(
                                        imageUrl: imageUrl,
                                        fit: BoxFit.cover,
                                        placeholder: (context, url) =>
                                        const Center(child: CircularProgressIndicator()),
                                        errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: ManagerHeight.h16),
                ButtonApp(title: "Save Selected", paddingWidth: ManagerWidth.w42),
                SizedBox(height: ManagerHeight.h14),
              ],
            ),
          );
        },
      ),
    );
  }
}
