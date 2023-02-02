class UserModel {
  final String userName;
  final String uId;
  final String userEmail;
  final String userImage;
  final String userPhone;

  UserModel(
      {required this.userName,
      required this.uId,
      required this.userEmail,
      required this.userImage,
      required this.userPhone});
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        userName: json['userName'],
        userEmail: json['userEmail'],
        userImage: json['userImage'],
        userPhone: json['userPhone'],
        uId: json['uId'],
      );
  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'userEmail': userEmail,
      'userImage': userImage,
      'userPhone': userPhone,
      'uId': uId,
    };
  }
}
