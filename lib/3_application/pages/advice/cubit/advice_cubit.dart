import 'package:bloc/bloc.dart';
import 'package:connectivity/connectivity.dart';
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
  //see here i assigned adviceentity to variable myadvice initially
  var myadvice = const AdviceEntity(id: 0, advice: '');
  String errormessage = '';
  //here we are getting usecases as a parameter because we are implementing dependency injection
  //the instance will be used inside methods to acces getadvice which is in usecase
  //this dependency injection is very useful in testing
  final AdviceUsecases adviceusecases;

  //could also use other usecases too

  Future<void> getadvice() async {
    //will get triggered when user presses get advice button
    emit(Adviceloadingstate());
    //after emitting above state user will see circular progress indicator
    //actually the bloc will now call the usecase(get advice) and after getting data from usecase we will emit loaded state or error state depending upon exception
    //we dont implement any business logic to get advice here.we will just call getadvice usecase.thats all
    //use cases can be multiple but here there is only one usecase
    //here we will either get adviceentity or failure from usecase
    //if we get failure from usecase we will emit error state
    //if we get adviceentity from usecase we will get loaded state
    final failureoradviceentity = await adviceusecases.getadvice();
    //since getadvice has both left and right side(i mean failure and advice entity)
    //we will use fold method
    //fold will execute left side function if we get failure object
    //fold will execute right side function if we get advice entity object
    //the respective states will be emitted accordingly
    failureoradviceentity.fold((failure) {
      //we got failure
      //failure is generated in data layer then it will come to domain layer (usecase)
      //since we are accessing method from usecase the failure will arrive here
      //we will pass that failure to mapfailure message
      //_mapfailuremessage is a private function we will define here in cubit
      errormessage = _mapfailuremessage(failure);
      emit(Adviceerrorstate());
    }, (advice) {
      //we got advice object
      //when there is success state i will assign myadvice variable to data returned by usecase(ehich is stored in advice)
      myadvice = advice;
      emit(Adviceloadedstate());
    });
  }

  String _mapfailuremessage(Failure failure) {
    //this runtimetype will give us either server or cache or general failure
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
