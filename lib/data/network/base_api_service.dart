abstract class BaseApiServices{
  Future<dynamic> getGetApiResponse(String url);

  Future<dynamic> getPostApiResponse(String url, Map<String , String> data);
}