abstract class BaseApiServices {

  //Get API
  Future<dynamic> getApi(String url);

  //Post API
  Future<dynamic> postApi(String url, var data);

  //Delete API
  Future<dynamic> deleteAPI(String url);
  
}