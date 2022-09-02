import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'business_test/cubit/bloc_test_cubit.dart';
import 'data_test/my_repo.dart';
import 'data_test/web_services.dart';

final getIt = GetIt.instance;
void initGetIt() {
  getIt.registerLazySingleton<BlocTestCubit>(() => BlocTestCubit(getIt()));
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