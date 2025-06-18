import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marrige_app/controller/base_widgets/base_scaffold.dart';
import 'package:marrige_app/config/app_colors.dart';
import 'package:marrige_app/config/app_config.dart';
import 'package:marrige_app/config/manager_font_size.dart';
import 'package:marrige_app/config/manager_height.dart';
import 'package:marrige_app/config/manager_width.dart';

import '../../controller/notfication/cubit/notfication_cubit.dart';
import '../../models/notfication/notification_model.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return BlocProvider(
      create: (_) => NotificationCubit()..loadNotifications(),
      child: BlocBuilder<NotificationCubit, NotificationState>(
        builder: (context, state) {
          return BaseScaffold(
            backgroundColor: isDarkMode ? AppColors.black : AppColors.backgroundLight,
            appBar: _buildAppBar(context),
            body: state.isLoading
                ? const Center(child: CircularProgressIndicator(
              color: AppColors.purple,
            ))
                : _buildNotificationList(state.notifications, isDarkMode),
          );
        },
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return SizedBox(
      height: ManagerHeight.h99,
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: ManagerHeight.h35),
            child: Center(
              child: Text(
                "Notification List",
                style: TextStyle(
                  fontSize: ManagerFontSize.s20,
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
                top: ManagerHeight.h39,
                left: ManagerWidth.w24,
              ),
              child: Image.asset(
                "${AppConfig.baseImagePath}/close_icon.png",
                height: ManagerHeight.h40,
                width: ManagerWidth.w40,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationList(List<NotificationItem> items, bool isDarkMode) {
    final grouped = _groupByDate(items);

    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      children: grouped.entries.map((entry) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle(entry.key),
            ...entry.value.map((item) => _buildNotificationItem(item, isDarkMode)).toList(),
          ],
        );
      }).toList(),
    );
  }

  Map<String, List<NotificationItem>> _groupByDate(List<NotificationItem> items) {
    final Map<String, List<NotificationItem>> grouped = {};
    for (var item in items) {
      grouped.putIfAbsent(item.date, () => []).add(item);
    }
    return grouped;
  }

  Widget _buildSectionTitle(String title) {
    return Container(
      height: ManagerHeight.h27,
      margin: EdgeInsets.symmetric(vertical: ManagerHeight.h8),
      decoration: BoxDecoration(color: AppColors.colorStatusNotfication),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            fontFamily: "Afacad",
            fontWeight: FontWeight.w400,
            fontSize: ManagerFontSize.s12,
            color: AppColors.blockedUsersHeaderDark,
          ),
        ),
      ),
    );
  }

  Widget _buildNotificationItem(NotificationItem item, bool isDarkMode) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: item.isNew
            ? const Color(0xfffff1f8)
            : isDarkMode
            ? AppColors.backgroundDark
            : AppColors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Container(
              width: 40,
              decoration: BoxDecoration(
                gradient: item.isNew
                    ? LinearGradient(colors: [AppColors.grad1Color, AppColors.grad2Color])
                    : null,
                color: item.isNew ? null : AppColors.colorIconNotfication,
              ),
              alignment: Alignment.center,
              child: const Icon(Icons.notifications, color: Colors.white, size: 20),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(ManagerHeight.h8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 13.5,
                        color: item.isNew
                            ? AppColors.black
                            : isDarkMode
                            ? AppColors.white
                            : AppColors.black,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      item.time,
                      style: const TextStyle(fontSize: 11, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
