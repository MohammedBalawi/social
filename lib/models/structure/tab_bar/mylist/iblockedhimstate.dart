import 'package:marrige_app/models/structure/tab_bar/mylist/iblockedhim_response.dart';

class IBlockedHimState {
  final bool noData;
  final List<IblockedHimData> members;

  IBlockedHimState({
    required this.noData,
    required this.members,
  });

  factory IBlockedHimState.initial() => IBlockedHimState(noData: false, members: []);
}