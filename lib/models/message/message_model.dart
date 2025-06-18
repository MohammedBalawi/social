
class MessageModel {
  final String username;
  final String date;
  final bool isOnline;
  final bool isNewMessage;

  MessageModel({
    required this.username,
    required this.date,
    required this.isOnline,
    required this.isNewMessage,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      username: json['username'],
      date: json['date'],
      isOnline: json['isOnline'],
      isNewMessage: json['isNewMessage'],
    );
  }
}
