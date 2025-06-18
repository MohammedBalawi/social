import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marrige_app/config/manager_height.dart';

import '../../../config/app_colors.dart' show AppColors;
import '../../../config/manager_font_size.dart';
import '../../../config/manager_width.dart';
import '../../../config/responsive/screen_util_new.dart';
import '../../../config/theme/theme_bloc.dart';
import '../../../controller/home/cubit/home_cubit.dart';
import '../../search/search_view.dart';

class UserStoryList extends StatelessWidget {
  final Color backgroundColor;

  const UserStoryList({super.key, required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    ScreenUtilNew.init(context);
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final spotlightUsers = state.spotlightUsers;

        if (spotlightUsers.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        final containerColor = isDarkMode ? Colors.black : AppColors.greyAppBar;

        return Container(
          width: double.infinity,
          color: containerColor,
          child: Column(
            children: [
              SizedBox(height: ManagerHeight.h16),
              SizedBox(
                height: ManagerHeight.h130,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  padding:  EdgeInsets.symmetric(horizontal: ManagerWidth.w16),
                  itemCount: spotlightUsers.length,
                  separatorBuilder: (_, _) => SizedBox(width: ManagerWidth.w16),
                  itemBuilder: (context, index) {
                    final user = spotlightUsers[index];
                    return Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColors.purple,
                              width: ManagerWidth.w2,
                            ),
                          ),
                          child: CircleAvatar(
                            radius:
                                MediaQuery.of(context).orientation ==
                                        Orientation.portrait
                                    ? 32.r
                                    : 44.r,
                            backgroundColor: Colors.transparent,
                            child:
                                (user.profileImage.isEmpty)
                                    ? _defaultProfileIcon()
                                    : GestureDetector(
                                  onTap:(){
                                  },
                                      child: ClipOval(
                                        child: CachedNetworkImage(
                                          imageUrl: user.profileImage,
                                          fit: BoxFit.cover,
                                          width: double.infinity,
                                          height: double.infinity,
                                          placeholder:
                                              (context, url) =>
                                                  _defaultProfileIcon(),
                                          errorWidget:
                                              (context, url, error) =>
                                                  _defaultProfileIcon(),
                                        ),
                                      ),
                                    ),
                          ),
                        ),
                        SizedBox(height: ManagerHeight.h6),
                        Text(
                          user.userName,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize:
                            ManagerFontSize.s12,
                            color: isDarkMode ? Colors.white : Colors.black,
                            fontFamily: 'Arial',
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.menu,
                          size:
                              MediaQuery.of(context).orientation ==
                                      Orientation.portrait
                                  ? ManagerHeight.h26
                                  : ManagerHeight.h37,
                          color: AppColors.primarygreyicon,
                        ),
                        SizedBox(width: ManagerWidth.w20),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) =>  SearchView()
                              ),
                            );
                          },
                          child: Icon(
                            Icons.search,
                            // size:
                            //     MediaQuery.of(context).orientation ==
                            //             Orientation.portrait
                            //         ? ManagerHeight.h26
                            //         : ManagerHeight.h37,
                            color: AppColors.primarygreyicon,
                          ),
                        ),
                        SizedBox(width: ManagerWidth.w20),
                        Icon(
                          Icons.settings,
                          // size:
                          //     MediaQuery.of(context).orientation ==
                          //             Orientation.portrait
                          //         ? ManagerHeight.h26
                          //         : ManagerHeight.h37,
                          color: AppColors.primarygreyicon,
                        ),
                      ],
                    ),
                    IntrinsicWidth(
                      child: Icon(
                        Icons.notifications,
                        color: AppColors.primarygreyicon,
                        // size:
                        //     MediaQuery.of(context).orientation ==
                        //             Orientation.portrait
                        //         ? ManagerHeight.h24
                        //         : ManagerHeight.h28,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

Widget _defaultProfileIcon() {
  return Container(
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      gradient: LinearGradient(
        colors: [Colors.purple.shade200, Colors.purple.shade800],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
    child: Center(child: Icon(Icons.person, size: 32.r, color: Colors.white)),
  );
}
