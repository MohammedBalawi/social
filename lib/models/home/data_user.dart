import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:marrige_app/models/home/spotlightusers.dart' show DataUser, SpotlightUser;

Future<Map<String, dynamic>> loadJsonData() async {
  final String response = await rootBundle.loadString('assets/data.json');
  return json.decode(response);
}

Future<List<SpotlightUser>> loadSpotlightUsers() async {
  final data = await loadJsonData();
  var usersJson = data['SpotlightUsers'] as List;
  return usersJson.map((userJson) => SpotlightUser.fromJson(userJson)).toList();
}

Future<List<DataUser>> loadDataUsers() async {
  final data = await loadJsonData();
  var usersJson = data['Data'] as List;
  return usersJson.map((userJson) => DataUser.fromJson(userJson)).toList();
}

