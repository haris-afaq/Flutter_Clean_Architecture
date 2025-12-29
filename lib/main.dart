import 'package:clean_architecture_demu_project/config/routes/route_names.dart';
import 'package:clean_architecture_demu_project/config/routes/routes.dart';
import 'package:flutter/material.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clean architecture Demu project',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: RouteNames.splashScreen,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}




//endpoint url :   https://dummyjson.com/auth/login
/*
{
    "username": "emilys",
    "password": "emilyspass"
}
*/