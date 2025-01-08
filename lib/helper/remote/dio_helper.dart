import 'package:dio/dio.dart';

import 'endpoints.dart';

class DioHelper {
  static late Dio dio;

  static dioInit() async {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: AppEndpoints.baseUrl,
      receiveDataWhenStatusError: true,
    );
    dio = Dio(baseOptions);
    DioInterceptor.setupInterceptors(dio);
  }

  static Future<Response> postData({
    required path,
    required data,
  }) async {

    return await dio.post(
      path,
      data: data,
    );
  }

  static Future<Response> getData({
    required String path,
    data,
  }) async {
    return await dio.get(
      path,
      data: data,
    );
  }
}

class DioInterceptor {
  static Dio setupInterceptors(Dio dio) {
    dio.interceptors.add(
      InterceptorsWrapper(
        onError: (e, handler) {
          if (e.response?.statusCode == 401) {
            // Return a non-error response to prevent further error propagation
            return handler.resolve(
              Response(
                data: {'message': 'Unauthorized'},
                requestOptions: RequestOptions(
                  path: '',
                ),
              ),
            );
          }

          // For other error cases, continue with the error
          return handler.next(e);
        },
      ),
    );

    return dio;
  }
}
