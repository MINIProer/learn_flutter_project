import 'package:dio/dio.dart';
import 'package:learn_flutter_project/tool/const_tool/const.dart';

class JRRequestTool {
  static final baseOptions = BaseOptions(
      baseUrl: JRConstTool.http_baseUrl,
      // connectTimeout: JRConstTool.http_connect_timeout 添加链接超时会导致请求失败？？？为什么？？？
      );

  static final dio = Dio(baseOptions); // 如果存在Base配置，需要把baseOptions当作参数传入

  static Future<T> request<T>(String url,
      {String method = 'get',
      Map<String, dynamic> params,
      Interceptor interceptor}) async {
    final options = Options(method: method);

    // 创建一个全局的拦截器
    Interceptor default_interceptor = InterceptorsWrapper(onRequest: (options) {
      print('请求拦截');
      return options;
    }, onResponse: (response) {
      // 可以对response做一些自定义处理
      print('响应拦截');
      return response;
    }, onError: (err) {
      print('错误拦截');
      return err;
    });

    List<Interceptor> interceptor_list = [default_interceptor];
    if (interceptor != null) {
      interceptor_list.add(interceptor);
    }
    dio.interceptors.addAll(interceptor_list);

    try {
      Response response =
          await dio.request(url, queryParameters: params, options: options);
      return response.data;
    } on DioError catch (err) {
      Future.error(err);
    }
  }
}
