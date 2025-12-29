import 'package:clean_architecture_demu_project/bloc/login_bloc/login_bloc.dart';
import 'package:clean_architecture_demu_project/bloc/login_bloc/login_events.dart';
import 'package:clean_architecture_demu_project/bloc/login_bloc/login_states.dart';
import 'package:clean_architecture_demu_project/config/components/main_button.dart';
import 'package:clean_architecture_demu_project/config/constants/colors.dart';
import 'package:clean_architecture_demu_project/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginButton extends StatelessWidget {

  final formKey ;
   LoginButton({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return  BlocListener<LoginBloc, LoginStates>(listener: (context, state){
      if(state.postApiStatus == PostApiStatus.error){
        print(state.message.toString());
      }
      else if(state.postApiStatus == PostApiStatus.loading){
        print(state.message.toString());
      }
      else if(state.postApiStatus == PostApiStatus.success){
        print(state.message.toString());
      }
    },

    child: BlocBuilder<LoginBloc , LoginStates>(
      buildWhen: (previous, current) => false,
      builder: (context, state){
      return MainButton(title: "Login",
                  onTap: (){
                    if(formKey.currentState!.validate()){
                      context.read<LoginBloc>().add(LoginApi());
                    };
                  },
                  color: AppColors.greenColor,
                  ) ;
    }),
    );
  }
}