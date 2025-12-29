import 'package:clean_architecture_demu_project/bloc/login_bloc/login_bloc.dart';
import 'package:clean_architecture_demu_project/config/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/widgets.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final usernameFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (_) => LoginBloc(),
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Welcome Back!",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              const Text(
                "You've been missed...",
                style: TextStyle(fontSize: 15),
              ),
              const SizedBox(height: 50),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    UsernameInputWidget(usernameFocusNode: usernameFocusNode),
                    const SizedBox(height: 10),
                    PasswordInputWidget(passwordFocusNode: passwordFocusNode),
                    const SizedBox(height: 50),
                    LoginButton(formKey: _formKey),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
