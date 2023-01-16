import 'package:dartz/dartz.dart';
import 'package:dfg/0_data/repositries/advice_repo_impl.dart';
import 'package:dfg/1_domain/entities/advice_entity.dart';
import 'package:dfg/1_domain/failures/failures.dart';
import 'package:dfg/1_domain/repositries/advice_repo.dart';

class AdviceUsecases {
  AdviceUsecases({required this.advicerepimpl});
  final AdviceRepo advicerepimpl;
  Future<Either<Failure, AdviceEntity>> getadvice() async {
    return advicerepimpl.getadvicefromdatasource();
    //space for business logic
  }
}
