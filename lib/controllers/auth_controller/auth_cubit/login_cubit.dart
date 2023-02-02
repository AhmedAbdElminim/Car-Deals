import 'package:car_deals/models/user_model.dart';
import 'package:car_deals/shared/component/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/network/local/cache_helper.dart';
import '../auth_states/login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());
  static LoginCubit get(context) => BlocProvider.of(context);

  Future<void> loginUser({
    required String emailAddress,
    required String password,
  }) async {
    try {
      emit(LoginLoadingState());
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password)
          .then((value) {
        CacheHelper.saveData(key: 'uId', value: value.user!.uid);
        uId=value.user!.uid;
        //_getUserData(userId: value.user!.uid);
        emit(LoginSuccessState());

      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        // print('No user found for that email.');
        emit(LoginErrorState(error: 'No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        //print('Wrong password provided for that user.');
        emit(LoginErrorState(error: 'Wrong password provided for that user.'));
      }
    }
  }
  //CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> _getUserData({required String userId}) async {
    try {
      FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get()
          .then((documentSnapshot) {
        if (documentSnapshot.exists) {
          // print('Document exists on the database');
          userModel = UserModel.fromJson(documentSnapshot.data()!);
        }
      });
    } catch (error) {
      print('the error is $error');
    }
  }
}
