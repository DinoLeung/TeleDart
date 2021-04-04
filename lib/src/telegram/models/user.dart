/// TeleDart - Telegram Bot API for Dart
/// Copyright (C) 2019  Dino PH Leung
///
/// This program is free software: you can redistribute it and/or modify
/// it under the terms of the GNU General Public License as published by
/// the Free Software Foundation, either version 3 of the License, or
/// (at your option) any later version.
///
/// This program is distributed in the hope that it will be useful,
/// but WITHOUT ANY WARRANTY; without even the implied warranty of
/// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
/// GNU General Public License for more details.
///
/// You should have received a copy of the GNU General Public License
/// along with this program.  If not, see <https://www.gnu.org/licenses/>.

part of '../model.dart';

/// This object represents a Telegram user or bot.
///
/// https://core.telegram.org/bots/api#user
@JsonSerializable()
class User {
  int? id;
  bool? is_bot;
  String? first_name;
  String? last_name;
  String? username;
  String? language_code;
  bool? can_join_groups;
  bool? can_read_all_group_messages;
  bool? supports_inline_queries;
  User({
    this.id,
    this.is_bot,
    this.first_name,
    this.last_name,
    this.username,
    this.language_code,
    this.can_join_groups,
    this.can_read_all_group_messages,
    this.supports_inline_queries,
  });
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
