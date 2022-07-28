import 'package:get_it/get_it.dart';
import 'package:go_cart_rider/core/data-source/jobs_remote_data_source/jobs_remote_data_source.dart';
import 'package:go_cart_rider/core/data-source/jobs_remote_data_source/jobs_remote_data_source_impl.dart';
import 'package:hive/hive.dart';
import 'package:go_cart_rider/core/data-source/auth_remote_data_source/auth_remote_data_source.dart';
import 'package:go_cart_rider/core/data-source/auth_remote_data_source/auth_remote_data_source_impl.dart';
import 'package:go_cart_rider/core/data-source/profile_remote_data_source/profile_remote_data_source.dart';
import 'package:go_cart_rider/core/data-source/profile_remote_data_source/profile_remote_data_source_impl.dart';
import 'package:go_cart_rider/core/data-source/utility_remote_data_source.dart/utility_remote_data_source.dart';
import 'package:go_cart_rider/core/data-source/utility_remote_data_source.dart/utility_remote_data_source_impl.dart';
import 'package:go_cart_rider/core/services/http/http_service_impl.dart';
import 'package:go_cart_rider/core/services/user_service.dart';
import 'package:go_cart_rider/core/services/utility_service.dart';
import 'package:go_cart_rider/core/utils/exports.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stacked_services/stacked_services.dart';

GetIt locator = GetIt.instance;
Future<void> setupLocator({bool test = false})async {
  Directory appDocDir = test ? Directory.current : await getApplicationDocumentsDirectory();
  Hive.init(appDocDir.path);

  if(!test) {
    locator.registerLazySingleton<HiveInterface>(() => Hive);
  }

  locator.registerLazySingleton<NavigationService>(
    () => NavigationService()..config(
      enableLog: true,
      defaultTransition: 'rightToLeftWithFade'
    )
  );
  locator.registerLazySingleton<DialogService>(
    () => DialogService(),
  );
  locator.registerLazySingleton<BottomSheetService>(
    () => BottomSheetService(),
  );
  locator.registerLazySingleton<SnackbarService>(
    () => SnackbarService(),
  );
  locator.registerLazySingleton<HttpService>(
    () => HttpServiceImpl()
  );
  locator.registerLazySingleton<StorageService>(
    () => StorageService()
  );
  locator.registerLazySingleton<UserService>(
    () => UserService()
  );
  locator.registerLazySingleton<UtilityService>(
    () => UtilityService()
  );

  locator.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl()
  );
  locator.registerLazySingleton<UtilityRemoteDataSource>(
    () => UtilityRemoteDataSourceImpl()
  );
  locator.registerLazySingleton<ProfileRemoteDataSource>(
    () => ProfileRemoteDataSourceImpl()
  );
  locator.registerLazySingleton<JobsRemoteDataSource>(
    () => JobsRemoteDataSourceImpl()
  );

  Logger.d('Initializing boxes...');
  await UserService().init();
  await StorageService().init();
}