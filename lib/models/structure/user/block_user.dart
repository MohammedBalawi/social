class BlockUserRequest {
  String? bndID;

  BlockUserRequest({this.bndID});

  BlockUserRequest.fromJson(Map<String, dynamic> json) {
    bndID = json['BndID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['BndID'] = this.bndID;
    return data;
  }
}