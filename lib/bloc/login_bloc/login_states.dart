import 'package:clean_architecture_demu_project/utils/enums.dart';
import 'package:equatable/equatable.dart';

class LoginStates extends Equatable{


    final String userName;
    final String password;
    final String message;
    final PostApiStatus postApiStatus;

    const LoginStates({
        // here we have to define initial states of the events
        this.userName ='',
        this.password='',
        this.message = '',
        this.postApiStatus= PostApiStatus.initial,
    });


    // Copywith function for creating an instance

    LoginStates copyWith({
        String? userName,
        String?password,
        String? message,
        PostApiStatus? postApiStatus,
    }){
        return LoginStates(
            userName: userName??this.userName,
            password: password?? this.password,
            message: message?? this.message,
            postApiStatus: postApiStatus?? this.postApiStatus
            );
    }

    @override
    List<Object> get props => [userName, password, message, postApiStatus];

}