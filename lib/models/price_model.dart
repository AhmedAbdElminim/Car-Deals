class PriceModel {
  final String userId;
  final String userName;
  final String userPhone;
  final int userPrice;

  PriceModel(
      {required this.userId,
      required this.userName,
      required this.userPhone,
      required this.userPrice});
  factory PriceModel.fromJson(Map<String, dynamic> json) => PriceModel(
      userId: json['userId'],
      userName: json['userName'],
      userPhone: json['userPhone'],
      userPrice: json['userPrice']);
  Map<String, dynamic> toJson() {
    return {
      "userId": userId,
      "userName": userName,
      "userPhone": userPhone,
      "userPrice": userPrice
    };
  }
}
