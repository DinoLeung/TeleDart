/**
 * TeleDart - Telegram Bot API for Dart
 * Copyright (C) 2019  Dino PH Leung
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */

part of '../model.dart';

/// Contains information about the current status of a webhook.
///
/// https://core.telegram.org/bots/api#webhookinfo
@JsonSerializable()
class WebhookInfo {
  String url;
  bool has_custom_certificate;
  int pending_update_count;
  int last_error_date;
  String last_error_message;
  int max_connections;
  List<String> allowed_updates;

  WebhookInfo({
    this.url,
    this.has_custom_certificate,
    this.pending_update_count,
    this.last_error_date,
    this.last_error_message,
    this.max_connections,
    this.allowed_updates,
  });

  @JsonKey(ignore: true)
  DateTime get last_error_date_ => TimeHelper.toDateTime(last_error_date);
  set last_error_date_(DateTime dateTime) =>
      last_error_date = TimeHelper.toUnixTime(dateTime);

  factory WebhookInfo.fromJson(Map<String, dynamic> json) =>
      _$WebhookInfoFromJson(json);
  Map<String, dynamic> toJson() => _$WebhookInfoToJson(this);
}
