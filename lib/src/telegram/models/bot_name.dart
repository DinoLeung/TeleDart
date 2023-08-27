part of '../model.dart';

/// This object represents the bot's name.
@JsonSerializable(fieldRename: FieldRename.snake)
class BotName {
  String? name;
  BotName({this.name});
  factory BotName.fromJson(Map<String, dynamic> json) =>
      _$BotNameFromJson(json);
  Map<String, dynamic> toJson() => _$BotNameToJson(this);
}
