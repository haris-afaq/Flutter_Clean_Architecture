import 'package:clean_architecture_demu_project/config/components/custom_alert_dialoge_box.dart';
import 'package:clean_architecture_demu_project/config/constants/colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,

        ),
        ),
        automaticallyImplyActions: false,
        actions: [
          IconButton(
            onPressed: (){
              CustomAlertDiaglogeBox.show(
                context,
                title: "Logout",
                message: "Are you sure you want to logout?",
                primaryButtonText: "Yes",
                onPrimaryPressed: (){
                  // Navigator.pop(context);
                },
                secondaryButtonText: "No",
                onSecondaryPressed: (){
                      // Navigator.pop(context);
                }
              );
            },
             icon: Icon(Icons.logout_outlined, color: AppColors.redColor,))
        ],
      ),
    );
  }
}