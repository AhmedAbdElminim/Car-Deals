class NotificationModel {
  final String senderName;
  final String content;
  NotificationModel({required this.content, required this.senderName});

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
          senderName: json['senderName'], content: json['content']);

  Map<String, dynamic> toJson() {
    return {
      "senderName": senderName,
      "content": content,
    };
  }
}
