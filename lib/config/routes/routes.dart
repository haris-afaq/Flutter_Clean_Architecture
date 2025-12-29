import 'package:clean_architecture_demu_project/config/routes/route_names.dart';
import 'package:flutter/material.dart';

import '../../views/view.dart';

class Routes{
static Route<dynamic> generateRoute(RouteSettings settings){
  switch(settings.name){
    case RouteNames.splashScreen:
      return MaterialPageRoute(builder: (context)=> SplashScreen());

      case RouteNames.homeScreen:
      return MaterialPageRoute(builder: (context)=> HomeScreen());

      case RouteNames.loginScreen:
      return MaterialPageRoute(builder: (context)=> LoginScreen());
    
    default: 
      return MaterialPageRoute(builder: (context){
        return Scaffold(
          body: Center(
            child: Text("No Route Generated..."),
          ),
        );
      });
    
  }
}
}