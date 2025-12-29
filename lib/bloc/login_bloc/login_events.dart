import 'package:equatable/equatable.dart';

abstract class LoginEvents extends Equatable{

  const LoginEvents();

  @override
  List<Object> get props => [];
}


class UserNameChanged extends LoginEvents{

  final String userName;

  const UserNameChanged({
    required this.userName,
  });
  @override
  List<Object> get props=>[userName];

}

class UserNameUnfocuesd extends LoginEvents{}



class PasswordChanged extends LoginEvents{

final String password;

const PasswordChanged({
  required this.password,
});

@override
List<Object> get props => [password];

}


class PasswordUnfocused extends LoginEvents{}


class LoginApi extends LoginEvents{}