
abstract class BaseApiservices {

  Future<dynamic> getGetApiResponse(String url);

  Future<dynamic>getPostApiResponse(String url, dynamic data,dynamic header);

}