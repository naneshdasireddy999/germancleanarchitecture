import 'package:equatable/equatable.dart';

class AdviceEntity extends Equatable {
  final String advice;
  final int? id;
  const AdviceEntity({this.id, required this.advice});
  @override
  List<Object?> get props => [id, advice];
}
