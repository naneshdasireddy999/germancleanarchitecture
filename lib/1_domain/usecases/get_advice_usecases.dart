import 'package:dartz/dartz.dart';
import 'package:dfg/0_data/repositries/advice_repo_impl.dart';
import 'package:dfg/1_domain/entities/advice_entity.dart';
import 'package:dfg/1_domain/failures/failures.dart';
import 'package:dfg/1_domain/repositries/advice_repo.dart';

class AdviceUsecases {
  AdviceUsecases({required this.advicerepimpl});
  final AdviceRepo advicerepimpl;
  //here we are getting advicerepo as a parameter because we are implementing dependency injection
  //the instance will be used inside methods to acces getadvicefromdatasource which is in repoimpl in datalayer
  //this dependency injection is very useful in testing
  Future<Either<Failure, AdviceEntity>> getadvice() async {
    //here we have to implement business logic
    //but unfortunately there is not much business logic here to implement
    //we can manipulate the advice we got by using business logic but here it is not the case
    //therefore we will just call repositry(to get either failure or actual data which is advice entity)
    //usecase doesnt know anything about datasource
    //usecase asks datasourcerepositry the data it wants after recieving data it will perform business logic
    //what will happen is the data source will either return advice entity or failure
    //thats why we use dartz package for either(functional programming)
    //we will define failure class in domain layer.i created failure folder
    //failure is an abstract class
    //server failure and cache failure classes will implement failure class(cache failure and server failure are custom failures we created and general failures also)
    //we can create as many custom failures as we want
    //we will get advice from repositry of data layer
    return advicerepimpl.getadvicefromdatasource();
    //generally what we will do is we will get data from repositry of data layer
    //performs some business logic on retrieved data
    //then gives final output to cubit
    //but here we are just returning data to cubit because there is no complex business logic to perform
  }
}
