import 'package:dartz/dartz.dart';
import 'package:dfg/1_domain/entities/advice_entity.dart';
import 'package:dfg/1_domain/failures/failures.dart';

abstract class AdviceRepo {
  Future<Either<Failure, AdviceEntity>> getadvicefromdatasource();
}
