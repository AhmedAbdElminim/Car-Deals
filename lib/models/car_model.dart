class CarModel {
  final String carId;
  final String carBrand;
  final String carName;
  final String carModel;
  final String carColor;
  final String carImage;
  final String carPrice;
  final String carTransmission;
  final String carSpeed;
  final String carDescription;
  final String carCapacity;

  CarModel(
      {required this.carId,
      required this.carBrand,
      required this.carName,
      required this.carModel,
      required this.carColor,
      required this.carImage,
      required this.carPrice,
      required this.carTransmission,
      required this.carSpeed,
      required this.carDescription,
      required this.carCapacity});
  factory CarModel.fromJson(Map<String, dynamic> json) => CarModel(
      carId: json['carId'],
      carBrand: json['carBrand'],
      carName: json['carName'],
      carModel: json['carModel'],
      carColor: json['carColor'],
      carImage: json['carImage'],
      carPrice: json['carPrice'],
      carTransmission: json['carTransmission'],
      carSpeed: json['carSpeed'],
      carDescription: json['carDescription'],
      carCapacity: json['carCapacity']);
  Map<String, dynamic> toJson() {
    return {
      "carId": carId,
      "carBrand": carBrand,
      "carName": carName,
      "carModel": carModel,
      "carColor": carColor,
      "carImage": carImage,
      "carPrice": carPrice,
      "carTransmission": carTransmission,
      "carSSpeed": carSpeed,
      "carDescription": carDescription,
      "carCapacity": carCapacity
    };
  }
}
