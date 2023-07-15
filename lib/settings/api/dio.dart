import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    // عشان اعمل create l dio
    dio = Dio(
      //بعرف ال dio
      BaseOptions(
        baseUrl: "https://newsapi.org/",
        receiveDataWhenStatusError: true, //هات الداتا في كل الاحوال
      ),
    );
  }

  // get ,put,post need url
  // نوع البيانات الراجعه future
  static Future<Response> get({
    required String url,
    String? token,
    Options? options,
  }) async {
    return await dio.get(url, options: options);
  }

// ====================================================

  static Future<Response> post({required String url, dynamic data}) async {
    dio.options.headers = {};
    return dio.post(url, data: data);
  }

// ====================================================

  static Future<Response> putData(
      {required String url,
      Map<String, dynamic>? query,
      required dynamic data}) async {
    dio.options.headers = {};
    return dio.put(url, queryParameters: query, data: data);
  }

// ====================================================
  static Future<Response> deleteData({required String url}) {
    dio.options.headers = {};
    return dio.delete(url);
  }
}
