import 'package:dio/dio.dart';

class DioHelper{
static late Dio dio;

static init()
{
  dio=Dio(
    BaseOptions(
      baseUrl: 'https://student.valuxapps.com/api/',
      receiveDataWhenStatusError: true
    )
  );
}

static Future<Response> getData({
  required String url,
  required Map<String,dynamic> query,
  String? token
})async
{
  dio.options.headers={
    'lang':'eg',
    'Content-Type':'application/json',
    'Authorization':token
  };
  return await dio.get(url,queryParameters: query);
}

static Future<Response> sendData({
  required String url,
  required Map<String,dynamic> query,
  required Map<String ,dynamic> data
})async
{
  return await dio.post(url,queryParameters: query,data: data);
}

static Future<Response> updateData({
  required String url,
  required Map<String,dynamic> query,
  required Map<String ,dynamic> data
})async
{
  return await dio.put(url,queryParameters: query,data: data);
}

static Future<Response> deleteData({
  required String url,
})async
{
  return await dio.delete(url);
}
}