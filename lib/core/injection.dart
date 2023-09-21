import 'package:api/Features/HomeTest/Data/repo/homeRepoImplem.dart';
import 'package:api/Features/HomeTest/prsentation/view_model/user_cubit.dart';
import 'package:api/core/utils/api_servise/apiservice.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';


final getIt = GetIt.instance;

void  initGitIT() {

  Dio createAndSetupDio() {
    final dio = Dio();
    dio.options.connectTimeout = Duration(milliseconds: 10000); // Set connection timeout to 1 second (1000 milliseconds)
    dio.options.receiveTimeout = Duration(milliseconds: 10000); // Set receive timeout to 10 seconds (10000 milliseconds)

    dio.interceptors.add(LogInterceptor(
      requestBody: true,
      error: true,
      requestHeader: true,
      responseHeader: true,
      request: true,
      responseBody: true,
    ));

    return dio;
  }



  getIt.registerLazySingleton<ApiService>(()=>ApiService(createAndSetupDio()));
  getIt.registerLazySingleton<UserCubit>(()=>UserCubit(getIt())..getUser());

  getIt.registerSingleton<HomeRepoImplem>(HomeRepoImplem(getIt.get<ApiService>()));



}