import 'package:marrige_app/models/structure/tab_bar/home/main_block_user_data.dart';
import 'package:marrige_app/models/structure/tab_bar/home/spotlight_user.dart';

class mainPageResponse {
  String? notNodeCall;
  List<SpotlightUsers>? spotlightUsers;
  String? edge;
  String? iMGsFirst;
  List<int>? showedIDsSorted;
  List<MainBlockUserData>? data;
  String? retSex;

  mainPageResponse(
      {this.notNodeCall,
        this.spotlightUsers,
        this.edge,
        this.iMGsFirst,
        this.showedIDsSorted,
        this.data,
        this.retSex});

  mainPageResponse.fromJson(Map<String, dynamic> json) {
    notNodeCall = json['NotNodeCall'];
    if (json['SpotlightUsers'] != null) {
      spotlightUsers = <SpotlightUsers>[];
      json['SpotlightUsers'].forEach((v) {
        spotlightUsers!.add(new SpotlightUsers.fromJson(v));
      });
    }else{
      spotlightUsers = [];//no more to load
    }
    edge = json['Edge'];
    iMGsFirst = json['IMGsFirst'];
    showedIDsSorted = json['ShowedIDsSorted'].cast<int>();
    if (json['Data'] != null) {
      data = <MainBlockUserData>[];
      json['Data'].forEach((v) {
        data!.add(new MainBlockUserData.fromJson(v));
      });
    }else{
      data = [];//no more to load
    }
    retSex = json['RetSex'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['NotNodeCall'] = this.notNodeCall;
    if (this.spotlightUsers != null) {
      data['SpotlightUsers'] =
          this.spotlightUsers!.map((v) => v.toJson()).toList();
    }
    data['Edge'] = this.edge;
    data['IMGsFirst'] = this.iMGsFirst;
    data['ShowedIDsSorted'] = this.showedIDsSorted;
    if (this.data != null) {
      data['Data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['RetSex'] = this.retSex;
    return data;
  }
}

