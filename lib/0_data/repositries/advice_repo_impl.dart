import 'package:dfg/0_data/datasources/advice_remote_data_source.dart';
import 'package:dfg/0_data/exception/exceptions.dart';
import 'package:dfg/1_domain/failures/failures.dart';
import 'package:dfg/1_domain/entities/advice_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:dfg/1_domain/repositries/advice_repo.dart';

class AdviceRepoImpl implements AdviceRepo {
  AdviceRepoImpl({required this.adviceremotedatasource});
  final AdviceRemoteDatasource adviceremotedatasource;

  @override
  Future<Either<Failure, AdviceEntity>> getadvicefromdatasource() async {
    try {
      final result = await adviceremotedatasource.getrandomadvicefromapi();
      return right(result);
    } on ServerException catch (_) {
      return left(ServerFailure());
    } on Exception catch (_) {
      return left(GeneralFailure());
    }
  }
}
