import 'package:dio/dio.dart';

class DioHelper
{
  static late Dio dio;

  static init()
  {
    dio = Dio(
      BaseOptions(
        receiveDataWhenStatusError: true,
        baseUrl: 'https://student.valuxapps.com/api/',
        headers: {
          'Content-Type' : 'application/json',
        },
      ),
    );
  }

  static Future<Response> get({
    required String url,
    required Map<String,dynamic> query,
    String lang = 'ar',
    String? token,
}) async
  {
    dio.options.headers =
    {
        'lang': lang,
        'Authorization' : token,
    };
    return await dio.get(url, queryParameters: query,);
  }

  static Future<Response> postData(
      {
        required String url,
        Map<String,dynamic>? query,
        required Map<String,dynamic> data,
        String lang = 'ar',
        String? token,
      }) async
{
  dio.options.headers =
  {
    'lang': lang,
    'Authorization' : token,
  };
  return await dio.post(url,data: data, queryParameters: query);
}

}