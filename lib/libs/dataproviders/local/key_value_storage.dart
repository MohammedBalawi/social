import 'package:flutter/material.dart';
import 'package:marrige_app/libs/debug_it.dart';

import 'key_value_storage_provider.dart';

class KeyValueStorage {
  final String _tag = "KeyValueStorage";
  final String _fontSizeScaleKey = 'fontSizeScale';
  final String _selectedLanguageKey = 'selectedLanguage';
  final String _userTokenKey = 'userToken';
  final String _sessionIdKey = 'sessionId';
  final String _forceUpdateDataKey = 'ForceUpdateData';
  final String _generalConfigKey = 'GeneralConfig';
  final String _userInfoKey = 'UserInfo';
  final String _userTypeDefaultsKey = 'UserTypeDefaults';
  final String _usersTypesForChatKey = 'UsersTypesForChat';
  final String _usersTypesForSendAudioMSGsKey = 'UsersTypesForSendAudioMSGs';
  final String _onlineStatusChatSwitchCountCookieKey =
      'OnlineStatusChatSwitchCountCookie';
  final String _onlineStatusChatSwitchTimestampKey =
      'OnlineStatusChatSwitchCountCookie-Timestamp';
  final String _stopNewLoginSoundKey = 'StopNewLoginSound';
  final String _soundOnNewMessageKey = 'SoundOnNewMessage';
  final String _clientInfo = 'ClientInfo';
  final String _playbackSpeedKey = 'PlaybackSpeed';

  final StorageProvider _storageProvider = StorageProvider();

  static final KeyValueStorage _instance = KeyValueStorage._internal();

  KeyValueStorage._internal();

  factory KeyValueStorage() {
    return _instance;
  }

  Future<double?> getFontSizeScale(BuildContext context) async {
    // Try to read the stored font size scale
    double? storedScale = await _storageProvider.getDouble(_fontSizeScaleKey);

    // If the stored value is null, fallback to the system's text scale factor
    if (storedScale == null && context.mounted) {
      return MediaQuery.textScalerOf(context).scale(1);
    }

    return storedScale;
  }

  void setFontSizeScale(double fontScale) {
    _storageProvider.saveDouble(_fontSizeScaleKey, fontScale);
  }

  Future<String?> getSelectedLanguage() async {
    final savedLanguage =
        await _storageProvider.getString(_selectedLanguageKey);
    DebugIT.printLog(_tag,
        'return the selected language $savedLanguage in shared preference');

    return await _storageProvider.getString(_selectedLanguageKey);
  }

  void setLanguage(String languageCode) {
    _storageProvider.saveString(_selectedLanguageKey, languageCode);
    DebugIT.printLog(_tag,
        'Save the new selected language $languageCode to shared preference');
  }

  Future<String?> getUserToken() async {
    final token = await _storageProvider.getString(_userTokenKey);
    DebugIT.printLog(_tag,
        'return the saved  user access token $token in shared preference');
    return await _storageProvider.getString(_userTokenKey);
  }

  void saveUserToken(String userToken) {
    _storageProvider.saveString(_userTokenKey, userToken);
    DebugIT.printLog(_tag, 'Save user token to shared preference');
  }

  void saveSId(String sID) {
    _storageProvider.saveString(_sessionIdKey, sID);
    DebugIT.printLog(_tag, 'Save session id $sID to shared preference');
  }

  Future<String?> getSID() async {
    final sid = await _storageProvider.getString(_sessionIdKey);
    DebugIT.printLog(_tag, 'return the session id $sid from shared preference');
    return sid;
  }

  void saveForceUpdateData(String forceUpdateData) {
    _storageProvider.saveString(_forceUpdateDataKey, forceUpdateData);
    DebugIT.printLog(_tag, 'Save force update data to shared preference');
  }

  void saveGeneralConfig(String generalConfig) {
    _storageProvider.saveString(_generalConfigKey, generalConfig);
    DebugIT.printLog(
        _tag, 'Save general config to shared preference $generalConfig');
  }

  void saveUserInfo(String userInfo) {
    _storageProvider.saveString(_userInfoKey, userInfo);
    DebugIT.printLog(_tag, 'Save user info $userInfo to shared preference');
  }

  void saveUserTypeDefaults(String userTypeDefaults) {
    _storageProvider.saveString(_userTypeDefaultsKey, userTypeDefaults);
    DebugIT.printLog(
        _tag, 'Save user type defaults to $userTypeDefaults shared preference');
  }

  void saveUsersTypesForChat(String usersTypesForChat) {
    _storageProvider.saveString(_usersTypesForChatKey, usersTypesForChat);
    DebugIT.printLog(_tag,
        'Save users types for chat $usersTypesForChat to shared preference');
  }

  void clearUserData() {
    _storageProvider.removeValue(_usersTypesForChatKey);
    _storageProvider.removeValue(_userTypeDefaultsKey);
    _storageProvider.removeValue(_userInfoKey);
    _storageProvider.removeValue(_userTokenKey);
    _storageProvider.removeValue(_sessionIdKey);
    DebugIT.printLog(_tag, 'clear all user data from shared preference');
  }

  void saveClientInfo(String clientInfo) {
    _storageProvider.saveString(_clientInfo, clientInfo);
    DebugIT.printLog(
        _tag, 'Save Client Info  $clientInfo to shared preference');
  }

  Future<String?> getUserInfo() async {
    return await _storageProvider.getString(_userInfoKey);
  }

  void clearClientInfo() {
    _storageProvider.removeValue(_clientInfo);
    DebugIT.printLog(_tag, "Client info cleared ${getClientInfo()}");
  }

  Future<String?> getClientInfo() async {
    final userInfoFullData = await _storageProvider.getString(_clientInfo);
    DebugIT.printLog(
        _tag, "Get userInfoFullData from local storage $userInfoFullData");
    return userInfoFullData;
  }

  void clearUserToken() {
    _storageProvider.removeValue(_userTokenKey);
    DebugIT.printLog(_tag, "User token cleared ${getUserToken()}");
  }

  Future<String?> getUsersTypesForChat() async {
    return await _storageProvider.getString(_usersTypesForChatKey);
  }

  void saveUsersTypesForSendAudioMSGs(String usersTypesForSendAudioMSGs) {
    _storageProvider.saveString(
        _usersTypesForSendAudioMSGsKey, usersTypesForSendAudioMSGs);
    DebugIT.printLog(_tag,
        'Save UsersTypesForSendAudioMSGs  $usersTypesForSendAudioMSGs to shared preference');
  }

  Future<String?> getUsersTypesForSendAudioMSGs() async {
    return await _storageProvider.getString(_usersTypesForSendAudioMSGsKey);
  }

  Future<int?> getOnlineStatusChatSwitchCount() async {
    return await _storageProvider.getInt(_onlineStatusChatSwitchCountCookieKey);
  }

  void saveOnlineStatusChatSwitchCount(int switchCount) {
    _storageProvider.saveInt(
        _onlineStatusChatSwitchCountCookieKey, switchCount);
    DebugIT.printLog(_tag,
        'Save OnlineStatusChatSwitchCountCookie  $switchCount to shared preference');
  }

  Future<void> resetOnlineStatusChatSwitchCount() async {
    await _storageProvider.removeValue(_onlineStatusChatSwitchCountCookieKey);
  }

  Future<int?> getOnlineStatusChatSwitchTimestamp() async {
    return await _storageProvider.getInt(_onlineStatusChatSwitchTimestampKey);
  }

  void saveOnlineStatusChatSwitchTimestamp(int timestamp) {
    _storageProvider.saveInt(_onlineStatusChatSwitchTimestampKey, timestamp);
    DebugIT.printLog(
        _tag, 'Saved OnlineStatusChatSwitchCountCookie timestamp: $timestamp');
  }

  Future<void> resetOnlineStatusChatSwitchTimestamp() async {
    await _storageProvider.removeValue(_onlineStatusChatSwitchTimestampKey);
    DebugIT.printLog(_tag, 'Reset OnlineStatusChatSwitchCountCookie timestamp');
  }

  Future<bool?> getStopNewLoginSound() async {
    return await _storageProvider.getBool(_stopNewLoginSoundKey);
  }

  Future<void> saveStopNewLoginSound(bool value) async {
    await _storageProvider.saveBool(_stopNewLoginSoundKey, value);
    DebugIT.printLog(_tag, 'Saved StopNewLoginSound preference: $value');
  }

  Future<bool> getSoundOnNewMessage() async {
    final soundPreference =
        await _storageProvider.getBool(_soundOnNewMessageKey);
    DebugIT.printLog(
        _tag, 'Retrieved SoundOnNewMessage preference: $soundPreference');
    return soundPreference ?? true;
  }

  Future<void> saveSoundOnNewMessage(bool value) async {
    await _storageProvider.saveBool(_soundOnNewMessageKey, value);
    DebugIT.printLog(_tag, 'Saved SoundOnNewMessage preference: $value');
  }

  void savePlaybackSpeed(double speed) {
    _storageProvider.saveDouble(_playbackSpeedKey, speed);
    DebugIT.printLog(
        _tag, 'Saved playback speed: $speed to shared preferences');
  }

// Get playback speed
  Future<double> getPlaybackSpeed() async {
    double? speed = await _storageProvider.getDouble(_playbackSpeedKey);
    if (speed == null) {
      speed = 1.0; // Default to normal speed if not set
      savePlaybackSpeed(speed); // Save the default value
    }
    DebugIT.printLog(
        _tag, 'Retrieved playback speed: $speed from shared preferences');
    return speed;
  }
}
