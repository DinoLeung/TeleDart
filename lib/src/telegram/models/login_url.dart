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

/// This object represents a parameter of the inline keyboard button used to automatically authorize a user.
/// Serves as a great replacement for the [Telegram Login Widget] when the user is coming from Telegram.
/// All the user needs to do is tap/click a button and confirm that they want to log in.
///
/// Telegram apps support these buttons as of [version 5.7].
///
/// https://core.telegram.org/bots/api#loginurl
///
/// [Telegram Login Widget]: https://core.telegram.org/widgets/login
/// [version 5.7]: https://telegram.org/blog/privacy-discussions-web-bots#meet-seamless-web-bots
@JsonSerializable()
class LoginUrl {
  String? url;
  String? forward_text;
  String? bot_username;
  bool? request_write_access;
  LoginUrl({
    this.url,
    this.forward_text,
    this.bot_username,
    this.request_write_access,
  });
  factory LoginUrl.fromJson(Map<String, dynamic> json) =>
      _$LoginUrlFromJson(json);
  Map<String, dynamic> toJson() => _$LoginUrlToJson(this);
}
