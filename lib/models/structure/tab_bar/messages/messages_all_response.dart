class MessagesAllResponse {
  int? nextNum;
  List<MessagesAllData>? result;

  MessagesAllResponse({this.nextNum, this.result});

  MessagesAllResponse.fromJson(Map<String, dynamic> json) {
    nextNum = int.tryParse(json['NextNum'].toString()) ?? 0;
    if (json['Result'] != null) {
      result = <MessagesAllData>[];
      json['Result'].forEach((v) {
        result!.add(new MessagesAllData.fromJson(v));
      });
    }else{
      result = [];//if no more data
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

class MessagesAllData {
  String? userName;
  int? fromID;
  int? toID;
  String? sentDate;
  int? readStatus;
  String? canAddAttachment;

  MessagesAllData(
      {this.userName,
        this.fromID,
        this.toID,
        this.sentDate,
        this.readStatus,
        this.canAddAttachment});

  MessagesAllData.fromJson(Map<String, dynamic> json) {
    userName = json['UserName'];
    fromID = json['FromID'];
    toID = json['ToID'];
    sentDate = json['SentDate'];
    readStatus = json['ReadStatus'];
    canAddAttachment = json['CanAddAttachment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['UserName'] = this.userName;
    data['FromID'] = this.fromID;
    data['ToID'] = this.toID;
    data['SentDate'] = this.sentDate;
    data['ReadStatus'] = this.readStatus;
    data['CanAddAttachment'] = this.canAddAttachment;
    return data;
  }
}
