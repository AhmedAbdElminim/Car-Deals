class PaymentConstants {
  static String payMobApiKey =
      'ZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6VXhNaUo5LmV5SnVZVzFsSWpvaWFXNXBkR2xoYkNJc0luQnliMlpwYkdWZmNHc2lPakk0TWpNNE9Dd2lZMnhoYzNNaU9pSk5aWEpqYUdGdWRDSjkuc2UzWHk3MG05MU51N3dmWllneVoxUGlscTdubmFyb3E1SzlDMHV0bmdVNHIxZWhWdW8wUHVOOWJlcjBQWHZGdUllcUpNclp4cWZCMXQ2QzBqM1F6RVE=';
  static String authenticationApi = 'https://accept.paymob.com/api/auth/tokens';
  static String orderApi = 'https://accept.paymob.com/api/ecommerce/orders';
  static String paymentKeyApi =
      'https://accept.paymob.com/api/acceptance/payment_keys';
  static String getOrderDetailsApi({required int orderId}) =>
      'https://accept.paymob.com/api/ecommerce/orders/$orderId';
  static String integrationId = '2550968';
  static String getFrameUrl({required String token}) =>
      'https://accept.paymob.com/api/acceptance/iframes/444036?payment_token=$token';
}