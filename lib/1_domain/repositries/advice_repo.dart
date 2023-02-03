import 'package:dartz/dartz.dart';
import 'package:dfg/1_domain/entities/advice_entity.dart';
import 'package:dfg/1_domain/failures/failures.dart';

abstract class AdviceRepo {
  //functions which combine remote and local data source
  //here in domain layer we will define repositries but not implement them
  //the repositries in domain layer are abstract
  //gernerally usecase will call repositry
  //generally this repositry catch exceptions in datalayer and map them to failures
  //here again the repositry will either return failure or advice entity object
  //this is just a plan for repositry implementation in data layer
  Future<Either<Failure, AdviceEntity>> getadvicefromdatasource();
}
