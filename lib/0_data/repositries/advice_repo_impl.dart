import 'package:dfg/0_data/datasources/advice_local_data_source.dart';
import 'package:dfg/0_data/datasources/advice_remote_data_source.dart';
import 'package:dfg/0_data/exception/exceptions.dart';
import 'package:dfg/1_domain/failures/failures.dart';
import 'package:dfg/1_domain/entities/advice_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:dfg/1_domain/repositries/advice_repo.dart';
import 'package:dfg/3_application/core/platform/network_info.dart';

class AdviceRepoImpl implements AdviceRepo {
  AdviceRepoImpl(
      {required this.adviceremotedatasource,
      required this.advicelocaldatasource,
      required this.netwokinfo});
  final AdviceRemoteDatasource adviceremotedatasource;
  final AdviceLocalDataSource advicelocaldatasource;
  final NetworkInfo netwokinfo;

  @override
  Future<Either<Failure, AdviceEntity>> getadvicefromdatasource() async {
    if (await netwokinfo.isConnected) {
      try {
        final result = await adviceremotedatasource.getrandomadvicefromapi();
        advicelocaldatasource.cacheadvice(result);
        return right(result);
      } on ServerException catch (_) {
        return left(ServerFailure());
      } on Exception catch (_) {
        return left(GeneralFailure());
      }
    } else {
      try {
        final localTrivia = await advicelocaldatasource.getLastadvice();
        return Right(localTrivia);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
