import 'package:connectivity/connectivity.dart';
import 'package:dfg/0_data/datasources/advice_local_data_source.dart';

import 'package:dfg/0_data/datasources/advice_remote_data_source.dart';
import 'package:dfg/0_data/repositries/advice_repo_impl.dart';
import 'package:dfg/1_domain/repositries/advice_repo.dart';
import 'package:dfg/1_domain/usecases/get_advice_usecases.dart';
import 'package:dfg/3_application/core/platform/network_info.dart';
import 'package:dfg/3_application/pages/advice/cubit/advice_cubit.dart';

import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'package:sqflite/sqflite.dart';

final sl = GetIt.I; //sl=service locator
Future<void> init() async {
  //application layer
  //factory =every time new/fresh instance of that class
  sl.registerFactory(() => AdviceCubit(adviceusecases: sl()));
  //domain layer
  sl.registerFactory(() => AdviceUsecases(advicerepimpl: sl()));
  //data layer
  sl.registerFactory<AdviceRepo>(() => AdviceRepoImpl(
      adviceremotedatasource: sl(),
      advicelocaldatasource: sl(),
      netwokinfo: sl()));
  sl.registerFactory<AdviceRemoteDatasource>(
      () => AdviceRemoteDatasourceimpl(client: sl()));
  sl.registerFactory<AdviceLocalDataSource>(() => AdviceLocalDataSourceImpl());
  sl.registerFactory<NetworkInfo>(() => NetworkInfoImpl(connectivity: sl()));

  //externs
  sl.registerFactory(() => Sqflite());
  sl.registerFactory(() => http.Client());
  sl.registerFactory(() => Connectivity());
}
