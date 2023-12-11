import 'package:dio/dio.dart';

class dioHelper{
  static  Dio? dio;
  static init()
  {
    dio =Dio(
      BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true,
      ),
    );
  }
  static  Future getData({
    required String url,
    Map<String, dynamic>? query,
    String  lang='en',
    String?  token,}
      )async
  {
    dio?.options.headers= {
      'lang':lang,
      'Authorization':token,
      'Content-Type':'application/json',
    };
    return await dio?.get(url,queryParameters: query);
  }

  static Future<Response?> postData({
    required String path,
    Map<String,dynamic>?query,
    required Map<String,dynamic>data,
    String  lang='en',
    String?  token,
  })
  async {
    dio?.options.headers= {
      'lang':lang,
      'Authorization':token,
      'Content-Type':'application/json',

    };
    return await  dio?.post(path,queryParameters:query,data: data );
  }
  static  Future putData({
    required String url,
    required Map<String,dynamic>data,
    Map<String, dynamic>? query,
    String  lang='en',
    String?  token,}
      )async
  {
    dio?.options.headers= {
      'lang':lang,
      'Authorization':token,
      'Content-Type':'application/json',
    };
    return await dio?.put(url,queryParameters: query);
  }
}