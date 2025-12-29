import 'package:clean_architecture_demu_project/config/constants/app_urls.dart';
import 'package:clean_architecture_demu_project/data/network/network_service_api.dart';
import 'package:clean_architecture_demu_project/models/user/user_model.dart';


class LoginRepository {
  final _loginApi = NetworkServiceApi();

  Future<UserModel> loginApi(dynamic data) async{
    final response = await _loginApi.postApi(AppUrls.LoginApiUrl, data);
    return UserModel.fromJson(response);
  }
}