import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marrige_app/layouts/widgets/popup/popup_helper.dart';
import 'package:marrige_app/libs/debug_it.dart';
import 'package:marrige_app/libs/event_bus/event_bus.dart';
import 'package:marrige_app/main.dart';
import 'package:marrige_app/models/structure/tab_bar/mylist/iblockedhim_response.dart';
import 'package:marrige_app/models/structure/tab_bar/mylist/iblockedhimstate.dart';

class IBlockedHimCubit extends Cubit<IBlockedHimState> {

  String _tag = "IBlockedHimCubit";


  int _nextPageNum = 0;
  bool isLoading = false;
  bool isFirstLoad = true;

  IBlockedHimCubit() : super(IBlockedHimState.initial())
  {
    DebugIT.printLog(_tag, "IBlockedHimCubit called");
    _eventBusListener();
    LoadDataAPI();
  }



  _eventBusListener(){

  }

  _restIblockedHimPage(){
    _nextPageNum = 0;
    isLoading = false;
    emit(IBlockedHimState(  members: [], noData: false));
  }

  LoadDataAPI() async {
   }



  DeleteFromList(int DeleteID) async{

  }

  navigateToMemberProfile(int? id) {
    //todo go to profile
    DebugIT.printLog(_tag, "Go to profile $id");
  }


}


class RestIBlockedHimPage {
}