import 'package:dfg/0_data/datasources/advice_local_data_source.dart';
import 'package:dfg/0_data/datasources/advice_remote_data_source.dart';
import 'package:dfg/0_data/exception/exceptions.dart';
import 'package:dfg/1_domain/failures/failures.dart';
import 'package:dfg/1_domain/entities/advice_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:dfg/1_domain/repositries/advice_repo.dart';
import 'package:dfg/3_application/core/platform/network_info.dart';

class AdviceRepoImpl implements AdviceRepo {
  //here we will implement repositry which is in domain layer
  AdviceRepoImpl(
      {required this.adviceremotedatasource,
      required this.advicelocaldatasource,
      required this.netwokinfo});
  final AdviceRemoteDatasource adviceremotedatasource;
  final AdviceLocalDataSource advicelocaldatasource;
  final NetworkInfo netwokinfo;

  @override
  //here we are overriding this method
  //this repositry will call either local or remote data source based on network connection
  Future<Either<Failure, AdviceEntity>> getadvicefromdatasource() async {
    if (await netwokinfo.isConnected) {
      try {
        //we are calling remote data source to return advicemodel object
        final result = await adviceremotedatasource.getrandomadvicefromapi();
        //we are caching advicemodel entity by calling cacheadvice in local datasource
        advicelocaldatasource.cacheadvice(result);
        //we are returning sucess case when we get the advice model entity to usecase which calls this repositry
        return right(result);
        //when it throws any error while getting data from api then we have to cache exceptions
      } on ServerException catch (_) {
        //we will get server exception when status code is not 200
        //this exception is thrown from remote datasource
        //when server error occurs
        //here we are mapping server exception to server failure
        return left(ServerFailure());
      } on Exception catch (_) {
        //when unknown error occurs
        //here we are mapping general exception to general failure
        return left(GeneralFailure());
      }
    } else {
      try {
        final localTrivia = await advicelocaldatasource.getLastadvice();
        return Right(localTrivia);
      } on CacheException {
        //here we are mapping cache exception to cache failure
        return Left(CacheFailure());
      }
    }
  }
}
