import 'package:clean_architecture_demu_project/config/components/custom_alert_dialoge_box.dart';
import 'package:clean_architecture_demu_project/config/components/text_style/heading2.dart';
import 'package:clean_architecture_demu_project/config/constants/colors.dart';
import 'package:clean_architecture_demu_project/config/constants/strings.dart';
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
        title: Heading2(title: "HomeScreen"),
        automaticallyImplyActions: false,
        actions: [
          IconButton(
            onPressed: (){
              CustomAlertDiaglogeBox.show(
                context,
                title: AppStrings.logout,
                message: AppStrings.logoutMessage,
                primaryButtonText: AppStrings.alertDialogePrimaryText,
                onPrimaryPressed: (){
                  // Navigator.pop(context);
                },
                secondaryButtonText: AppStrings.alertDialogeSecondaryText,
                onSecondaryPressed: (){
                      // Navigator.pop(context);
                }
              );
            },
             icon: Icon(Icons.logout_outlined, color: AppColors.redColor,))
        ],
      ),
      body: Column(
        children: [
        ],
      ),
    );
  }
}