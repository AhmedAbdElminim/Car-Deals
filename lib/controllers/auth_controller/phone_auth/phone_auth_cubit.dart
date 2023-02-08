import 'package:car_deals/controllers/auth_controller/phone_auth/phone_auth_states.dart';
import 'package:car_deals/shared/network/local/cache_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';
import 'package:telephony/telephony.dart';

import '../../../models/user_model.dart';
import '../../../shared/component/constants.dart';

class PhoneAuthCubit extends Cubit<PhoneAuthStates> {
  PhoneAuthCubit() : super(PhoneAuthInitialStates());
  static PhoneAuthCubit get(context) => BlocProvider.of(context);

  String? verificationCode;
  String? otpCode;
  Future<void> phoneAuth({
    required String phoneNumber,
  }) async {
    try {
      emit(PhoneAuthLoadingStates());
      FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+2$phoneNumber',
        verificationCompleted: (PhoneAuthCredential credential) {
          otpCode = credential.smsCode;
        },
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == 'invalid-phone-number') {
            emit(PhoneAuthErrorStates(
                error: 'The provided phone number is not valid.'));
          }
        },
        codeSent: (String verificationId, int? resendToken) {
          verificationCode = verificationId;
          emit(PhoneAuthSuccessStates());
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (error) {
      emit(PhoneAuthErrorStates(error: error.toString()));
    }
  }

  Future<void> checkPinCode({required String pinCode}) async {
    try {
      // Create a PhoneAuthCredential with the code
      emit(CheckPinCodeLoadingStates());
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationCode!, smsCode: pinCode);

      await FirebaseAuth.instance
          .signInWithCredential(credential)
          .then((value) {
        print('the user id is : ${value.user!.uid}');
        uId = value.user!.uid;
        emit(CheckPinCodeSuccessStates());
      });
    } catch (error) {
      emit(CheckPinCodeErrorStates(error: error.toString()));
    }
  }

  Future<void> addNewUser({
    required String userName,
    required String uId,
    required String userPhone,
    required String userEmail,
  }) {
    // Call the user's CollectionReference to add a new user
    emit(CreateNewUserLoadingStates());
    UserModel userModel1 = UserModel(
        userName: userName,
        uId: uId,
        userEmail: userEmail,
        userPhone: userPhone);
    return FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(userModel1.toJson())
        .then((value) {
      CacheHelper.saveData(key: 'uId', value: uId);
      emit(CreateNewUserSuccessStates());
    }).catchError((error) {
      emit(CreateNewUserErrorStates(error: error.toString()));
    });
  }
  // void trimController({required TextEditingController pinController}){
  //   pinController.text=pinController.text.substring(0, pinController.text.length - 1);
  //   emit(TrimControllerStates());
  // }

  Future<void> listenToNewMessage(
      {required TextEditingController pinController}) async {
    Telephony.instance.listenIncomingSms(
      onNewMessage: (SmsMessage message) {
        // print(message.address); //+977981******67, sender nubmer
        // print(message.body); //Your OTP code is 34567

        String sms = message.body.toString(); //get the message

        if (message.address == 'CloudOTP') {
          String otpCode = sms.replaceAll(RegExp(r'[^0-9]'), '');
          pinController.setText(otpCode);

          emit(AutoFillSuccessStates());
        }
      },
      listenInBackground: false,
    );
  }
}
