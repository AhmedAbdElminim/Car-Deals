import 'package:car_deals/controllers/auth_controller/phone_auth/phone_auth_states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';
import 'package:telephony/telephony.dart';

class PhoneAuthCubit extends Cubit<PhoneAuthStates> {
  PhoneAuthCubit() : super(PhoneAuthInitialStates());
  static PhoneAuthCubit get(context) => BlocProvider.of(context);
  //final pinController = TextEditingController();

  Future<void> phoneAuth({required String phoneNumber}) async {
    try {
      emit(PhoneAuthLoadingStates());
      FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+201091007198',
        verificationCompleted: (PhoneAuthCredential credential) {
          // pinController.setText(credential.smsCode!);
          print('${credential.smsCode}');
          print('${credential.token}');

        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.toString());
        },
        codeSent: (String verificationId, int? resendToken) {
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (error) {
      emit(PhoneAuthErrorStates(error: error.toString()));
    }
  }

  Future<void> listenToNewMessage(
      {required TextEditingController pinController}) async {
    Telephony.instance.listenIncomingSms(
      onNewMessage: (SmsMessage message) {
        print(message.address); //+977981******67, sender nubmer
        print(message.body); //Your OTP code is 34567

        String sms = message.body.toString(); //get the message

        if (message.address == "CloudOTP") {
          String otpCode = sms.replaceAll(RegExp(r'[^0-9]'), '');
          pinController.setText(otpCode);
          emit(AutoFillSuccessStates());
        }
      },
      listenInBackground: false,
    );
  }
}
