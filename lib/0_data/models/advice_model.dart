// To parse this JSON data, do
//
//     final adviceModel = adviceModelFromJson(jsonString);

import 'dart:convert';

import 'package:dfg/1_domain/entities/advice_entity.dart';
import 'package:equatable/equatable.dart';

AdviceModel adviceModelFromJson(String str) =>
    AdviceModel.fromJson(json.decode(str));

String adviceModelToJson(AdviceModel? data) => json.encode(data!.toJson());

class AdviceModel extends AdviceEntity with EquatableMixin {
  AdviceModel({
    required this.adviceId,
    required this.myadvice,
  }) : super(advice: myadvice, id: adviceId);

  final int adviceId;
  final String myadvice;

  factory AdviceModel.fromJson(Map<String, dynamic> json) => AdviceModel(
        adviceId: json["advice_id"],
        myadvice: json["advice"],
      );

  Map<String, dynamic> toJson() => {
        "advice_id": adviceId,
        "advice": myadvice,
      };
}
