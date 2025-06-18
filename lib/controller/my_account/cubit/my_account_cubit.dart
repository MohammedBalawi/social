import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../models/my_account/my_account_model.dart';
part 'my_account_state.dart';

class MyAccountCubit extends Cubit<MyAccountState> {
  MyAccountCubit() : super(MyAccountInitial());

  Future<void> loadMyAccountFromJson() async {
    emit(MyAccountLoading());

    final String response = await rootBundle.loadString('assets/json/my_account_data.json');
    final data = await json.decode(response);

    final MyAccountModel model = MyAccountModel.fromJson(data);
    emit(MyAccountLoaded(model));
  }
}
