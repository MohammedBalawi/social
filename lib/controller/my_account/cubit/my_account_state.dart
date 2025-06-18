
part of 'my_account_cubit.dart';


abstract class MyAccountState {}

class MyAccountInitial extends MyAccountState {}

class MyAccountLoading extends MyAccountState {}

class MyAccountLoaded extends MyAccountState {
  final MyAccountModel myAccountModel;
  MyAccountLoaded(this.myAccountModel);
}
