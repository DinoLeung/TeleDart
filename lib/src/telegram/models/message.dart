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

/// This object represents a message.
///
/// https://core.telegram.org/bots/api#message
@JsonSerializable(fieldRename: FieldRename.snake)
class Message {
  int messageId;
  int? messageThreadId;
  User? from;
  Chat? senderChat;
  int date;
  Chat chat;
  User? forwardFrom;
  Chat? forwardFromChat;
  int? forwardFromMessageId;
  String? forwardSignature;
  String? forwardSenderName;
  int? forwardDate;
  bool? isTopicMessage;
  bool? isAutomaticForward;
  Message? replyToMessage;
  User? viaBot;
  int? editDate;
  bool? hasProtectedContent;
  String? mediaGroupId;
  String? authorSignature;
  String? text;
  List<MessageEntity>? entities;
  Animation? animation;
  Audio? audio;
  Document? document;
  List<PhotoSize>? photo;
  Sticker? sticker;
  Video? video;
  VideoNote? videoNote;
  Voice? voice;
  String? caption;
  List<MessageEntity>? captionEntities;
  bool? hasMediaSpoiler;
  Contact? contact;
  Dice? dice;
  Game? game;
  Poll? poll;
  Venue? venue;
  Location? location;
  List<User>? newChatMembers;
  User? leftChatMember;
  String? newChatTitle;
  List<PhotoSize>? newChatPhoto;
  bool? deleteChatPhoto;
  bool? groupChatCreated;
  bool? supergroupChatCreated;
  bool? channelChatCreated;
  MessageAutoDeleteTimerChanged? messageAutoDeleteTimerChanged;
  int? migrateToChatId;
  int? migrateFromChatId;
  Message? pinnedMessage;
  Invoice? invoice;
  SuccessfulPayment? successfulPayment;
  UserShared? userShared;
  ChatShared? chatShared;
  String? connectedWebsite;
  WriteAccessAllowed? writeAccessAllowed;
  PassportData? passportData;
  ProximityAlertTriggered? proximityAlertTriggered;
  ForumTopicCreated? forumTopicCreated;
  ForumTopicEdited? forumTopicEdited;
  ForumTopicClosed? forumTopicClosed;
  ForumTopicReopened? forumTopicReopened;
  GeneralForumTopicHidden? generalForumTopicHidden;
  GeneralForumTopicUnhidden? generalForumTopicUnhidden;
  VoiceChatScheduled? videoChatScheduled;
  VoiceChatStarted? videoChatStarted;
  VoiceChatEnded? videoChatEnded;
  VoiceChatParticipantsInvited? videoChatParticipantsInvited;
  WebAppData? webAppData;
  InlineKeyboardMarkup? replyMarkup;

  Message({
    required this.messageId,
    this.messageThreadId,
    this.from,
    this.senderChat,
    required this.date,
    required this.chat,
    this.forwardFrom,
    this.forwardFromChat,
    this.forwardFromMessageId,
    this.forwardSignature,
    this.forwardSenderName,
    this.forwardDate,
    this.isTopicMessage,
    this.isAutomaticForward,
    this.replyToMessage,
    this.viaBot,
    this.editDate,
    this.hasProtectedContent,
    this.mediaGroupId,
    this.authorSignature,
    this.text,
    this.entities,
    this.animation,
    this.audio,
    this.document,
    this.photo,
    this.sticker,
    this.video,
    this.videoNote,
    this.voice,
    this.caption,
    this.captionEntities,
    this.hasMediaSpoiler,
    this.contact,
    this.dice,
    this.game,
    this.poll,
    this.venue,
    this.location,
    this.newChatMembers,
    this.leftChatMember,
    this.newChatTitle,
    this.newChatPhoto,
    this.deleteChatPhoto,
    this.groupChatCreated,
    this.supergroupChatCreated,
    this.channelChatCreated,
    this.messageAutoDeleteTimerChanged,
    this.migrateToChatId,
    this.migrateFromChatId,
    this.pinnedMessage,
    this.invoice,
    this.successfulPayment,
    this.userShared,
    this.chatShared,
    this.connectedWebsite,
    this.writeAccessAllowed,
    this.passportData,
    this.proximityAlertTriggered,
    this.forumTopicCreated,
    this.forumTopicEdited,
    this.forumTopicClosed,
    this.forumTopicReopened,
    this.generalForumTopicHidden,
    this.generalForumTopicUnhidden,
    this.videoChatScheduled,
    this.videoChatStarted,
    this.videoChatEnded,
    this.videoChatParticipantsInvited,
    this.webAppData,
    this.replyMarkup,
  });

  @JsonKey(includeFromJson: false, includeToJson: false)
  DateTime get date_ => TimeHelper.toDateTime(date);
  set date_(DateTime dateTime) => date = TimeHelper.toUnixTime(dateTime);

  @JsonKey(includeFromJson: false, includeToJson: false)
  DateTime? get forwardDate_ =>
      forwardDate == null ? null : TimeHelper.toDateTime(forwardDate!);
  set forwardDate_(DateTime? dateTime) =>
      forwardDate = dateTime == null ? null : TimeHelper.toUnixTime(dateTime);

  @JsonKey(includeFromJson: false, includeToJson: false)
  DateTime? get editDate_ =>
      editDate == null ? null : TimeHelper.toDateTime(editDate!);
  set editDate_(DateTime? dateTime) =>
      editDate = dateTime == null ? null : TimeHelper.toUnixTime(dateTime);

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
  Map<String, dynamic> toJson() => _$MessageToJson(this);

  int indexOfEntity(String? type) {
    var etts = entities ?? captionEntities;
    if (etts != null) {
      for (var ett in etts) {
        if (ett.type == type) return etts.indexOf(ett);
      }
    }
    return -1;
  }

  MessageEntity? entityOf(String? type) {
    var i = indexOfEntity(type);
    if (i >= 0) {
      return (entities ?? captionEntities)![i];
    } else {
      return null;
    }
  }

  String? getEntity(String? type) {
    var ett = entityOf(type);
    if (ett != null) {
      return (text ?? caption)!.substring(ett.offset, ett.offset + ett.length);
    } else {
      return null;
    }
  }
}
