import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialprofitional/modules/social_model.dart';
import 'package:socialprofitional/shared/cubits/register_cubit/register_states.dart';


class RegisterCubit extends Cubit<RegisterStates>{
  RegisterCubit():super(RegisterInitialState());
  static RegisterCubit get(context)=>BlocProvider.of(context);
  bool isNotVisible=true;
  IconData icon=Icons.visibility_off;
  void changeIconPassword()
  {
    isNotVisible=!isNotVisible;
    icon=isNotVisible?Icons.visibility_off:Icons.visibility;
    emit(ChangeIconVisibleState());
  }



  void userRegister({
    required String email,
    required String password,
    required String name,
    required String phone,
})
  {
    emit(RegisterLoadingCreateState());
    FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password)
    .then((value){
      //userCreate(name: name, email: email, phone: phone, uid: value.user!.uid);
      print('moapp');
      emit(RegisterSuccessCreateState());

    })
    .catchError((error){
      emit(RegisterErrorCreateState(error.toString()));
    });
  }


//   void userCreate({
//   required String name,
//   required String email,
//   required String phone,
//   required String uid,
// })
// {
//   SocialUserModel model=SocialUserModel(
//     name: name,
//     email: email,
//     phone: phone,
//     uid: uid
//   );
//   FirebaseFirestore.instance.collection('users').doc(uid).set(model.toMap())
//       .then((value){
//         emit(RegisterSuccessCreateUserState());
//
//   }).catchError((error){
//     emit(RegisterErrorCreateUserState(error.toString()));
//   });
// }
}