import 'package:bloc/bloc.dart';
import 'package:dfg/1_domain/entities/advice_entity.dart';
import 'package:dfg/1_domain/failures/failures.dart';
import 'package:dfg/1_domain/usecases/get_advice_usecases.dart';
import 'package:equatable/equatable.dart';

part 'advice_state.dart';

const serverfailure = 'api error please try again';
const cachefailure = 'oops cache failed please try again';
const generalfailure = 'something went wrong please try again';

class AdviceCubit extends Cubit<AdviceState> {
  AdviceCubit({required this.adviceusecases}) : super(AdviceInitialstate());
  var myadvice = const AdviceEntity(id: 0, advice: '');
  String errormessage = '';
  final AdviceUsecases adviceusecases;
  //could also use other usecases too
  Future<void> getadvice() async {
    emit(Adviceloadingstate());
    final failureoradvice = await adviceusecases.getadvice();
    failureoradvice.fold((failure) {
      errormessage = _mapfailuremessage(failure);
      emit(Adviceerrorstate());
    }, (advice) {
      myadvice = advice;
      emit(Adviceloadedstate());
    });
  }

  String _mapfailuremessage(Failure failure) {
    var command = failure.runtimeType;
    switch (command) {
      case ServerFailure:
        return serverfailure;

      case CacheFailure:
        return cachefailure;

      default:
        return generalfailure;
    }
  }
}
