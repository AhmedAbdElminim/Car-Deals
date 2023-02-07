import 'package:car_deals/models/user_model.dart';
import 'package:car_deals/shared/network/local/cache_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/component/constants.dart';
import '../auth_states/register_states.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());
  static RegisterCubit get(context) => BlocProvider.of(context);
  Future<void> registerNewUser({
    required String userName,
    required String password,
    required String userPhone,
    required String emailAddress,
  }) async {
    try {
      emit(RegisterLoadingState());
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      )
          .then((value) {
        CacheHelper.saveData(key: 'uId', value: value.user!.uid);
        uId = value.user!.uid;

        _addNewUser(
            userName: userName,
            uId: value.user!.uid,
            userPhone: userPhone,
            userEmail: emailAddress);
        emit(RegisterSuccessState());
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        //print('The password provided is too weak.');
        emit(RegisterErrorState(error: 'The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        //print('The account already exists for that email.');
        emit(RegisterErrorState(
            error: 'The account already exists for that email.'));
      }
    } catch (e) {
      print(e);
      emit(RegisterErrorState(error: e.toString()));
    }
  }

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> _addNewUser({
    required String userName,
    required String uId,
    required String userPhone,
    required String userEmail,
  }) {
    // Call the user's CollectionReference to add a new user
    UserModel userModel1 = UserModel(
        userName: userName,
        uId: uId,
        userEmail: userEmail,
        userPhone: userPhone);
    return users
        .doc(uId)
        .set(userModel1.toJson() // 42
            )
        .then((value) {
      // print("User Added");
      // userModel = UserModel(
      //     userName: userName,
      //     uId: uId,
      //     userEmail: userEmail,
      //     userImage: userImage,
      //     userPhone: userPhone);
    }).catchError((error) {
      emit(RegisterErrorState(error: error.toString()));
    });
  }
}
