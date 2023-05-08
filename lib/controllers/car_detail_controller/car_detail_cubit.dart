import 'package:car_deals/features/car_details/payment/payment_constants/payment_constants.dart';
import 'package:car_deals/models/car_model.dart';
import 'package:car_deals/shared/component/app_local.dart';
import 'package:car_deals/shared/component/constants.dart';
import 'package:car_deals/shared/component/loading_widget.dart';
import 'package:car_deals/shared/style/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import '../../shared/component/function.dart';
import 'car_detail_states.dart';

class CarDetailCubit extends Cubit<CarDetailStates> {
  CarDetailCubit() : super(CarDetailInitialState());
  static CarDetailCubit get(context) => BlocProvider.of(context);
  late CarModel carModel;
  Future<void> getCarDetail({required String carId}) async {
    try {
      emit(GetCarDetailLoadingState());
      if (await execute(customInstance)) {
        FirebaseFirestore.instance
            .collection('cars')
            .doc(carId)
            .get()
            .then((value) {
          carModel = CarModel.fromJson(value.data()!);
          emit(GetCarDetailSuccessState());
        });
      } else {
        emit(GetCarDetailInternetConnectionErrorState());
      }
    } catch (error) {
      emit(GetCarDetailErrorState(error: error.toString()));
    }
  }

  bool getExpired({required String date}) {
    //"2023-01-28"

    return DateTime.now().difference(DateTime.parse(date)).inDays >= 7;
  }

  ///payment functions
  String? accessToken;
  String? token;

  int? orderNumber;

  Future<void> isUserExit({
    required String carId,
    required BuildContext context,
  }) async {
    try {
      emit(CheckTransactionStatusLoadingState());
      bool isExist = false;

      FirebaseFirestore.instance
          .collection('cars')
          .doc(carId)
          .collection('bidders')
          .get()
          .then(
        (value) {
          value.docs.forEach(
            (element) {
              if (element.id == userModel!.uId) {
                orderNumber = element.data()['orderNumber'];
                isExist = true;
              }
            },
          );

          if (isExist) {
            print('yes your function work successfully');
            bool isPaid = false;
            checkPaymentTransactionStatus(orderId: orderNumber!);

            emit(CheckTransactionStatusSuccessState());
          } else {
            emit(ShowDialogState());
          }
        },
      );
    } catch (error) {
      print('the error in check function is $error');
    }
  }

  Future<void> checkPaymentTransactionStatus({required int orderId}) async {
    try {
      getAccessToken(isNewOrder: false, carId: '');
    } catch (error) {
      print('the error in check Payment Transaction Status function is $error');
    }
  }

  Future<void> getAccessToken({
    required bool isNewOrder,
    required String carId,
  }) async {
    //emit(PayLoadingState());
    var response = await http.post(
      Uri.parse(PaymentConstants.authenticationApi),
      headers: {
        "Content-Type": "application/json",
      },
      body: convert.jsonEncode({"api_key": PaymentConstants.payMobApiKey}),
    );

    if (response.statusCode == 201) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      accessToken = jsonResponse['token'];
      if (isNewOrder) {
        getOrderNumber(carId: carId);
      } else {
        getOrderDetails(
          accessToken: accessToken!,
        );
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
      // emit(PostDataErrorState());
    }
  }

  ///Get Order Number
  Future<void> getOrderNumber({
    required String carId,
  }) async {
    var response = await http.post(
      Uri.parse(PaymentConstants.orderApi),
      headers: {
        "Content-Type": "application/json",
      },
      body: convert.jsonEncode({
        "auth_token": accessToken,
        "delivery_needed": "false",
        "amount_cents": "10000",
        "items": [],
      }),
    );

    if (response.statusCode == 201) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      orderNumber = jsonResponse['id'];
      print('the order number is : $orderNumber');
      getToken(carId: carId);
    } else {
      print('Request failed with status: ${response.statusCode}.');
      // emit(PostDataErrorState());
    }
  }

  ///Get token
  Future<void> getToken({
    required String carId,
  }) async {
    var response = await http.post(
      Uri.parse(PaymentConstants.paymentKeyApi),
      headers: {
        "Content-Type": "application/json",
      },
      body: convert.jsonEncode({
        "auth_token": accessToken,
        "amount_cents": "10000",
        "expiration": 3600,
        "order_id": orderNumber,
        "billing_data": {
          "apartment": "803",
          "email": "test@test.com",
          "floor": "42",
          "first_name": "ahmed",
          "street": "Ethan Land",
          "building": "NA",
          "phone_number": "+201095295641",
          "shipping_method": "NA",
          "postal_code": "NA",
          "city": "NA",
          "country": "NA",
          "last_name": "abdelmoniem",
          "state": "NA"
        },
        "currency": "EGP",
        "integration_id": PaymentConstants.integrationId
      }),
    );

    if (response.statusCode == 201) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      token = jsonResponse['token'];
      addBidderToCar(
        carId: carId,
      );
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  bool? isSuccessfulTransaction;
  Future<void> getOrderDetails({
    required String accessToken,
  }) async {
    //emit(GetOrderDetailLoadingState());
    var response = await http.get(
      Uri.parse(PaymentConstants.getOrderDetailsApi(orderId: orderNumber!)),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $accessToken"
      },
    );

    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      isSuccessfulTransaction =
          jsonResponse['paid_amount_cents'] > 0 ? true : false;
      if (isSuccessfulTransaction!) {
        emit(TransactionSuccessState());
      } else {
        emit(ShowDialogState());
      }

      // emit(GetOrderDetailSuccessState());
    } else {
      print('Request failed with status: ${response.statusCode}.');
      // emit(PostDataErrorState());
    }
  }

  Future<void> addBidderToCar({
    required String carId,
  }) async {
    try {
      print('the car id is $carId');
      print('the car id is ${userModel!.uId}');
      FirebaseFirestore.instance
          .collection('cars')
          .doc(carId)
          .collection('bidders')
          .doc(userModel!.uId)
          .set({'orderNumber': orderNumber}).then((value) {
        emit(PayMobAuthSuccessState());
      });
    } catch (error) {
      print('the error is here in add bidder to car: $error');
    }
  }

  Future<void> showInfoDialog({
    required BuildContext context,
    required String carId,
  }) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('${getLang(context, 'payment_dialog_info')}'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('${getLang(context, 'payment_dialog_body')}'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                '${getLang(context, 'payment_button')}',
                style:
                    TextStyle(color: defaultColor, fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                test(context: context).then((value) {
                  emit(PayLoadingState());
                  getAccessToken(isNewOrder: true, carId: carId)
                      .then((value) {});
                });
              },
            ),
            TextButton(
              child: Text(
                '${getLang(context, 'payment_cancel_button')}',
                style:
                    TextStyle(color: defaultColor, fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> test({required BuildContext context}) async {
    Navigator.pop(context);
  }

  Future<void> showLoadingDialog({
    required BuildContext context,

  }) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                LoadingWidget(loadingNum: 1),
                SizedBox(
                  height: 20,
                ),
                Center(
                    child: Text(
                  'Please Wait....',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                )),
              ],
            ),
          ),
        );
      },
    );
  }
}
