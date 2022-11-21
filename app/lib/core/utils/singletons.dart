import 'package:houston_app/core/utils/logging.dart';
import 'package:houston_app/navigation/app_router.gr.dart';
import 'package:houston_app/core/utils/storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final singleton = GetIt.instance;

Future<void> initSingletons() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  singleton.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  singleton.registerSingleton<AppRouter>(AppRouter());

  singleton.registerSingleton<Log>(Log());

  singleton.registerLazySingleton<Storage>(
    () => StorageImplementation(),
  );
}
