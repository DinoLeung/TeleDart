// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Animation _$AnimationFromJson(Map<String, dynamic> json) => Animation(
      fileId: json['file_id'] as String,
      fileUniqueId: json['file_unique_id'] as String,
      width: json['width'] as int,
      height: json['height'] as int,
      duration: json['duration'] as int,
      thumb: json['thumb'] == null
          ? null
          : PhotoSize.fromJson(json['thumb'] as Map<String, dynamic>),
      fileName: json['file_name'] as String?,
      mimeType: json['mime_type'] as String?,
      fileSize: json['file_size'] as int?,
    );

Map<String, dynamic> _$AnimationToJson(Animation instance) {
  final val = <String, dynamic>{
    'file_id': instance.fileId,
    'file_unique_id': instance.fileUniqueId,
    'width': instance.width,
    'height': instance.height,
    'duration': instance.duration,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('thumb', instance.thumb?.toJson());
  writeNotNull('file_name', instance.fileName);
  writeNotNull('mime_type', instance.mimeType);
  writeNotNull('file_size', instance.fileSize);
  return val;
}

Audio _$AudioFromJson(Map<String, dynamic> json) => Audio(
      fileId: json['file_id'] as String,
      fileUniqueId: json['file_unique_id'] as String,
      duration: json['duration'] as int,
      performer: json['performer'] as String?,
      title: json['title'] as String?,
      fileName: json['file_name'] as String?,
      mimeType: json['mime_type'] as String?,
      fileSize: json['file_size'] as int?,
      thumb: json['thumb'] == null
          ? null
          : PhotoSize.fromJson(json['thumb'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AudioToJson(Audio instance) {
  final val = <String, dynamic>{
    'file_id': instance.fileId,
    'file_unique_id': instance.fileUniqueId,
    'duration': instance.duration,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('performer', instance.performer);
  writeNotNull('title', instance.title);
  writeNotNull('file_name', instance.fileName);
  writeNotNull('mime_type', instance.mimeType);
  writeNotNull('file_size', instance.fileSize);
  writeNotNull('thumb', instance.thumb?.toJson());
  return val;
}

BotCommandScopeAllChatAdministrators
    _$BotCommandScopeAllChatAdministratorsFromJson(Map<String, dynamic> json) =>
        BotCommandScopeAllChatAdministrators(
          type: json['type'] as String? ??
              BotCommandScope.typeAllChatAdministrators,
        );

Map<String, dynamic> _$BotCommandScopeAllChatAdministratorsToJson(
        BotCommandScopeAllChatAdministrators instance) =>
    <String, dynamic>{
      'type': instance.type,
    };

BotCommandScopeAllGroupChats _$BotCommandScopeAllGroupChatsFromJson(
        Map<String, dynamic> json) =>
    BotCommandScopeAllGroupChats(
      type: json['type'] as String? ?? BotCommandScope.typeAllGroupChats,
    );

Map<String, dynamic> _$BotCommandScopeAllGroupChatsToJson(
        BotCommandScopeAllGroupChats instance) =>
    <String, dynamic>{
      'type': instance.type,
    };

BotCommandScopeAllPrivateChats _$BotCommandScopeAllPrivateChatsFromJson(
        Map<String, dynamic> json) =>
    BotCommandScopeAllPrivateChats(
      type: json['type'] as String? ?? BotCommandScope.typeAllPrivateChats,
    );

Map<String, dynamic> _$BotCommandScopeAllPrivateChatsToJson(
        BotCommandScopeAllPrivateChats instance) =>
    <String, dynamic>{
      'type': instance.type,
    };

BotCommandScopeChatAdministrators _$BotCommandScopeChatAdministratorsFromJson(
        Map<String, dynamic> json) =>
    BotCommandScopeChatAdministrators(
      type:
          json['type'] as String? ?? BotCommandScope.typeAllChatAdministrators,
      chatId: json['chat_id'],
    );

Map<String, dynamic> _$BotCommandScopeChatAdministratorsToJson(
    BotCommandScopeChatAdministrators instance) {
  final val = <String, dynamic>{
    'type': instance.type,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('chat_id', instance.chatId);
  return val;
}

BotCommandScopeChatMember _$BotCommandScopeChatMemberFromJson(
        Map<String, dynamic> json) =>
    BotCommandScopeChatMember(
      type: json['type'] as String? ?? BotCommandScope.typeChatMember,
      chatId: json['chat_id'],
    );

Map<String, dynamic> _$BotCommandScopeChatMemberToJson(
    BotCommandScopeChatMember instance) {
  final val = <String, dynamic>{
    'type': instance.type,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('chat_id', instance.chatId);
  return val;
}

BotCommandScopeChat _$BotCommandScopeChatFromJson(Map<String, dynamic> json) =>
    BotCommandScopeChat(
      type: json['type'] as String? ?? BotCommandScope.typeChat,
      chatId: json['chat_id'],
    );

Map<String, dynamic> _$BotCommandScopeChatToJson(BotCommandScopeChat instance) {
  final val = <String, dynamic>{
    'type': instance.type,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('chat_id', instance.chatId);
  return val;
}

BotCommandScopeDefault _$BotCommandScopeDefaultFromJson(
        Map<String, dynamic> json) =>
    BotCommandScopeDefault(
      type: json['type'] as String? ?? BotCommandScope.typeDefault,
    );

Map<String, dynamic> _$BotCommandScopeDefaultToJson(
        BotCommandScopeDefault instance) =>
    <String, dynamic>{
      'type': instance.type,
    };

BotCommandScope _$BotCommandScopeFromJson(Map<String, dynamic> json) =>
    BotCommandScope(
      type: json['type'] as String,
    );

Map<String, dynamic> _$BotCommandScopeToJson(BotCommandScope instance) =>
    <String, dynamic>{
      'type': instance.type,
    };

BotCommand _$BotCommandFromJson(Map<String, dynamic> json) => BotCommand(
      command: json['command'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$BotCommandToJson(BotCommand instance) =>
    <String, dynamic>{
      'command': instance.command,
      'description': instance.description,
    };

CallbackGame _$CallbackGameFromJson(Map<String, dynamic> json) =>
    CallbackGame();

Map<String, dynamic> _$CallbackGameToJson(CallbackGame instance) =>
    <String, dynamic>{};

CallbackQuery _$CallbackQueryFromJson(Map<String, dynamic> json) =>
    CallbackQuery(
      id: json['id'] as String,
      from: User.fromJson(json['from'] as Map<String, dynamic>),
      message: json['message'] == null
          ? null
          : Message.fromJson(json['message'] as Map<String, dynamic>),
      inlineMessageId: json['inline_message_id'] as String?,
      chatInstance: json['chat_instance'] as String?,
      data: json['data'] as String?,
      gameShortName: json['game_short_name'] as String?,
    );

Map<String, dynamic> _$CallbackQueryToJson(CallbackQuery instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'from': instance.from.toJson(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('message', instance.message?.toJson());
  writeNotNull('inline_message_id', instance.inlineMessageId);
  writeNotNull('chat_instance', instance.chatInstance);
  writeNotNull('data', instance.data);
  writeNotNull('game_short_name', instance.gameShortName);
  return val;
}

ChatAdministratorRights _$ChatAdministratorRightsFromJson(
        Map<String, dynamic> json) =>
    ChatAdministratorRights(
      isAnonymous: json['is_anonymous'] as bool? ?? false,
      canManageChat: json['can_manage_chat'] as bool? ?? false,
      canDeleteMessages: json['can_delete_messages'] as bool? ?? false,
      canManageVideoChats: json['can_manage_video_chats'] as bool? ?? false,
      canRestrictMembers: json['can_restrict_members'] as bool? ?? false,
      canPromoteMembers: json['can_promote_members'] as bool? ?? false,
      canChangeInfo: json['can_change_info'] as bool? ?? false,
      canInviteUsers: json['can_invite_users'] as bool? ?? false,
      canPostMessages: json['can_post_messages'] as bool?,
      canEditMessages: json['can_edit_messages'] as bool?,
      canPinMessages: json['can_pin_messages'] as bool?,
      canManageTopics: json['can_manage_topics'] as bool?,
    );

Map<String, dynamic> _$ChatAdministratorRightsToJson(
    ChatAdministratorRights instance) {
  final val = <String, dynamic>{
    'is_anonymous': instance.isAnonymous,
    'can_manage_chat': instance.canManageChat,
    'can_delete_messages': instance.canDeleteMessages,
    'can_manage_video_chats': instance.canManageVideoChats,
    'can_restrict_members': instance.canRestrictMembers,
    'can_promote_members': instance.canPromoteMembers,
    'can_change_info': instance.canChangeInfo,
    'can_invite_users': instance.canInviteUsers,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('can_post_messages', instance.canPostMessages);
  writeNotNull('can_edit_messages', instance.canEditMessages);
  writeNotNull('can_pin_messages', instance.canPinMessages);
  writeNotNull('can_manage_topics', instance.canManageTopics);
  return val;
}

ChatInviteLink _$ChatInviteLinkFromJson(Map<String, dynamic> json) =>
    ChatInviteLink(
      inviteLink: json['invite_link'] as String,
      creator: User.fromJson(json['creator'] as Map<String, dynamic>),
      createsJoinRequest: json['creates_join_request'] as bool,
      isPrimary: json['is_primary'] as bool,
      isRevoked: json['is_revoked'] as bool,
      name: json['name'] as String?,
      expireDate: json['expire_date'] as int?,
      memberLimit: json['member_limit'] as int?,
      pendingJoinRequestCount: json['pending_join_request_count'] as int?,
    );

Map<String, dynamic> _$ChatInviteLinkToJson(ChatInviteLink instance) {
  final val = <String, dynamic>{
    'invite_link': instance.inviteLink,
    'creator': instance.creator.toJson(),
    'creates_join_request': instance.createsJoinRequest,
    'is_primary': instance.isPrimary,
    'is_revoked': instance.isRevoked,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('expire_date', instance.expireDate);
  writeNotNull('member_limit', instance.memberLimit);
  writeNotNull('pending_join_request_count', instance.pendingJoinRequestCount);
  return val;
}

ChatJoinRequest _$ChatJoinRequestFromJson(Map<String, dynamic> json) =>
    ChatJoinRequest(
      chat: Chat.fromJson(json['chat'] as Map<String, dynamic>),
      from: User.fromJson(json['from'] as Map<String, dynamic>),
      userChatId: json['user_chat_id'] as int,
      date: json['date'] as int,
      bio: json['bio'] as String?,
      inviteLink: json['invite_link'] == null
          ? null
          : ChatInviteLink.fromJson(
              json['invite_link'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChatJoinRequestToJson(ChatJoinRequest instance) {
  final val = <String, dynamic>{
    'chat': instance.chat.toJson(),
    'from': instance.from.toJson(),
    'user_chat_id': instance.userChatId,
    'date': instance.date,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('bio', instance.bio);
  writeNotNull('invite_link', instance.inviteLink?.toJson());
  return val;
}

ChatLocation _$ChatLocationFromJson(Map<String, dynamic> json) => ChatLocation(
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
      address: json['address'] as String,
    );

Map<String, dynamic> _$ChatLocationToJson(ChatLocation instance) =>
    <String, dynamic>{
      'location': instance.location.toJson(),
      'address': instance.address,
    };

ChatMemberAdministrator _$ChatMemberAdministratorFromJson(
        Map<String, dynamic> json) =>
    ChatMemberAdministrator(
      status: json['status'] as String,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      canBeEdited: json['can_be_edited'] as bool? ?? false,
      isAnonymous: json['is_anonymous'] as bool? ?? false,
      canManageChat: json['can_manage_chat'] as bool? ?? false,
      canDeleteMessages: json['can_delete_messages'] as bool? ?? false,
      canManageVideoChats: json['can_manage_video_chats'] as bool? ?? false,
      canRestrictMembers: json['can_restrict_members'] as bool? ?? false,
      canPromoteMembers: json['can_promote_members'] as bool? ?? false,
      canChangeInfo: json['can_change_info'] as bool? ?? false,
      canInviteUsers: json['can_invite_users'] as bool? ?? false,
      canPostMessages: json['can_post_messages'] as bool?,
      canEditMessages: json['can_edit_messages'] as bool?,
      canPinMessages: json['can_pin_messages'] as bool?,
      canManageTopics: json['can_manage_topics'] as bool?,
      customTitle: json['custom_title'] as String?,
    );

Map<String, dynamic> _$ChatMemberAdministratorToJson(
    ChatMemberAdministrator instance) {
  final val = <String, dynamic>{
    'status': instance.status,
    'user': instance.user.toJson(),
    'can_be_edited': instance.canBeEdited,
    'is_anonymous': instance.isAnonymous,
    'can_manage_chat': instance.canManageChat,
    'can_delete_messages': instance.canDeleteMessages,
    'can_manage_video_chats': instance.canManageVideoChats,
    'can_restrict_members': instance.canRestrictMembers,
    'can_promote_members': instance.canPromoteMembers,
    'can_change_info': instance.canChangeInfo,
    'can_invite_users': instance.canInviteUsers,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('can_post_messages', instance.canPostMessages);
  writeNotNull('can_edit_messages', instance.canEditMessages);
  writeNotNull('can_pin_messages', instance.canPinMessages);
  writeNotNull('can_manage_topics', instance.canManageTopics);
  writeNotNull('custom_title', instance.customTitle);
  return val;
}

ChatMemberBanned _$ChatMemberBannedFromJson(Map<String, dynamic> json) =>
    ChatMemberBanned(
      status: json['status'] as String,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      untilDate: json['until_date'] as int,
    );

Map<String, dynamic> _$ChatMemberBannedToJson(ChatMemberBanned instance) =>
    <String, dynamic>{
      'status': instance.status,
      'user': instance.user.toJson(),
      'until_date': instance.untilDate,
    };

ChatMemberLeft _$ChatMemberLeftFromJson(Map<String, dynamic> json) =>
    ChatMemberLeft(
      status: json['status'] as String,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChatMemberLeftToJson(ChatMemberLeft instance) =>
    <String, dynamic>{
      'status': instance.status,
      'user': instance.user.toJson(),
    };

ChatMemberMember _$ChatMemberMemberFromJson(Map<String, dynamic> json) =>
    ChatMemberMember(
      status: json['status'] as String,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChatMemberMemberToJson(ChatMemberMember instance) =>
    <String, dynamic>{
      'status': instance.status,
      'user': instance.user.toJson(),
    };

ChatMemberOwner _$ChatMemberOwnerFromJson(Map<String, dynamic> json) =>
    ChatMemberOwner(
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      status: json['status'] as String,
      isAnonymous: json['is_anonymous'] as bool,
      customTitle: json['custom_title'] as String?,
    );

Map<String, dynamic> _$ChatMemberOwnerToJson(ChatMemberOwner instance) {
  final val = <String, dynamic>{
    'status': instance.status,
    'user': instance.user.toJson(),
    'is_anonymous': instance.isAnonymous,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('custom_title', instance.customTitle);
  return val;
}

ChatMemberRestricted _$ChatMemberRestrictedFromJson(
        Map<String, dynamic> json) =>
    ChatMemberRestricted(
      status: json['status'] as String,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      isMember: json['is_member'] as bool? ?? false,
      canChangeInfo: json['can_change_info'] as bool? ?? false,
      canInviteUsers: json['can_invite_users'] as bool? ?? false,
      canPinMessages: json['can_pin_messages'] as bool? ?? false,
      canManageTopics: json['can_manage_topics'] as bool? ?? false,
      canSendMessages: json['can_send_messages'] as bool? ?? false,
      canSendAudios: json['can_send_audios'] as bool? ?? false,
      canSendDocuments: json['can_send_documents'] as bool? ?? false,
      canSendPhotos: json['can_send_photos'] as bool? ?? false,
      canSendVideos: json['can_send_videos'] as bool? ?? false,
      canSendVideoNotes: json['can_send_video_notes'] as bool? ?? false,
      canSendVoiceNotes: json['can_send_voice_notes'] as bool? ?? false,
      canSendPolls: json['can_send_polls'] as bool? ?? false,
      canSendOtherMessages: json['can_send_other_messages'] as bool? ?? false,
      canAddWebPagePreviews:
          json['can_add_web_page_previews'] as bool? ?? false,
      untilDate: json['until_date'] as int,
    );

Map<String, dynamic> _$ChatMemberRestrictedToJson(
    ChatMemberRestricted instance) {
  final val = <String, dynamic>{
    'status': instance.status,
    'user': instance.user.toJson(),
    'is_member': instance.isMember,
    'can_change_info': instance.canChangeInfo,
    'can_invite_users': instance.canInviteUsers,
    'can_pin_messages': instance.canPinMessages,
    'can_manage_topics': instance.canManageTopics,
    'can_send_messages': instance.canSendMessages,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('can_send_audios', instance.canSendAudios);
  writeNotNull('can_send_documents', instance.canSendDocuments);
  writeNotNull('can_send_photos', instance.canSendPhotos);
  writeNotNull('can_send_videos', instance.canSendVideos);
  writeNotNull('can_send_video_notes', instance.canSendVideoNotes);
  writeNotNull('can_send_voice_notes', instance.canSendVoiceNotes);
  val['can_send_polls'] = instance.canSendPolls;
  val['can_send_other_messages'] = instance.canSendOtherMessages;
  val['can_add_web_page_previews'] = instance.canAddWebPagePreviews;
  val['until_date'] = instance.untilDate;
  return val;
}

ChatMemberUpdated _$ChatMemberUpdatedFromJson(Map<String, dynamic> json) =>
    ChatMemberUpdated(
      chat: json['chat'] == null
          ? null
          : Chat.fromJson(json['chat'] as Map<String, dynamic>),
      from: json['from'] == null
          ? null
          : User.fromJson(json['from'] as Map<String, dynamic>),
      oldChatMember: json['old_chat_member'] == null
          ? null
          : ChatMember.fromJson(
              json['old_chat_member'] as Map<String, dynamic>),
      newChatMember: json['new_chat_member'] == null
          ? null
          : ChatMember.fromJson(
              json['new_chat_member'] as Map<String, dynamic>),
      inviteLink: json['invite_link'] == null
          ? null
          : ChatInviteLink.fromJson(
              json['invite_link'] as Map<String, dynamic>),
    )..date = json['date'] as int?;

Map<String, dynamic> _$ChatMemberUpdatedToJson(ChatMemberUpdated instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('chat', instance.chat?.toJson());
  writeNotNull('from', instance.from?.toJson());
  writeNotNull('date', instance.date);
  writeNotNull('old_chat_member', instance.oldChatMember?.toJson());
  writeNotNull('new_chat_member', instance.newChatMember?.toJson());
  writeNotNull('invite_link', instance.inviteLink?.toJson());
  return val;
}

ChatMember _$ChatMemberFromJson(Map<String, dynamic> json) => ChatMember(
      status: json['status'] as String,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChatMemberToJson(ChatMember instance) =>
    <String, dynamic>{
      'status': instance.status,
      'user': instance.user.toJson(),
    };

ChatPermissions _$ChatPermissionsFromJson(Map<String, dynamic> json) =>
    ChatPermissions(
      canSendMessages: json['can_send_messages'] as bool?,
      canSendAudios: json['can_send_audios'] as bool?,
      canSendDocuments: json['can_send_documents'] as bool?,
      canSendPhotos: json['can_send_photos'] as bool?,
      canSendVideos: json['can_send_videos'] as bool?,
      canSendVideoNotes: json['can_send_video_notes'] as bool?,
      canSendVoiceNotes: json['can_send_voice_notes'] as bool?,
      canSendPolls: json['can_send_polls'] as bool?,
      canSendOtherMessages: json['can_send_other_messages'] as bool?,
      canAddWebPagePreviews: json['can_add_web_page_previews'] as bool?,
      canChangeInfo: json['can_change_info'] as bool?,
      canInviteUsers: json['can_invite_users'] as bool?,
      canPinMessages: json['can_pin_messages'] as bool?,
      canManageTopics: json['can_manage_topics'] as bool?,
    );

Map<String, dynamic> _$ChatPermissionsToJson(ChatPermissions instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('can_send_messages', instance.canSendMessages);
  writeNotNull('can_send_audios', instance.canSendAudios);
  writeNotNull('can_send_documents', instance.canSendDocuments);
  writeNotNull('can_send_photos', instance.canSendPhotos);
  writeNotNull('can_send_videos', instance.canSendVideos);
  writeNotNull('can_send_video_notes', instance.canSendVideoNotes);
  writeNotNull('can_send_voice_notes', instance.canSendVoiceNotes);
  writeNotNull('can_send_polls', instance.canSendPolls);
  writeNotNull('can_send_other_messages', instance.canSendOtherMessages);
  writeNotNull('can_add_web_page_previews', instance.canAddWebPagePreviews);
  writeNotNull('can_change_info', instance.canChangeInfo);
  writeNotNull('can_invite_users', instance.canInviteUsers);
  writeNotNull('can_pin_messages', instance.canPinMessages);
  writeNotNull('can_manage_topics', instance.canManageTopics);
  return val;
}

ChatPhoto _$ChatPhotoFromJson(Map<String, dynamic> json) => ChatPhoto(
      smallFileId: json['small_file_id'] as String,
      smallFileUniqueId: json['small_file_unique_id'] as String,
      bigFileId: json['big_file_id'] as String,
      bigFileUniqueId: json['big_file_unique_id'] as String,
    );

Map<String, dynamic> _$ChatPhotoToJson(ChatPhoto instance) => <String, dynamic>{
      'small_file_id': instance.smallFileId,
      'small_file_unique_id': instance.smallFileUniqueId,
      'big_file_id': instance.bigFileId,
      'big_file_unique_id': instance.bigFileUniqueId,
    };

ChatShared _$ChatSharedFromJson(Map<String, dynamic> json) => ChatShared(
      requestId: json['request_id'] as int,
      userId: json['user_id'] as int,
    );

Map<String, dynamic> _$ChatSharedToJson(ChatShared instance) =>
    <String, dynamic>{
      'request_id': instance.requestId,
      'user_id': instance.userId,
    };

Chat _$ChatFromJson(Map<String, dynamic> json) => Chat(
      id: json['id'] as int,
      type: json['type'] as String,
      title: json['title'] as String?,
      username: json['username'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      isForum: json['is_forum'] as bool?,
      photo: json['photo'] == null
          ? null
          : ChatPhoto.fromJson(json['photo'] as Map<String, dynamic>),
      activeUsernames: (json['active_usernames'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      emojiStatusCustomEmojiId: json['emoji_status_custom_emoji_id'] as String?,
      bio: json['bio'] as String?,
      hasPrivateForwards: json['has_private_forwards'] as bool?,
      hasRestrictedVoiceAndVideoMessages:
          json['has_restricted_voice_and_video_messages'] as bool?,
      joinToSendMessages: json['join_to_send_messages'] as bool?,
      joinByRequest: json['join_by_request'] as bool?,
      description: json['description'] as String?,
      inviteLink: json['invite_link'] as String?,
      pinnedMessage: json['pinned_message'] == null
          ? null
          : Message.fromJson(json['pinned_message'] as Map<String, dynamic>),
      permissions: json['permissions'] == null
          ? null
          : ChatPermissions.fromJson(
              json['permissions'] as Map<String, dynamic>),
      slowModeDelay: json['slow_mode_delay'] as int?,
      messageAutoDeleteTime: json['message_auto_delete_time'] as int?,
      hasAggressiveAntiSpamEnabled:
          json['has_aggressive_anti_spam_enabled'] as bool?,
      hasHiddenMembers: json['has_hidden_members'] as bool?,
      hasProtectedContent: json['has_protected_content'] as bool?,
      stickerSetName: json['sticker_set_name'] as String?,
      canSetStickerSet: json['can_set_sticker_set'] as bool?,
      linkedChatId: json['linked_chat_id'] as int?,
      location: json['location'] == null
          ? null
          : ChatLocation.fromJson(json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChatToJson(Chat instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'type': instance.type,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('title', instance.title);
  writeNotNull('username', instance.username);
  writeNotNull('first_name', instance.firstName);
  writeNotNull('last_name', instance.lastName);
  writeNotNull('is_forum', instance.isForum);
  writeNotNull('photo', instance.photo?.toJson());
  writeNotNull('active_usernames', instance.activeUsernames);
  writeNotNull(
      'emoji_status_custom_emoji_id', instance.emojiStatusCustomEmojiId);
  writeNotNull('bio', instance.bio);
  writeNotNull('has_private_forwards', instance.hasPrivateForwards);
  writeNotNull('has_restricted_voice_and_video_messages',
      instance.hasRestrictedVoiceAndVideoMessages);
  writeNotNull('join_to_send_messages', instance.joinToSendMessages);
  writeNotNull('join_by_request', instance.joinByRequest);
  writeNotNull('description', instance.description);
  writeNotNull('invite_link', instance.inviteLink);
  writeNotNull('pinned_message', instance.pinnedMessage?.toJson());
  writeNotNull('permissions', instance.permissions?.toJson());
  writeNotNull('slow_mode_delay', instance.slowModeDelay);
  writeNotNull('message_auto_delete_time', instance.messageAutoDeleteTime);
  writeNotNull('has_aggressive_anti_spam_enabled',
      instance.hasAggressiveAntiSpamEnabled);
  writeNotNull('has_hidden_members', instance.hasHiddenMembers);
  writeNotNull('has_protected_content', instance.hasProtectedContent);
  writeNotNull('sticker_set_name', instance.stickerSetName);
  writeNotNull('can_set_sticker_set', instance.canSetStickerSet);
  writeNotNull('linked_chat_id', instance.linkedChatId);
  writeNotNull('location', instance.location?.toJson());
  return val;
}

ChosenInlineResult _$ChosenInlineResultFromJson(Map<String, dynamic> json) =>
    ChosenInlineResult(
      resultId: json['result_id'] as String,
      from: User.fromJson(json['from'] as Map<String, dynamic>),
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
      inlineMessageId: json['inline_message_id'] as String?,
      query: json['query'] as String,
    );

Map<String, dynamic> _$ChosenInlineResultToJson(ChosenInlineResult instance) {
  final val = <String, dynamic>{
    'result_id': instance.resultId,
    'from': instance.from.toJson(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('location', instance.location?.toJson());
  writeNotNull('inline_message_id', instance.inlineMessageId);
  val['query'] = instance.query;
  return val;
}

Contact _$ContactFromJson(Map<String, dynamic> json) => Contact(
      phoneNumber: json['phone_number'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String?,
      userId: json['user_id'] as int?,
      vcard: json['vcard'] as String?,
    );

Map<String, dynamic> _$ContactToJson(Contact instance) {
  final val = <String, dynamic>{
    'phone_number': instance.phoneNumber,
    'first_name': instance.firstName,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('last_name', instance.lastName);
  writeNotNull('user_id', instance.userId);
  writeNotNull('vcard', instance.vcard);
  return val;
}

Dice _$DiceFromJson(Map<String, dynamic> json) => Dice(
      value: json['value'] as int,
      emoji: json['emoji'] as String,
    );

Map<String, dynamic> _$DiceToJson(Dice instance) => <String, dynamic>{
      'value': instance.value,
      'emoji': instance.emoji,
    };

Document _$DocumentFromJson(Map<String, dynamic> json) => Document(
      fileId: json['file_id'] as String,
      fileUniqueId: json['file_unique_id'] as String,
      thumb: json['thumb'] == null
          ? null
          : PhotoSize.fromJson(json['thumb'] as Map<String, dynamic>),
      fileName: json['file_name'] as String?,
      mimeType: json['mime_type'] as String?,
      fileSize: json['file_size'] as int?,
    );

Map<String, dynamic> _$DocumentToJson(Document instance) {
  final val = <String, dynamic>{
    'file_id': instance.fileId,
    'file_unique_id': instance.fileUniqueId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('thumb', instance.thumb?.toJson());
  writeNotNull('file_name', instance.fileName);
  writeNotNull('mime_type', instance.mimeType);
  writeNotNull('file_size', instance.fileSize);
  return val;
}

EncryptedCredentials _$EncryptedCredentialsFromJson(
        Map<String, dynamic> json) =>
    EncryptedCredentials(
      data: json['data'] as String,
      hash: json['hash'] as String,
      secret: json['secret'] as String,
    );

Map<String, dynamic> _$EncryptedCredentialsToJson(
        EncryptedCredentials instance) =>
    <String, dynamic>{
      'data': instance.data,
      'hash': instance.hash,
      'secret': instance.secret,
    };

EncryptedPassportElement _$EncryptedPassportElementFromJson(
        Map<String, dynamic> json) =>
    EncryptedPassportElement(
      type: json['type'] as String,
      data: json['data'] as String?,
      phoneNumber: json['phone_number'] as String?,
      email: json['email'] as String?,
      files: (json['files'] as List<dynamic>?)
          ?.map((e) => PassportFile.fromJson(e as Map<String, dynamic>))
          .toList(),
      frontSide: json['front_side'] == null
          ? null
          : PassportFile.fromJson(json['front_side'] as Map<String, dynamic>),
      reverseSide: json['reverse_side'] == null
          ? null
          : PassportFile.fromJson(json['reverse_side'] as Map<String, dynamic>),
      selfie: json['selfie'] == null
          ? null
          : PassportFile.fromJson(json['selfie'] as Map<String, dynamic>),
      translation: (json['translation'] as List<dynamic>?)
          ?.map((e) => PassportFile.fromJson(e as Map<String, dynamic>))
          .toList(),
      hash: json['hash'] as String,
    );

Map<String, dynamic> _$EncryptedPassportElementToJson(
    EncryptedPassportElement instance) {
  final val = <String, dynamic>{
    'type': instance.type,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('data', instance.data);
  writeNotNull('phone_number', instance.phoneNumber);
  writeNotNull('email', instance.email);
  writeNotNull('files', instance.files?.map((e) => e.toJson()).toList());
  writeNotNull('front_side', instance.frontSide?.toJson());
  writeNotNull('reverse_side', instance.reverseSide?.toJson());
  writeNotNull('selfie', instance.selfie?.toJson());
  writeNotNull(
      'translation', instance.translation?.map((e) => e.toJson()).toList());
  val['hash'] = instance.hash;
  return val;
}

File _$FileFromJson(Map<String, dynamic> json) => File(
      fileId: json['file_id'] as String,
      fileUniqueId: json['file_unique_id'] as String,
      fileSize: json['file_size'] as int?,
      filePath: json['file_path'] as String?,
    );

Map<String, dynamic> _$FileToJson(File instance) {
  final val = <String, dynamic>{
    'file_id': instance.fileId,
    'file_unique_id': instance.fileUniqueId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('file_size', instance.fileSize);
  writeNotNull('file_path', instance.filePath);
  return val;
}

ForceReply _$ForceReplyFromJson(Map<String, dynamic> json) => ForceReply(
      forceReply: json['force_reply'] as bool,
      inputFieldPlaceholder: json['input_field_placeholder'] as String?,
      selective: json['selective'] as bool?,
    );

Map<String, dynamic> _$ForceReplyToJson(ForceReply instance) {
  final val = <String, dynamic>{
    'force_reply': instance.forceReply,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('input_field_placeholder', instance.inputFieldPlaceholder);
  writeNotNull('selective', instance.selective);
  return val;
}

ForumTopicClosed _$ForumTopicClosedFromJson(Map<String, dynamic> json) =>
    ForumTopicClosed();

Map<String, dynamic> _$ForumTopicClosedToJson(ForumTopicClosed instance) =>
    <String, dynamic>{};

ForumTopicCreated _$ForumTopicCreatedFromJson(Map<String, dynamic> json) =>
    ForumTopicCreated(
      name: json['name'] as String,
      iconColor: json['icon_color'] as int,
      iconCustomEmojiId: json['icon_custom_emoji_id'] as String?,
    );

Map<String, dynamic> _$ForumTopicCreatedToJson(ForumTopicCreated instance) {
  final val = <String, dynamic>{
    'name': instance.name,
    'icon_color': instance.iconColor,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('icon_custom_emoji_id', instance.iconCustomEmojiId);
  return val;
}

ForumTopicEdited _$ForumTopicEditedFromJson(Map<String, dynamic> json) =>
    ForumTopicEdited(
      name: json['name'] as String?,
      iconCustomEmojiId: json['icon_custom_emoji_id'] as String?,
    );

Map<String, dynamic> _$ForumTopicEditedToJson(ForumTopicEdited instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('icon_custom_emoji_id', instance.iconCustomEmojiId);
  return val;
}

ForumTopicReopened _$ForumTopicReopenedFromJson(Map<String, dynamic> json) =>
    ForumTopicReopened();

Map<String, dynamic> _$ForumTopicReopenedToJson(ForumTopicReopened instance) =>
    <String, dynamic>{};

ForumTopic _$ForumTopicFromJson(Map<String, dynamic> json) => ForumTopic(
      messageThreadId: json['message_thread_id'] as String,
      name: json['name'] as String,
      iconColor: json['icon_color'] as int,
      iconCustomEmojiId: json['icon_custom_emoji_id'] as String?,
    );

Map<String, dynamic> _$ForumTopicToJson(ForumTopic instance) {
  final val = <String, dynamic>{
    'message_thread_id': instance.messageThreadId,
    'name': instance.name,
    'icon_color': instance.iconColor,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('icon_custom_emoji_id', instance.iconCustomEmojiId);
  return val;
}

GameHighScore _$GameHighScoreFromJson(Map<String, dynamic> json) =>
    GameHighScore(
      position: json['position'] as int,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      score: json['score'] as int,
    );

Map<String, dynamic> _$GameHighScoreToJson(GameHighScore instance) =>
    <String, dynamic>{
      'position': instance.position,
      'user': instance.user.toJson(),
      'score': instance.score,
    };

Game _$GameFromJson(Map<String, dynamic> json) => Game(
      title: json['title'] as String,
      description: json['description'] as String,
      photo: (json['photo'] as List<dynamic>)
          .map((e) => PhotoSize.fromJson(e as Map<String, dynamic>))
          .toList(),
      text: json['text'] as String?,
      textEntities: (json['text_entities'] as List<dynamic>?)
          ?.map((e) => MessageEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      animation: json['animation'] == null
          ? null
          : Animation.fromJson(json['animation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GameToJson(Game instance) {
  final val = <String, dynamic>{
    'title': instance.title,
    'description': instance.description,
    'photo': instance.photo.map((e) => e.toJson()).toList(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('text', instance.text);
  writeNotNull(
      'text_entities', instance.textEntities?.map((e) => e.toJson()).toList());
  writeNotNull('animation', instance.animation?.toJson());
  return val;
}

GeneralForumTopicHidden _$GeneralForumTopicHiddenFromJson(
        Map<String, dynamic> json) =>
    GeneralForumTopicHidden();

Map<String, dynamic> _$GeneralForumTopicHiddenToJson(
        GeneralForumTopicHidden instance) =>
    <String, dynamic>{};

GeneralForumTopicUnhidden _$GeneralForumTopicUnhiddenFromJson(
        Map<String, dynamic> json) =>
    GeneralForumTopicUnhidden();

Map<String, dynamic> _$GeneralForumTopicUnhiddenToJson(
        GeneralForumTopicUnhidden instance) =>
    <String, dynamic>{};

InlineKeyboardButton _$InlineKeyboardButtonFromJson(
        Map<String, dynamic> json) =>
    InlineKeyboardButton(
      text: json['text'] as String,
      url: json['url'] as String?,
      callbackData: json['callback_data'] as String?,
      webApp: json['web_app'] == null
          ? null
          : WebAppInfo.fromJson(json['web_app'] as Map<String, dynamic>),
      loginUrl: json['login_url'] == null
          ? null
          : LoginUrl.fromJson(json['login_url'] as Map<String, dynamic>),
      switchInlineQuery: json['switch_inline_query'] as String?,
      switchInlineQueryCurrentChat:
          json['switch_inline_query_current_chat'] as String?,
      callbackGame: json['callback_game'] == null
          ? null
          : CallbackGame.fromJson(
              json['callback_game'] as Map<String, dynamic>),
      pay: json['pay'] as bool?,
    );

Map<String, dynamic> _$InlineKeyboardButtonToJson(
    InlineKeyboardButton instance) {
  final val = <String, dynamic>{
    'text': instance.text,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('url', instance.url);
  writeNotNull('callback_data', instance.callbackData);
  writeNotNull('web_app', instance.webApp?.toJson());
  writeNotNull('login_url', instance.loginUrl?.toJson());
  writeNotNull('switch_inline_query', instance.switchInlineQuery);
  writeNotNull('switch_inline_query_current_chat',
      instance.switchInlineQueryCurrentChat);
  writeNotNull('callback_game', instance.callbackGame?.toJson());
  writeNotNull('pay', instance.pay);
  return val;
}

InlineKeyboardMarkup _$InlineKeyboardMarkupFromJson(
        Map<String, dynamic> json) =>
    InlineKeyboardMarkup(
      inlineKeyboard: (json['inline_keyboard'] as List<dynamic>)
          .map((e) => (e as List<dynamic>)
              .map((e) =>
                  InlineKeyboardButton.fromJson(e as Map<String, dynamic>))
              .toList())
          .toList(),
    );

Map<String, dynamic> _$InlineKeyboardMarkupToJson(
        InlineKeyboardMarkup instance) =>
    <String, dynamic>{
      'inline_keyboard': instance.inlineKeyboard
          .map((e) => e.map((e) => e.toJson()).toList())
          .toList(),
    };

InlineQueryResultArticle _$InlineQueryResultArticleFromJson(
        Map<String, dynamic> json) =>
    InlineQueryResultArticle(
      id: json['id'] as String,
      type: json['type'] as String? ?? InlineQueryResult.typeArticle,
      title: json['title'] as String,
      inputMessageContent: InputMessageContent.fromJson(
          json['input_message_content'] as Map<String, dynamic>),
      replyMarkup: json['reply_markup'] == null
          ? null
          : InlineKeyboardMarkup.fromJson(
              json['reply_markup'] as Map<String, dynamic>),
      url: json['url'] as String?,
      hideUrl: json['hide_url'] as bool?,
      description: json['description'] as String?,
      thumbUrl: json['thumb_url'] as String?,
      thumbWidth: json['thumb_width'] as String?,
      thumbHeight: json['thumb_height'] as String?,
    );

Map<String, dynamic> _$InlineQueryResultArticleToJson(
    InlineQueryResultArticle instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'type': instance.type,
    'title': instance.title,
    'input_message_content': instance.inputMessageContent.toJson(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('reply_markup', instance.replyMarkup?.toJson());
  writeNotNull('url', instance.url);
  writeNotNull('hide_url', instance.hideUrl);
  writeNotNull('description', instance.description);
  writeNotNull('thumb_url', instance.thumbUrl);
  writeNotNull('thumb_width', instance.thumbWidth);
  writeNotNull('thumb_height', instance.thumbHeight);
  return val;
}

InlineQueryResultAudio _$InlineQueryResultAudioFromJson(
        Map<String, dynamic> json) =>
    InlineQueryResultAudio(
      id: json['id'] as String,
      type: json['type'] as String? ?? InlineQueryResult.typeAudio,
      audioUrl: json['audio_url'] as String,
      title: json['title'] as String,
      caption: json['caption'] as String?,
      parseMode: json['parse_mode'] as String?,
      performer: json['performer'] as String?,
      audioDuration: json['audio_duration'] as int?,
      captionEntities: (json['caption_entities'] as List<dynamic>?)
          ?.map((e) => MessageEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      replyMarkup: json['reply_markup'] == null
          ? null
          : InlineKeyboardMarkup.fromJson(
              json['reply_markup'] as Map<String, dynamic>),
      inputMessageContent: json['input_message_content'] == null
          ? null
          : InputMessageContent.fromJson(
              json['input_message_content'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InlineQueryResultAudioToJson(
    InlineQueryResultAudio instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'type': instance.type,
    'audio_url': instance.audioUrl,
    'title': instance.title,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('caption', instance.caption);
  writeNotNull('parse_mode', instance.parseMode);
  writeNotNull('performer', instance.performer);
  writeNotNull('audio_duration', instance.audioDuration);
  writeNotNull('caption_entities',
      instance.captionEntities?.map((e) => e.toJson()).toList());
  writeNotNull('reply_markup', instance.replyMarkup?.toJson());
  writeNotNull('input_message_content', instance.inputMessageContent?.toJson());
  return val;
}

InlineQueryResultCachedAudio _$InlineQueryResultCachedAudioFromJson(
        Map<String, dynamic> json) =>
    InlineQueryResultCachedAudio(
      id: json['id'] as String,
      type: json['type'] as String? ?? InlineQueryResult.typeAudio,
      audioFileId: json['audio_file_id'] as String,
      caption: json['caption'] as String?,
      parseMode: json['parse_mode'] as String?,
      captionEntities: (json['caption_entities'] as List<dynamic>?)
          ?.map((e) => MessageEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      replyMarkup: json['reply_markup'] == null
          ? null
          : InlineKeyboardMarkup.fromJson(
              json['reply_markup'] as Map<String, dynamic>),
      inputMessageContent: json['input_message_content'] == null
          ? null
          : InputMessageContent.fromJson(
              json['input_message_content'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InlineQueryResultCachedAudioToJson(
    InlineQueryResultCachedAudio instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'type': instance.type,
    'audio_file_id': instance.audioFileId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('caption', instance.caption);
  writeNotNull('parse_mode', instance.parseMode);
  writeNotNull('caption_entities',
      instance.captionEntities?.map((e) => e.toJson()).toList());
  writeNotNull('reply_markup', instance.replyMarkup?.toJson());
  writeNotNull('input_message_content', instance.inputMessageContent?.toJson());
  return val;
}

InlineQueryResultCachedDocument _$InlineQueryResultCachedDocumentFromJson(
        Map<String, dynamic> json) =>
    InlineQueryResultCachedDocument(
      id: json['id'] as String,
      type: json['type'] as String? ?? InlineQueryResult.typeDocument,
      title: json['title'] as String,
      documentFileId: json['document_file_id'] as String,
      description: json['description'] as String?,
      caption: json['caption'] as String?,
      parseMode: json['parse_mode'] as String?,
      captionEntities: (json['caption_entities'] as List<dynamic>?)
          ?.map((e) => MessageEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      replyMarkup: json['reply_markup'] == null
          ? null
          : InlineKeyboardMarkup.fromJson(
              json['reply_markup'] as Map<String, dynamic>),
      inputMessageContent: json['input_message_content'] == null
          ? null
          : InputMessageContent.fromJson(
              json['input_message_content'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InlineQueryResultCachedDocumentToJson(
    InlineQueryResultCachedDocument instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'type': instance.type,
    'title': instance.title,
    'document_file_id': instance.documentFileId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('description', instance.description);
  writeNotNull('caption', instance.caption);
  writeNotNull('parse_mode', instance.parseMode);
  writeNotNull('caption_entities',
      instance.captionEntities?.map((e) => e.toJson()).toList());
  writeNotNull('reply_markup', instance.replyMarkup?.toJson());
  writeNotNull('input_message_content', instance.inputMessageContent?.toJson());
  return val;
}

InlineQueryResultCachedGif _$InlineQueryResultCachedGifFromJson(
        Map<String, dynamic> json) =>
    InlineQueryResultCachedGif(
      id: json['id'] as String,
      type: json['type'] as String? ?? InlineQueryResult.typeGif,
      gifFileId: json['gif_file_id'] as String,
      title: json['title'] as String?,
      caption: json['caption'] as String?,
      parseMode: json['parse_mode'] as String?,
      captionEntities: (json['caption_entities'] as List<dynamic>?)
          ?.map((e) => MessageEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      replyMarkup: json['reply_markup'] == null
          ? null
          : InlineKeyboardMarkup.fromJson(
              json['reply_markup'] as Map<String, dynamic>),
      inputMessageContent: json['input_message_content'] == null
          ? null
          : InputMessageContent.fromJson(
              json['input_message_content'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InlineQueryResultCachedGifToJson(
    InlineQueryResultCachedGif instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'type': instance.type,
    'gif_file_id': instance.gifFileId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('title', instance.title);
  writeNotNull('caption', instance.caption);
  writeNotNull('parse_mode', instance.parseMode);
  writeNotNull('caption_entities',
      instance.captionEntities?.map((e) => e.toJson()).toList());
  writeNotNull('reply_markup', instance.replyMarkup?.toJson());
  writeNotNull('input_message_content', instance.inputMessageContent?.toJson());
  return val;
}

InlineQueryResultCachedMpeg4Gif _$InlineQueryResultCachedMpeg4GifFromJson(
        Map<String, dynamic> json) =>
    InlineQueryResultCachedMpeg4Gif(
      id: json['id'] as String,
      type: json['type'] as String? ?? InlineQueryResult.typeMpeg4Gif,
      mpeg4FileId: json['mpeg4_file_id'] as String,
      title: json['title'] as String?,
      caption: json['caption'] as String?,
      parseMode: json['parse_mode'] as String?,
      captionEntities: (json['caption_entities'] as List<dynamic>?)
          ?.map((e) => MessageEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      replyMarkup: json['reply_markup'] == null
          ? null
          : InlineKeyboardMarkup.fromJson(
              json['reply_markup'] as Map<String, dynamic>),
      inputMessageContent: json['input_message_content'] == null
          ? null
          : InputMessageContent.fromJson(
              json['input_message_content'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InlineQueryResultCachedMpeg4GifToJson(
    InlineQueryResultCachedMpeg4Gif instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'type': instance.type,
    'mpeg4_file_id': instance.mpeg4FileId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('title', instance.title);
  writeNotNull('caption', instance.caption);
  writeNotNull('parse_mode', instance.parseMode);
  writeNotNull('caption_entities',
      instance.captionEntities?.map((e) => e.toJson()).toList());
  writeNotNull('reply_markup', instance.replyMarkup?.toJson());
  writeNotNull('input_message_content', instance.inputMessageContent?.toJson());
  return val;
}

InlineQueryResultCachedPhoto _$InlineQueryResultCachedPhotoFromJson(
        Map<String, dynamic> json) =>
    InlineQueryResultCachedPhoto(
      id: json['id'] as String,
      type: json['type'] as String? ?? InlineQueryResult.typePhoto,
      photoFileId: json['photo_file_id'] as String,
      title: json['title'] as String?,
      description: json['description'] as String?,
      caption: json['caption'] as String?,
      parseMode: json['parse_mode'] as String?,
      captionEntities: (json['caption_entities'] as List<dynamic>?)
          ?.map((e) => MessageEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      replyMarkup: json['reply_markup'] == null
          ? null
          : InlineKeyboardMarkup.fromJson(
              json['reply_markup'] as Map<String, dynamic>),
      inputMessageContent: json['input_message_content'] == null
          ? null
          : InputMessageContent.fromJson(
              json['input_message_content'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InlineQueryResultCachedPhotoToJson(
    InlineQueryResultCachedPhoto instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'type': instance.type,
    'photo_file_id': instance.photoFileId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('title', instance.title);
  writeNotNull('description', instance.description);
  writeNotNull('caption', instance.caption);
  writeNotNull('parse_mode', instance.parseMode);
  writeNotNull('caption_entities',
      instance.captionEntities?.map((e) => e.toJson()).toList());
  writeNotNull('reply_markup', instance.replyMarkup?.toJson());
  writeNotNull('input_message_content', instance.inputMessageContent?.toJson());
  return val;
}

InlineQueryResultCachedSticker _$InlineQueryResultCachedStickerFromJson(
        Map<String, dynamic> json) =>
    InlineQueryResultCachedSticker(
      id: json['id'] as String,
      type: json['type'] as String? ?? InlineQueryResult.typeSticker,
      stickerFileId: json['sticker_file_id'] as String?,
      replyMarkup: json['reply_markup'] == null
          ? null
          : InlineKeyboardMarkup.fromJson(
              json['reply_markup'] as Map<String, dynamic>),
      inputMessageContent: json['input_message_content'] == null
          ? null
          : InputMessageContent.fromJson(
              json['input_message_content'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InlineQueryResultCachedStickerToJson(
    InlineQueryResultCachedSticker instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'type': instance.type,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('sticker_file_id', instance.stickerFileId);
  writeNotNull('reply_markup', instance.replyMarkup?.toJson());
  writeNotNull('input_message_content', instance.inputMessageContent?.toJson());
  return val;
}

InlineQueryResultCachedVideo _$InlineQueryResultCachedVideoFromJson(
        Map<String, dynamic> json) =>
    InlineQueryResultCachedVideo(
      id: json['id'] as String,
      type: json['type'] as String? ?? InlineQueryResult.typeVideo,
      videoFileId: json['video_file_id'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
      caption: json['caption'] as String?,
      parseMode: json['parse_mode'] as String?,
      captionEntities: (json['caption_entities'] as List<dynamic>?)
          ?.map((e) => MessageEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      replyMarkup: json['reply_markup'] == null
          ? null
          : InlineKeyboardMarkup.fromJson(
              json['reply_markup'] as Map<String, dynamic>),
      inputMessageContent: json['input_message_content'] == null
          ? null
          : InputMessageContent.fromJson(
              json['input_message_content'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InlineQueryResultCachedVideoToJson(
    InlineQueryResultCachedVideo instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'type': instance.type,
    'video_file_id': instance.videoFileId,
    'title': instance.title,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('description', instance.description);
  writeNotNull('caption', instance.caption);
  writeNotNull('parse_mode', instance.parseMode);
  writeNotNull('caption_entities',
      instance.captionEntities?.map((e) => e.toJson()).toList());
  writeNotNull('reply_markup', instance.replyMarkup?.toJson());
  writeNotNull('input_message_content', instance.inputMessageContent?.toJson());
  return val;
}

InlineQueryResultCachedVoice _$InlineQueryResultCachedVoiceFromJson(
        Map<String, dynamic> json) =>
    InlineQueryResultCachedVoice(
      id: json['id'] as String,
      type: json['type'] as String? ?? InlineQueryResult.typeVoice,
      voiceFileId: json['voice_file_id'] as String,
      title: json['title'] as String,
      caption: json['caption'] as String?,
      parseMode: json['parse_mode'] as String?,
      captionEntities: (json['caption_entities'] as List<dynamic>?)
          ?.map((e) => MessageEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      replyMarkup: json['reply_markup'] == null
          ? null
          : InlineKeyboardMarkup.fromJson(
              json['reply_markup'] as Map<String, dynamic>),
      inputMessageContent: json['input_message_content'] == null
          ? null
          : InputMessageContent.fromJson(
              json['input_message_content'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InlineQueryResultCachedVoiceToJson(
    InlineQueryResultCachedVoice instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'type': instance.type,
    'voice_file_id': instance.voiceFileId,
    'title': instance.title,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('caption', instance.caption);
  writeNotNull('parse_mode', instance.parseMode);
  writeNotNull('caption_entities',
      instance.captionEntities?.map((e) => e.toJson()).toList());
  writeNotNull('reply_markup', instance.replyMarkup?.toJson());
  writeNotNull('input_message_content', instance.inputMessageContent?.toJson());
  return val;
}

InlineQueryResultContact _$InlineQueryResultContactFromJson(
        Map<String, dynamic> json) =>
    InlineQueryResultContact(
      id: json['id'] as String,
      type: json['type'] as String? ?? InlineQueryResult.typeContact,
      phoneNumber: json['phone_number'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String?,
      vcard: json['vcard'] as String?,
      replyMarkup: json['reply_markup'] == null
          ? null
          : InlineKeyboardMarkup.fromJson(
              json['reply_markup'] as Map<String, dynamic>),
      inputMessageContent: json['input_message_content'] == null
          ? null
          : InputMessageContent.fromJson(
              json['input_message_content'] as Map<String, dynamic>),
      thumbUrl: json['thumb_url'] as String?,
      thumbWidth: json['thumb_width'] as int?,
      thumbHeight: json['thumb_height'] as int?,
    );

Map<String, dynamic> _$InlineQueryResultContactToJson(
    InlineQueryResultContact instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'type': instance.type,
    'phone_number': instance.phoneNumber,
    'first_name': instance.firstName,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('last_name', instance.lastName);
  writeNotNull('vcard', instance.vcard);
  writeNotNull('reply_markup', instance.replyMarkup?.toJson());
  writeNotNull('input_message_content', instance.inputMessageContent?.toJson());
  writeNotNull('thumb_url', instance.thumbUrl);
  writeNotNull('thumb_width', instance.thumbWidth);
  writeNotNull('thumb_height', instance.thumbHeight);
  return val;
}

InlineQueryResultDocument _$InlineQueryResultDocumentFromJson(
        Map<String, dynamic> json) =>
    InlineQueryResultDocument(
      id: json['id'] as String,
      type: json['type'] as String? ?? InlineQueryResult.typeDocument,
      title: json['title'] as String,
      caption: json['caption'] as String?,
      parseMode: json['parse_mode'] as String?,
      captionEntities: (json['caption_entities'] as List<dynamic>?)
          ?.map((e) => MessageEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      documentUrl: json['document_url'] as String,
      mimeType: json['mime_type'] as String,
      description: json['description'] as String?,
      replyMarkup: json['reply_markup'] == null
          ? null
          : InlineKeyboardMarkup.fromJson(
              json['reply_markup'] as Map<String, dynamic>),
      inputMessageContent: json['input_message_content'] == null
          ? null
          : InputMessageContent.fromJson(
              json['input_message_content'] as Map<String, dynamic>),
      thumbUrl: json['thumb_url'] as String?,
      thumbWidth: json['thumb_width'] as int?,
      thumbHeight: json['thumb_height'] as int?,
    );

Map<String, dynamic> _$InlineQueryResultDocumentToJson(
    InlineQueryResultDocument instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'type': instance.type,
    'title': instance.title,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('caption', instance.caption);
  writeNotNull('parse_mode', instance.parseMode);
  writeNotNull('caption_entities',
      instance.captionEntities?.map((e) => e.toJson()).toList());
  val['document_url'] = instance.documentUrl;
  val['mime_type'] = instance.mimeType;
  writeNotNull('description', instance.description);
  writeNotNull('reply_markup', instance.replyMarkup?.toJson());
  writeNotNull('input_message_content', instance.inputMessageContent?.toJson());
  writeNotNull('thumb_url', instance.thumbUrl);
  writeNotNull('thumb_width', instance.thumbWidth);
  writeNotNull('thumb_height', instance.thumbHeight);
  return val;
}

InlineQueryResultGame _$InlineQueryResultGameFromJson(
        Map<String, dynamic> json) =>
    InlineQueryResultGame(
      id: json['id'] as String,
      type: json['type'] as String? ?? InlineQueryResult.typeGame,
      gameShortName: json['game_short_name'] as String,
      replyMarkup: json['reply_markup'] == null
          ? null
          : InlineKeyboardMarkup.fromJson(
              json['reply_markup'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InlineQueryResultGameToJson(
    InlineQueryResultGame instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'type': instance.type,
    'game_short_name': instance.gameShortName,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('reply_markup', instance.replyMarkup?.toJson());
  return val;
}

InlineQueryResultGif _$InlineQueryResultGifFromJson(
        Map<String, dynamic> json) =>
    InlineQueryResultGif(
      id: json['id'] as String,
      type: json['type'] as String? ?? InlineQueryResult.typeGif,
      gifUrl: json['gif_url'] as String,
      gifWidth: json['gif_width'] as int?,
      gifHeight: json['gif_height'] as int?,
      gifDuration: json['gif_duration'] as int?,
      thumbUrl: json['thumb_url'] as String,
      thumbMimeType: json['thumb_mime_type'] as String?,
      title: json['title'] as String?,
      caption: json['caption'] as String?,
      parseMode: json['parse_mode'] as String?,
      captionEntities: (json['caption_entities'] as List<dynamic>?)
          ?.map((e) => MessageEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      replyMarkup: json['reply_markup'] == null
          ? null
          : InlineKeyboardMarkup.fromJson(
              json['reply_markup'] as Map<String, dynamic>),
      inputMessageContent: json['input_message_content'] == null
          ? null
          : InputMessageContent.fromJson(
              json['input_message_content'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InlineQueryResultGifToJson(
    InlineQueryResultGif instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'type': instance.type,
    'gif_url': instance.gifUrl,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('gif_width', instance.gifWidth);
  writeNotNull('gif_height', instance.gifHeight);
  writeNotNull('gif_duration', instance.gifDuration);
  val['thumb_url'] = instance.thumbUrl;
  writeNotNull('thumb_mime_type', instance.thumbMimeType);
  writeNotNull('title', instance.title);
  writeNotNull('caption', instance.caption);
  writeNotNull('parse_mode', instance.parseMode);
  writeNotNull('caption_entities',
      instance.captionEntities?.map((e) => e.toJson()).toList());
  writeNotNull('reply_markup', instance.replyMarkup?.toJson());
  writeNotNull('input_message_content', instance.inputMessageContent?.toJson());
  return val;
}

InlineQueryResultLocation _$InlineQueryResultLocationFromJson(
        Map<String, dynamic> json) =>
    InlineQueryResultLocation(
      id: json['id'] as String,
      type: json['type'] as String? ?? InlineQueryResult.typeLocation,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      title: json['title'] as String,
      horizontalAccuracy: (json['horizontal_accuracy'] as num?)?.toDouble(),
      livePeriod: json['live_period'] as int?,
      heading: json['heading'] as int?,
      proximityAlertRadius: json['proximity_alert_radius'] as int?,
      replyMarkup: json['reply_markup'] == null
          ? null
          : InlineKeyboardMarkup.fromJson(
              json['reply_markup'] as Map<String, dynamic>),
      inputMessageContent: json['input_message_content'] == null
          ? null
          : InputMessageContent.fromJson(
              json['input_message_content'] as Map<String, dynamic>),
      thumbUrl: json['thumb_url'] as String?,
      thumbWidth: json['thumb_width'] as int?,
      thumbHeight: json['thumb_height'] as int?,
    );

Map<String, dynamic> _$InlineQueryResultLocationToJson(
    InlineQueryResultLocation instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'type': instance.type,
    'latitude': instance.latitude,
    'longitude': instance.longitude,
    'title': instance.title,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('horizontal_accuracy', instance.horizontalAccuracy);
  writeNotNull('live_period', instance.livePeriod);
  writeNotNull('heading', instance.heading);
  writeNotNull('proximity_alert_radius', instance.proximityAlertRadius);
  writeNotNull('reply_markup', instance.replyMarkup?.toJson());
  writeNotNull('input_message_content', instance.inputMessageContent?.toJson());
  writeNotNull('thumb_url', instance.thumbUrl);
  writeNotNull('thumb_width', instance.thumbWidth);
  writeNotNull('thumb_height', instance.thumbHeight);
  return val;
}

InlineQueryResultMpeg4Gif _$InlineQueryResultMpeg4GifFromJson(
        Map<String, dynamic> json) =>
    InlineQueryResultMpeg4Gif(
      id: json['id'] as String,
      type: json['type'] as String? ?? InlineQueryResult.typeMpeg4Gif,
      mpeg4Url: json['mpeg4_url'] as String,
      mpeg4Width: json['mpeg4_width'] as int?,
      mpeg4Height: json['mpeg4_height'] as int?,
      mpeg4Duration: json['mpeg4_duration'] as int?,
      thumbUrl: json['thumb_url'] as String,
      thumbMimeType: json['thumb_mime_type'] as String?,
      title: json['title'] as String?,
      caption: json['caption'] as String?,
      parseMode: json['parse_mode'] as String?,
      captionEntities: (json['caption_entities'] as List<dynamic>?)
          ?.map((e) => MessageEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      replyMarkup: json['reply_markup'] == null
          ? null
          : InlineKeyboardMarkup.fromJson(
              json['reply_markup'] as Map<String, dynamic>),
      inputMessageContent: json['input_message_content'] == null
          ? null
          : InputMessageContent.fromJson(
              json['input_message_content'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InlineQueryResultMpeg4GifToJson(
    InlineQueryResultMpeg4Gif instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'type': instance.type,
    'mpeg4_url': instance.mpeg4Url,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('mpeg4_width', instance.mpeg4Width);
  writeNotNull('mpeg4_height', instance.mpeg4Height);
  writeNotNull('mpeg4_duration', instance.mpeg4Duration);
  val['thumb_url'] = instance.thumbUrl;
  writeNotNull('thumb_mime_type', instance.thumbMimeType);
  writeNotNull('title', instance.title);
  writeNotNull('caption', instance.caption);
  writeNotNull('parse_mode', instance.parseMode);
  writeNotNull('caption_entities',
      instance.captionEntities?.map((e) => e.toJson()).toList());
  writeNotNull('reply_markup', instance.replyMarkup?.toJson());
  writeNotNull('input_message_content', instance.inputMessageContent?.toJson());
  return val;
}

InlineQueryResultPhoto _$InlineQueryResultPhotoFromJson(
        Map<String, dynamic> json) =>
    InlineQueryResultPhoto(
      id: json['id'] as String,
      type: json['type'] as String? ?? InlineQueryResult.typePhoto,
      photoUrl: json['photo_url'] as String,
      thumbUrl: json['thumb_url'] as String,
      photoWidth: json['photo_width'] as int?,
      photoHeight: json['photo_height'] as int?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      caption: json['caption'] as String?,
      parseMode: json['parse_mode'] as String?,
      captionEntities: (json['caption_entities'] as List<dynamic>?)
          ?.map((e) => MessageEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      replyMarkup: json['reply_markup'] == null
          ? null
          : InlineKeyboardMarkup.fromJson(
              json['reply_markup'] as Map<String, dynamic>),
      inputMessageContent: json['input_message_content'] == null
          ? null
          : InputMessageContent.fromJson(
              json['input_message_content'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InlineQueryResultPhotoToJson(
    InlineQueryResultPhoto instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'type': instance.type,
    'photo_url': instance.photoUrl,
    'thumb_url': instance.thumbUrl,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('photo_width', instance.photoWidth);
  writeNotNull('photo_height', instance.photoHeight);
  writeNotNull('title', instance.title);
  writeNotNull('description', instance.description);
  writeNotNull('caption', instance.caption);
  writeNotNull('parse_mode', instance.parseMode);
  writeNotNull('caption_entities',
      instance.captionEntities?.map((e) => e.toJson()).toList());
  writeNotNull('reply_markup', instance.replyMarkup?.toJson());
  writeNotNull('input_message_content', instance.inputMessageContent?.toJson());
  return val;
}

InlineQueryResultVenue _$InlineQueryResultVenueFromJson(
        Map<String, dynamic> json) =>
    InlineQueryResultVenue(
      id: json['id'] as String,
      type: json['type'] as String? ?? InlineQueryResult.typeVenue,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      title: json['title'] as String,
      address: json['address'] as String,
      foursquareId: json['foursquare_id'] as String?,
      foursquareType: json['foursquare_type'] as String?,
      googlePlaceId: json['google_place_id'] as String?,
      googlePlaceType: json['google_place_type'] as String?,
      replyMarkup: json['reply_markup'] == null
          ? null
          : InlineKeyboardMarkup.fromJson(
              json['reply_markup'] as Map<String, dynamic>),
      inputMessageContent: json['input_message_content'] == null
          ? null
          : InputMessageContent.fromJson(
              json['input_message_content'] as Map<String, dynamic>),
      thumbUrl: json['thumb_url'] as String?,
      thumbWidth: json['thumb_width'] as int?,
      thumbHeight: json['thumb_height'] as int?,
    );

Map<String, dynamic> _$InlineQueryResultVenueToJson(
    InlineQueryResultVenue instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'type': instance.type,
    'latitude': instance.latitude,
    'longitude': instance.longitude,
    'title': instance.title,
    'address': instance.address,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('foursquare_id', instance.foursquareId);
  writeNotNull('foursquare_type', instance.foursquareType);
  writeNotNull('google_place_id', instance.googlePlaceId);
  writeNotNull('google_place_type', instance.googlePlaceType);
  writeNotNull('reply_markup', instance.replyMarkup?.toJson());
  writeNotNull('input_message_content', instance.inputMessageContent?.toJson());
  writeNotNull('thumb_url', instance.thumbUrl);
  writeNotNull('thumb_width', instance.thumbWidth);
  writeNotNull('thumb_height', instance.thumbHeight);
  return val;
}

InlineQueryResultVideo _$InlineQueryResultVideoFromJson(
        Map<String, dynamic> json) =>
    InlineQueryResultVideo(
      id: json['id'] as String,
      type: json['type'] as String? ?? InlineQueryResult.typeVideo,
      videoUrl: json['video_url'] as String,
      mimeType: json['mime_type'] as String,
      thumbUrl: json['thumb_url'] as String,
      title: json['title'] as String,
      caption: json['caption'] as String?,
      parseMode: json['parse_mode'] as String?,
      videoWidth: json['video_width'] as int?,
      videoHeight: json['video_height'] as int?,
      videoDuration: json['video_duration'] as int?,
      description: json['description'] as String?,
      captionEntities: (json['caption_entities'] as List<dynamic>?)
          ?.map((e) => MessageEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      replyMarkup: json['reply_markup'] == null
          ? null
          : InlineKeyboardMarkup.fromJson(
              json['reply_markup'] as Map<String, dynamic>),
      inputMessageContent: json['input_message_content'] == null
          ? null
          : InputMessageContent.fromJson(
              json['input_message_content'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InlineQueryResultVideoToJson(
    InlineQueryResultVideo instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'type': instance.type,
    'video_url': instance.videoUrl,
    'mime_type': instance.mimeType,
    'thumb_url': instance.thumbUrl,
    'title': instance.title,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('caption', instance.caption);
  writeNotNull('parse_mode', instance.parseMode);
  writeNotNull('video_width', instance.videoWidth);
  writeNotNull('video_height', instance.videoHeight);
  writeNotNull('video_duration', instance.videoDuration);
  writeNotNull('description', instance.description);
  writeNotNull('caption_entities',
      instance.captionEntities?.map((e) => e.toJson()).toList());
  writeNotNull('reply_markup', instance.replyMarkup?.toJson());
  writeNotNull('input_message_content', instance.inputMessageContent?.toJson());
  return val;
}

InlineQueryResultVoice _$InlineQueryResultVoiceFromJson(
        Map<String, dynamic> json) =>
    InlineQueryResultVoice(
      id: json['id'] as String,
      type: json['type'] as String? ?? InlineQueryResult.typeVoice,
      voiceUrl: json['voice_url'] as String,
      title: json['title'] as String,
      caption: json['caption'] as String?,
      parseMode: json['parse_mode'] as String?,
      voiceDuration: json['voice_duration'] as int?,
      captionEntities: (json['caption_entities'] as List<dynamic>?)
          ?.map((e) => MessageEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      replyMarkup: json['reply_markup'] == null
          ? null
          : InlineKeyboardMarkup.fromJson(
              json['reply_markup'] as Map<String, dynamic>),
      inputMessageContent: json['input_message_content'] == null
          ? null
          : InputMessageContent.fromJson(
              json['input_message_content'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InlineQueryResultVoiceToJson(
    InlineQueryResultVoice instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'type': instance.type,
    'voice_url': instance.voiceUrl,
    'title': instance.title,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('caption', instance.caption);
  writeNotNull('parse_mode', instance.parseMode);
  writeNotNull('voice_duration', instance.voiceDuration);
  writeNotNull('caption_entities',
      instance.captionEntities?.map((e) => e.toJson()).toList());
  writeNotNull('reply_markup', instance.replyMarkup?.toJson());
  writeNotNull('input_message_content', instance.inputMessageContent?.toJson());
  return val;
}

InlineQueryResult _$InlineQueryResultFromJson(Map<String, dynamic> json) =>
    InlineQueryResult(
      type: json['type'] as String,
      id: json['id'] as String,
      replyMarkup: json['reply_markup'] == null
          ? null
          : InlineKeyboardMarkup.fromJson(
              json['reply_markup'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InlineQueryResultToJson(InlineQueryResult instance) {
  final val = <String, dynamic>{
    'type': instance.type,
    'id': instance.id,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('reply_markup', instance.replyMarkup?.toJson());
  return val;
}

InlineQuery _$InlineQueryFromJson(Map<String, dynamic> json) => InlineQuery(
      id: json['id'] as String,
      from: User.fromJson(json['from'] as Map<String, dynamic>),
      query: json['query'] as String,
      offset: json['offset'] as String,
      chatType: json['chat_type'] as String?,
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InlineQueryToJson(InlineQuery instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'from': instance.from.toJson(),
    'query': instance.query,
    'offset': instance.offset,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('chat_type', instance.chatType);
  writeNotNull('location', instance.location?.toJson());
  return val;
}

InputContactMessageContent _$InputContactMessageContentFromJson(
        Map<String, dynamic> json) =>
    InputContactMessageContent(
      phoneNumber: json['phone_number'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String?,
      vcard: json['vcard'] as String?,
    );

Map<String, dynamic> _$InputContactMessageContentToJson(
    InputContactMessageContent instance) {
  final val = <String, dynamic>{
    'phone_number': instance.phoneNumber,
    'first_name': instance.firstName,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('last_name', instance.lastName);
  writeNotNull('vcard', instance.vcard);
  return val;
}

InputInvoiceMessageContent _$InputInvoiceMessageContentFromJson(
        Map<String, dynamic> json) =>
    InputInvoiceMessageContent(
      title: json['title'] as String,
      description: json['description'] as String,
      payload: json['payload'] as String,
      providerToken: json['provider_token'] as String,
      currency: json['currency'] as String,
      prices: (json['prices'] as List<dynamic>)
          .map((e) => LabeledPrice.fromJson(e as Map<String, dynamic>))
          .toList(),
      maxTipAmount: json['max_tip_amount'] as int?,
      suggestedTipAmounts: (json['suggested_tip_amounts'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
      providerData: json['provider_data'] as String?,
      photoSize: json['photo_size'] as int?,
      photoWidth: json['photo_width'] as int?,
      photoHeight: json['photo_height'] as int?,
      needName: json['need_name'] as bool?,
      needPhoneNumber: json['need_phone_number'] as bool?,
      needEmail: json['need_email'] as bool?,
      needShippingAddress: json['need_shipping_address'] as bool?,
      sendPhoneNumberToProvider: json['send_phone_number_to_provider'] as bool?,
      sendEmailToProvider: json['send_email_to_provider'] as bool?,
      isFlexible: json['is_flexible'] as bool?,
    )..photoUrl = json['photo_url'] as String?;

Map<String, dynamic> _$InputInvoiceMessageContentToJson(
    InputInvoiceMessageContent instance) {
  final val = <String, dynamic>{
    'title': instance.title,
    'description': instance.description,
    'payload': instance.payload,
    'provider_token': instance.providerToken,
    'currency': instance.currency,
    'prices': instance.prices.map((e) => e.toJson()).toList(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('max_tip_amount', instance.maxTipAmount);
  writeNotNull('suggested_tip_amounts', instance.suggestedTipAmounts);
  writeNotNull('provider_data', instance.providerData);
  writeNotNull('photo_url', instance.photoUrl);
  writeNotNull('photo_size', instance.photoSize);
  writeNotNull('photo_width', instance.photoWidth);
  writeNotNull('photo_height', instance.photoHeight);
  writeNotNull('need_name', instance.needName);
  writeNotNull('need_phone_number', instance.needPhoneNumber);
  writeNotNull('need_email', instance.needEmail);
  writeNotNull('need_shipping_address', instance.needShippingAddress);
  writeNotNull(
      'send_phone_number_to_provider', instance.sendPhoneNumberToProvider);
  writeNotNull('send_email_to_provider', instance.sendEmailToProvider);
  writeNotNull('is_flexible', instance.isFlexible);
  return val;
}

InputLocationMessageContent _$InputLocationMessageContentFromJson(
        Map<String, dynamic> json) =>
    InputLocationMessageContent(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      horizontalAccuracy: (json['horizontal_accuracy'] as num?)?.toDouble(),
      livePeriod: json['live_period'] as int?,
      heading: json['heading'] as int?,
      proximityAlertRadius: json['proximity_alert_radius'] as int?,
    );

Map<String, dynamic> _$InputLocationMessageContentToJson(
    InputLocationMessageContent instance) {
  final val = <String, dynamic>{
    'latitude': instance.latitude,
    'longitude': instance.longitude,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('horizontal_accuracy', instance.horizontalAccuracy);
  writeNotNull('live_period', instance.livePeriod);
  writeNotNull('heading', instance.heading);
  writeNotNull('proximity_alert_radius', instance.proximityAlertRadius);
  return val;
}

InputMediaAnimation _$InputMediaAnimationFromJson(Map<String, dynamic> json) =>
    InputMediaAnimation(
      type: json['type'] as String? ?? InputMedia.typeAnimation,
      media: json['media'] as String,
      thumb: json['thumb'],
      caption: json['caption'] as String?,
      parseMode: json['parse_mode'] as String?,
      captionEntities: (json['caption_entities'] as List<dynamic>?)
          ?.map((e) => MessageEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      width: json['width'] as int?,
      height: json['height'] as int?,
      duration: json['duration'] as int?,
      hasSpoiler: json['has_spoiler'] as bool?,
    );

Map<String, dynamic> _$InputMediaAnimationToJson(InputMediaAnimation instance) {
  final val = <String, dynamic>{
    'type': instance.type,
    'media': instance.media,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('caption', instance.caption);
  writeNotNull('parse_mode', instance.parseMode);
  writeNotNull('caption_entities',
      instance.captionEntities?.map((e) => e.toJson()).toList());
  writeNotNull('thumb', instance.thumb);
  writeNotNull('width', instance.width);
  writeNotNull('height', instance.height);
  writeNotNull('duration', instance.duration);
  writeNotNull('has_spoiler', instance.hasSpoiler);
  return val;
}

InputMediaAudio _$InputMediaAudioFromJson(Map<String, dynamic> json) =>
    InputMediaAudio(
      type: json['type'] as String? ?? InputMedia.typeAudio,
      media: json['media'] as String,
      thumb: json['thumb'],
      caption: json['caption'] as String?,
      parseMode: json['parse_mode'] as String?,
      captionEntities: (json['caption_entities'] as List<dynamic>?)
          ?.map((e) => MessageEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      duration: json['duration'] as int?,
      performer: json['performer'] as String?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$InputMediaAudioToJson(InputMediaAudio instance) {
  final val = <String, dynamic>{
    'type': instance.type,
    'media': instance.media,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('caption', instance.caption);
  writeNotNull('parse_mode', instance.parseMode);
  writeNotNull('caption_entities',
      instance.captionEntities?.map((e) => e.toJson()).toList());
  writeNotNull('thumb', instance.thumb);
  writeNotNull('duration', instance.duration);
  writeNotNull('performer', instance.performer);
  writeNotNull('title', instance.title);
  return val;
}

InputMediaDocument _$InputMediaDocumentFromJson(Map<String, dynamic> json) =>
    InputMediaDocument(
      type: json['type'] as String? ?? InputMedia.typeDocument,
      media: json['media'] as String,
      thumb: json['thumb'],
      caption: json['caption'] as String?,
      parseMode: json['parse_mode'] as String?,
      captionEntities: (json['caption_entities'] as List<dynamic>?)
          ?.map((e) => MessageEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      disableContentTypeDetection:
          json['disable_content_type_detection'] as bool?,
    );

Map<String, dynamic> _$InputMediaDocumentToJson(InputMediaDocument instance) {
  final val = <String, dynamic>{
    'type': instance.type,
    'media': instance.media,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('caption', instance.caption);
  writeNotNull('parse_mode', instance.parseMode);
  writeNotNull('caption_entities',
      instance.captionEntities?.map((e) => e.toJson()).toList());
  writeNotNull('thumb', instance.thumb);
  writeNotNull(
      'disable_content_type_detection', instance.disableContentTypeDetection);
  return val;
}

InputMediaPhoto _$InputMediaPhotoFromJson(Map<String, dynamic> json) =>
    InputMediaPhoto(
      type: json['type'] as String? ?? InputMedia.typePhoto,
      media: json['media'] as String,
      caption: json['caption'] as String?,
      parseMode: json['parse_mode'] as String?,
      captionEntities: (json['caption_entities'] as List<dynamic>?)
          ?.map((e) => MessageEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      hasSpoiler: json['has_spoiler'] as bool?,
    );

Map<String, dynamic> _$InputMediaPhotoToJson(InputMediaPhoto instance) {
  final val = <String, dynamic>{
    'type': instance.type,
    'media': instance.media,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('caption', instance.caption);
  writeNotNull('parse_mode', instance.parseMode);
  writeNotNull('caption_entities',
      instance.captionEntities?.map((e) => e.toJson()).toList());
  writeNotNull('has_spoiler', instance.hasSpoiler);
  return val;
}

InputMediaVideo _$InputMediaVideoFromJson(Map<String, dynamic> json) =>
    InputMediaVideo(
      type: json['type'] as String? ?? InputMedia.typeVideo,
      media: json['media'] as String,
      caption: json['caption'] as String?,
      parseMode: json['parse_mode'] as String?,
      captionEntities: (json['caption_entities'] as List<dynamic>?)
          ?.map((e) => MessageEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      thumb: json['thumb'],
      width: json['width'] as int?,
      height: json['height'] as int?,
      duration: json['duration'] as int?,
      supportsStreaming: json['supports_streaming'] as bool?,
      hasSpoiler: json['has_spoiler'] as bool?,
    );

Map<String, dynamic> _$InputMediaVideoToJson(InputMediaVideo instance) {
  final val = <String, dynamic>{
    'type': instance.type,
    'media': instance.media,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('caption', instance.caption);
  writeNotNull('parse_mode', instance.parseMode);
  writeNotNull('caption_entities',
      instance.captionEntities?.map((e) => e.toJson()).toList());
  writeNotNull('thumb', instance.thumb);
  writeNotNull('width', instance.width);
  writeNotNull('height', instance.height);
  writeNotNull('duration', instance.duration);
  writeNotNull('supports_streaming', instance.supportsStreaming);
  writeNotNull('has_spoiler', instance.hasSpoiler);
  return val;
}

InputMedia _$InputMediaFromJson(Map<String, dynamic> json) => InputMedia(
      type: json['type'] as String,
      media: json['media'] as String,
      caption: json['caption'] as String?,
      parseMode: json['parse_mode'] as String?,
      captionEntities: (json['caption_entities'] as List<dynamic>?)
          ?.map((e) => MessageEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$InputMediaToJson(InputMedia instance) {
  final val = <String, dynamic>{
    'type': instance.type,
    'media': instance.media,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('caption', instance.caption);
  writeNotNull('parse_mode', instance.parseMode);
  writeNotNull('caption_entities',
      instance.captionEntities?.map((e) => e.toJson()).toList());
  return val;
}

InputMessageContent _$InputMessageContentFromJson(Map<String, dynamic> json) =>
    InputMessageContent();

Map<String, dynamic> _$InputMessageContentToJson(
        InputMessageContent instance) =>
    <String, dynamic>{};

InputTextMessageContent _$InputTextMessageContentFromJson(
        Map<String, dynamic> json) =>
    InputTextMessageContent(
      messageText: json['message_text'] as String,
      parseMode: json['parse_mode'] as String?,
      disableWebPagePreview: json['disable_web_page_preview'] as bool?,
    )..entities = (json['entities'] as List<dynamic>?)
        ?.map((e) => MessageEntity.fromJson(e as Map<String, dynamic>))
        .toList();

Map<String, dynamic> _$InputTextMessageContentToJson(
    InputTextMessageContent instance) {
  final val = <String, dynamic>{
    'message_text': instance.messageText,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('parse_mode', instance.parseMode);
  writeNotNull('entities', instance.entities?.map((e) => e.toJson()).toList());
  writeNotNull('disable_web_page_preview', instance.disableWebPagePreview);
  return val;
}

InputVenueMessageContent _$InputVenueMessageContentFromJson(
        Map<String, dynamic> json) =>
    InputVenueMessageContent(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      title: json['title'] as String,
      address: json['address'] as String,
      foursquareId: json['foursquare_id'] as String?,
      foursquareType: json['foursquare_type'] as String?,
      googlePlaceId: json['google_place_id'] as String?,
      googlePlaceType: json['google_place_type'] as String?,
    );

Map<String, dynamic> _$InputVenueMessageContentToJson(
    InputVenueMessageContent instance) {
  final val = <String, dynamic>{
    'latitude': instance.latitude,
    'longitude': instance.longitude,
    'title': instance.title,
    'address': instance.address,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('foursquare_id', instance.foursquareId);
  writeNotNull('foursquare_type', instance.foursquareType);
  writeNotNull('google_place_id', instance.googlePlaceId);
  writeNotNull('google_place_type', instance.googlePlaceType);
  return val;
}

Invoice _$InvoiceFromJson(Map<String, dynamic> json) => Invoice(
      title: json['title'] as String,
      description: json['description'] as String,
      startParameter: json['start_parameter'] as String,
      currency: json['currency'] as String,
      totalAmount: json['total_amount'] as int,
    );

Map<String, dynamic> _$InvoiceToJson(Invoice instance) => <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'start_parameter': instance.startParameter,
      'currency': instance.currency,
      'total_amount': instance.totalAmount,
    };

KeyboardButtonPollType _$KeyboardButtonPollTypeFromJson(
        Map<String, dynamic> json) =>
    KeyboardButtonPollType(
      type: json['type'] as String?,
    );

Map<String, dynamic> _$KeyboardButtonPollTypeToJson(
    KeyboardButtonPollType instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('type', instance.type);
  return val;
}

KeyboardButtonRequestChat _$KeyboardButtonRequestChatFromJson(
        Map<String, dynamic> json) =>
    KeyboardButtonRequestChat(
      requestId: json['request_id'] as int,
      chatIsChannel: json['chat_is_channel'] as bool,
      charIsForum: json['char_is_forum'] as bool?,
      chatHasUsername: json['chat_has_username'] as bool?,
      chatIsCreated: json['chat_is_created'] as bool?,
      userAdministratorRights: json['user_administrator_rights'] == null
          ? null
          : ChatAdministratorRights.fromJson(
              json['user_administrator_rights'] as Map<String, dynamic>),
      botAdministratorRights: json['bot_administrator_rights'] == null
          ? null
          : ChatAdministratorRights.fromJson(
              json['bot_administrator_rights'] as Map<String, dynamic>),
      botIsMember: json['bot_is_member'] as bool?,
    );

Map<String, dynamic> _$KeyboardButtonRequestChatToJson(
    KeyboardButtonRequestChat instance) {
  final val = <String, dynamic>{
    'request_id': instance.requestId,
    'chat_is_channel': instance.chatIsChannel,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('char_is_forum', instance.charIsForum);
  writeNotNull('chat_has_username', instance.chatHasUsername);
  writeNotNull('chat_is_created', instance.chatIsCreated);
  writeNotNull(
      'user_administrator_rights', instance.userAdministratorRights?.toJson());
  writeNotNull(
      'bot_administrator_rights', instance.botAdministratorRights?.toJson());
  writeNotNull('bot_is_member', instance.botIsMember);
  return val;
}

KeyboardButtonRequestUser _$KeyboardButtonRequestUserFromJson(
        Map<String, dynamic> json) =>
    KeyboardButtonRequestUser(
      requestId: json['request_id'] as int,
      userIsBot: json['user_is_bot'] as bool?,
      userIsPremium: json['user_is_premium'] as bool?,
    );

Map<String, dynamic> _$KeyboardButtonRequestUserToJson(
    KeyboardButtonRequestUser instance) {
  final val = <String, dynamic>{
    'request_id': instance.requestId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('user_is_bot', instance.userIsBot);
  writeNotNull('user_is_premium', instance.userIsPremium);
  return val;
}

KeyboardButton _$KeyboardButtonFromJson(Map<String, dynamic> json) =>
    KeyboardButton(
      text: json['text'] as String,
      requestUser: json['request_user'] == null
          ? null
          : KeyboardButtonRequestUser.fromJson(
              json['request_user'] as Map<String, dynamic>),
      requestContact: json['request_contact'] as bool?,
      requestLocation: json['request_location'] as bool?,
      requestPoll: json['request_poll'] == null
          ? null
          : KeyboardButtonPollType.fromJson(
              json['request_poll'] as Map<String, dynamic>),
      webApp: json['web_app'] == null
          ? null
          : WebAppInfo.fromJson(json['web_app'] as Map<String, dynamic>),
    )..requestChat = json['request_chat'] == null
        ? null
        : KeyboardButtonRequestChat.fromJson(
            json['request_chat'] as Map<String, dynamic>);

Map<String, dynamic> _$KeyboardButtonToJson(KeyboardButton instance) {
  final val = <String, dynamic>{
    'text': instance.text,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('request_user', instance.requestUser?.toJson());
  writeNotNull('request_chat', instance.requestChat?.toJson());
  writeNotNull('request_contact', instance.requestContact);
  writeNotNull('request_location', instance.requestLocation);
  writeNotNull('request_poll', instance.requestPoll?.toJson());
  writeNotNull('web_app', instance.webApp?.toJson());
  return val;
}

LabeledPrice _$LabeledPriceFromJson(Map<String, dynamic> json) => LabeledPrice(
      label: json['label'] as String,
      amount: json['amount'] as int,
    );

Map<String, dynamic> _$LabeledPriceToJson(LabeledPrice instance) =>
    <String, dynamic>{
      'label': instance.label,
      'amount': instance.amount,
    };

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
      longitude: (json['longitude'] as num).toDouble(),
      latitude: (json['latitude'] as num).toDouble(),
      horizontalAccuracy: (json['horizontal_accuracy'] as num?)?.toDouble(),
      livePeriod: json['live_period'] as int?,
      heading: json['heading'] as int?,
      proximityAlertRadius: json['proximity_alert_radius'] as int?,
    );

Map<String, dynamic> _$LocationToJson(Location instance) {
  final val = <String, dynamic>{
    'longitude': instance.longitude,
    'latitude': instance.latitude,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('horizontal_accuracy', instance.horizontalAccuracy);
  writeNotNull('live_period', instance.livePeriod);
  writeNotNull('heading', instance.heading);
  writeNotNull('proximity_alert_radius', instance.proximityAlertRadius);
  return val;
}

LoginUrl _$LoginUrlFromJson(Map<String, dynamic> json) => LoginUrl(
      url: json['url'] as String,
      forwardText: json['forward_text'] as String?,
      botUsername: json['bot_username'] as String?,
      requestWriteAccess: json['request_write_access'] as bool?,
    );

Map<String, dynamic> _$LoginUrlToJson(LoginUrl instance) {
  final val = <String, dynamic>{
    'url': instance.url,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('forward_text', instance.forwardText);
  writeNotNull('bot_username', instance.botUsername);
  writeNotNull('request_write_access', instance.requestWriteAccess);
  return val;
}

MaskPosition _$MaskPositionFromJson(Map<String, dynamic> json) => MaskPosition(
      point: json['point'] as String,
      xShift: (json['x_shift'] as num).toDouble(),
      yShift: (json['y_shift'] as num).toDouble(),
      scale: (json['scale'] as num).toDouble(),
    );

Map<String, dynamic> _$MaskPositionToJson(MaskPosition instance) =>
    <String, dynamic>{
      'point': instance.point,
      'x_shift': instance.xShift,
      'y_shift': instance.yShift,
      'scale': instance.scale,
    };

MenuButtonCommands _$MenuButtonCommandsFromJson(Map<String, dynamic> json) =>
    MenuButtonCommands(
      type: json['type'] as String? ?? MenuButton.typeCommands,
    );

Map<String, dynamic> _$MenuButtonCommandsToJson(MenuButtonCommands instance) =>
    <String, dynamic>{
      'type': instance.type,
    };

MenuButtonDefault _$MenuButtonDefaultFromJson(Map<String, dynamic> json) =>
    MenuButtonDefault(
      type: json['type'] as String? ?? MenuButton.typeDefault,
    );

Map<String, dynamic> _$MenuButtonDefaultToJson(MenuButtonDefault instance) =>
    <String, dynamic>{
      'type': instance.type,
    };

MenuButtonWebApp _$MenuButtonWebAppFromJson(Map<String, dynamic> json) =>
    MenuButtonWebApp(
      type: json['type'] as String? ?? MenuButton.typeWebApp,
      text: json['text'] as String,
      webApp: WebAppInfo.fromJson(json['web_app'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MenuButtonWebAppToJson(MenuButtonWebApp instance) =>
    <String, dynamic>{
      'type': instance.type,
      'text': instance.text,
      'web_app': instance.webApp.toJson(),
    };

MenuButton _$MenuButtonFromJson(Map<String, dynamic> json) => MenuButton(
      type: json['type'] as String,
    );

Map<String, dynamic> _$MenuButtonToJson(MenuButton instance) =>
    <String, dynamic>{
      'type': instance.type,
    };

MessageAutoDeleteTimerChanged _$MessageAutoDeleteTimerChangedFromJson(
        Map<String, dynamic> json) =>
    MessageAutoDeleteTimerChanged(
      messageAutoDeleteTime: json['message_auto_delete_time'] as int,
    );

Map<String, dynamic> _$MessageAutoDeleteTimerChangedToJson(
        MessageAutoDeleteTimerChanged instance) =>
    <String, dynamic>{
      'message_auto_delete_time': instance.messageAutoDeleteTime,
    };

MessageEntity _$MessageEntityFromJson(Map<String, dynamic> json) =>
    MessageEntity(
      type: json['type'] as String,
      offset: json['offset'] as int,
      length: json['length'] as int,
      url: json['url'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      language: json['language'] as String?,
      customEmojiId: json['custom_emoji_id'] as String?,
    );

Map<String, dynamic> _$MessageEntityToJson(MessageEntity instance) {
  final val = <String, dynamic>{
    'type': instance.type,
    'offset': instance.offset,
    'length': instance.length,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('url', instance.url);
  writeNotNull('user', instance.user?.toJson());
  writeNotNull('language', instance.language);
  writeNotNull('custom_emoji_id', instance.customEmojiId);
  return val;
}

MessageId _$MessageIdFromJson(Map<String, dynamic> json) => MessageId(
      messageId: json['message_id'] as int,
    );

Map<String, dynamic> _$MessageIdToJson(MessageId instance) => <String, dynamic>{
      'message_id': instance.messageId,
    };

Message _$MessageFromJson(Map<String, dynamic> json) => Message(
      messageId: json['message_id'] as int,
      messageThreadId: json['message_thread_id'] as int?,
      from: json['from'] == null
          ? null
          : User.fromJson(json['from'] as Map<String, dynamic>),
      senderChat: json['sender_chat'] == null
          ? null
          : Chat.fromJson(json['sender_chat'] as Map<String, dynamic>),
      date: json['date'] as int,
      chat: Chat.fromJson(json['chat'] as Map<String, dynamic>),
      forwardFrom: json['forward_from'] == null
          ? null
          : User.fromJson(json['forward_from'] as Map<String, dynamic>),
      forwardFromChat: json['forward_from_chat'] == null
          ? null
          : Chat.fromJson(json['forward_from_chat'] as Map<String, dynamic>),
      forwardFromMessageId: json['forward_from_message_id'] as int?,
      forwardSignature: json['forward_signature'] as String?,
      forwardSenderName: json['forward_sender_name'] as String?,
      forwardDate: json['forward_date'] as int?,
      isTopicMessage: json['is_topic_message'] as bool?,
      isAutomaticForward: json['is_automatic_forward'] as bool?,
      replyToMessage: json['reply_to_message'] == null
          ? null
          : Message.fromJson(json['reply_to_message'] as Map<String, dynamic>),
      viaBot: json['via_bot'] == null
          ? null
          : User.fromJson(json['via_bot'] as Map<String, dynamic>),
      editDate: json['edit_date'] as int?,
      hasProtectedContent: json['has_protected_content'] as bool?,
      mediaGroupId: json['media_group_id'] as String?,
      authorSignature: json['author_signature'] as String?,
      text: json['text'] as String?,
      entities: (json['entities'] as List<dynamic>?)
          ?.map((e) => MessageEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      animation: json['animation'] == null
          ? null
          : Animation.fromJson(json['animation'] as Map<String, dynamic>),
      audio: json['audio'] == null
          ? null
          : Audio.fromJson(json['audio'] as Map<String, dynamic>),
      document: json['document'] == null
          ? null
          : Document.fromJson(json['document'] as Map<String, dynamic>),
      photo: (json['photo'] as List<dynamic>?)
          ?.map((e) => PhotoSize.fromJson(e as Map<String, dynamic>))
          .toList(),
      sticker: json['sticker'] == null
          ? null
          : Sticker.fromJson(json['sticker'] as Map<String, dynamic>),
      video: json['video'] == null
          ? null
          : Video.fromJson(json['video'] as Map<String, dynamic>),
      videoNote: json['video_note'] == null
          ? null
          : VideoNote.fromJson(json['video_note'] as Map<String, dynamic>),
      voice: json['voice'] == null
          ? null
          : Voice.fromJson(json['voice'] as Map<String, dynamic>),
      caption: json['caption'] as String?,
      captionEntities: (json['caption_entities'] as List<dynamic>?)
          ?.map((e) => MessageEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      hasMediaSpoiler: json['has_media_spoiler'] as bool?,
      contact: json['contact'] == null
          ? null
          : Contact.fromJson(json['contact'] as Map<String, dynamic>),
      dice: json['dice'] == null
          ? null
          : Dice.fromJson(json['dice'] as Map<String, dynamic>),
      game: json['game'] == null
          ? null
          : Game.fromJson(json['game'] as Map<String, dynamic>),
      poll: json['poll'] == null
          ? null
          : Poll.fromJson(json['poll'] as Map<String, dynamic>),
      venue: json['venue'] == null
          ? null
          : Venue.fromJson(json['venue'] as Map<String, dynamic>),
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
      newChatMembers: (json['new_chat_members'] as List<dynamic>?)
          ?.map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
      leftChatMember: json['left_chat_member'] == null
          ? null
          : User.fromJson(json['left_chat_member'] as Map<String, dynamic>),
      newChatTitle: json['new_chat_title'] as String?,
      newChatPhoto: (json['new_chat_photo'] as List<dynamic>?)
          ?.map((e) => PhotoSize.fromJson(e as Map<String, dynamic>))
          .toList(),
      deleteChatPhoto: json['delete_chat_photo'] as bool?,
      groupChatCreated: json['group_chat_created'] as bool?,
      supergroupChatCreated: json['supergroup_chat_created'] as bool?,
      channelChatCreated: json['channel_chat_created'] as bool?,
      messageAutoDeleteTimerChanged:
          json['message_auto_delete_timer_changed'] == null
              ? null
              : MessageAutoDeleteTimerChanged.fromJson(
                  json['message_auto_delete_timer_changed']
                      as Map<String, dynamic>),
      migrateToChatId: json['migrate_to_chat_id'] as int?,
      migrateFromChatId: json['migrate_from_chat_id'] as int?,
      pinnedMessage: json['pinned_message'] == null
          ? null
          : Message.fromJson(json['pinned_message'] as Map<String, dynamic>),
      invoice: json['invoice'] == null
          ? null
          : Invoice.fromJson(json['invoice'] as Map<String, dynamic>),
      successfulPayment: json['successful_payment'] == null
          ? null
          : SuccessfulPayment.fromJson(
              json['successful_payment'] as Map<String, dynamic>),
      userShared: json['user_shared'] == null
          ? null
          : UserShared.fromJson(json['user_shared'] as Map<String, dynamic>),
      chatShared: json['chat_shared'] == null
          ? null
          : ChatShared.fromJson(json['chat_shared'] as Map<String, dynamic>),
      connectedWebsite: json['connected_website'] as String?,
      writeAccessAllowed: json['write_access_allowed'] == null
          ? null
          : WriteAccessAllowed.fromJson(
              json['write_access_allowed'] as Map<String, dynamic>),
      passportData: json['passport_data'] == null
          ? null
          : PassportData.fromJson(
              json['passport_data'] as Map<String, dynamic>),
      proximityAlertTriggered: json['proximity_alert_triggered'] == null
          ? null
          : ProximityAlertTriggered.fromJson(
              json['proximity_alert_triggered'] as Map<String, dynamic>),
      forumTopicCreated: json['forum_topic_created'] == null
          ? null
          : ForumTopicCreated.fromJson(
              json['forum_topic_created'] as Map<String, dynamic>),
      forumTopicEdited: json['forum_topic_edited'] == null
          ? null
          : ForumTopicEdited.fromJson(
              json['forum_topic_edited'] as Map<String, dynamic>),
      forumTopicClosed: json['forum_topic_closed'] == null
          ? null
          : ForumTopicClosed.fromJson(
              json['forum_topic_closed'] as Map<String, dynamic>),
      forumTopicReopened: json['forum_topic_reopened'] == null
          ? null
          : ForumTopicReopened.fromJson(
              json['forum_topic_reopened'] as Map<String, dynamic>),
      generalForumTopicHidden: json['general_forum_topic_hidden'] == null
          ? null
          : GeneralForumTopicHidden.fromJson(
              json['general_forum_topic_hidden'] as Map<String, dynamic>),
      generalForumTopicUnhidden: json['general_forum_topic_unhidden'] == null
          ? null
          : GeneralForumTopicUnhidden.fromJson(
              json['general_forum_topic_unhidden'] as Map<String, dynamic>),
      videoChatScheduled: json['video_chat_scheduled'] == null
          ? null
          : VoiceChatScheduled.fromJson(
              json['video_chat_scheduled'] as Map<String, dynamic>),
      videoChatStarted: json['video_chat_started'] == null
          ? null
          : VoiceChatStarted.fromJson(
              json['video_chat_started'] as Map<String, dynamic>),
      videoChatEnded: json['video_chat_ended'] == null
          ? null
          : VoiceChatEnded.fromJson(
              json['video_chat_ended'] as Map<String, dynamic>),
      videoChatParticipantsInvited: json['video_chat_participants_invited'] ==
              null
          ? null
          : VoiceChatParticipantsInvited.fromJson(
              json['video_chat_participants_invited'] as Map<String, dynamic>),
      webAppData: json['web_app_data'] == null
          ? null
          : WebAppData.fromJson(json['web_app_data'] as Map<String, dynamic>),
      replyMarkup: json['reply_markup'] == null
          ? null
          : InlineKeyboardMarkup.fromJson(
              json['reply_markup'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MessageToJson(Message instance) {
  final val = <String, dynamic>{
    'message_id': instance.messageId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('message_thread_id', instance.messageThreadId);
  writeNotNull('from', instance.from?.toJson());
  writeNotNull('sender_chat', instance.senderChat?.toJson());
  val['date'] = instance.date;
  val['chat'] = instance.chat.toJson();
  writeNotNull('forward_from', instance.forwardFrom?.toJson());
  writeNotNull('forward_from_chat', instance.forwardFromChat?.toJson());
  writeNotNull('forward_from_message_id', instance.forwardFromMessageId);
  writeNotNull('forward_signature', instance.forwardSignature);
  writeNotNull('forward_sender_name', instance.forwardSenderName);
  writeNotNull('forward_date', instance.forwardDate);
  writeNotNull('is_topic_message', instance.isTopicMessage);
  writeNotNull('is_automatic_forward', instance.isAutomaticForward);
  writeNotNull('reply_to_message', instance.replyToMessage?.toJson());
  writeNotNull('via_bot', instance.viaBot?.toJson());
  writeNotNull('edit_date', instance.editDate);
  writeNotNull('has_protected_content', instance.hasProtectedContent);
  writeNotNull('media_group_id', instance.mediaGroupId);
  writeNotNull('author_signature', instance.authorSignature);
  writeNotNull('text', instance.text);
  writeNotNull('entities', instance.entities?.map((e) => e.toJson()).toList());
  writeNotNull('animation', instance.animation?.toJson());
  writeNotNull('audio', instance.audio?.toJson());
  writeNotNull('document', instance.document?.toJson());
  writeNotNull('photo', instance.photo?.map((e) => e.toJson()).toList());
  writeNotNull('sticker', instance.sticker?.toJson());
  writeNotNull('video', instance.video?.toJson());
  writeNotNull('video_note', instance.videoNote?.toJson());
  writeNotNull('voice', instance.voice?.toJson());
  writeNotNull('caption', instance.caption);
  writeNotNull('caption_entities',
      instance.captionEntities?.map((e) => e.toJson()).toList());
  writeNotNull('has_media_spoiler', instance.hasMediaSpoiler);
  writeNotNull('contact', instance.contact?.toJson());
  writeNotNull('dice', instance.dice?.toJson());
  writeNotNull('game', instance.game?.toJson());
  writeNotNull('poll', instance.poll?.toJson());
  writeNotNull('venue', instance.venue?.toJson());
  writeNotNull('location', instance.location?.toJson());
  writeNotNull('new_chat_members',
      instance.newChatMembers?.map((e) => e.toJson()).toList());
  writeNotNull('left_chat_member', instance.leftChatMember?.toJson());
  writeNotNull('new_chat_title', instance.newChatTitle);
  writeNotNull(
      'new_chat_photo', instance.newChatPhoto?.map((e) => e.toJson()).toList());
  writeNotNull('delete_chat_photo', instance.deleteChatPhoto);
  writeNotNull('group_chat_created', instance.groupChatCreated);
  writeNotNull('supergroup_chat_created', instance.supergroupChatCreated);
  writeNotNull('channel_chat_created', instance.channelChatCreated);
  writeNotNull('message_auto_delete_timer_changed',
      instance.messageAutoDeleteTimerChanged?.toJson());
  writeNotNull('migrate_to_chat_id', instance.migrateToChatId);
  writeNotNull('migrate_from_chat_id', instance.migrateFromChatId);
  writeNotNull('pinned_message', instance.pinnedMessage?.toJson());
  writeNotNull('invoice', instance.invoice?.toJson());
  writeNotNull('successful_payment', instance.successfulPayment?.toJson());
  writeNotNull('user_shared', instance.userShared?.toJson());
  writeNotNull('chat_shared', instance.chatShared?.toJson());
  writeNotNull('connected_website', instance.connectedWebsite);
  writeNotNull('write_access_allowed', instance.writeAccessAllowed?.toJson());
  writeNotNull('passport_data', instance.passportData?.toJson());
  writeNotNull(
      'proximity_alert_triggered', instance.proximityAlertTriggered?.toJson());
  writeNotNull('forum_topic_created', instance.forumTopicCreated?.toJson());
  writeNotNull('forum_topic_edited', instance.forumTopicEdited?.toJson());
  writeNotNull('forum_topic_closed', instance.forumTopicClosed?.toJson());
  writeNotNull('forum_topic_reopened', instance.forumTopicReopened?.toJson());
  writeNotNull(
      'general_forum_topic_hidden', instance.generalForumTopicHidden?.toJson());
  writeNotNull('general_forum_topic_unhidden',
      instance.generalForumTopicUnhidden?.toJson());
  writeNotNull('video_chat_scheduled', instance.videoChatScheduled?.toJson());
  writeNotNull('video_chat_started', instance.videoChatStarted?.toJson());
  writeNotNull('video_chat_ended', instance.videoChatEnded?.toJson());
  writeNotNull('video_chat_participants_invited',
      instance.videoChatParticipantsInvited?.toJson());
  writeNotNull('web_app_data', instance.webAppData?.toJson());
  writeNotNull('reply_markup', instance.replyMarkup?.toJson());
  return val;
}

OrderInfo _$OrderInfoFromJson(Map<String, dynamic> json) => OrderInfo(
      name: json['name'] as String?,
      phoneNumber: json['phone_number'] as String?,
      email: json['email'] as String?,
      shippingAddress: json['shipping_address'] == null
          ? null
          : ShippingAddress.fromJson(
              json['shipping_address'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrderInfoToJson(OrderInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('phone_number', instance.phoneNumber);
  writeNotNull('email', instance.email);
  writeNotNull('shipping_address', instance.shippingAddress?.toJson());
  return val;
}

PassportData _$PassportDataFromJson(Map<String, dynamic> json) => PassportData(
      data: (json['data'] as List<dynamic>)
          .map((e) =>
              EncryptedPassportElement.fromJson(e as Map<String, dynamic>))
          .toList(),
      credentials: EncryptedCredentials.fromJson(
          json['credentials'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PassportDataToJson(PassportData instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
      'credentials': instance.credentials.toJson(),
    };

PassportElementErrorDataField _$PassportElementErrorDataFieldFromJson(
        Map<String, dynamic> json) =>
    PassportElementErrorDataField(
      source: json['source'] as String,
      type: json['type'] as String,
      message: json['message'] as String,
      fieldName: json['field_name'] as String,
      dataHash: json['data_hash'] as String,
    );

Map<String, dynamic> _$PassportElementErrorDataFieldToJson(
        PassportElementErrorDataField instance) =>
    <String, dynamic>{
      'source': instance.source,
      'type': instance.type,
      'message': instance.message,
      'field_name': instance.fieldName,
      'data_hash': instance.dataHash,
    };

PassportElementErrorFile _$PassportElementErrorFileFromJson(
        Map<String, dynamic> json) =>
    PassportElementErrorFile(
      source: json['source'] as String,
      type: json['type'] as String,
      message: json['message'] as String,
      fileHash: json['file_hash'] as String,
    );

Map<String, dynamic> _$PassportElementErrorFileToJson(
        PassportElementErrorFile instance) =>
    <String, dynamic>{
      'source': instance.source,
      'type': instance.type,
      'message': instance.message,
      'file_hash': instance.fileHash,
    };

PassportElementErrorFiles _$PassportElementErrorFilesFromJson(
        Map<String, dynamic> json) =>
    PassportElementErrorFiles(
      source: json['source'] as String,
      type: json['type'] as String,
      message: json['message'] as String,
      fileHashes: (json['file_hashes'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$PassportElementErrorFilesToJson(
        PassportElementErrorFiles instance) =>
    <String, dynamic>{
      'source': instance.source,
      'type': instance.type,
      'message': instance.message,
      'file_hashes': instance.fileHashes,
    };

PassportElementErrorFrontSide _$PassportElementErrorFrontSideFromJson(
        Map<String, dynamic> json) =>
    PassportElementErrorFrontSide(
      source: json['source'] as String,
      type: json['type'] as String,
      message: json['message'] as String,
      fileHash: json['file_hash'] as String,
    );

Map<String, dynamic> _$PassportElementErrorFrontSideToJson(
        PassportElementErrorFrontSide instance) =>
    <String, dynamic>{
      'source': instance.source,
      'type': instance.type,
      'message': instance.message,
      'file_hash': instance.fileHash,
    };

PassportElementErrorReverseSide _$PassportElementErrorReverseSideFromJson(
        Map<String, dynamic> json) =>
    PassportElementErrorReverseSide(
      source: json['source'] as String,
      type: json['type'] as String,
      message: json['message'] as String,
      fileHash: json['file_hash'] as String,
    );

Map<String, dynamic> _$PassportElementErrorReverseSideToJson(
        PassportElementErrorReverseSide instance) =>
    <String, dynamic>{
      'source': instance.source,
      'type': instance.type,
      'message': instance.message,
      'file_hash': instance.fileHash,
    };

PassportElementErrorSelfie _$PassportElementErrorSelfieFromJson(
        Map<String, dynamic> json) =>
    PassportElementErrorSelfie(
      source: json['source'] as String,
      type: json['type'] as String,
      message: json['message'] as String,
      fileHash: json['file_hash'] as String,
    );

Map<String, dynamic> _$PassportElementErrorSelfieToJson(
        PassportElementErrorSelfie instance) =>
    <String, dynamic>{
      'source': instance.source,
      'type': instance.type,
      'message': instance.message,
      'file_hash': instance.fileHash,
    };

PassportElementErrorTranslationFile
    _$PassportElementErrorTranslationFileFromJson(Map<String, dynamic> json) =>
        PassportElementErrorTranslationFile(
          source: json['source'] as String,
          type: json['type'] as String,
          message: json['message'] as String,
          fileHash: json['file_hash'] as String,
        );

Map<String, dynamic> _$PassportElementErrorTranslationFileToJson(
        PassportElementErrorTranslationFile instance) =>
    <String, dynamic>{
      'source': instance.source,
      'type': instance.type,
      'message': instance.message,
      'file_hash': instance.fileHash,
    };

PassportElementErrorTranslationFiles
    _$PassportElementErrorTranslationFilesFromJson(Map<String, dynamic> json) =>
        PassportElementErrorTranslationFiles(
          source: json['source'] as String,
          type: json['type'] as String,
          message: json['message'] as String,
          fileHashes: (json['file_hashes'] as List<dynamic>)
              .map((e) => e as String)
              .toList(),
        );

Map<String, dynamic> _$PassportElementErrorTranslationFilesToJson(
        PassportElementErrorTranslationFiles instance) =>
    <String, dynamic>{
      'source': instance.source,
      'type': instance.type,
      'message': instance.message,
      'file_hashes': instance.fileHashes,
    };

PassportElementErrorUnspecified _$PassportElementErrorUnspecifiedFromJson(
        Map<String, dynamic> json) =>
    PassportElementErrorUnspecified(
      source: json['source'] as String,
      type: json['type'] as String,
      message: json['message'] as String,
      elementHash: json['element_hash'] as String,
    );

Map<String, dynamic> _$PassportElementErrorUnspecifiedToJson(
        PassportElementErrorUnspecified instance) =>
    <String, dynamic>{
      'source': instance.source,
      'type': instance.type,
      'message': instance.message,
      'element_hash': instance.elementHash,
    };

PassportElementError _$PassportElementErrorFromJson(
        Map<String, dynamic> json) =>
    PassportElementError(
      source: json['source'] as String,
      type: json['type'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$PassportElementErrorToJson(
        PassportElementError instance) =>
    <String, dynamic>{
      'source': instance.source,
      'type': instance.type,
      'message': instance.message,
    };

PassportFile _$PassportFileFromJson(Map<String, dynamic> json) => PassportFile(
      fileId: json['file_id'] as String,
      fileUniqueId: json['file_unique_id'] as String,
      fileSize: json['file_size'] as int,
      fileDate: json['file_date'] as int,
    );

Map<String, dynamic> _$PassportFileToJson(PassportFile instance) =>
    <String, dynamic>{
      'file_id': instance.fileId,
      'file_unique_id': instance.fileUniqueId,
      'file_size': instance.fileSize,
      'file_date': instance.fileDate,
    };

PhotoSize _$PhotoSizeFromJson(Map<String, dynamic> json) => PhotoSize(
      fileId: json['file_id'] as String,
      fileUniqueId: json['file_unique_id'] as String,
      width: json['width'] as int,
      height: json['height'] as int,
      fileSize: json['file_size'] as int?,
    );

Map<String, dynamic> _$PhotoSizeToJson(PhotoSize instance) {
  final val = <String, dynamic>{
    'file_id': instance.fileId,
    'file_unique_id': instance.fileUniqueId,
    'width': instance.width,
    'height': instance.height,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('file_size', instance.fileSize);
  return val;
}

PollAnswer _$PollAnswerFromJson(Map<String, dynamic> json) => PollAnswer(
      pollId: json['poll_id'] as String,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      optionIds:
          (json['option_ids'] as List<dynamic>).map((e) => e as int).toList(),
    );

Map<String, dynamic> _$PollAnswerToJson(PollAnswer instance) =>
    <String, dynamic>{
      'poll_id': instance.pollId,
      'user': instance.user.toJson(),
      'option_ids': instance.optionIds,
    };

PollOption _$PollOptionFromJson(Map<String, dynamic> json) => PollOption(
      text: json['text'] as String,
      voterCount: json['voter_count'] as int,
    );

Map<String, dynamic> _$PollOptionToJson(PollOption instance) =>
    <String, dynamic>{
      'text': instance.text,
      'voter_count': instance.voterCount,
    };

Poll _$PollFromJson(Map<String, dynamic> json) => Poll(
      id: json['id'] as String,
      question: json['question'] as String,
      options: (json['options'] as List<dynamic>)
          .map((e) => PollOption.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalVoterCount: json['total_voter_count'] as int,
      isClosed: json['is_closed'] as bool,
      isAnonymous: json['is_anonymous'] as bool,
      type: json['type'] as String,
      allowsMultipleAnswers: json['allows_multiple_answers'] as bool,
      correctOptionId: json['correct_option_id'] as int?,
      explanation: json['explanation'] as String?,
      explanationEntities: (json['explanation_entities'] as List<dynamic>?)
          ?.map((e) => MessageEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      openPeriod: json['open_period'] as int?,
      closeDate: json['close_date'] as int?,
    );

Map<String, dynamic> _$PollToJson(Poll instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'question': instance.question,
    'options': instance.options.map((e) => e.toJson()).toList(),
    'total_voter_count': instance.totalVoterCount,
    'is_closed': instance.isClosed,
    'is_anonymous': instance.isAnonymous,
    'type': instance.type,
    'allows_multiple_answers': instance.allowsMultipleAnswers,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('correct_option_id', instance.correctOptionId);
  writeNotNull('explanation', instance.explanation);
  writeNotNull('explanation_entities',
      instance.explanationEntities?.map((e) => e.toJson()).toList());
  writeNotNull('open_period', instance.openPeriod);
  writeNotNull('close_date', instance.closeDate);
  return val;
}

PreCheckoutQuery _$PreCheckoutQueryFromJson(Map<String, dynamic> json) =>
    PreCheckoutQuery(
      id: json['id'] as String,
      from: User.fromJson(json['from'] as Map<String, dynamic>),
      currency: json['currency'] as String,
      totalAmount: json['total_amount'] as int,
      invoicePayload: json['invoice_payload'] as String,
      shippingOptionId: json['shipping_option_id'] as String?,
      orderInfo: json['order_info'] == null
          ? null
          : OrderInfo.fromJson(json['order_info'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PreCheckoutQueryToJson(PreCheckoutQuery instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'from': instance.from.toJson(),
    'currency': instance.currency,
    'total_amount': instance.totalAmount,
    'invoice_payload': instance.invoicePayload,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('shipping_option_id', instance.shippingOptionId);
  writeNotNull('order_info', instance.orderInfo?.toJson());
  return val;
}

ProximityAlertTriggered _$ProximityAlertTriggeredFromJson(
        Map<String, dynamic> json) =>
    ProximityAlertTriggered(
      traveler: User.fromJson(json['traveler'] as Map<String, dynamic>),
      watcher: User.fromJson(json['watcher'] as Map<String, dynamic>),
      distance: json['distance'] as int,
    );

Map<String, dynamic> _$ProximityAlertTriggeredToJson(
        ProximityAlertTriggered instance) =>
    <String, dynamic>{
      'traveler': instance.traveler.toJson(),
      'watcher': instance.watcher.toJson(),
      'distance': instance.distance,
    };

ReplyKeyboardMarkup _$ReplyKeyboardMarkupFromJson(Map<String, dynamic> json) =>
    ReplyKeyboardMarkup(
      keyboard: (json['keyboard'] as List<dynamic>)
          .map((e) => (e as List<dynamic>)
              .map((e) => KeyboardButton.fromJson(e as Map<String, dynamic>))
              .toList())
          .toList(),
      isPersistent: json['is_persistent'] as bool?,
      resizeKeyboard: json['resize_keyboard'] as bool?,
      oneTimeKeyboard: json['one_time_keyboard'] as bool?,
      inputFieldPlaceholder: json['input_field_placeholder'] as String?,
      selective: json['selective'] as bool?,
    );

Map<String, dynamic> _$ReplyKeyboardMarkupToJson(ReplyKeyboardMarkup instance) {
  final val = <String, dynamic>{
    'keyboard': instance.keyboard
        .map((e) => e.map((e) => e.toJson()).toList())
        .toList(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('is_persistent', instance.isPersistent);
  writeNotNull('resize_keyboard', instance.resizeKeyboard);
  writeNotNull('one_time_keyboard', instance.oneTimeKeyboard);
  writeNotNull('input_field_placeholder', instance.inputFieldPlaceholder);
  writeNotNull('selective', instance.selective);
  return val;
}

ReplyKeyboardRemove _$ReplyKeyboardRemoveFromJson(Map<String, dynamic> json) =>
    ReplyKeyboardRemove(
      removeKeyboard: json['remove_keyboard'] as bool,
      selective: json['selective'] as bool?,
    );

Map<String, dynamic> _$ReplyKeyboardRemoveToJson(ReplyKeyboardRemove instance) {
  final val = <String, dynamic>{
    'remove_keyboard': instance.removeKeyboard,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('selective', instance.selective);
  return val;
}

ReplyMarkup _$ReplyMarkupFromJson(Map<String, dynamic> json) => ReplyMarkup();

Map<String, dynamic> _$ReplyMarkupToJson(ReplyMarkup instance) =>
    <String, dynamic>{};

ResponseParameters _$ResponseParametersFromJson(Map<String, dynamic> json) =>
    ResponseParameters(
      migrateToChatId: json['migrate_to_chat_id'] as int?,
      retryAfter: json['retry_after'] as int?,
    );

Map<String, dynamic> _$ResponseParametersToJson(ResponseParameters instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('migrate_to_chat_id', instance.migrateToChatId);
  writeNotNull('retry_after', instance.retryAfter);
  return val;
}

Response _$ResponseFromJson(Map<String, dynamic> json) => Response(
      ok: json['ok'] as bool,
    );

Map<String, dynamic> _$ResponseToJson(Response instance) => <String, dynamic>{
      'ok': instance.ok,
    };

SuccessResponse _$SuccessResponseFromJson(Map<String, dynamic> json) =>
    SuccessResponse(
      ok: json['ok'] as bool,
      result: json['result'],
    );

Map<String, dynamic> _$SuccessResponseToJson(SuccessResponse instance) {
  final val = <String, dynamic>{
    'ok': instance.ok,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('result', instance.result);
  return val;
}

ErrorResponse _$ErrorResponseFromJson(Map<String, dynamic> json) =>
    ErrorResponse(
      ok: json['ok'] as bool,
      description: json['description'] as String,
      errorCode: json['error_code'] as int,
      parameters: json['parameters'] == null
          ? null
          : ResponseParameters.fromJson(
              json['parameters'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ErrorResponseToJson(ErrorResponse instance) {
  final val = <String, dynamic>{
    'ok': instance.ok,
    'description': instance.description,
    'error_code': instance.errorCode,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('parameters', instance.parameters?.toJson());
  return val;
}

SentWebAppMessage _$SentWebAppMessageFromJson(Map<String, dynamic> json) =>
    SentWebAppMessage(
      inlineMessageId: json['inline_message_id'] as String?,
    );

Map<String, dynamic> _$SentWebAppMessageToJson(SentWebAppMessage instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('inline_message_id', instance.inlineMessageId);
  return val;
}

ShippingAddress _$ShippingAddressFromJson(Map<String, dynamic> json) =>
    ShippingAddress(
      countryCode: json['country_code'] as String,
      state: json['state'] as String,
      city: json['city'] as String,
      streetLine1: json['street_line1'] as String,
      streetLine2: json['street_line2'] as String,
      postCode: json['post_code'] as String,
    );

Map<String, dynamic> _$ShippingAddressToJson(ShippingAddress instance) =>
    <String, dynamic>{
      'country_code': instance.countryCode,
      'state': instance.state,
      'city': instance.city,
      'street_line1': instance.streetLine1,
      'street_line2': instance.streetLine2,
      'post_code': instance.postCode,
    };

ShippingOption _$ShippingOptionFromJson(Map<String, dynamic> json) =>
    ShippingOption(
      id: json['id'] as String,
      title: json['title'] as String,
      prices: (json['prices'] as List<dynamic>)
          .map((e) => LabeledPrice.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ShippingOptionToJson(ShippingOption instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'prices': instance.prices.map((e) => e.toJson()).toList(),
    };

ShippingQuery _$ShippingQueryFromJson(Map<String, dynamic> json) =>
    ShippingQuery(
      id: json['id'] as String,
      from: User.fromJson(json['from'] as Map<String, dynamic>),
      invoicePayload: json['invoice_payload'] as String,
      shippingAddress: ShippingAddress.fromJson(
          json['shipping_address'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ShippingQueryToJson(ShippingQuery instance) =>
    <String, dynamic>{
      'id': instance.id,
      'from': instance.from.toJson(),
      'invoice_payload': instance.invoicePayload,
      'shipping_address': instance.shippingAddress.toJson(),
    };

StickerSet _$StickerSetFromJson(Map<String, dynamic> json) => StickerSet(
      name: json['name'] as String,
      title: json['title'] as String,
      stickerType: json['sticker_type'] as String,
      isAnimated: json['is_animated'] as bool,
      isVideo: json['is_video'] as bool,
      stickers: (json['stickers'] as List<dynamic>)
          .map((e) => Sticker.fromJson(e as Map<String, dynamic>))
          .toList(),
      thumb: json['thumb'] == null
          ? null
          : PhotoSize.fromJson(json['thumb'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StickerSetToJson(StickerSet instance) {
  final val = <String, dynamic>{
    'name': instance.name,
    'title': instance.title,
    'sticker_type': instance.stickerType,
    'is_animated': instance.isAnimated,
    'is_video': instance.isVideo,
    'stickers': instance.stickers.map((e) => e.toJson()).toList(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('thumb', instance.thumb?.toJson());
  return val;
}

Sticker _$StickerFromJson(Map<String, dynamic> json) => Sticker(
      fileId: json['file_id'] as String,
      fileUniqueId: json['file_unique_id'] as String,
      width: json['width'] as int,
      height: json['height'] as int,
      isAnimated: json['is_animated'] as bool,
      isVideo: json['is_video'] as bool,
      thumb: json['thumb'] == null
          ? null
          : PhotoSize.fromJson(json['thumb'] as Map<String, dynamic>),
      emoji: json['emoji'] as String?,
      setName: json['set_name'] as String?,
      premiumAnimation: json['premium_animation'] == null
          ? null
          : File.fromJson(json['premium_animation'] as Map<String, dynamic>),
      maskPosition: json['mask_position'] == null
          ? null
          : MaskPosition.fromJson(
              json['mask_position'] as Map<String, dynamic>),
      customEmojiId: json['custom_emoji_id'] as String?,
      fileSize: json['file_size'] as int?,
    );

Map<String, dynamic> _$StickerToJson(Sticker instance) {
  final val = <String, dynamic>{
    'file_id': instance.fileId,
    'file_unique_id': instance.fileUniqueId,
    'width': instance.width,
    'height': instance.height,
    'is_animated': instance.isAnimated,
    'is_video': instance.isVideo,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('thumb', instance.thumb?.toJson());
  writeNotNull('emoji', instance.emoji);
  writeNotNull('set_name', instance.setName);
  writeNotNull('premium_animation', instance.premiumAnimation?.toJson());
  writeNotNull('mask_position', instance.maskPosition?.toJson());
  writeNotNull('custom_emoji_id', instance.customEmojiId);
  writeNotNull('file_size', instance.fileSize);
  return val;
}

SuccessfulPayment _$SuccessfulPaymentFromJson(Map<String, dynamic> json) =>
    SuccessfulPayment(
      currency: json['currency'] as String,
      totalAmount: json['total_amount'] as int,
      invoicePayload: json['invoice_payload'] as String,
      shippingOptionId: json['shipping_option_id'] as String?,
      orderInfo: json['order_info'] == null
          ? null
          : OrderInfo.fromJson(json['order_info'] as Map<String, dynamic>),
      telegramPaymentChargeId: json['telegram_payment_charge_id'] as String,
      providerPaymentChargeId: json['provider_payment_charge_id'] as String,
    );

Map<String, dynamic> _$SuccessfulPaymentToJson(SuccessfulPayment instance) {
  final val = <String, dynamic>{
    'currency': instance.currency,
    'total_amount': instance.totalAmount,
    'invoice_payload': instance.invoicePayload,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('shipping_option_id', instance.shippingOptionId);
  writeNotNull('order_info', instance.orderInfo?.toJson());
  val['telegram_payment_charge_id'] = instance.telegramPaymentChargeId;
  val['provider_payment_charge_id'] = instance.providerPaymentChargeId;
  return val;
}

Update _$UpdateFromJson(Map<String, dynamic> json) => Update(
      updateId: json['update_id'] as int,
      message: json['message'] == null
          ? null
          : Message.fromJson(json['message'] as Map<String, dynamic>),
      editedMessage: json['edited_message'] == null
          ? null
          : Message.fromJson(json['edited_message'] as Map<String, dynamic>),
      channelPost: json['channel_post'] == null
          ? null
          : Message.fromJson(json['channel_post'] as Map<String, dynamic>),
      editedChannelPost: json['edited_channel_post'] == null
          ? null
          : Message.fromJson(
              json['edited_channel_post'] as Map<String, dynamic>),
      inlineQuery: json['inline_query'] == null
          ? null
          : InlineQuery.fromJson(json['inline_query'] as Map<String, dynamic>),
      chosenInlineResult: json['chosen_inline_result'] == null
          ? null
          : ChosenInlineResult.fromJson(
              json['chosen_inline_result'] as Map<String, dynamic>),
      callbackQuery: json['callback_query'] == null
          ? null
          : CallbackQuery.fromJson(
              json['callback_query'] as Map<String, dynamic>),
      shippingQuery: json['shipping_query'] == null
          ? null
          : ShippingQuery.fromJson(
              json['shipping_query'] as Map<String, dynamic>),
      preCheckoutQuery: json['pre_checkout_query'] == null
          ? null
          : PreCheckoutQuery.fromJson(
              json['pre_checkout_query'] as Map<String, dynamic>),
      poll: json['poll'] == null
          ? null
          : Poll.fromJson(json['poll'] as Map<String, dynamic>),
      pollAnswer: json['poll_answer'] == null
          ? null
          : PollAnswer.fromJson(json['poll_answer'] as Map<String, dynamic>),
      myChatMember: json['my_chat_member'] == null
          ? null
          : ChatMemberUpdated.fromJson(
              json['my_chat_member'] as Map<String, dynamic>),
      chatMember: json['chat_member'] == null
          ? null
          : ChatMemberUpdated.fromJson(
              json['chat_member'] as Map<String, dynamic>),
      chatJoinRequest: json['chat_join_request'] == null
          ? null
          : ChatJoinRequest.fromJson(
              json['chat_join_request'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UpdateToJson(Update instance) {
  final val = <String, dynamic>{
    'update_id': instance.updateId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('message', instance.message?.toJson());
  writeNotNull('edited_message', instance.editedMessage?.toJson());
  writeNotNull('channel_post', instance.channelPost?.toJson());
  writeNotNull('edited_channel_post', instance.editedChannelPost?.toJson());
  writeNotNull('inline_query', instance.inlineQuery?.toJson());
  writeNotNull('chosen_inline_result', instance.chosenInlineResult?.toJson());
  writeNotNull('callback_query', instance.callbackQuery?.toJson());
  writeNotNull('shipping_query', instance.shippingQuery?.toJson());
  writeNotNull('pre_checkout_query', instance.preCheckoutQuery?.toJson());
  writeNotNull('poll', instance.poll?.toJson());
  writeNotNull('poll_answer', instance.pollAnswer?.toJson());
  writeNotNull('my_chat_member', instance.myChatMember?.toJson());
  writeNotNull('chat_member', instance.chatMember?.toJson());
  writeNotNull('chat_join_request', instance.chatJoinRequest?.toJson());
  return val;
}

UserProfilePhotos _$UserProfilePhotosFromJson(Map<String, dynamic> json) =>
    UserProfilePhotos(
      totalCount: json['total_count'] as int,
      photos: (json['photos'] as List<dynamic>)
          .map((e) => (e as List<dynamic>)
              .map((e) => PhotoSize.fromJson(e as Map<String, dynamic>))
              .toList())
          .toList(),
    );

Map<String, dynamic> _$UserProfilePhotosToJson(UserProfilePhotos instance) =>
    <String, dynamic>{
      'total_count': instance.totalCount,
      'photos': instance.photos
          .map((e) => e.map((e) => e.toJson()).toList())
          .toList(),
    };

UserShared _$UserSharedFromJson(Map<String, dynamic> json) => UserShared(
      requestId: json['request_id'] as int,
      userId: json['user_id'] as int,
    );

Map<String, dynamic> _$UserSharedToJson(UserShared instance) =>
    <String, dynamic>{
      'request_id': instance.requestId,
      'user_id': instance.userId,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as int,
      isBot: json['is_bot'] as bool,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String?,
      username: json['username'] as String?,
      languageCode: json['language_code'] as String?,
      isPremium: json['is_premium'] as bool?,
      addedToAttachmentMenu: json['added_to_attachment_menu'] as bool?,
      canJoinGroups: json['can_join_groups'] as bool?,
      canReadAllGroupMessages: json['can_read_all_group_messages'] as bool?,
      supportsInlineQueries: json['supports_inline_queries'] as bool?,
    );

Map<String, dynamic> _$UserToJson(User instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'is_bot': instance.isBot,
    'first_name': instance.firstName,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('last_name', instance.lastName);
  writeNotNull('username', instance.username);
  writeNotNull('language_code', instance.languageCode);
  writeNotNull('is_premium', instance.isPremium);
  writeNotNull('added_to_attachment_menu', instance.addedToAttachmentMenu);
  writeNotNull('can_join_groups', instance.canJoinGroups);
  writeNotNull('can_read_all_group_messages', instance.canReadAllGroupMessages);
  writeNotNull('supports_inline_queries', instance.supportsInlineQueries);
  return val;
}

Venue _$VenueFromJson(Map<String, dynamic> json) => Venue(
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
      title: json['title'] as String,
      address: json['address'] as String,
      foursquareId: json['foursquare_id'] as String?,
      foursquareType: json['foursquare_type'] as String?,
      googlePlaceId: json['google_place_id'] as String?,
      googlePlaceType: json['google_place_type'] as String?,
    );

Map<String, dynamic> _$VenueToJson(Venue instance) {
  final val = <String, dynamic>{
    'location': instance.location.toJson(),
    'title': instance.title,
    'address': instance.address,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('foursquare_id', instance.foursquareId);
  writeNotNull('foursquare_type', instance.foursquareType);
  writeNotNull('google_place_id', instance.googlePlaceId);
  writeNotNull('google_place_type', instance.googlePlaceType);
  return val;
}

VideoNote _$VideoNoteFromJson(Map<String, dynamic> json) => VideoNote(
      fileId: json['file_id'] as String,
      fileUniqueId: json['file_unique_id'] as String,
      length: json['length'] as int,
      duration: json['duration'] as int,
      thumb: json['thumb'] == null
          ? null
          : PhotoSize.fromJson(json['thumb'] as Map<String, dynamic>),
      fileSize: json['file_size'] as int?,
    );

Map<String, dynamic> _$VideoNoteToJson(VideoNote instance) {
  final val = <String, dynamic>{
    'file_id': instance.fileId,
    'file_unique_id': instance.fileUniqueId,
    'length': instance.length,
    'duration': instance.duration,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('thumb', instance.thumb?.toJson());
  writeNotNull('file_size', instance.fileSize);
  return val;
}

Video _$VideoFromJson(Map<String, dynamic> json) => Video(
      fileId: json['file_id'] as String,
      fileUniqueId: json['file_unique_id'] as String,
      width: json['width'] as int,
      height: json['height'] as int,
      duration: json['duration'] as int,
      thumb: json['thumb'] == null
          ? null
          : PhotoSize.fromJson(json['thumb'] as Map<String, dynamic>),
      fileName: json['file_name'] as String?,
      mimeType: json['mime_type'] as String?,
      fileSize: json['file_size'] as int?,
    );

Map<String, dynamic> _$VideoToJson(Video instance) {
  final val = <String, dynamic>{
    'file_id': instance.fileId,
    'file_unique_id': instance.fileUniqueId,
    'width': instance.width,
    'height': instance.height,
    'duration': instance.duration,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('thumb', instance.thumb?.toJson());
  writeNotNull('file_name', instance.fileName);
  writeNotNull('mime_type', instance.mimeType);
  writeNotNull('file_size', instance.fileSize);
  return val;
}

VoiceChatEnded _$VoiceChatEndedFromJson(Map<String, dynamic> json) =>
    VoiceChatEnded(
      duration: json['duration'] as int,
    );

Map<String, dynamic> _$VoiceChatEndedToJson(VoiceChatEnded instance) =>
    <String, dynamic>{
      'duration': instance.duration,
    };

VoiceChatParticipantsInvited _$VoiceChatParticipantsInvitedFromJson(
        Map<String, dynamic> json) =>
    VoiceChatParticipantsInvited(
      users: (json['users'] as List<dynamic>?)
          ?.map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$VoiceChatParticipantsInvitedToJson(
    VoiceChatParticipantsInvited instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('users', instance.users?.map((e) => e.toJson()).toList());
  return val;
}

VoiceChatScheduled _$VoiceChatScheduledFromJson(Map<String, dynamic> json) =>
    VoiceChatScheduled(
      json['start_date'] as int,
    );

Map<String, dynamic> _$VoiceChatScheduledToJson(VoiceChatScheduled instance) =>
    <String, dynamic>{
      'start_date': instance.startDate,
    };

VoiceChatStarted _$VoiceChatStartedFromJson(Map<String, dynamic> json) =>
    VoiceChatStarted();

Map<String, dynamic> _$VoiceChatStartedToJson(VoiceChatStarted instance) =>
    <String, dynamic>{};

Voice _$VoiceFromJson(Map<String, dynamic> json) => Voice(
      fileId: json['file_id'] as String,
      fileUniqueId: json['file_unique_id'] as String,
      duration: json['duration'] as int,
      mimeType: json['mime_type'] as String?,
      fileSize: json['file_size'] as int?,
    );

Map<String, dynamic> _$VoiceToJson(Voice instance) {
  final val = <String, dynamic>{
    'file_id': instance.fileId,
    'file_unique_id': instance.fileUniqueId,
    'duration': instance.duration,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('mime_type', instance.mimeType);
  writeNotNull('file_size', instance.fileSize);
  return val;
}

WebAppData _$WebAppDataFromJson(Map<String, dynamic> json) => WebAppData(
      data: json['data'] as String,
      buttonText: json['button_text'] as String,
    );

Map<String, dynamic> _$WebAppDataToJson(WebAppData instance) =>
    <String, dynamic>{
      'data': instance.data,
      'button_text': instance.buttonText,
    };

WebAppInfo _$WebAppInfoFromJson(Map<String, dynamic> json) => WebAppInfo(
      url: json['url'] as String,
    );

Map<String, dynamic> _$WebAppInfoToJson(WebAppInfo instance) =>
    <String, dynamic>{
      'url': instance.url,
    };

WebhookInfo _$WebhookInfoFromJson(Map<String, dynamic> json) => WebhookInfo(
      url: json['url'] as String,
      hasCustomCertificate: json['has_custom_certificate'] as bool,
      pendingUpdateCount: json['pending_update_count'] as int,
      ipAddress: json['ip_address'] as String?,
      lastErrorDate: json['last_error_date'] as int?,
      lastErrorMessage: json['last_error_message'] as String?,
      lastSynchronizationErrorDate:
          json['last_synchronization_error_date'] as int?,
      maxConnections: json['max_connections'] as int?,
      allowedUpdates: (json['allowed_updates'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$WebhookInfoToJson(WebhookInfo instance) {
  final val = <String, dynamic>{
    'url': instance.url,
    'has_custom_certificate': instance.hasCustomCertificate,
    'pending_update_count': instance.pendingUpdateCount,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ip_address', instance.ipAddress);
  writeNotNull('last_error_date', instance.lastErrorDate);
  writeNotNull('last_error_message', instance.lastErrorMessage);
  writeNotNull(
      'last_synchronization_error_date', instance.lastSynchronizationErrorDate);
  writeNotNull('max_connections', instance.maxConnections);
  writeNotNull('allowed_updates', instance.allowedUpdates);
  return val;
}

WriteAccessAllowed _$WriteAccessAllowedFromJson(Map<String, dynamic> json) =>
    WriteAccessAllowed();

Map<String, dynamic> _$WriteAccessAllowedToJson(WriteAccessAllowed instance) =>
    <String, dynamic>{};
