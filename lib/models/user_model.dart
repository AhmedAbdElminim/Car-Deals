class UserModel {
  final String userName;
  final String uId;
  final String userEmail;

  final String userPhone;

  UserModel(
      {required this.userName,
      required this.uId,
      required this.userEmail,
      required this.userPhone});
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        userName: json['userName'],
        userEmail: json['userEmail'],
        userPhone: json['userPhone'],
        uId: json['uId'],
      );
  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'userEmail': userEmail,
      'userPhone': userPhone,
      'uId': uId,
    };
  }
}
