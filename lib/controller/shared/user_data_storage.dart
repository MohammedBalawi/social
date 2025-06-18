import 'dart:convert';
import 'package:marrige_app/libs/dataproviders/local/key_value_storage.dart';
import 'package:marrige_app/libs/debug_it.dart';
import 'package:marrige_app/models/structure/user/user_info_full_data.dart';

class UserDataStorage {
  static const _tag = 'UserDataStorage';
  static final storage = KeyValueStorage();

  static Future<void> storeUserData(Map<String, dynamic> response) async {
    if (response.containsKey('MSGs')) {
      final msgs = response['MSGs'];

      // Store SID
      if (msgs.containsKey('SID')) {
        storage.saveSId(msgs['SID']);
        // Store UserInfo
        final userInfo = msgs['UserInfo'];
        if (userInfo.containsKey('LoginToken')) {
          storage.saveUserToken(userInfo['LoginToken']);
          DebugIT.printLog(_tag, 'Saved LoginToken: ${userInfo['LoginToken']}');
        }
        storage.saveUserInfo(jsonEncode(userInfo));
        // Store UserTypeDefault
        storage.saveUserTypeDefaults(jsonEncode(msgs['UserTypeDefualts']));
        // Store GeneralConfig
        storage.saveGeneralConfig(jsonEncode(msgs['GeneralConfig']));
        // Store UsersTypesForChat
        storage.saveUsersTypesForChat(jsonEncode(msgs['UsersTypesForChat']));
        storage.saveUsersTypesForSendAudioMSGs(
            jsonEncode(msgs['UsersTypesForSendAudioMSGs']));
      }
      // Store ForceUpdateData
      if (msgs.containsKey('ForceUpdateData')) {
        storage.saveForceUpdateData(msgs['ForceUpdateData']);
        DebugIT.printLog(
            _tag, 'Saved ForceUpdateData: ${msgs['ForceUpdateData']}');
      }
    }
  }

  //Retrieve `UsersTypesForSendAudioMSGs` from storage
  static Future<Map<String, int>?> getUsersTypesForSendAudio() async {
    String? jsonString = await storage.getUsersTypesForSendAudioMSGs();

    if (jsonString == null) {
      DebugIT.printLog(
          _tag, 'UsersTypesForSendAudioMSGs not found in storage.');
      return null;
    }

    DebugIT.printLog(_tag, 'Retrieved UsersTypesForSendAudioMSGs: $jsonString');

    Map<String, dynamic> decodedMap = jsonDecode(jsonString);
    return decodedMap.map((key, value) => MapEntry(key, value as int));
  }

  static Future<String?> getUserGender() async {
    final userInfo = await getUserInfo();
    if (userInfo == null) {
      return null;
    }

    DebugIT.printLog(_tag, 'UserInfo: $userInfo');
    final gender = userInfo['Sex'];
    DebugIT.printLog(_tag, 'User Gender: $gender');

    return gender;
  }

  static Future<Map<String, dynamic>?> getUserInfo() async {
    String? jsonString = await storage.getUserInfo();
    if (jsonString != null) {
      final userInfo = jsonDecode(jsonString);
      return userInfo;
    }
    return null;
  }

  static Future<String?> getUserId() async {
    final userInfo = await getUserInfo();
    if (userInfo == null) {
      return null;
    }

    DebugIT.printLog(_tag, 'UserInfo: $userInfo');
    final userId = userInfo['id'];
    DebugIT.printLog(_tag, 'User Id: $userId');

    return userId;
  }

  static Future<Map<String, dynamic>?> getUsersTypesForChat() async {
    String? jsonString = await storage.getUsersTypesForChat();
    if (jsonString != null) {
      final usersTypesForChat = jsonDecode(jsonString);
      return usersTypesForChat;
    }
    return null;
  }

  static Future<int> getHideShowOnlineStatus() async {
    final userInfo = await getUserInfo();
    if (userInfo == null) {
      return 0;
    }
    DebugIT.printLog(_tag, 'UserInfo: $userInfo');
    final onlineStatus = userInfo['ChatOptions_HideShowOnlineStatus'];
    DebugIT.printLog(_tag, 'ChatOptions_HideShowOnlineStatus: $onlineStatus');
    if (onlineStatus == null) {
      return 0;
    }

    return int.tryParse(onlineStatus) ?? 0;
  }

  static Future<int> getAllowSendAudioMessage() async {
    final userInfo = await getUserInfo();
    if (userInfo == null) {
      return 0;
    }
    DebugIT.printLog(_tag, 'UserInfo: $userInfo');
    final sendAudioMSGs = userInfo['ChatOptions_SendAudioMSGs'];
    DebugIT.printLog(_tag, 'ChatOptions_SendAudioMSGs: $sendAudioMSGs');
    if (sendAudioMSGs == null) {
      return 0;
    }

    return int.tryParse(sendAudioMSGs) ?? 0;
  }

  static void saveClientDataInput(UserInfoFullData userInfoFullData) async {
    storage.saveClientInfo(userInfoFullData.toJson());
    DebugIT.printLog(_tag, "User info saved: ${userInfoFullData.toJson()}");
  }

  static Future<UserInfoFullData?>? getUserInfoFullData() async {
    final userDataAsString = await storage.getClientInfo();
    if (userDataAsString == null) {
      return null;
    }

    return UserInfoFullData.fromJson(userDataAsString);
  }

  static void clearClientInfo() {
    storage.clearClientInfo();
  }

  static void clearToken() {
    storage.clearUserToken();
  }

  static Future<String?> getLoginToke() async {
    return await storage.getUserToken();
  }

  static Future<int?> getHideLastLoginDate() async {
    final userInfo = await getUserInfo();

    DebugIT.printLog(_tag, 'UserInfo: $userInfo');
    final hideLastLoginDate = userInfo?['HideLastLoginDate'];
    DebugIT.printLog(_tag, 'HideLastLoginDate: $hideLastLoginDate');

    return int.tryParse(hideLastLoginDate);
  }
}
