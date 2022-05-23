import 'package:dio/dio.dart';
import 'package:flutter_learn/Network/config.dart';

class HttpRequest {
  static final BaseOptions baseOptions = BaseOptions(
      baseUrl: HttpConfig.baseURL, connectTimeout: HttpConfig.timeout);
  static final Dio dio = Dio(baseOptions);

  static Future<T> request<T>(String url,
      {String method = 'get', Map<String, dynamic>? params,
      Interceptor? inter}) async {
    //1.创建单独配置
    final options = Options(method: method);
    
    //2.发送网络请求
    try{
      Response response = await dio.request(url,
          queryParameters: params,
          options: options);
      return response.data;
    } on DioError catch(e){
      return Future.error(e);
    }
  }

    //全局拦截器
    // Interceptor defaultInter = InterceptorsWrapper(
    //   onRequest: (options) {
    //     return options;
    //   },
    //
    // );
    // dio.interceptors.addAll(iterable)

}
