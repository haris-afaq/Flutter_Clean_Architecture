class AppExceptions implements Exception{

  final _message;
  AppExceptions([this._message,]);


  @override
  String toString(){
    return "$_message";
  }
}

class NoInternetException extends AppExceptions{
  NoInternetException([String? super.message]);
}

class RequestTimeOutException extends AppExceptions{
  RequestTimeOutException ([String? super.messaage]);
}

class UnAuthorizedException extends AppExceptions{
  UnAuthorizedException ([String? super.messaage]);
}

class FetchDataException extends AppExceptions{
  FetchDataException ([String? super.message]);
}