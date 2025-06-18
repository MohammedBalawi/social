class IBlockedHimResponse {
  int? nextNum;
  List<IblockedHimData>? result;

  IBlockedHimResponse({this.nextNum, this.result});

  IBlockedHimResponse.fromJson(Map<String, dynamic> json) {
    nextNum = int.tryParse(json['NextNum'].toString()) ?? 0;

    if (json['Result'] != null) {
      result = <IblockedHimData>[];
      json['Result'].forEach((v) {
        result!.add(new IblockedHimData.fromJson(v));
      });
    }else{
      result = [];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['NextNum'] = this.nextNum;
    if (this.result != null) {
      data['Result'] = this.result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class IblockedHimData {
  int? id;
  String? userName;
  int? userID;
  String? addDate;
  int? bandedID;
  int? totalRows;

  IblockedHimData(
      {this.id,
        this.userName,
        this.userID,
        this.addDate,
        this.bandedID,
        this.totalRows});

  IblockedHimData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['UserName'];
    userID = json['UserID'];
    addDate = json['AddDate'];
    bandedID = json['BandedID'];
    totalRows = json['TotalRows'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['UserName'] = this.userName;
    data['UserID'] = this.userID;
    data['AddDate'] = this.addDate;
    data['BandedID'] = this.bandedID;
    data['TotalRows'] = this.totalRows;
    return data;
  }
}
