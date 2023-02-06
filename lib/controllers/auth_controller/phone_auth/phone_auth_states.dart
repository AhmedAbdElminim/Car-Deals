abstract class PhoneAuthStates {}

class PhoneAuthInitialStates extends PhoneAuthStates {}
class PhoneAuthLoadingStates extends PhoneAuthStates {}
class PhoneAuthSuccessStates extends PhoneAuthStates {}
class PhoneAuthErrorStates extends PhoneAuthStates {
  final String error;
  PhoneAuthErrorStates({required this.error});
}

class AutoFillSuccessStates extends PhoneAuthStates {}

