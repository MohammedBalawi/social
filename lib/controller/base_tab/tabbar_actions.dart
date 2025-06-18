import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:marrige_app/controller/base_tab/actions_state.dart';
 import 'package:marrige_app/libs/debug_it.dart';
import 'package:marrige_app/libs/dialogs/custom_dialog.dart';
import 'package:marrige_app/libs/event_bus/event_bus.dart';

class TabBarActions {
  String _tag = "TabBarActions";


  TabBarActions() {
    DebugIT.printLog(_tag, "TabBarActions called");
    initTimers();
  }

  void initTimers() {
    Every1Minute();
  }



  void Every1Minute() {
    Future.delayed(Duration(minutes: 1), () {
      Every1Minute();
      DebugIT.printLog(_tag, "Running function every 1 min");
      RefreshLastUSEOnline();

    });
  }


  // تحديث اخر تواجد والمحافظة على السيشن
  void RefreshLastUSEOnline(){

  }




}