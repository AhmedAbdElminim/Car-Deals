class ApplyModel {
  final String carBrand;
  final String carName;
  final String carModel;
  final String userName;
  final String uId;
  final String userPhone;

  ApplyModel(
      {required this.userName,
      required this.uId,
      required this.userPhone,
      required this.carBrand,
      required this.carName,
      required this.carModel});
  factory ApplyModel.fromJson(Map<String, dynamic> json) => ApplyModel(
      userName: json['userName'],
      uId: json['uId'],
      userPhone: json['userPhone'],
      carBrand: json['carBrand'],
      carName: json['carName'],
      carModel: json['carModel']);
  Map<String, dynamic> toJson() {
    return {
      "userName": userName,
      "uId": uId,
      "userPhone": userPhone,
      "carBrand": carBrand,
      "carName": carName,
      "carModel": carModel
    };
  }
}
