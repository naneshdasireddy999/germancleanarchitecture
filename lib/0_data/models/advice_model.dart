// To parse this JSON data, do
//
//     final adviceModel = adviceModelFromJson(jsonString);

import 'dart:convert';

import 'package:dfg/1_domain/entities/advice_entity.dart';
import 'package:equatable/equatable.dart';

AdviceModel adviceModelFromJson(String str) =>
//this method will return adviceentity i mean advice model object to remotedatasource or local data source
    AdviceModel.fromJson(json.decode(str));

String adviceModelToJson(AdviceModel? data) => json.encode(data!.toJson());

class AdviceModel extends AdviceEntity with EquatableMixin {
  //models are there to convert raw data into entities by using from json and tojson methods
  //models are nothing but data parsers
  AdviceModel({
    this.adviceId,
    required this.myadvice,
  }) : super(advice: myadvice, id: adviceId);

  final int? adviceId;
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
