import 'dart:async';

import 'package:clean_architecture_demu_project/config/routes/route_names.dart';
import 'package:flutter/material.dart';

class SplashServices {
  

  void isLogin(BuildContext context){

    Timer(Duration(seconds: 3), (){
      Navigator.pushNamedAndRemoveUntil(
        context, 
        RouteNames.loginScreen,
         (route)=> false);
    });
  }
}