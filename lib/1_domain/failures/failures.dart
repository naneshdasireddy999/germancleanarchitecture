abstract class Failure {}

class ServerFailure extends Failure {
  //these are custom failures created by us based on abstract class failure which is also created by us.
} //saving data to server or reading data from server

class CacheFailure extends Failure {
  //these are custom failures created by us based on abstract class failure which is also created by us.
} //saving data to phone or reading data from phone

class GeneralFailure extends Failure {
  //these are custom failures created by us based on abstract class failure which is also created by us.
}//you are not sure what went wrong