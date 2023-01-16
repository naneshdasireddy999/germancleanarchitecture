abstract class Failure {}

class ServerFailure extends Failure {
} //saving data to server or reading data from server

class CacheFailure extends Failure {
} //saving data to phone or reading data from phone

class GeneralFailure extends Failure {}//you are not sure what went wrong