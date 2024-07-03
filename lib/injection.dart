import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'data_layer/my_repo.dart';
import 'data_layer/web_services.dart';

final getIt = GetIt.instance;
void initGetIt() {
  getIt.registerLazySingleton<MyRepo>(() => MyRepo(getIt()));
  getIt.registerLazySingleton<WebServices>(() => WebServices(createAndSetupDio()));
}

createAndSetupDio(){
  Dio dio = Dio();
  
  dio..options.connectTimeout = 10 * 1000
  ..options.receiveTimeout = 10 * 1000 ;

  dio.interceptors.add(LogInterceptor(
    responseBody: true,
    error: true,
    requestHeader: false,
    responseHeader: false,
    request : true,
    requestBody : true,
  ));
  return dio;
}