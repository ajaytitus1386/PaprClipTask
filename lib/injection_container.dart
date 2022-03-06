import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:papr_clip_task/core/network/network_info.dart';
import 'package:papr_clip_task/data/api/reel_api.dart';
import 'package:papr_clip_task/data/repos/reel_repo_impl.dart';
import 'package:papr_clip_task/domain/repos/reel_repo.dart';
import 'package:papr_clip_task/domain/usecases/get_all_reels_from_api.dart';
import 'package:papr_clip_task/presentation/bloc/reel_bloc.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  // Features
  sl.registerFactory(() => ReelBloc(getAllReelsFromApi: sl()));

  sl.registerLazySingleton(() => GetAllReelsFromApi(sl()));

  sl.registerLazySingleton<ReelRepo>(
      () => ReelRepoImpl(reelApi: sl(), networkInfo: sl()));

  // Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  // External Dependencies
  sl.registerLazySingleton(() => ReelApi(client: sl()));
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => http.Client);
}
