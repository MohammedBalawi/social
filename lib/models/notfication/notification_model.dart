class NotificationItem {
  final String title;
  final String time;
  final String date;
  final bool isNew;

  NotificationItem({
    required this.title,
    required this.time,
    required this.date,
    this.isNew = false,
  });

  factory NotificationItem.fromJson(Map<String, dynamic> json) {
    return NotificationItem(
      title: json['title'],
      time: json['time'],
      date: json['date'],
      isNew: json['isNew'] ?? false,
    );
  }
}
