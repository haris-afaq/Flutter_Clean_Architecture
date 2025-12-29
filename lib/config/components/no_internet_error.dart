import 'package:clean_architecture_demu_project/config/constants/colors.dart';
import 'package:flutter/material.dart';

class NotInternetError extends StatelessWidget {
  final VoidCallback onPress;
  final String message;
  const NotInternetError({super.key,
  required this.onPress,
  this.message= "Unable to load data,\nPlease check your internet connection\nand try again",
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height:MediaQuery.sizeOf(context).height * .15 ,),
          Icon(Icons.cloud_off_outlined, color: AppColors.redColor,),
          SizedBox(
          height:MediaQuery.sizeOf(context).height * .01 ,),
          Text(message, textAlign: TextAlign.center),
                    SizedBox(
          height:MediaQuery.sizeOf(context).height * .001 ,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(onPressed: onPress, child: Text("Retry")),
              Icon(Icons.history_outlined,
              color: AppColors.grayColor,
              )
            ],
          )

      ],
    );
  }
}