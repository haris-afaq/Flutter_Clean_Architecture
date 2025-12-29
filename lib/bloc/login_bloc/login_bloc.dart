import 'package:bloc/bloc.dart';
import 'package:clean_architecture_demu_project/bloc/login_bloc/login_events.dart';
import 'package:clean_architecture_demu_project/bloc/login_bloc/login_states.dart';
import 'package:clean_architecture_demu_project/repositories/auth_repository/login_repository.dart';
import 'package:clean_architecture_demu_project/utils/enums.dart';
import 'package:flutter/material.dart';

class LoginBloc extends Bloc<LoginEvents, LoginStates>{

  LoginRepository loginRepository = LoginRepository();

  LoginBloc(): super( LoginStates()){
    on<UserNameChanged> (_userNameChanged);
    on<PasswordChanged> (_passwordChanged);
    on<LoginApi> (_onloginApi);
     }



     void _userNameChanged (UserNameChanged event, Emitter<LoginStates> emit){
      emit(state.copyWith(
        userName: event.userName
      ));
     }


     void _passwordChanged(PasswordChanged event, Emitter<LoginStates> emit){
      emit(
        state.copyWith(
          password: event.password
        )
      );
     }

void _onloginApi(LoginApi event, Emitter<LoginStates> emit) async {
  Map data = {
    "username": state.userName,
    "password": state.password,
  };

  debugPrint("LOGIN REQUEST DATA: $data");

  emit(state.copyWith(
    postApiStatus: PostApiStatus.loading,
  ));

  await loginRepository.loginApi(data).then((value) {
    debugPrint("LOGIN API RESPONSE: ${value.message}");

    if (value.message.isNotEmpty) {
      debugPrint("LOGIN ERROR MESSAGE: ${value.message}");

      emit(state.copyWith(
        message: value.message.toString(),
        postApiStatus: PostApiStatus.error,
      ));
    } else {
      debugPrint("LOGIN SUCCESS");

      emit(state.copyWith(
        message: value.message.toString(),
        postApiStatus: PostApiStatus.success,
      ));
    }
  }).onError((error, StackTrace stackTrace) {
    debugPrint("LOGIN API ERROR: $error");
    debugPrint("STACK TRACE: $stackTrace");

    emit(state.copyWith(
      message: error.toString(),
      postApiStatus: PostApiStatus.error,
    ));
  });
}



    //  void _onloginApi(LoginApi event, Emitter<LoginStates> emit) async{
    //   Map data = {
    //    "username": state.userName,
    //    "password": state.password,
    //       //   "username": "emilys",
    //       //  "password": "emilyspass"
    //   };
    //   emit(state.copyWith(
    //     postApiStatus: PostApiStatus.loading,
    //   ));

    //  await loginRepository.loginApi(data).then((value){
    //   if(value.message.isNotEmpty){
    //      emit(state.copyWith(
    //       message: value.message.toString(),
    //       postApiStatus: PostApiStatus.error,
    //     ));
       
    //   }
    //   else{
    //     emit(state.copyWith(
    //       message: value.message.toString(),
    //       postApiStatus: PostApiStatus.success,
    //     ));
    //   }

    //   }).onError((error, StackTrace){

    //     emit(state.copyWith(message: error.toString(),
    //               postApiStatus: PostApiStatus.error,
    //     ));
    //   });

    //  }

}