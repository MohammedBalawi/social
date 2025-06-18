import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../config/app_colors.dart';
import '../../config/app_config.dart';
import '../../config/manager_font_size.dart';
import '../../config/manager_height.dart';
import '../../config/manager_width.dart';
import '../../config/responsive/screen_util_new.dart';
import '../../controller/base_widgets/base_scaffold.dart';
import '../../controller/my_photos/cubit/my_photos_cubit.dart';
import '../../controller/my_photos/cubit/my_photo_state.dart';
import '../../models/my_photos/my_photos_model.dart';

class MyPhotosScreen extends StatelessWidget {
  const MyPhotosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return BlocProvider(
      create: (_) => PhotoCubit()..loadPhotosFromJson(),
      child: BlocBuilder<PhotoCubit, PhotoState>(
        builder: (context, state) {
          if (state is PhotoLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PhotoLoaded) {
            final photos = state.photos;

            return BaseScaffold(
              backgroundColor: isDarkMode ? AppColors.black : AppColors.backgroundLight,
              appBar: _buildAppBar(context),
              body: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
                child: Column(
                  children: [
                    _buildMainPhoto(),
                    SizedBox(height: ManagerHeight.h30),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 12.w,
                        mainAxisSpacing: 12.h,
                        childAspectRatio: 104 / 139,
                      ),
                      itemCount: photos.length + 1,
                      itemBuilder: (context, index) {
                        if (index == photos.length) {
                          return _buildAddTile(context);
                        } else {
                          final photo = photos[index];
                          return _buildPhotoTile(context, index, photo.imgPath, photo.hidden, isDarkMode);
                        }
                      },
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) => SizedBox(
    height: ManagerHeight.h99,
    child: Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(top: ManagerHeight.h35),
          child: Center(
            child: Text(
              "My Photos",
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
            padding: EdgeInsets.only(top: ManagerHeight.h47, left: ManagerWidth.w24),
            child: Image.asset(
              "${AppConfig.baseImagePath}/back_button.png",
              height: ManagerHeight.h40,
              width: ManagerWidth.w40,
            ),
          ),
        ),
      ],
    ),
  );

  Widget _buildMainPhoto() => Container(
    height: ManagerHeight.h216,
    width: ManagerWidth.w216,
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.r)),
    child: Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16.r),
          child: Image.asset(
            '${AppConfig.baseImagePath}/image_in_my_photos.png',
            height: ManagerHeight.h216,
            width: ManagerWidth.w216,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: ManagerHeight.h16,
          left: 0,
          right: 0,
          child: Center(
            child: Container(
              height: ManagerHeight.h36,
              width: ManagerWidth.w140,
              decoration: BoxDecoration(
                color: AppColors.white.withOpacity(0.30),
                borderRadius: BorderRadius.circular(32.r),
                border: Border.all(color: AppColors.purple),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.camera_alt_rounded, color: AppColors.white),
                  SizedBox(width: 5.w),
                  Expanded(
                    child: Text(
                      "Change Photo",
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: ManagerFontSize.s14,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Acme",
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );

  Widget _buildPhotoTile(BuildContext context, int index, String? imgPath, bool hidden, bool isDarkMode) {
    return Container(
      height: ManagerHeight.h139,
      width: ManagerWidth.w104,
      decoration: BoxDecoration(
        color: isDarkMode ? AppColors.backgroundDark : AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.purple),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (imgPath != null && !hidden)
            ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Image.asset(
                imgPath,
                height: ManagerHeight.h90,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            )
          else
            SizedBox(height: ManagerHeight.h90),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w6, vertical: ManagerHeight.h6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => context.read<PhotoCubit>().deletePhoto(index),
                  child: const Icon(Icons.delete, size: 16),
                ),
                GestureDetector(
                  onTap: () => context.read<PhotoCubit>().togglePhotoVisibility(index),
                  child: Icon(
                    hidden ? Icons.visibility_off : Icons.visibility,
                    size: 16,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildAddTile(BuildContext context) {
    return GestureDetector(
      onTap: () => context.read<PhotoCubit>().addPhoto(
        PhotoItemModel(
          imgPath: 'assets/images/image_in_my_photos.png',
          hidden: false,
        ),
      ),      child: Container(
        height: ManagerHeight.h139,
        width: ManagerWidth.w104,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: AppColors.purple),
        ),
        child: Center(
          child: Container(
            width: ManagerWidth.w60,
            height: ManagerHeight.h32,
            decoration: BoxDecoration(
              color: AppColors.purple,
              borderRadius: BorderRadius.circular(24.r),
            ),
            child: Center(
              child: Expanded(
                child: Text(
                  "+ Add",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Afacad',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),

              ),
            ),
          ),
        ),
      ),
    );
  }
}
