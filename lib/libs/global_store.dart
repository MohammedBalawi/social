
class GlobalStore {
  static final GlobalStore _instance = GlobalStore._internal();

  factory GlobalStore() => _instance;

  GlobalStore._internal();


  int? ChatOpenWithThisUserID;
  bool DisableAlertErrorToClient = false;

  Map<int, String> needToRefreshForLikesMainPage = {};
  Map<int, String> needToRefreshForSendPmIds = {};
}