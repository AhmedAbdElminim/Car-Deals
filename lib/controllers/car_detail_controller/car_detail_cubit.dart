import 'package:car_deals/features/car_details/payment/payment_constants/payment_constants.dart';
import 'package:car_deals/models/car_model.dart';
import 'package:car_deals/shared/component/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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

  //payment functions
  String? accessToken;
  String? token;

  int? orderId;

  Future<void> isUserExit({
    required String carId,
  }) async {
    try {
      emit(CheckTransactionStatusLoadingState());
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
                print('yes your function work successfuly');
                checkPaymentTransactionStatus(orderId: 120065404);
                emit(CheckTransactionStatusSuccessState());
              }
            },
          );
        },
      );
    } catch (error) {
      print('the error in check function is $error');
    }
  }

  Future<void> checkPaymentTransactionStatus({required int orderId}) async {
    try {
      getAccessToken(isNewOrder: false,orderId: orderId);

    } catch (error) {
      print('the error in check Payment Transaction Status function is $error');
    }
  }

  Future<void> getAccessToken({required bool isNewOrder,required int orderId}) async {
    // emit(PostDataLoadingState());
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
        // getOrderId(authToken: jsonResponse['token']);
      }
      else{
        getOrderDetails(orderId: orderId, accessToken: accessToken!);
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
      // emit(PostDataErrorState());
    }
  }

  bool? isSuccessfulTransaction;
  Future<void> getOrderDetails({
    required int orderId,
    required String accessToken,
  }) async {
    //emit(GetOrderDetailLoadingState());
    var response = await http.get(
      Uri.parse(PaymentConstants.getOrderDetailsApi(orderId: orderId)),
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

      // emit(GetOrderDetailSuccessState());
    } else {
      print('Request failed with status: ${response.statusCode}.');
      // emit(PostDataErrorState());
    }
  }
}
