import 'package:equatable/equatable.dart';

class AdviceEntity extends Equatable {
  //this is business objects i mean what we display on screen(data types)
  final String advice;
  final int? id;
  const AdviceEntity({this.id, required this.advice});
  @override
  List<Object?> get props => [id, advice];
}
