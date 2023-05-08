///Pop up menu
// PopupMenuButton<int>(
// itemBuilder: (context) => [
// // PopupMenuItem 1
// const PopupMenuItem(
// value: 1,
// // row with 2 children
// child: Text("All"),
// ),
// // PopupMenuItem 2
// const PopupMenuItem(
// value: 2,
// // row with two children
// child:Text("Ongoing"),
// ),
// const PopupMenuItem(
// value: 3,
// // row with two children
// child:Text("Finished"),
// ),
// ],
// //offset: Offset(0, 100),   ----->  change the position of the menu
// color: Colors.white,
// elevation: 2,
//
// onSelected: (value) {
//
// if (value == 1) {
//
// } else if (value == 2) {
//
// }
// else if (value == 3) {
//
// }
// },
// ),


// Thank you for using the online payment service.
//
// The transaction you have attempted to make has been declined. If this problem persists, please contact your service provider.

//-----------------------------------------Payment Screen Code------------------------------------------//
// import 'package:car_deals/features/payment/test_screen.dart';
// import 'package:car_deals/shared/style/colors.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'dart:async';
//
// class PaymentScreen extends StatefulWidget {
//   const PaymentScreen({Key? key}) : super(key: key);
//   static String paymentScreenId = 'PaymentScreenId';
//
//   @override
//   State<PaymentScreen> createState() => _PaymentScreenState();
// }
//
// class _PaymentScreenState extends State<PaymentScreen> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }
//
//   bool isLoading = false;
//   void startTimer() {
//     setState(() {
//       isLoading = true;
//     });
//     Timer timer = Timer(const Duration(seconds: 5), () {
//       Navigator.push(
//           context, MaterialPageRoute(builder: (context) => const TestScreen()));
//     });
//
//     timer.cancel();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Card(
//           color: Colors.white,
//           elevation: 3,
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: SingleChildScrollView(
//               child: Center(
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         const Text(
//                           'Credit Card',
//                           style: TextStyle(
//                               fontSize: 20, fontWeight: FontWeight.bold),
//                         ),
//                         const Spacer(),
//                         SvgPicture.asset(
//                           'assets/images/payment/visa.svg',
//                           width: 20,
//                           height: 20,
//                         ),
//                         const SizedBox(
//                           width: 10,
//                         ),
//                         SvgPicture.asset(
//                           'assets/images/payment/mastercard.svg',
//                           width: 35,
//                           height: 35,
//                         ),
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 30,
//                     ),
//                     TextFormField(
//                       controller: TextEditingController(),
//                       keyboardType: TextInputType.number,
//                       decoration: InputDecoration(
//                         hintText: 'Card Number',
//                         focusedBorder: OutlineInputBorder(
//                             borderSide: BorderSide(
//                               color: defaultColor,
//                             ),
//                             borderRadius: BorderRadius.circular(15)),
//                         enabledBorder: OutlineInputBorder(
//                             borderSide: const BorderSide(
//                               color: Colors.grey,
//                             ),
//                             borderRadius: BorderRadius.circular(15)),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 30,
//                     ),
//                     TextFormField(
//                       controller: TextEditingController(),
//                       keyboardType: TextInputType.text,
//                       decoration: InputDecoration(
//                         hintText: 'Card Holder Name',
//                         focusedBorder: OutlineInputBorder(
//                             borderSide: BorderSide(
//                               color: defaultColor,
//                             ),
//                             borderRadius: BorderRadius.circular(15)),
//                         enabledBorder: OutlineInputBorder(
//                             borderSide: const BorderSide(
//                               color: Colors.grey,
//                             ),
//                             borderRadius: BorderRadius.circular(15)),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 30,
//                     ),
//                     Row(
//                       children: [
//                         Expanded(
//                           child: TextFormField(
//                             controller: TextEditingController(),
//                             keyboardType: TextInputType.number,
//                             decoration: InputDecoration(
//                               hintText: 'Exp. Month',
//                               focusedBorder: OutlineInputBorder(
//                                   borderSide: BorderSide(
//                                     color: defaultColor,
//                                   ),
//                                   borderRadius: BorderRadius.circular(15)),
//                               enabledBorder: OutlineInputBorder(
//                                   borderSide: const BorderSide(
//                                     color: Colors.grey,
//                                   ),
//                                   borderRadius: BorderRadius.circular(15)),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(
//                           width: 20,
//                         ),
//                         Expanded(
//                           child: TextFormField(
//                             controller: TextEditingController(),
//                             keyboardType: TextInputType.number,
//                             decoration: InputDecoration(
//                               hintText: 'Exp. Year',
//                               focusedBorder: OutlineInputBorder(
//                                   borderSide: BorderSide(
//                                     color: defaultColor,
//                                   ),
//                                   borderRadius: BorderRadius.circular(15)),
//                               enabledBorder: OutlineInputBorder(
//                                   borderSide: const BorderSide(
//                                     color: Colors.grey,
//                                   ),
//                                   borderRadius: BorderRadius.circular(15)),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 30,
//                     ),
//                     TextFormField(
//                       controller: TextEditingController(),
//                       keyboardType: TextInputType.number,
//                       decoration: InputDecoration(
//                         hintText: 'CVV',
//                         focusedBorder: OutlineInputBorder(
//                             borderSide: BorderSide(
//                               color: defaultColor,
//                             ),
//                             borderRadius: BorderRadius.circular(15)),
//                         enabledBorder: OutlineInputBorder(
//                             borderSide: const BorderSide(
//                               color: Colors.grey,
//                             ),
//                             borderRadius: BorderRadius.circular(15)),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 30,
//                     ),
//                     Center(
//                       child: MaterialButton(
//                         onPressed: () {
//                           setState(() {
//                             isLoading = true;
//                           });
//                           Timer timer = Timer(const Duration(seconds: 5), () {
//                             Navigator.push(
//                                 context, MaterialPageRoute(builder: (context) => const TestScreen()));
//                           });
//                           if(timer.isActive==false){
//                             setState(() {
//                               isLoading=false;
//                             });
//                             timer.cancel();
//                           }
//
//
//                         },
//                         color: defaultColor,
//                         child: isLoading
//                             ? CircularProgressIndicator(
//                           color: Colors.white,
//                         )
//                             : const Text(
//                           'Pay',
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 18),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 30,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         const Text(
//                           'Powered By ',
//                           style: TextStyle(
//                             fontWeight: FontWeight.w700,
//                             fontSize: 20,
//                           ),
//                         ),
//                         Text(
//                           'PayMob',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 25,
//                             color: defaultColor,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


//---------------------------------------------------------//
//
//
// import 'package:car_deals/features/car_details/payment/payment_constants/payment_constants.dart';
// import 'package:car_deals/models/car_model.dart';
// import 'package:car_deals/shared/component/app_local.dart';
// import 'package:car_deals/shared/component/constants.dart';
// import 'package:car_deals/shared/component/loading_widget.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert' as convert;
// import '../../shared/component/function.dart';
// import 'car_detail_states.dart';
//
// class CarDetailCubit extends Cubit<CarDetailStates> {
//   CarDetailCubit() : super(CarDetailInitialState());
//   static CarDetailCubit get(context) => BlocProvider.of(context);
//   late CarModel carModel;
//   Future<void> getCarDetail({required String carId}) async {
//     try {
//       emit(GetCarDetailLoadingState());
//       if (await execute(customInstance)) {
//         FirebaseFirestore.instance
//             .collection('cars')
//             .doc(carId)
//             .get()
//             .then((value) {
//           carModel = CarModel.fromJson(value.data()!);
//           emit(GetCarDetailSuccessState());
//         });
//       } else {
//         emit(GetCarDetailInternetConnectionErrorState());
//       }
//     } catch (error) {
//       emit(GetCarDetailErrorState(error: error.toString()));
//     }
//   }
//
//   bool getExpired({required String date}) {
//     //"2023-01-28"
//
//     return DateTime.now().difference(DateTime.parse(date)).inDays >= 7;
//   }
//
//   ///payment functions
//   String? accessToken;
//   String? token;
//
//   int? orderNumber;
//
//   Future<void> isUserExit({
//     required String carId,
//     required BuildContext context,
//   }) async {
//     try {
//       emit(CheckTransactionStatusLoadingState());
//       bool isExist = false;
//
//       FirebaseFirestore.instance
//           .collection('cars')
//           .doc(carId)
//           .collection('bidders')
//           .get()
//           .then(
//             (value) {
//           value.docs.forEach(
//                 (element) {
//               if (element.id == userModel!.uId) {
//                 orderNumber = element.data()['orderNumber'];
//                 isExist = true;
//               }
//             },
//           );
//
//           if (isExist) {
//             print('yes your function work successfully');
//             bool isPaid = false;
//             checkPaymentTransactionStatus(orderId: orderNumber!);
//
//             emit(CheckTransactionStatusSuccessState());
//           } else {
//             emit(ShowDialogState());
//           }
//         },
//       );
//     } catch (error) {
//       print('the error in check function is $error');
//     }
//   }
//
//   Future<void> checkPaymentTransactionStatus({required int orderId}) async {
//     try {
//       getAccessToken(isNewOrder: false, carId: '');
//     } catch (error) {
//       print('the error in check Payment Transaction Status function is $error');
//     }
//   }
//
//   Future<void> getAccessToken({
//     required bool isNewOrder,
//     required String carId,
//   }) async {
//     emit(PayLoadingState());
//     var response = await http.post(
//       Uri.parse(PaymentConstants.authenticationApi),
//       headers: {
//         "Content-Type": "application/json",
//       },
//       body: convert.jsonEncode({"api_key": PaymentConstants.payMobApiKey}),
//     );
//
//     if (response.statusCode == 201) {
//       var jsonResponse =
//       convert.jsonDecode(response.body) as Map<String, dynamic>;
//       accessToken = jsonResponse['token'];
//       if (isNewOrder) {
//         getOrderNumber(carId: carId);
//       } else {
//         getOrderDetails(
//           accessToken: accessToken!,
//         );
//       }
//     } else {
//       print('Request failed with status: ${response.statusCode}.');
//       // emit(PostDataErrorState());
//     }
//   }
//
//   ///Get Order Number
//   Future<void> getOrderNumber({
//     required String carId,
//   }) async {
//     var response = await http.post(
//       Uri.parse(PaymentConstants.orderApi),
//       headers: {
//         "Content-Type": "application/json",
//       },
//       body: convert.jsonEncode({
//         "auth_token": accessToken,
//         "delivery_needed": "false",
//         "amount_cents": "10000",
//         "items": [],
//       }),
//     );
//
//     if (response.statusCode == 201) {
//       var jsonResponse =
//       convert.jsonDecode(response.body) as Map<String, dynamic>;
//       orderNumber = jsonResponse['id'];
//       print('the order number is : $orderNumber');
//       getToken(carId: carId);
//     } else {
//       print('Request failed with status: ${response.statusCode}.');
//       // emit(PostDataErrorState());
//     }
//   }
//
//   ///Get token
//   Future<void> getToken({
//     required String carId,
//   }) async {
//     var response = await http.post(
//       Uri.parse(PaymentConstants.paymentKeyApi),
//       headers: {
//         "Content-Type": "application/json",
//       },
//       body: convert.jsonEncode({
//         "auth_token": accessToken,
//         "amount_cents": "10000",
//         "expiration": 3600,
//         "order_id": orderNumber,
//         "billing_data": {
//           "apartment": "803",
//           "email": "test@test.com",
//           "floor": "42",
//           "first_name": "ahmed",
//           "street": "Ethan Land",
//           "building": "NA",
//           "phone_number": "+201095295641",
//           "shipping_method": "NA",
//           "postal_code": "NA",
//           "city": "NA",
//           "country": "NA",
//           "last_name": "abdelmoniem",
//           "state": "NA"
//         },
//         "currency": "EGP",
//         "integration_id": PaymentConstants.integrationId
//       }),
//     );
//
//     if (response.statusCode == 201) {
//       var jsonResponse =
//       convert.jsonDecode(response.body) as Map<String, dynamic>;
//       token = jsonResponse['token'];
//       addBidderToCar(
//         carId: carId,
//       );
//
//       //emit(PostDataSuccessState());
//     } else {
//       print('Request failed with status: ${response.statusCode}.');
//       //  emit(PostDataErrorState());
//     }
//   }
//
//   bool? isSuccessfulTransaction;
//   Future<void> getOrderDetails({
//     required String accessToken,
//   }) async {
//     //emit(GetOrderDetailLoadingState());
//     var response = await http.get(
//       Uri.parse(PaymentConstants.getOrderDetailsApi(orderId: orderNumber!)),
//       headers: {
//         "Content-Type": "application/json",
//         "Authorization": "Bearer $accessToken"
//       },
//     );
//
//     if (response.statusCode == 200) {
//       var jsonResponse =
//       convert.jsonDecode(response.body) as Map<String, dynamic>;
//       isSuccessfulTransaction =
//       jsonResponse['paid_amount_cents'] > 0 ? true : false;
//       if (isSuccessfulTransaction!) {
//         emit(TransactionSuccessState());
//       } else {
//         emit(ShowDialogState());
//       }
//
//       // emit(GetOrderDetailSuccessState());
//     } else {
//       print('Request failed with status: ${response.statusCode}.');
//       // emit(PostDataErrorState());
//     }
//   }
//
//   Future<void> addBidderToCar({
//     required String carId,
//   }) async {
//     try {
//       print('the car id is $carId');
//       print('the car id is ${userModel!.uId}');
//       FirebaseFirestore.instance
//           .collection('cars')
//           .doc(carId)
//           .collection('bidders')
//           .doc(userModel!.uId)
//           .set({'orderNumber': orderNumber}).then((value) {
//         emit(PayMobAuthSuccessState());
//       });
//     } catch (error) {
//       print('the error is here in add bidder to car: $error');
//     }
//   }
//
//   Future<void> showInfoDialog({
//     required BuildContext context,
//     required String carId,
//   }) async {
//     return showDialog<void>(
//       context: context,
//       barrierDismissible: false, // user must tap button!
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('${getLang(context, 'payment_dialog_info')}'),
//           content: SingleChildScrollView(
//             child: ListBody(
//               children: <Widget>[
//                 Text('${getLang(context, 'payment_dialog_body')}'),
//               ],
//             ),
//           ),
//           actions: <Widget>[
//             TextButton(
//               child: state is PayLoadingState
//                   ? LoadingWidget(loadingNum: 1)
//                   : Text('${getLang(context, 'payment_button')}'),
//               onPressed: () {
//                 getAccessToken(isNewOrder: true, carId: carId);
//               },
//             ),
//             TextButton(
//               child: Text('${getLang(context, 'payment_cancel_button')}'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
