import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marrige_app/config/app_colors.dart';
import 'package:marrige_app/config/manager_height.dart';
import 'package:marrige_app/config/manager_width.dart';
import 'package:marrige_app/layouts/widgets/home/add_photo_card.dart';
import 'package:marrige_app/layouts/widgets/home/custom_profile_card.dart' show ProfileCard;
import 'package:marrige_app/layouts/widgets/home/upgrade_offer_card.dart';
import 'package:marrige_app/layouts/widgets/home/vip_profile_card.dart' show VipProfileCard;
import '../../config/responsive/screen_util_new.dart';
import '../../controller/home/cubit/home_cubit.dart';
import '../widgets/home/user_story_list .dart';


class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtilNew.init(context);

    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    context.read<HomeCubit>().loadHomeData();

    return SafeArea(
      top: true,
      bottom: false,
      child: Scaffold(
        backgroundColor: isDarkMode ? AppColors.darkBackgroundCool : AppColors.backgroundLight,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              UserStoryList(
                backgroundColor: isDarkMode ? AppColors.black20Opacity : AppColors.greyLightcolor,
              ),
              SizedBox(height: ManagerHeight.h16),
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  final spotlightUsers = state.spotlightUsers;

                  if (spotlightUsers.isEmpty) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w16),
                    child: Column(
                      children: [
                        for (var user in spotlightUsers)
                          Column(
                            children: [
                              ProfileCard(user: user),
                              SizedBox(height: ManagerHeight.h16),
                            ],
                          ),
                      ],
                    ),
                  );
                },
              ),
              SizedBox(height: ManagerHeight.h8),
              const VipProfileCard(),
              SizedBox(height: ManagerHeight.h14),
              const UpgradeOfferCard(),
              SizedBox(height: ManagerHeight.h8),
              const AddPhotoCard(),
              SizedBox(height: ManagerHeight.h16),
            ],
          ),
        ),
      ),
    );
  }
}
