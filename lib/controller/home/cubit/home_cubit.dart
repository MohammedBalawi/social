import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState(dataUsers: [], spotlightUsers: []));

  Future<void> loadHomeData() async {
    try {
      final data = await loadJsonData();

      
      var usersJson = data['Data'] as List;
      List<DataUser> dataUsers = usersJson.map((userJson) => DataUser.fromJson(userJson)).toList();

      // Load SpotlightUser data
      var spotlightUsersJson = data['SpotlightUsers'] as List;
      List<SpotlightUser> spotlightUsers = spotlightUsersJson.map((userJson) => SpotlightUser.fromJson(userJson)).toList();

      // Emit the new state with both data
      emit(HomeState(dataUsers: dataUsers, spotlightUsers: spotlightUsers));
    } catch (e) {
      print("Error: $e");
    }
  }
}

Future<Map<String, dynamic>> loadJsonData() async {
  final String response = await rootBundle.loadString('assets/data.json');
  return json.decode(response);
}

class HomeState {
  final List<DataUser> dataUsers;
  final List<SpotlightUser> spotlightUsers;

  HomeState({required this.dataUsers, required this.spotlightUsers});
}

class SpotlightUser {
  final int userID;
  final String userName;
  final String country;
  final String profileImage;
  final String age;

  SpotlightUser({
    required this.userID,
    required this.userName,
    required this.country,
    required this.profileImage,
    required this.age,
  });

  factory SpotlightUser.fromJson(Map<String, dynamic> json) {
    return SpotlightUser(
      userID: json['UserID'],
      userName: json['UserName'],
      country: json['Country'],
      profileImage: json['ProfileImage'],
      age: json['Age'],
    );
  }
}

class DataUser {
  final int id;
  final String userName;
  final String sex;
  final String age;
  final String country;
  final String profileImage;

  DataUser({
    required this.id,
    required this.userName,
    required this.sex,
    required this.age,
    required this.country,
    required this.profileImage,
  });

  factory DataUser.fromJson(Map<String, dynamic> json) {
    return DataUser(
      id: json['id'],
      userName: json['UserName'],
      sex: json['Sex'],
      age: json['Age'],
      country: json['CountryID'],
      profileImage: json['ProfileImage'],
    );
  }
}
