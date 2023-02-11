class ContactModel {
  final String userMessage;
  final String userName;
  final String uId;
  final String userPhone;

  ContactModel({
    required this.userName,
    required this.uId,
    required this.userPhone,
    required this.userMessage,
  });
  factory ContactModel.fromJson(Map<String, dynamic> json) => ContactModel(
        userName: json['userName'],
        uId: json['uId'],
        userPhone: json['userPhone'],
        userMessage: json['userMessage'],
      );
  Map<String, dynamic> toJson() {
    return {
      "userName": userName,
      "uId": uId,
      "userPhone": userPhone,
      "userMessage": userMessage,
    };
  }
}
