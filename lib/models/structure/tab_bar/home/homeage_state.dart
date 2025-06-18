import 'package:marrige_app/models/structure/tab_bar/home/main_block_user_data.dart';


class HomePageState {
  final bool noData;
  final List<MainBlockUserData> members;

  HomePageState({
    required this.noData,
    required this.members,
  });

  factory HomePageState.initial() => HomePageState(noData: false, members: []);
}