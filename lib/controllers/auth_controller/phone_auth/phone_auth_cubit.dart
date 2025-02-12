import 'package:car_deals/controllers/auth_controller/phone_auth/phone_auth_states.dart';
import 'package:car_deals/shared/component/function.dart';
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
          print('the otp code is : $otpCode');
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
      if (await execute(customInstance)) {
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
            verificationId: verificationCode!, smsCode: pinCode);

        await FirebaseAuth.instance
            .signInWithCredential(credential)
            .then((value) {
          print('the user id is : ${value.user!.uid}');
          uId = value.user!.uid;
          emit(CheckPinCodeSuccessStates());
        });
      } else {
        emit(OtpInternetConnectionErrorStates());
      }
    } catch (error) {
      emit(CheckPinCodeErrorStates(error: error.toString()));
    }
  }

  Future<void> addNewUser({
    required String userName,
    required String uId,
    required String userPhone,
    required String userEmail,
  }) async {
    // Call the user's CollectionReference to add a new user
    emit(CreateNewUserLoadingStates());
    if (await execute(customInstance)) {
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
    } else {
      emit(CreateUserInternetConnectionErrorStates());
    }
  }

  Future<void> listenToNewMessage(
      {required TextEditingController pinController}) async {
    Telephony.instance.listenIncomingSms(
      onNewMessage: (SmsMessage message) {
        String sms = message.body.toString(); //get the message

        if (message.address == 'CloudOTP') {
          String otpCode = sms.replaceAll(RegExp(r'[^0-9]'), '');
          pinController.text = otpCode.substring(0,6);

          emit(AutoFillSuccessStates());
        }
      },
      listenInBackground: false,
    );
  }
}
