import 'package:clean_architecture_demu_project/config/constants/app_urls.dart';
import 'package:clean_architecture_demu_project/data/network/network_service_api.dart';
import 'package:clean_architecture_demu_project/models/moview_model/movies.dart';

class MoviesRepository {
  final _moviesApi = NetworkServiceApi();
  
  Future<MoviesModel> moviesApi() async{
    final response = await _moviesApi.getApi(AppUrls.MoviesApi);
    return MoviesModel.fromJson(response);
  }
}