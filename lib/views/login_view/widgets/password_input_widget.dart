import 'package:clean_architecture_demu_project/bloc/login_bloc/login_bloc.dart';
import 'package:clean_architecture_demu_project/bloc/login_bloc/login_events.dart';
import 'package:clean_architecture_demu_project/bloc/login_bloc/login_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordInputWidget extends StatelessWidget {
  final FocusNode passwordFocusNode;
  const PasswordInputWidget({super.key,
  required this.passwordFocusNode
  });

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<LoginBloc, LoginStates>(
      
      buildWhen: (previous, current) => previous.password!=current.password,

      builder: (context, state){


      return  TextFormField(
                  focusNode: passwordFocusNode,
                  obscureText: true,
                  obscuringCharacter: "*",
                  decoration: InputDecoration(
                    label: Text("Password"),
                    prefixIcon: Icon(Icons.lock_outline),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value){
                    if(value!.isEmpty){
                      return "Password is required...!";
                    }
                  
                    else {
                      return null;
                    }
                  },
                  onChanged: (value){
                    context.read<LoginBloc>().add(PasswordChanged(password: value));
                  },
                  onFieldSubmitted: (value){},
                );
    });
  }
}