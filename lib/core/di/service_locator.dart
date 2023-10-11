

import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../ui/screens/auth_screen/bloc/login_cubit.dart';
import '../const/api_end_points.dart';
import '../datasource/app_data_sources.dart';
import '../datasource/local/shared_preference_data.dart';
import '../datasource/remote/remote_datasource.dart';
import '../http_client/dio_client.dart';
import '../http_client/interceptors.dart';
import '../repository/app_repository.dart';
import '../repository/local/preference_repository.dart';
import '../repository/remote/remote_repository.dart';


GetIt serviceLocator = GetIt.instance;

Future<void> setupLocator() async {
  final SharedPreferences sharedPreferences =
  await SharedPreferences.getInstance();

  serviceLocator.registerSingleton<SharedPreferences>(sharedPreferences);

  serviceLocator.registerLazySingleton<DioClient>(
          () => DioClient(baseUrl: ApiEndPoints.baseUrl,dio: null,interceptors:  [SalesAppInterceptors()]));

  serviceLocator.registerLazySingleton<PrefDataSource>(() => PreferenceRepository(serviceLocator()));

  serviceLocator.registerLazySingleton<RemoteDatasource>(() => RemoteRepository.getInstance(serviceLocator<DioClient>())!);

  serviceLocator.registerLazySingleton<RemoteRepository>(
          () => RemoteRepository.getInstance(serviceLocator<DioClient>())!);

  serviceLocator.registerLazySingleton<PreferenceRepository>(
          () => PreferenceRepository(serviceLocator()));


  serviceLocator.registerLazySingleton<AppRepository>(
          () => AppRepository(serviceLocator<PrefDataSource>(), serviceLocator<RemoteDatasource>())
  );

  serviceLocator.registerLazySingleton<AppDataSource>(
          () => AppRepository(serviceLocator<PrefDataSource>(), serviceLocator<RemoteDatasource>())
  );


  serviceLocator.registerLazySingleton<LoginCubit>(
          () => LoginCubit(serviceLocator<AppRepository>()));


}