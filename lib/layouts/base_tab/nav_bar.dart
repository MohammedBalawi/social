import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:marrige_app/config/manager_height.dart';
import 'package:marrige_app/config/manager_width.dart';
import 'package:marrige_app/config/responsive/screen_util_new.dart';
import 'package:marrige_app/controller/base_tab/tabbar_cubit.dart';
import 'package:marrige_app/layouts/base_tab/nav_bottom_item.dart';

import 'package:marrige_app/libs/lang/localization_helper.dart';

import '../../config/app_colors.dart';



class NavBar extends StatelessWidget {
  final BottomNavPage selectedTab;
  final Function(BottomNavPage) onTabSelected;

  const NavBar({required this.selectedTab, required this.onTabSelected, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtilNew.init(context);
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final bgColor = isDarkMode ? Colors.black87 : Colors.white;
    return Container(
      width: double.infinity,
      height: ManagerHeight.h96<78?ManagerHeight.h96:96,
      decoration: BoxDecoration(
        color: isDarkMode ? AppColors.inputFieldDarkBackground : Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(0, 4),
            blurRadius: 8,
            spreadRadius: -1,
          ),
        ],
      ),
      child: SafeArea(
        bottom: false,
        child: BottomAppBar(
          color: Colors.transparent,
          elevation: 0,
          shadowColor: Colors.transparent,
          child: Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: List.generate(BottomNavPage.values.length, (index) {
              final tab = BottomNavPage.values[index];
              return Flexible(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w16), // No extra padding on sides
                  child: NavBottomItem(
                    isSelected: selectedTab == tab,
                    icon: _getTabIcon(tab),
                    title: _getTabLabel(tab,context),
                    onPressed: () {
                      onTabSelected(tab);
                    },
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }


  IconData _getTabIcon(BottomNavPage tab) {
    switch (tab) {
      case BottomNavPage.myAccount: return FontAwesomeIcons.solidAddressCard;
      case BottomNavPage.myList: return FontAwesomeIcons.users;
      case BottomNavPage.messages: return FontAwesomeIcons.solidMessage;
      case BottomNavPage.online: return FontAwesomeIcons.podcast;
      default: return FontAwesomeIcons.house;
    }
  }

  String _getTabLabel(BottomNavPage tab,BuildContext context) {
    switch (tab) {
      case BottomNavPage.myAccount: return AppLocalizations.of(context)!.tr('myaccount');
      case BottomNavPage.myList:  return AppLocalizations.of(context)!.tr('my_list');
      case BottomNavPage.messages:  return AppLocalizations.of(context)!.tr('messages');
      case BottomNavPage.online: return  AppLocalizations.of(context)!.tr('online');
      default: return    AppLocalizations.of(context)!.tr('home');
    }
  }
}
