abstract class PhoneAuthStates {}

class PhoneAuthInitialStates extends PhoneAuthStates {}
class PhoneAuthLoadingStates extends PhoneAuthStates {}
class PhoneAuthSuccessStates extends PhoneAuthStates {}
class PhoneAuthErrorStates extends PhoneAuthStates {
  final String error;
  PhoneAuthErrorStates({required this.error});
}

class AutoFillSuccessStates extends PhoneAuthStates {}

class CheckPinCodeLoadingStates extends PhoneAuthStates {}
class CheckPinCodeSuccessStates extends PhoneAuthStates {}
class CheckPinCodeErrorStates extends PhoneAuthStates {
  final String error;
  CheckPinCodeErrorStates({required this.error});
}

class CreateNewUserLoadingStates extends PhoneAuthStates {}
class CreateNewUserSuccessStates extends PhoneAuthStates {}
class CreateNewUserErrorStates extends PhoneAuthStates {
  final String error;
  CreateNewUserErrorStates({required this.error});
}

