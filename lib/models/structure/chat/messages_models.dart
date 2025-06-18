class SendMessageRequest {
  int? toID;
  String? tBdy;
  String? isUserOnline;

  SendMessageRequest({this.toID, this.tBdy, this.isUserOnline});

  SendMessageRequest.fromJson(Map<String, dynamic> json) {
    toID = json['ToID'];
    tBdy = json['TBdy'];
    isUserOnline = json['IsUserOnline'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ToID'] = this.toID;
    data['TBdy'] = this.tBdy;
    data['IsUserOnline'] = this.isUserOnline;
    return data;
  }
}


class SendMessageResponse {
  String? resultMSG;
  String? typeIS;
  String? printtxt;
  int? showUpgradePage;
  bool? hideResultMSG;
  String? AttachName;

  SendMessageResponse(
      {this.resultMSG, this.typeIS, this.printtxt, this.showUpgradePage, this.hideResultMSG,this.AttachName});

  SendMessageResponse.fromJson(Map<String, dynamic> json) {
    resultMSG = json['ResultMSG'];
    typeIS = json['TypeIS'];
    printtxt = json['Print'];
    showUpgradePage = int.tryParse(json['ShowUpgradePage'].toString()) ?? 0;
    hideResultMSG = json['HideResultMSG']==null || json['HideResultMSG'].isEmpty ? false : true;
    AttachName = json['AttachName'];// فقط في حال ارسال ملف ، ستعيد الرابط الكامل
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ResultMSG'] = this.resultMSG;
    data['TypeIS'] = this.typeIS;
    data['Print'] = this.printtxt;
    data['ShowUpgradePage'] = this.showUpgradePage;
    data['hideResultMSG'] = this.hideResultMSG;
    data['AttachName'] = this.AttachName;
    return data;
  }
}


class DeleteMessageRequest {
  int? deleteMSGID;
  String? usersIDs;// عند الحذف الجماعي لاكثر من عضو

  DeleteMessageRequest({this.deleteMSGID, this.usersIDs});

  DeleteMessageRequest.fromJson(Map<String, dynamic> json) {
    deleteMSGID = int.tryParse(json['DeleteMSGID'].toString()) ;
    usersIDs = json['UsersIDs'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['DeleteMSGID'] = this.deleteMSGID;
    data['UsersIDs'] = this.usersIDs;
    return data;
  }
}
