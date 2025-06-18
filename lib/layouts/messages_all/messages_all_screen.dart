import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/app_colors.dart';
import '../../config/manager_font_size.dart';
import '../../config/manager_height.dart';
import '../../config/manager_width.dart';
import '../../config/responsive/screen_util_new.dart';
import '../../controller/all_message/cubit/message_cubit.dart';

class MessagesAllScreen extends StatefulWidget {
  const MessagesAllScreen({super.key});

  @override
  State<MessagesAllScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesAllScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtilNew.init(context);
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return BlocProvider(
      create: (_) => MessagesCubit()..loadMessages(),
      child: BlocBuilder<MessagesCubit, MessagesState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: isDarkMode
                ? AppColors.darkBackgroundCool
                : AppColors.backgroundLight,
            body: Column(
              children: [
                Container(
                  height: ManagerHeight.h182,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: isDarkMode ? AppColors.purpleDark : AppColors.purple,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50.r),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: ManagerHeight.h40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Messages",
                              style: TextStyle(
                                color: AppColors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: ManagerFontSize.s24,
                                fontFamily: "Afacad",
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          SizedBox(height: ManagerHeight.h82),
                          Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: ManagerWidth.w16),
                              child: Container(
                                width: double.infinity,
                                height: ManagerHeight.h71,
                                decoration: BoxDecoration(
                                  color: AppColors.backgroundTabBar,
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                padding: EdgeInsets.all(5.r),
                                child: TabBar(
                                  controller: _tabController,
                                  indicator: BoxDecoration(
                                    color: AppColors.purple,
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  indicatorSize: TabBarIndicatorSize.tab,
                                  labelColor: Colors.white,
                                  dividerColor: Colors.transparent,
                                  unselectedLabelColor: AppColors.black,
                                  unselectedLabelStyle: TextStyle(
                                    fontSize: ManagerFontSize.s18,
                                    fontFamily: 'Afacad',
                                    fontWeight: FontWeight.w500,
                                  ),
                                  labelStyle: TextStyle(
                                    fontSize: ManagerFontSize.s18,
                                    fontFamily: 'Afacad',
                                    fontWeight: FontWeight.w500,
                                  ),
                                  tabs: const [
                                    Tab(text: 'Outbox'),
                                    Tab(text: 'Inbox'),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: state.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : TabBarView(
                    controller: _tabController,
                    children: [
                      _buildMessageList(
                        isDarkMode: isDarkMode,
                        messages: state.outboxMessages,
                      ),
                      _buildMessageList(
                        isDarkMode: isDarkMode,
                        messages: state.inboxMessages,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildMessageList({
    required bool isDarkMode,
    required List messages,
  }) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(
        horizontal: ManagerWidth.w16,
        vertical: ManagerHeight.h16,
      ),
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final message = messages[index];

        return Container(
          margin: EdgeInsets.only(bottom: ManagerHeight.h8),
          padding: EdgeInsets.all(12.r),
          decoration: BoxDecoration(
            color: isDarkMode ? AppColors.black : Colors.white,
            borderRadius: BorderRadius.circular(12.r),
            boxShadow: [
              if (!isDarkMode)
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      message.username,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: ManagerFontSize.s16,
                        color: isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                    SizedBox(height: ManagerHeight.h8),
                    Text(
                      message.date,
                      style: TextStyle(
                        fontSize: ManagerFontSize.s12,
                        color: isDarkMode ? Colors.white70 : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Icon(
                    Icons.circle,
                    size: 12,
                    color: message.isOnline ? Colors.green : Colors.grey,
                  ),
                  SizedBox(width: ManagerWidth.w8),
                  Icon(
                    message.isNewMessage
                        ? Icons.mark_email_unread_outlined
                        : Icons.mark_email_read_outlined,
                    color:
                    message.isNewMessage ? Colors.red : Colors.grey,
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
