import 'package:clean_architecture_demu_project/bloc/login_bloc/login_bloc.dart';
import 'package:clean_architecture_demu_project/bloc/login_bloc/login_events.dart';
import 'package:clean_architecture_demu_project/bloc/login_bloc/login_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsernameInputWidget extends StatelessWidget {
  final FocusNode usernameFocusNode  ;
   const UsernameInputWidget({super.key,
  required this.usernameFocusNode
  });

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<LoginBloc, LoginStates>(
      
      buildWhen: (current, previous)=> current.userName!=previous.userName,
      
      builder: (context, state){

      return TextFormField(
                  focusNode: usernameFocusNode,
                  decoration: InputDecoration(
                    label: Text("User Name"),
                    prefixIcon: Icon(Icons.person_outline),
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value){
                    context.read<LoginBloc>().add(UserNameChanged(userName: value));
                  },
                  validator: (value){
                    if(value!.isEmpty){
                      return "Username is required...!";
                    }
                    else {
                      return null;
                    }
                  },
                  onFieldSubmitted: (value){},
                );
    });
  }
}