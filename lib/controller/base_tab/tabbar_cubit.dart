import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:marrige_app/controller/base_tab/tabbar_actions.dart';

import 'package:marrige_app/layouts/widgets/popup/popup_helper.dart';
 import 'package:marrige_app/libs/debug_it.dart';
import 'package:marrige_app/libs/event_bus/event_bus.dart';
import 'package:marrige_app/main.dart';


enum BottomNavPage { home, online, messages, myList, myAccount }

class TabBarCubit extends Cubit<BottomNavPage> {
  final String _tag = "tabbar_cubit";
  late final TabBarActions _TabBarActions;

  TabBarCubit() : super(BottomNavPage.home) {
    DebugIT.printLog(_tag, "Start loading TabBarCubit that will control all tabs");
    _initialize();
  }

  /*
  عند التنقل بين التاب
   */
  void selectTab(BottomNavPage tab) {
    if(state==tab){
      _refreshCurrentTab(tab);
    }else {
     DebugIT.printLog(_tag, "change tab bar to $tab");
      emit(tab);
      if (tab == BottomNavPage.online) { // كل ماندخله سنطلب الجديد ، كل مرة
     //   eventBus.fire(RestMessagesAllPage());
      }
      emit(tab);
    }
  }


  void _initialize() async {
    _TabBarActions = TabBarActions();

    callChat();
  }


  void callChat() async{
  //  ChatListeners(); // Singleton for managing chat listeners

    final BuildContext? context = navigatorKey.currentContext;
    PopupHelper.showLoadingDialog(context,BlockWindow: true);

  }


  void _refreshCurrentTab(BottomNavPage tab) {
    DebugIT.printLog(_tag, "Refresh current tab: " + tab.toString());

    if (tab == BottomNavPage.home) {
    //  eventBus.fire(RestMainPage());
    } else if (tab == BottomNavPage.online) {
    //  eventBus.fire(RefreshTabOnlineUsers());
    }
  }
}