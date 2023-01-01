/*
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
@JsonSerializable(fieldRename: FieldRename.snake)
class WebhookInfo {
  String url;
  bool hasCustomCertificate;
  int pendingUpdateCount;
  String? ipAddress;
  int? lastErrorDate;
  String? lastErrorMessage;
  int? lastSynchronizationErrorDate;
  int? maxConnections;
  List<String>? allowedUpdates;

  WebhookInfo({
    required this.url,
    required this.hasCustomCertificate,
    required this.pendingUpdateCount,
    this.ipAddress,
    this.lastErrorDate,
    this.lastErrorMessage,
    this.lastSynchronizationErrorDate,
    this.maxConnections,
    this.allowedUpdates,
  });

  @JsonKey(ignore: true)
  DateTime? get lastErrorDate_ =>
      lastErrorDate == null ? null : TimeHelper.toDateTime(lastErrorDate!);
  set lastErrorDate_(DateTime? dateTime) =>
      lastErrorDate = dateTime == null ? null : TimeHelper.toUnixTime(dateTime);

  factory WebhookInfo.fromJson(Map<String, dynamic> json) =>
      _$WebhookInfoFromJson(json);
  Map<String, dynamic> toJson() => _$WebhookInfoToJson(this);
}
