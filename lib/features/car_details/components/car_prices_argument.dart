class CarPricesArgument {
  final String carId;
  final String carImage;
  final String carName;
  final bool carExpired;
  final int initialPrice;

  CarPricesArgument(
      {required this.carId,
      required this.carImage,
      required this.carName,
      required this.carExpired,
      required this.initialPrice});
}
