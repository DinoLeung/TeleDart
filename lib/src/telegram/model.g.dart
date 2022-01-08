// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Update _$UpdateFromJson(Map<String, dynamic> json) => Update(
      update_id: json['update_id'] as int,
      message: json['message'] == null
          ? null
          : Message.fromJson(json['message'] as Map<String, dynamic>),
      edited_message: json['edited_message'] == null
          ? null
          : Message.fromJson(json['edited_message'] as Map<String, dynamic>),
      channel_post: json['channel_post'] == null
          ? null
          : Message.fromJson(json['channel_post'] as Map<String, dynamic>),
      edited_channel_post: json['edited_channel_post'] == null
          ? null
          : Message.fromJson(
              json['edited_channel_post'] as Map<String, dynamic>),
      inline_query: json['inline_query'] == null
          ? null
          : InlineQuery.fromJson(json['inline_query'] as Map<String, dynamic>),
      chosen_inline_result: json['chosen_inline_result'] == null
          ? null
          : ChosenInlineResult.fromJson(
              json['chosen_inline_result'] as Map<String, dynamic>),
      callback_query: json['callback_query'] == null
          ? null
          : CallbackQuery.fromJson(
              json['callback_query'] as Map<String, dynamic>),
      shipping_query: json['shipping_query'] == null
          ? null
          : ShippingQuery.fromJson(
              json['shipping_query'] as Map<String, dynamic>),
      pre_checkout_query: json['pre_checkout_query'] == null
          ? null
          : PreCheckoutQuery.fromJson(
              json['pre_checkout_query'] as Map<String, dynamic>),
      poll: json['poll'] == null
          ? null
          : Poll.fromJson(json['poll'] as Map<String, dynamic>),
      poll_answer: json['poll_answer'] == null
          ? null
          : PollAnswer.fromJson(json['poll_answer'] as Map<String, dynamic>),
      my_chat_member: json['my_chat_member'] == null
          ? null
          : ChatMemberUpdated.fromJson(
              json['my_chat_member'] as Map<String, dynamic>),
      chat_member: json['chat_member'] == null
          ? null
          : ChatMemberUpdated.fromJson(
              json['chat_member'] as Map<String, dynamic>),
      chat_join_request: json['chat_join_request'] == null
          ? null
          : ChatJoinRequest.fromJson(
              json['chat_join_request'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UpdateToJson(Update instance) {
  final val = <String, dynamic>{
    'update_id': instance.update_id,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('message', instance.message?.toJson());
  writeNotNull('edited_message', instance.edited_message?.toJson());
  writeNotNull('channel_post', instance.channel_post?.toJson());
  writeNotNull('edited_channel_post', instance.edited_channel_post?.toJson());
  writeNotNull('inline_query', instance.inline_query?.toJson());
  writeNotNull('chosen_inline_result', instance.chosen_inline_result?.toJson());
  writeNotNull('callback_query', instance.callback_query?.toJson());
  writeNotNull('shipping_query', instance.shipping_query?.toJson());
  writeNotNull('pre_checkout_query', instance.pre_checkout_query?.toJson());
  writeNotNull('poll', instance.poll?.toJson());
  writeNotNull('poll_answer', instance.poll_answer?.toJson());
  writeNotNull('my_chat_member', instance.my_chat_member?.toJson());
  writeNotNull('chat_member', instance.chat_member?.toJson());
  writeNotNull('chat_join_request', instance.chat_join_request?.toJson());
  return val;
}

WebhookInfo _$WebhookInfoFromJson(Map<String, dynamic> json) => WebhookInfo(
      url: json['url'] as String,
      has_custom_certificate: json['has_custom_certificate'] as bool,
      pending_update_count: json['pending_update_count'] as int,
      ip_address: json['ip_address'] as String?,
      last_error_date: json['last_error_date'] as int?,
      last_error_message: json['last_error_message'] as String?,
      max_connections: json['max_connections'] as int?,
      allowed_updates: (json['allowed_updates'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$WebhookInfoToJson(WebhookInfo instance) {
  final val = <String, dynamic>{
    'url': instance.url,
    'has_custom_certificate': instance.has_custom_certificate,
    'pending_update_count': instance.pending_update_count,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ip_address', instance.ip_address);
  writeNotNull('last_error_date', instance.last_error_date);
  writeNotNull('last_error_message', instance.last_error_message);
  writeNotNull('max_connections', instance.max_connections);
  writeNotNull('allowed_updates', instance.allowed_updates);
  return val;
}

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as int,
      is_bot: json['is_bot'] as bool,
      first_name: json['first_name'] as String,
      last_name: json['last_name'] as String?,
      username: json['username'] as String?,
      language_code: json['language_code'] as String?,
      can_join_groups: json['can_join_groups'] as bool?,
      can_read_all_group_messages: json['can_read_all_group_messages'] as bool?,
      supports_inline_queries: json['supports_inline_queries'] as bool?,
    );

Map<String, dynamic> _$UserToJson(User instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'is_bot': instance.is_bot,
    'first_name': instance.first_name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('last_name', instance.last_name);
  writeNotNull('username', instance.username);
  writeNotNull('language_code', instance.language_code);
  writeNotNull('can_join_groups', instance.can_join_groups);
  writeNotNull(
      'can_read_all_group_messages', instance.can_read_all_group_messages);
  writeNotNull('supports_inline_queries', instance.supports_inline_queries);
  return val;
}

Chat _$ChatFromJson(Map<String, dynamic> json) => Chat(
      id: json['id'] as int,
      type: json['type'] as String,
      title: json['title'] as String?,
      username: json['username'] as String?,
      first_name: json['first_name'] as String?,
      last_name: json['last_name'] as String?,
      photo: json['photo'] == null
          ? null
          : ChatPhoto.fromJson(json['photo'] as Map<String, dynamic>),
      bio: json['bio'] as String?,
      has_private_forwards: json['has_private_forwards'] as bool?,
      description: json['description'] as String?,
      invite_link: json['invite_link'] as String?,
      pinned_message: json['pinned_message'] == null
          ? null
          : Message.fromJson(json['pinned_message'] as Map<String, dynamic>),
      permissions: json['permissions'] == null
          ? null
          : ChatPermissions.fromJson(
              json['permissions'] as Map<String, dynamic>),
      slow_mode_delay: json['slow_mode_delay'] as int?,
      has_protected_content: json['has_protected_content'] as bool?,
      sticker_set_name: json['sticker_set_name'] as String?,
      can_set_sticker_set: json['can_set_sticker_set'] as bool?,
      linked_chat_id: json['linked_chat_id'] as int?,
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
  writeNotNull('first_name', instance.first_name);
  writeNotNull('last_name', instance.last_name);
  writeNotNull('photo', instance.photo?.toJson());
  writeNotNull('bio', instance.bio);
  writeNotNull('has_private_forwards', instance.has_private_forwards);
  writeNotNull('description', instance.description);
  writeNotNull('invite_link', instance.invite_link);
  writeNotNull('pinned_message', instance.pinned_message?.toJson());
  writeNotNull('permissions', instance.permissions?.toJson());
  writeNotNull('slow_mode_delay', instance.slow_mode_delay);
  writeNotNull('has_protected_content', instance.has_protected_content);
  writeNotNull('sticker_set_name', instance.sticker_set_name);
  writeNotNull('can_set_sticker_set', instance.can_set_sticker_set);
  writeNotNull('linked_chat_id', instance.linked_chat_id);
  writeNotNull('location', instance.location?.toJson());
  return val;
}

Message _$MessageFromJson(Map<String, dynamic> json) => Message(
      message_id: json['message_id'] as int,
      from: json['from'] == null
          ? null
          : User.fromJson(json['from'] as Map<String, dynamic>),
      sender_chat: json['sender_chat'] == null
          ? null
          : Chat.fromJson(json['sender_chat'] as Map<String, dynamic>),
      date: json['date'] as int,
      chat: Chat.fromJson(json['chat'] as Map<String, dynamic>),
      forward_from: json['forward_from'] == null
          ? null
          : User.fromJson(json['forward_from'] as Map<String, dynamic>),
      forward_from_chat: json['forward_from_chat'] == null
          ? null
          : Chat.fromJson(json['forward_from_chat'] as Map<String, dynamic>),
      forward_from_message_id: json['forward_from_message_id'] as int?,
      forward_signature: json['forward_signature'] as String?,
      forward_sender_name: json['forward_sender_name'] as String?,
      forward_date: json['forward_date'] as int?,
      is_automatic_forward: json['is_automatic_forward'] as bool?,
      reply_to_message: json['reply_to_message'] == null
          ? null
          : Message.fromJson(json['reply_to_message'] as Map<String, dynamic>),
      via_bot: json['via_bot'] == null
          ? null
          : User.fromJson(json['via_bot'] as Map<String, dynamic>),
      edit_date: json['edit_date'] as int?,
      has_protected_content: json['has_protected_content'] as bool?,
      media_group_id: json['media_group_id'] as String?,
      author_signature: json['author_signature'] as String?,
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
      video_note: json['video_note'] == null
          ? null
          : VideoNote.fromJson(json['video_note'] as Map<String, dynamic>),
      voice: json['voice'] == null
          ? null
          : Voice.fromJson(json['voice'] as Map<String, dynamic>),
      caption: json['caption'] as String?,
      caption_entities: (json['caption_entities'] as List<dynamic>?)
          ?.map((e) => MessageEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
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
      new_chat_members: (json['new_chat_members'] as List<dynamic>?)
          ?.map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
      left_chat_member: json['left_chat_member'] == null
          ? null
          : User.fromJson(json['left_chat_member'] as Map<String, dynamic>),
      new_chat_title: json['new_chat_title'] as String?,
      new_chat_photo: (json['new_chat_photo'] as List<dynamic>?)
          ?.map((e) => PhotoSize.fromJson(e as Map<String, dynamic>))
          .toList(),
      delete_chat_photo: json['delete_chat_photo'] as bool?,
      group_chat_created: json['group_chat_created'] as bool?,
      supergroup_chat_created: json['supergroup_chat_created'] as bool?,
      channel_chat_created: json['channel_chat_created'] as bool?,
      message_auto_delete_timer_changed:
          json['message_auto_delete_timer_changed'] == null
              ? null
              : MessageAutoDeleteTimerChanged.fromJson(
                  json['message_auto_delete_timer_changed']
                      as Map<String, dynamic>),
      migrate_to_chat_id: json['migrate_to_chat_id'] as int?,
      migrate_from_chat_id: json['migrate_from_chat_id'] as int?,
      pinned_message: json['pinned_message'] == null
          ? null
          : Message.fromJson(json['pinned_message'] as Map<String, dynamic>),
      invoice: json['invoice'] == null
          ? null
          : Invoice.fromJson(json['invoice'] as Map<String, dynamic>),
      successful_payment: json['successful_payment'] == null
          ? null
          : SuccessfulPayment.fromJson(
              json['successful_payment'] as Map<String, dynamic>),
      connected_website: json['connected_website'] as String?,
      passport_data: json['passport_data'] == null
          ? null
          : PassportData.fromJson(
              json['passport_data'] as Map<String, dynamic>),
      proximity_alert_triggered: json['proximity_alert_triggered'] == null
          ? null
          : ProximityAlertTriggered.fromJson(
              json['proximity_alert_triggered'] as Map<String, dynamic>),
      voice_chat_scheduled: json['voice_chat_scheduled'] == null
          ? null
          : VoiceChatScheduled.fromJson(
              json['voice_chat_scheduled'] as Map<String, dynamic>),
      voice_chat_started: json['voice_chat_started'] == null
          ? null
          : VoiceChatStarted.fromJson(
              json['voice_chat_started'] as Map<String, dynamic>),
      voice_chat_ended: json['voice_chat_ended'] == null
          ? null
          : VoiceChatEnded.fromJson(
              json['voice_chat_ended'] as Map<String, dynamic>),
      voice_chat_participants_invited:
          json['voice_chat_participants_invited'] == null
              ? null
              : VoiceChatParticipantsInvited.fromJson(
                  json['voice_chat_participants_invited']
                      as Map<String, dynamic>),
      reply_markup: json['reply_markup'] == null
          ? null
          : InlineKeyboardMarkup.fromJson(
              json['reply_markup'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MessageToJson(Message instance) {
  final val = <String, dynamic>{
    'message_id': instance.message_id,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('from', instance.from?.toJson());
  writeNotNull('sender_chat', instance.sender_chat?.toJson());
  val['date'] = instance.date;
  val['chat'] = instance.chat.toJson();
  writeNotNull('forward_from', instance.forward_from?.toJson());
  writeNotNull('forward_from_chat', instance.forward_from_chat?.toJson());
  writeNotNull('forward_from_message_id', instance.forward_from_message_id);
  writeNotNull('forward_signature', instance.forward_signature);
  writeNotNull('forward_sender_name', instance.forward_sender_name);
  writeNotNull('forward_date', instance.forward_date);
  writeNotNull('is_automatic_forward', instance.is_automatic_forward);
  writeNotNull('reply_to_message', instance.reply_to_message?.toJson());
  writeNotNull('via_bot', instance.via_bot?.toJson());
  writeNotNull('edit_date', instance.edit_date);
  writeNotNull('has_protected_content', instance.has_protected_content);
  writeNotNull('media_group_id', instance.media_group_id);
  writeNotNull('author_signature', instance.author_signature);
  writeNotNull('text', instance.text);
  writeNotNull('entities', instance.entities?.map((e) => e.toJson()).toList());
  writeNotNull('animation', instance.animation?.toJson());
  writeNotNull('audio', instance.audio?.toJson());
  writeNotNull('document', instance.document?.toJson());
  writeNotNull('photo', instance.photo?.map((e) => e.toJson()).toList());
  writeNotNull('sticker', instance.sticker?.toJson());
  writeNotNull('video', instance.video?.toJson());
  writeNotNull('video_note', instance.video_note?.toJson());
  writeNotNull('voice', instance.voice?.toJson());
  writeNotNull('caption', instance.caption);
  writeNotNull('caption_entities',
      instance.caption_entities?.map((e) => e.toJson()).toList());
  writeNotNull('contact', instance.contact?.toJson());
  writeNotNull('dice', instance.dice?.toJson());
  writeNotNull('game', instance.game?.toJson());
  writeNotNull('poll', instance.poll?.toJson());
  writeNotNull('venue', instance.venue?.toJson());
  writeNotNull('location', instance.location?.toJson());
  writeNotNull('new_chat_members',
      instance.new_chat_members?.map((e) => e.toJson()).toList());
  writeNotNull('left_chat_member', instance.left_chat_member?.toJson());
  writeNotNull('new_chat_title', instance.new_chat_title);
  writeNotNull('new_chat_photo',
      instance.new_chat_photo?.map((e) => e.toJson()).toList());
  writeNotNull('delete_chat_photo', instance.delete_chat_photo);
  writeNotNull('group_chat_created', instance.group_chat_created);
  writeNotNull('supergroup_chat_created', instance.supergroup_chat_created);
  writeNotNull('channel_chat_created', instance.channel_chat_created);
  writeNotNull('message_auto_delete_timer_changed',
      instance.message_auto_delete_timer_changed?.toJson());
  writeNotNull('migrate_to_chat_id', instance.migrate_to_chat_id);
  writeNotNull('migrate_from_chat_id', instance.migrate_from_chat_id);
  writeNotNull('pinned_message', instance.pinned_message?.toJson());
  writeNotNull('invoice', instance.invoice?.toJson());
  writeNotNull('successful_payment', instance.successful_payment?.toJson());
  writeNotNull('connected_website', instance.connected_website);
  writeNotNull('passport_data', instance.passport_data?.toJson());
  writeNotNull('proximity_alert_triggered',
      instance.proximity_alert_triggered?.toJson());
  writeNotNull('voice_chat_scheduled', instance.voice_chat_scheduled?.toJson());
  writeNotNull('voice_chat_started', instance.voice_chat_started?.toJson());
  writeNotNull('voice_chat_ended', instance.voice_chat_ended?.toJson());
  writeNotNull('voice_chat_participants_invited',
      instance.voice_chat_participants_invited?.toJson());
  writeNotNull('reply_markup', instance.reply_markup?.toJson());
  return val;
}

MessageId _$MessageIdFromJson(Map<String, dynamic> json) => MessageId(
      message_id: json['message_id'] as int,
    );

Map<String, dynamic> _$MessageIdToJson(MessageId instance) => <String, dynamic>{
      'message_id': instance.message_id,
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
  return val;
}

PhotoSize _$PhotoSizeFromJson(Map<String, dynamic> json) => PhotoSize(
      file_id: json['file_id'] as String,
      file_unique_id: json['file_unique_id'] as String,
      width: json['width'] as int,
      height: json['height'] as int,
      file_size: json['file_size'] as int?,
    );

Map<String, dynamic> _$PhotoSizeToJson(PhotoSize instance) {
  final val = <String, dynamic>{
    'file_id': instance.file_id,
    'file_unique_id': instance.file_unique_id,
    'width': instance.width,
    'height': instance.height,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('file_size', instance.file_size);
  return val;
}

Audio _$AudioFromJson(Map<String, dynamic> json) => Audio(
      file_id: json['file_id'] as String,
      file_unique_id: json['file_unique_id'] as String,
      duration: json['duration'] as int,
      performer: json['performer'] as String?,
      title: json['title'] as String?,
      file_name: json['file_name'] as String?,
      mime_type: json['mime_type'] as String?,
      file_size: json['file_size'] as int?,
      thumb: json['thumb'] == null
          ? null
          : PhotoSize.fromJson(json['thumb'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AudioToJson(Audio instance) {
  final val = <String, dynamic>{
    'file_id': instance.file_id,
    'file_unique_id': instance.file_unique_id,
    'duration': instance.duration,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('performer', instance.performer);
  writeNotNull('title', instance.title);
  writeNotNull('file_name', instance.file_name);
  writeNotNull('mime_type', instance.mime_type);
  writeNotNull('file_size', instance.file_size);
  writeNotNull('thumb', instance.thumb?.toJson());
  return val;
}

Document _$DocumentFromJson(Map<String, dynamic> json) => Document(
      file_id: json['file_id'] as String,
      file_unique_id: json['file_unique_id'] as String,
      thumb: json['thumb'] == null
          ? null
          : PhotoSize.fromJson(json['thumb'] as Map<String, dynamic>),
      file_name: json['file_name'] as String?,
      mime_type: json['mime_type'] as String?,
      file_size: json['file_size'] as int?,
    );

Map<String, dynamic> _$DocumentToJson(Document instance) {
  final val = <String, dynamic>{
    'file_id': instance.file_id,
    'file_unique_id': instance.file_unique_id,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('thumb', instance.thumb?.toJson());
  writeNotNull('file_name', instance.file_name);
  writeNotNull('mime_type', instance.mime_type);
  writeNotNull('file_size', instance.file_size);
  return val;
}

Video _$VideoFromJson(Map<String, dynamic> json) => Video(
      file_id: json['file_id'] as String,
      file_unique_id: json['file_unique_id'] as String,
      width: json['width'] as int,
      height: json['height'] as int,
      duration: json['duration'] as int,
      thumb: json['thumb'] == null
          ? null
          : PhotoSize.fromJson(json['thumb'] as Map<String, dynamic>),
      file_name: json['file_name'] as String?,
      mime_type: json['mime_type'] as String?,
      file_size: json['file_size'] as int?,
    );

Map<String, dynamic> _$VideoToJson(Video instance) {
  final val = <String, dynamic>{
    'file_id': instance.file_id,
    'file_unique_id': instance.file_unique_id,
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
  writeNotNull('file_name', instance.file_name);
  writeNotNull('mime_type', instance.mime_type);
  writeNotNull('file_size', instance.file_size);
  return val;
}

Animation _$AnimationFromJson(Map<String, dynamic> json) => Animation(
      file_id: json['file_id'] as String,
      file_unique_id: json['file_unique_id'] as String,
      width: json['width'] as int,
      height: json['height'] as int,
      duration: json['duration'] as int,
      thumb: json['thumb'] == null
          ? null
          : PhotoSize.fromJson(json['thumb'] as Map<String, dynamic>),
      file_name: json['file_name'] as String?,
      mime_type: json['mime_type'] as String?,
      file_size: json['file_size'] as int?,
    );

Map<String, dynamic> _$AnimationToJson(Animation instance) {
  final val = <String, dynamic>{
    'file_id': instance.file_id,
    'file_unique_id': instance.file_unique_id,
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
  writeNotNull('file_name', instance.file_name);
  writeNotNull('mime_type', instance.mime_type);
  writeNotNull('file_size', instance.file_size);
  return val;
}

Voice _$VoiceFromJson(Map<String, dynamic> json) => Voice(
      file_id: json['file_id'] as String,
      file_unique_id: json['file_unique_id'] as String,
      duration: json['duration'] as int,
      mime_type: json['mime_type'] as String?,
      file_size: json['file_size'] as int?,
    );

Map<String, dynamic> _$VoiceToJson(Voice instance) {
  final val = <String, dynamic>{
    'file_id': instance.file_id,
    'file_unique_id': instance.file_unique_id,
    'duration': instance.duration,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('mime_type', instance.mime_type);
  writeNotNull('file_size', instance.file_size);
  return val;
}

VideoNote _$VideoNoteFromJson(Map<String, dynamic> json) => VideoNote(
      file_id: json['file_id'] as String,
      file_unique_id: json['file_unique_id'] as String,
      length: json['length'] as int,
      duration: json['duration'] as int,
      thumb: json['thumb'] == null
          ? null
          : PhotoSize.fromJson(json['thumb'] as Map<String, dynamic>),
      file_size: json['file_size'] as int?,
    );

Map<String, dynamic> _$VideoNoteToJson(VideoNote instance) {
  final val = <String, dynamic>{
    'file_id': instance.file_id,
    'file_unique_id': instance.file_unique_id,
    'length': instance.length,
    'duration': instance.duration,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('thumb', instance.thumb?.toJson());
  writeNotNull('file_size', instance.file_size);
  return val;
}

Contact _$ContactFromJson(Map<String, dynamic> json) => Contact(
      phone_number: json['phone_number'] as String,
      first_name: json['first_name'] as String,
      last_name: json['last_name'] as String?,
      user_id: json['user_id'] as int?,
      vcard: json['vcard'] as String?,
    );

Map<String, dynamic> _$ContactToJson(Contact instance) {
  final val = <String, dynamic>{
    'phone_number': instance.phone_number,
    'first_name': instance.first_name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('last_name', instance.last_name);
  writeNotNull('user_id', instance.user_id);
  writeNotNull('vcard', instance.vcard);
  return val;
}

LoginUrl _$LoginUrlFromJson(Map<String, dynamic> json) => LoginUrl(
      url: json['url'] as String,
      forward_text: json['forward_text'] as String?,
      bot_username: json['bot_username'] as String?,
      request_write_access: json['request_write_access'] as bool?,
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

  writeNotNull('forward_text', instance.forward_text);
  writeNotNull('bot_username', instance.bot_username);
  writeNotNull('request_write_access', instance.request_write_access);
  return val;
}

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
      longitude: (json['longitude'] as num).toDouble(),
      latitude: (json['latitude'] as num).toDouble(),
      horizontal_accuracy: (json['horizontal_accuracy'] as num?)?.toDouble(),
      live_period: json['live_period'] as int?,
      heading: json['heading'] as int?,
      proximity_alert_radius: json['proximity_alert_radius'] as int?,
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

  writeNotNull('horizontal_accuracy', instance.horizontal_accuracy);
  writeNotNull('live_period', instance.live_period);
  writeNotNull('heading', instance.heading);
  writeNotNull('proximity_alert_radius', instance.proximity_alert_radius);
  return val;
}

Venue _$VenueFromJson(Map<String, dynamic> json) => Venue(
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
      title: json['title'] as String,
      address: json['address'] as String,
      foursquare_id: json['foursquare_id'] as String?,
      foursquare_type: json['foursquare_type'] as String?,
      google_place_id: json['google_place_id'] as String?,
      google_place_type: json['google_place_type'] as String?,
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

  writeNotNull('foursquare_id', instance.foursquare_id);
  writeNotNull('foursquare_type', instance.foursquare_type);
  writeNotNull('google_place_id', instance.google_place_id);
  writeNotNull('google_place_type', instance.google_place_type);
  return val;
}

PollOption _$PollOptionFromJson(Map<String, dynamic> json) => PollOption(
      text: json['text'] as String,
      voter_count: json['voter_count'] as int,
    );

Map<String, dynamic> _$PollOptionToJson(PollOption instance) =>
    <String, dynamic>{
      'text': instance.text,
      'voter_count': instance.voter_count,
    };

PollAnswer _$PollAnswerFromJson(Map<String, dynamic> json) => PollAnswer(
      poll_id: json['poll_id'] as String,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      option_ids:
          (json['option_ids'] as List<dynamic>).map((e) => e as int).toList(),
    );

Map<String, dynamic> _$PollAnswerToJson(PollAnswer instance) =>
    <String, dynamic>{
      'poll_id': instance.poll_id,
      'user': instance.user.toJson(),
      'option_ids': instance.option_ids,
    };

Poll _$PollFromJson(Map<String, dynamic> json) => Poll(
      id: json['id'] as String,
      question: json['question'] as String,
      options: (json['options'] as List<dynamic>)
          .map((e) => PollOption.fromJson(e as Map<String, dynamic>))
          .toList(),
      total_voter_count: json['total_voter_count'] as int,
      is_closed: json['is_closed'] as bool,
      is_anonymous: json['is_anonymous'] as bool,
      type: json['type'] as String,
      allows_multiple_answers: json['allows_multiple_answers'] as bool,
      correct_option_id: json['correct_option_id'] as int?,
      explanation: json['explanation'] as String?,
      explanation_entities: (json['explanation_entities'] as List<dynamic>?)
          ?.map((e) => MessageEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      open_period: json['open_period'] as int?,
      close_date: json['close_date'] as int?,
    );

Map<String, dynamic> _$PollToJson(Poll instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'question': instance.question,
    'options': instance.options.map((e) => e.toJson()).toList(),
    'total_voter_count': instance.total_voter_count,
    'is_closed': instance.is_closed,
    'is_anonymous': instance.is_anonymous,
    'type': instance.type,
    'allows_multiple_answers': instance.allows_multiple_answers,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('correct_option_id', instance.correct_option_id);
  writeNotNull('explanation', instance.explanation);
  writeNotNull('explanation_entities',
      instance.explanation_entities?.map((e) => e.toJson()).toList());
  writeNotNull('open_period', instance.open_period);
  writeNotNull('close_date', instance.close_date);
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

MessageAutoDeleteTimerChanged _$MessageAutoDeleteTimerChangedFromJson(
        Map<String, dynamic> json) =>
    MessageAutoDeleteTimerChanged(
      message_auto_delete_time: json['message_auto_delete_time'] as int,
    );

Map<String, dynamic> _$MessageAutoDeleteTimerChangedToJson(
        MessageAutoDeleteTimerChanged instance) =>
    <String, dynamic>{
      'message_auto_delete_time': instance.message_auto_delete_time,
    };

VoiceChatScheduled _$VoiceChatScheduledFromJson(Map<String, dynamic> json) =>
    VoiceChatScheduled(
      json['start_date'] as int,
    );

Map<String, dynamic> _$VoiceChatScheduledToJson(VoiceChatScheduled instance) =>
    <String, dynamic>{
      'start_date': instance.start_date,
    };

VoiceChatStarted _$VoiceChatStartedFromJson(Map<String, dynamic> json) =>
    VoiceChatStarted();

Map<String, dynamic> _$VoiceChatStartedToJson(VoiceChatStarted instance) =>
    <String, dynamic>{};

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

UserProfilePhotos _$UserProfilePhotosFromJson(Map<String, dynamic> json) =>
    UserProfilePhotos(
      total_count: json['total_count'] as int,
      photos: (json['photos'] as List<dynamic>)
          .map((e) => (e as List<dynamic>)
              .map((e) => PhotoSize.fromJson(e as Map<String, dynamic>))
              .toList())
          .toList(),
    );

Map<String, dynamic> _$UserProfilePhotosToJson(UserProfilePhotos instance) =>
    <String, dynamic>{
      'total_count': instance.total_count,
      'photos': instance.photos
          .map((e) => e.map((e) => e.toJson()).toList())
          .toList(),
    };

File _$FileFromJson(Map<String, dynamic> json) => File(
      file_id: json['file_id'] as String,
      file_unique_id: json['file_unique_id'] as String,
      file_size: json['file_size'] as int?,
      file_path: json['file_path'] as String?,
    );

Map<String, dynamic> _$FileToJson(File instance) {
  final val = <String, dynamic>{
    'file_id': instance.file_id,
    'file_unique_id': instance.file_unique_id,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('file_size', instance.file_size);
  writeNotNull('file_path', instance.file_path);
  return val;
}

ReplyMarkup _$ReplyMarkupFromJson(Map<String, dynamic> json) => ReplyMarkup();

Map<String, dynamic> _$ReplyMarkupToJson(ReplyMarkup instance) =>
    <String, dynamic>{};

ReplyKeyboardMarkup _$ReplyKeyboardMarkupFromJson(Map<String, dynamic> json) =>
    ReplyKeyboardMarkup(
      keyboard: (json['keyboard'] as List<dynamic>)
          .map((e) => (e as List<dynamic>)
              .map((e) => KeyboardButton.fromJson(e as Map<String, dynamic>))
              .toList())
          .toList(),
      resize_keyboard: json['resize_keyboard'] as bool?,
      one_time_keyboard: json['one_time_keyboard'] as bool?,
      input_field_placeholder: json['input_field_placeholder'] as String?,
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

  writeNotNull('resize_keyboard', instance.resize_keyboard);
  writeNotNull('one_time_keyboard', instance.one_time_keyboard);
  writeNotNull('input_field_placeholder', instance.input_field_placeholder);
  writeNotNull('selective', instance.selective);
  return val;
}

KeyboardButton _$KeyboardButtonFromJson(Map<String, dynamic> json) =>
    KeyboardButton(
      text: json['text'] as String,
      request_contact: json['request_contact'] as bool?,
      request_location: json['request_location'] as bool?,
      request_poll: json['request_poll'] == null
          ? null
          : KeyboardButtonPollType.fromJson(
              json['request_poll'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$KeyboardButtonToJson(KeyboardButton instance) {
  final val = <String, dynamic>{
    'text': instance.text,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('request_contact', instance.request_contact);
  writeNotNull('request_location', instance.request_location);
  writeNotNull('request_poll', instance.request_poll?.toJson());
  return val;
}

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

ReplyKeyboardRemove _$ReplyKeyboardRemoveFromJson(Map<String, dynamic> json) =>
    ReplyKeyboardRemove(
      remove_keyboard: json['remove_keyboard'] as bool,
      selective: json['selective'] as bool?,
    );

Map<String, dynamic> _$ReplyKeyboardRemoveToJson(ReplyKeyboardRemove instance) {
  final val = <String, dynamic>{
    'remove_keyboard': instance.remove_keyboard,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('selective', instance.selective);
  return val;
}

InlineKeyboardMarkup _$InlineKeyboardMarkupFromJson(
        Map<String, dynamic> json) =>
    InlineKeyboardMarkup(
      inline_keyboard: (json['inline_keyboard'] as List<dynamic>)
          .map((e) => (e as List<dynamic>)
              .map((e) =>
                  InlineKeyboardButton.fromJson(e as Map<String, dynamic>))
              .toList())
          .toList(),
    );

Map<String, dynamic> _$InlineKeyboardMarkupToJson(
        InlineKeyboardMarkup instance) =>
    <String, dynamic>{
      'inline_keyboard': instance.inline_keyboard
          .map((e) => e.map((e) => e.toJson()).toList())
          .toList(),
    };

InlineKeyboardButton _$InlineKeyboardButtonFromJson(
        Map<String, dynamic> json) =>
    InlineKeyboardButton(
      text: json['text'] as String,
      url: json['url'] as String?,
      login_url: json['login_url'] == null
          ? null
          : LoginUrl.fromJson(json['login_url'] as Map<String, dynamic>),
      callback_data: json['callback_data'] as String?,
      switch_inline_query: json['switch_inline_query'] as String?,
      switch_inline_query_current_chat:
          json['switch_inline_query_current_chat'] as String?,
      callback_game: json['callback_game'] == null
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
  writeNotNull('login_url', instance.login_url?.toJson());
  writeNotNull('callback_data', instance.callback_data);
  writeNotNull('switch_inline_query', instance.switch_inline_query);
  writeNotNull('switch_inline_query_current_chat',
      instance.switch_inline_query_current_chat);
  writeNotNull('callback_game', instance.callback_game?.toJson());
  writeNotNull('pay', instance.pay);
  return val;
}

CallbackQuery _$CallbackQueryFromJson(Map<String, dynamic> json) =>
    CallbackQuery(
      id: json['id'] as String,
      from: User.fromJson(json['from'] as Map<String, dynamic>),
      message: json['message'] == null
          ? null
          : Message.fromJson(json['message'] as Map<String, dynamic>),
      inline_message_id: json['inline_message_id'] as String?,
      chat_instance: json['chat_instance'] as String?,
      data: json['data'] as String?,
      game_short_name: json['game_short_name'] as String?,
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
  writeNotNull('inline_message_id', instance.inline_message_id);
  writeNotNull('chat_instance', instance.chat_instance);
  writeNotNull('data', instance.data);
  writeNotNull('game_short_name', instance.game_short_name);
  return val;
}

ForceReply _$ForceReplyFromJson(Map<String, dynamic> json) => ForceReply(
      force_reply: json['force_reply'] as bool,
      input_field_placeholder: json['input_field_placeholder'] as String?,
      selective: json['selective'] as bool?,
    );

Map<String, dynamic> _$ForceReplyToJson(ForceReply instance) {
  final val = <String, dynamic>{
    'force_reply': instance.force_reply,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('input_field_placeholder', instance.input_field_placeholder);
  writeNotNull('selective', instance.selective);
  return val;
}

ChatPhoto _$ChatPhotoFromJson(Map<String, dynamic> json) => ChatPhoto(
      small_file_id: json['small_file_id'] as String,
      small_file_unique_id: json['small_file_unique_id'] as String,
      big_file_id: json['big_file_id'] as String,
      big_file_unique_id: json['big_file_unique_id'] as String,
    );

Map<String, dynamic> _$ChatPhotoToJson(ChatPhoto instance) => <String, dynamic>{
      'small_file_id': instance.small_file_id,
      'small_file_unique_id': instance.small_file_unique_id,
      'big_file_id': instance.big_file_id,
      'big_file_unique_id': instance.big_file_unique_id,
    };

ChatInviteLink _$ChatInviteLinkFromJson(Map<String, dynamic> json) =>
    ChatInviteLink(
      invite_link: json['invite_link'] as String,
      creator: User.fromJson(json['creator'] as Map<String, dynamic>),
      creates_join_request: json['creates_join_request'] as bool,
      is_primary: json['is_primary'] as bool,
      is_revoked: json['is_revoked'] as bool,
      name: json['name'] as String?,
      expire_date: json['expire_date'] as int?,
      member_limit: json['member_limit'] as int?,
      pending_join_request_count: json['pending_join_request_count'] as int?,
    );

Map<String, dynamic> _$ChatInviteLinkToJson(ChatInviteLink instance) {
  final val = <String, dynamic>{
    'invite_link': instance.invite_link,
    'creator': instance.creator.toJson(),
    'creates_join_request': instance.creates_join_request,
    'is_primary': instance.is_primary,
    'is_revoked': instance.is_revoked,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('expire_date', instance.expire_date);
  writeNotNull('member_limit', instance.member_limit);
  writeNotNull(
      'pending_join_request_count', instance.pending_join_request_count);
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

ChatMemberOwner _$ChatMemberOwnerFromJson(Map<String, dynamic> json) =>
    ChatMemberOwner(
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      status: json['status'] as String,
      is_anonymous: json['is_anonymous'] as bool,
      custom_title: json['custom_title'] as String?,
    );

Map<String, dynamic> _$ChatMemberOwnerToJson(ChatMemberOwner instance) {
  final val = <String, dynamic>{
    'status': instance.status,
    'user': instance.user.toJson(),
    'is_anonymous': instance.is_anonymous,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('custom_title', instance.custom_title);
  return val;
}

ChatMemberAdministrator _$ChatMemberAdministratorFromJson(
        Map<String, dynamic> json) =>
    ChatMemberAdministrator(
      status: json['status'] as String,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      can_be_edited: json['can_be_edited'] as bool? ?? false,
      is_anonymous: json['is_anonymous'] as bool? ?? false,
      can_manage_chat: json['can_manage_chat'] as bool? ?? false,
      can_delete_messages: json['can_delete_messages'] as bool? ?? false,
      can_manage_voice_chats: json['can_manage_voice_chats'] as bool? ?? false,
      can_restrict_members: json['can_restrict_members'] as bool? ?? false,
      can_promote_members: json['can_promote_members'] as bool? ?? false,
      can_change_info: json['can_change_info'] as bool? ?? false,
      can_invite_users: json['can_invite_users'] as bool? ?? false,
      can_post_messages: json['can_post_messages'] as bool?,
      can_edit_messages: json['can_edit_messages'] as bool?,
      can_pin_messages: json['can_pin_messages'] as bool?,
      custom_title: json['custom_title'] as String?,
    );

Map<String, dynamic> _$ChatMemberAdministratorToJson(
    ChatMemberAdministrator instance) {
  final val = <String, dynamic>{
    'status': instance.status,
    'user': instance.user.toJson(),
    'can_be_edited': instance.can_be_edited,
    'is_anonymous': instance.is_anonymous,
    'can_manage_chat': instance.can_manage_chat,
    'can_delete_messages': instance.can_delete_messages,
    'can_manage_voice_chats': instance.can_manage_voice_chats,
    'can_restrict_members': instance.can_restrict_members,
    'can_promote_members': instance.can_promote_members,
    'can_change_info': instance.can_change_info,
    'can_invite_users': instance.can_invite_users,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('can_post_messages', instance.can_post_messages);
  writeNotNull('can_edit_messages', instance.can_edit_messages);
  writeNotNull('can_pin_messages', instance.can_pin_messages);
  writeNotNull('custom_title', instance.custom_title);
  return val;
}

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

ChatMemberRestricted _$ChatMemberRestrictedFromJson(
        Map<String, dynamic> json) =>
    ChatMemberRestricted(
      status: json['status'] as String,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      is_member: json['is_member'] as bool? ?? false,
      can_change_info: json['can_change_info'] as bool? ?? false,
      can_invite_users: json['can_invite_users'] as bool? ?? false,
      can_pin_messages: json['can_pin_messages'] as bool? ?? false,
      can_send_messages: json['can_send_messages'] as bool? ?? false,
      can_send_media_messages:
          json['can_send_media_messages'] as bool? ?? false,
      can_send_polls: json['can_send_polls'] as bool? ?? false,
      can_send_other_messages:
          json['can_send_other_messages'] as bool? ?? false,
      can_add_web_page_previews:
          json['can_add_web_page_previews'] as bool? ?? false,
      until_date: json['until_date'] as int,
    );

Map<String, dynamic> _$ChatMemberRestrictedToJson(
        ChatMemberRestricted instance) =>
    <String, dynamic>{
      'status': instance.status,
      'user': instance.user.toJson(),
      'is_member': instance.is_member,
      'can_change_info': instance.can_change_info,
      'can_invite_users': instance.can_invite_users,
      'can_pin_messages': instance.can_pin_messages,
      'can_send_messages': instance.can_send_messages,
      'can_send_media_messages': instance.can_send_media_messages,
      'can_send_polls': instance.can_send_polls,
      'can_send_other_messages': instance.can_send_other_messages,
      'can_add_web_page_previews': instance.can_add_web_page_previews,
      'until_date': instance.until_date,
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

ChatMemberBanned _$ChatMemberBannedFromJson(Map<String, dynamic> json) =>
    ChatMemberBanned(
      status: json['status'] as String,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      until_date: json['until_date'] as int,
    );

Map<String, dynamic> _$ChatMemberBannedToJson(ChatMemberBanned instance) =>
    <String, dynamic>{
      'status': instance.status,
      'user': instance.user.toJson(),
      'until_date': instance.until_date,
    };

ChatMemberUpdated _$ChatMemberUpdatedFromJson(Map<String, dynamic> json) =>
    ChatMemberUpdated(
      chat: json['chat'] == null
          ? null
          : Chat.fromJson(json['chat'] as Map<String, dynamic>),
      from: json['from'] == null
          ? null
          : User.fromJson(json['from'] as Map<String, dynamic>),
      old_chat_member: json['old_chat_member'] == null
          ? null
          : ChatMember.fromJson(
              json['old_chat_member'] as Map<String, dynamic>),
      new_chat_member: json['new_chat_member'] == null
          ? null
          : ChatMember.fromJson(
              json['new_chat_member'] as Map<String, dynamic>),
      invite_link: json['invite_link'] == null
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
  writeNotNull('old_chat_member', instance.old_chat_member?.toJson());
  writeNotNull('new_chat_member', instance.new_chat_member?.toJson());
  writeNotNull('invite_link', instance.invite_link?.toJson());
  return val;
}

ChatJoinRequest _$ChatJoinRequestFromJson(Map<String, dynamic> json) =>
    ChatJoinRequest(
      chat: Chat.fromJson(json['chat'] as Map<String, dynamic>),
      from: User.fromJson(json['from'] as Map<String, dynamic>),
      date: json['date'] as int,
      bio: json['bio'] as String?,
      invite_link: json['invite_link'] == null
          ? null
          : ChatInviteLink.fromJson(
              json['invite_link'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChatJoinRequestToJson(ChatJoinRequest instance) {
  final val = <String, dynamic>{
    'chat': instance.chat.toJson(),
    'from': instance.from.toJson(),
    'date': instance.date,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('bio', instance.bio);
  writeNotNull('invite_link', instance.invite_link?.toJson());
  return val;
}

ChatPermissions _$ChatPermissionsFromJson(Map<String, dynamic> json) =>
    ChatPermissions(
      can_send_messages: json['can_send_messages'] as bool?,
      can_send_media_messages: json['can_send_media_messages'] as bool?,
      can_send_polls: json['can_send_polls'] as bool?,
      can_send_other_messages: json['can_send_other_messages'] as bool?,
      can_add_web_page_previews: json['can_add_web_page_previews'] as bool?,
      can_change_info: json['can_change_info'] as bool?,
      can_invite_users: json['can_invite_users'] as bool?,
      can_pin_messages: json['can_pin_messages'] as bool?,
    );

Map<String, dynamic> _$ChatPermissionsToJson(ChatPermissions instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('can_send_messages', instance.can_send_messages);
  writeNotNull('can_send_media_messages', instance.can_send_media_messages);
  writeNotNull('can_send_polls', instance.can_send_polls);
  writeNotNull('can_send_other_messages', instance.can_send_other_messages);
  writeNotNull('can_add_web_page_previews', instance.can_add_web_page_previews);
  writeNotNull('can_change_info', instance.can_change_info);
  writeNotNull('can_invite_users', instance.can_invite_users);
  writeNotNull('can_pin_messages', instance.can_pin_messages);
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

BotCommand _$BotCommandFromJson(Map<String, dynamic> json) => BotCommand(
      command: json['command'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$BotCommandToJson(BotCommand instance) =>
    <String, dynamic>{
      'command': instance.command,
      'description': instance.description,
    };

BotCommandScope _$BotCommandScopeFromJson(Map<String, dynamic> json) =>
    BotCommandScope(
      type: json['type'] as String,
    );

Map<String, dynamic> _$BotCommandScopeToJson(BotCommandScope instance) =>
    <String, dynamic>{
      'type': instance.type,
    };

BotCommandScopeDefault _$BotCommandScopeDefaultFromJson(
        Map<String, dynamic> json) =>
    BotCommandScopeDefault(
      type: json['type'] as String? ?? BotCommandScope.DEFAULT,
    );

Map<String, dynamic> _$BotCommandScopeDefaultToJson(
        BotCommandScopeDefault instance) =>
    <String, dynamic>{
      'type': instance.type,
    };

BotCommandScopeAllPrivateChats _$BotCommandScopeAllPrivateChatsFromJson(
        Map<String, dynamic> json) =>
    BotCommandScopeAllPrivateChats(
      type: json['type'] as String? ?? BotCommandScope.ALL_PRIVATE_CHATS,
    );

Map<String, dynamic> _$BotCommandScopeAllPrivateChatsToJson(
        BotCommandScopeAllPrivateChats instance) =>
    <String, dynamic>{
      'type': instance.type,
    };

BotCommandScopeAllGroupChats _$BotCommandScopeAllGroupChatsFromJson(
        Map<String, dynamic> json) =>
    BotCommandScopeAllGroupChats(
      type: json['type'] as String? ?? BotCommandScope.ALL_GROUP_CHATS,
    );

Map<String, dynamic> _$BotCommandScopeAllGroupChatsToJson(
        BotCommandScopeAllGroupChats instance) =>
    <String, dynamic>{
      'type': instance.type,
    };

BotCommandScopeAllChatAdministrators
    _$BotCommandScopeAllChatAdministratorsFromJson(Map<String, dynamic> json) =>
        BotCommandScopeAllChatAdministrators(
          type: json['type'] as String? ??
              BotCommandScope.ALL_CHAT_ADMINISTRATORS,
        );

Map<String, dynamic> _$BotCommandScopeAllChatAdministratorsToJson(
        BotCommandScopeAllChatAdministrators instance) =>
    <String, dynamic>{
      'type': instance.type,
    };

BotCommandScopeChat _$BotCommandScopeChatFromJson(Map<String, dynamic> json) =>
    BotCommandScopeChat(
      type: json['type'] as String? ?? BotCommandScope.CHAT,
      chat_id: json['chat_id'],
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

  writeNotNull('chat_id', instance.chat_id);
  return val;
}

BotCommandScopeChatAdministrators _$BotCommandScopeChatAdministratorsFromJson(
        Map<String, dynamic> json) =>
    BotCommandScopeChatAdministrators(
      type: json['type'] as String? ?? BotCommandScope.CHAT_ADMINISTRATORS,
      chat_id: json['chat_id'],
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

  writeNotNull('chat_id', instance.chat_id);
  return val;
}

BotCommandScopeChatMember _$BotCommandScopeChatMemberFromJson(
        Map<String, dynamic> json) =>
    BotCommandScopeChatMember(
      type: json['type'] as String? ?? BotCommandScope.CHAT_MEMBER,
      chat_id: json['chat_id'],
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

  writeNotNull('chat_id', instance.chat_id);
  return val;
}

ResponseParameters _$ResponseParametersFromJson(Map<String, dynamic> json) =>
    ResponseParameters(
      migrate_to_chat_id: json['migrate_to_chat_id'] as int?,
      retry_after: json['retry_after'] as int?,
    );

Map<String, dynamic> _$ResponseParametersToJson(ResponseParameters instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('migrate_to_chat_id', instance.migrate_to_chat_id);
  writeNotNull('retry_after', instance.retry_after);
  return val;
}

InputMedia _$InputMediaFromJson(Map<String, dynamic> json) => InputMedia(
      type: json['type'] as String,
      media: json['media'] as String,
      caption: json['caption'] as String?,
      parse_mode: json['parse_mode'] as String?,
      caption_entities: (json['caption_entities'] as List<dynamic>?)
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
  writeNotNull('parse_mode', instance.parse_mode);
  writeNotNull('caption_entities',
      instance.caption_entities?.map((e) => e.toJson()).toList());
  return val;
}

InputMediaPhoto _$InputMediaPhotoFromJson(Map<String, dynamic> json) =>
    InputMediaPhoto(
      type: json['type'] as String? ?? InputMedia.PHOTO,
      media: json['media'] as String,
      caption: json['caption'] as String?,
      parse_mode: json['parse_mode'] as String?,
      caption_entities: (json['caption_entities'] as List<dynamic>?)
          ?.map((e) => MessageEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
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
  writeNotNull('parse_mode', instance.parse_mode);
  writeNotNull('caption_entities',
      instance.caption_entities?.map((e) => e.toJson()).toList());
  return val;
}

InputMediaVideo _$InputMediaVideoFromJson(Map<String, dynamic> json) =>
    InputMediaVideo(
      type: json['type'] as String? ?? InputMedia.VIDEO,
      media: json['media'] as String,
      caption: json['caption'] as String?,
      parse_mode: json['parse_mode'] as String?,
      caption_entities: (json['caption_entities'] as List<dynamic>?)
          ?.map((e) => MessageEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      thumb: json['thumb'],
      width: json['width'] as int?,
      height: json['height'] as int?,
      duration: json['duration'] as int?,
      supports_streaming: json['supports_streaming'] as bool?,
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
  writeNotNull('parse_mode', instance.parse_mode);
  writeNotNull('caption_entities',
      instance.caption_entities?.map((e) => e.toJson()).toList());
  writeNotNull('thumb', instance.thumb);
  writeNotNull('width', instance.width);
  writeNotNull('height', instance.height);
  writeNotNull('duration', instance.duration);
  writeNotNull('supports_streaming', instance.supports_streaming);
  return val;
}

InputMediaAnimation _$InputMediaAnimationFromJson(Map<String, dynamic> json) =>
    InputMediaAnimation(
      type: json['type'] as String? ?? InputMedia.ANIMATION,
      media: json['media'] as String,
      thumb: json['thumb'],
      caption: json['caption'] as String?,
      parse_mode: json['parse_mode'] as String?,
      caption_entities: (json['caption_entities'] as List<dynamic>?)
          ?.map((e) => MessageEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      width: json['width'] as int?,
      height: json['height'] as int?,
      duration: json['duration'] as int?,
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
  writeNotNull('parse_mode', instance.parse_mode);
  writeNotNull('caption_entities',
      instance.caption_entities?.map((e) => e.toJson()).toList());
  writeNotNull('thumb', instance.thumb);
  writeNotNull('width', instance.width);
  writeNotNull('height', instance.height);
  writeNotNull('duration', instance.duration);
  return val;
}

InputMediaAudio _$InputMediaAudioFromJson(Map<String, dynamic> json) =>
    InputMediaAudio(
      type: json['type'] as String? ?? InputMedia.AUDIO,
      media: json['media'] as String,
      thumb: json['thumb'],
      caption: json['caption'] as String?,
      parse_mode: json['parse_mode'] as String?,
      caption_entities: (json['caption_entities'] as List<dynamic>?)
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
  writeNotNull('parse_mode', instance.parse_mode);
  writeNotNull('caption_entities',
      instance.caption_entities?.map((e) => e.toJson()).toList());
  writeNotNull('thumb', instance.thumb);
  writeNotNull('duration', instance.duration);
  writeNotNull('performer', instance.performer);
  writeNotNull('title', instance.title);
  return val;
}

InputMediaDocument _$InputMediaDocumentFromJson(Map<String, dynamic> json) =>
    InputMediaDocument(
      type: json['type'] as String? ?? InputMedia.DOCUMENT,
      media: json['media'] as String,
      thumb: json['thumb'],
      caption: json['caption'] as String?,
      parse_mode: json['parse_mode'] as String?,
      caption_entities: (json['caption_entities'] as List<dynamic>?)
          ?.map((e) => MessageEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      disable_content_type_detection:
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
  writeNotNull('parse_mode', instance.parse_mode);
  writeNotNull('caption_entities',
      instance.caption_entities?.map((e) => e.toJson()).toList());
  writeNotNull('thumb', instance.thumb);
  writeNotNull('disable_content_type_detection',
      instance.disable_content_type_detection);
  return val;
}

Sticker _$StickerFromJson(Map<String, dynamic> json) => Sticker(
      file_id: json['file_id'] as String,
      file_unique_id: json['file_unique_id'] as String,
      width: json['width'] as int,
      height: json['height'] as int,
      is_animated: json['is_animated'] as bool,
      thumb: json['thumb'] == null
          ? null
          : PhotoSize.fromJson(json['thumb'] as Map<String, dynamic>),
      emoji: json['emoji'] as String?,
      set_name: json['set_name'] as String?,
      mask_position: json['mask_position'] == null
          ? null
          : MaskPosition.fromJson(
              json['mask_position'] as Map<String, dynamic>),
      file_size: json['file_size'] as int?,
    );

Map<String, dynamic> _$StickerToJson(Sticker instance) {
  final val = <String, dynamic>{
    'file_id': instance.file_id,
    'file_unique_id': instance.file_unique_id,
    'width': instance.width,
    'height': instance.height,
    'is_animated': instance.is_animated,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('thumb', instance.thumb?.toJson());
  writeNotNull('emoji', instance.emoji);
  writeNotNull('set_name', instance.set_name);
  writeNotNull('mask_position', instance.mask_position?.toJson());
  writeNotNull('file_size', instance.file_size);
  return val;
}

StickerSet _$StickerSetFromJson(Map<String, dynamic> json) => StickerSet(
      name: json['name'] as String,
      title: json['title'] as String,
      is_animated: json['is_animated'] as bool,
      contains_masks: json['contains_masks'] as bool,
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
    'is_animated': instance.is_animated,
    'contains_masks': instance.contains_masks,
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

MaskPosition _$MaskPositionFromJson(Map<String, dynamic> json) => MaskPosition(
      point: json['point'] as String,
      x_shift: (json['x_shift'] as num).toDouble(),
      y_shift: (json['y_shift'] as num).toDouble(),
      scale: (json['scale'] as num).toDouble(),
    );

Map<String, dynamic> _$MaskPositionToJson(MaskPosition instance) =>
    <String, dynamic>{
      'point': instance.point,
      'x_shift': instance.x_shift,
      'y_shift': instance.y_shift,
      'scale': instance.scale,
    };

InlineQuery _$InlineQueryFromJson(Map<String, dynamic> json) => InlineQuery(
      id: json['id'] as String,
      from: User.fromJson(json['from'] as Map<String, dynamic>),
      query: json['query'] as String,
      offset: json['offset'] as String,
      chat_type: json['chat_type'] as String?,
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

  writeNotNull('chat_type', instance.chat_type);
  writeNotNull('location', instance.location?.toJson());
  return val;
}

InlineQueryResult _$InlineQueryResultFromJson(Map<String, dynamic> json) =>
    InlineQueryResult(
      type: json['type'] as String,
      id: json['id'] as String,
      reply_markup: json['reply_markup'] == null
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

  writeNotNull('reply_markup', instance.reply_markup?.toJson());
  return val;
}

InlineQueryResultArticle _$InlineQueryResultArticleFromJson(
        Map<String, dynamic> json) =>
    InlineQueryResultArticle(
      id: json['id'] as String,
      type: json['type'] as String? ?? InlineQueryResult.ARTICLE,
      title: json['title'] as String,
      input_message_content: InputMessageContent.fromJson(
          json['input_message_content'] as Map<String, dynamic>),
      reply_markup: json['reply_markup'] == null
          ? null
          : InlineKeyboardMarkup.fromJson(
              json['reply_markup'] as Map<String, dynamic>),
      url: json['url'] as String?,
      hide_url: json['hide_url'] as bool?,
      description: json['description'] as String?,
      thumb_url: json['thumb_url'] as String?,
      thumb_width: json['thumb_width'] as String?,
      thumb_height: json['thumb_height'] as String?,
    );

Map<String, dynamic> _$InlineQueryResultArticleToJson(
    InlineQueryResultArticle instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'type': instance.type,
    'title': instance.title,
    'input_message_content': instance.input_message_content.toJson(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('reply_markup', instance.reply_markup?.toJson());
  writeNotNull('url', instance.url);
  writeNotNull('hide_url', instance.hide_url);
  writeNotNull('description', instance.description);
  writeNotNull('thumb_url', instance.thumb_url);
  writeNotNull('thumb_width', instance.thumb_width);
  writeNotNull('thumb_height', instance.thumb_height);
  return val;
}

InlineQueryResultPhoto _$InlineQueryResultPhotoFromJson(
        Map<String, dynamic> json) =>
    InlineQueryResultPhoto(
      id: json['id'] as String,
      type: json['type'] as String? ?? InlineQueryResult.PHOTO,
      photo_url: json['photo_url'] as String,
      thumb_url: json['thumb_url'] as String,
      photo_width: json['photo_width'] as int?,
      photo_height: json['photo_height'] as int?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      caption: json['caption'] as String?,
      parse_mode: json['parse_mode'] as String?,
      caption_entities: (json['caption_entities'] as List<dynamic>?)
          ?.map((e) => MessageEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      reply_markup: json['reply_markup'] == null
          ? null
          : InlineKeyboardMarkup.fromJson(
              json['reply_markup'] as Map<String, dynamic>),
      input_message_content: json['input_message_content'] == null
          ? null
          : InputMessageContent.fromJson(
              json['input_message_content'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InlineQueryResultPhotoToJson(
    InlineQueryResultPhoto instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'type': instance.type,
    'photo_url': instance.photo_url,
    'thumb_url': instance.thumb_url,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('photo_width', instance.photo_width);
  writeNotNull('photo_height', instance.photo_height);
  writeNotNull('title', instance.title);
  writeNotNull('description', instance.description);
  writeNotNull('caption', instance.caption);
  writeNotNull('parse_mode', instance.parse_mode);
  writeNotNull('caption_entities',
      instance.caption_entities?.map((e) => e.toJson()).toList());
  writeNotNull('reply_markup', instance.reply_markup?.toJson());
  writeNotNull(
      'input_message_content', instance.input_message_content?.toJson());
  return val;
}

InlineQueryResultGif _$InlineQueryResultGifFromJson(
        Map<String, dynamic> json) =>
    InlineQueryResultGif(
      id: json['id'] as String,
      type: json['type'] as String? ?? InlineQueryResult.GIF,
      gif_url: json['gif_url'] as String,
      gif_width: json['gif_width'] as int?,
      gif_height: json['gif_height'] as int?,
      gif_duration: json['gif_duration'] as int?,
      thumb_url: json['thumb_url'] as String,
      thumb_mime_type: json['thumb_mime_type'] as String?,
      title: json['title'] as String?,
      caption: json['caption'] as String?,
      parse_mode: json['parse_mode'] as String?,
      caption_entities: (json['caption_entities'] as List<dynamic>?)
          ?.map((e) => MessageEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      reply_markup: json['reply_markup'] == null
          ? null
          : InlineKeyboardMarkup.fromJson(
              json['reply_markup'] as Map<String, dynamic>),
      input_message_content: json['input_message_content'] == null
          ? null
          : InputMessageContent.fromJson(
              json['input_message_content'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InlineQueryResultGifToJson(
    InlineQueryResultGif instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'type': instance.type,
    'gif_url': instance.gif_url,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('gif_width', instance.gif_width);
  writeNotNull('gif_height', instance.gif_height);
  writeNotNull('gif_duration', instance.gif_duration);
  val['thumb_url'] = instance.thumb_url;
  writeNotNull('thumb_mime_type', instance.thumb_mime_type);
  writeNotNull('title', instance.title);
  writeNotNull('caption', instance.caption);
  writeNotNull('parse_mode', instance.parse_mode);
  writeNotNull('caption_entities',
      instance.caption_entities?.map((e) => e.toJson()).toList());
  writeNotNull('reply_markup', instance.reply_markup?.toJson());
  writeNotNull(
      'input_message_content', instance.input_message_content?.toJson());
  return val;
}

InlineQueryResultMpeg4Gif _$InlineQueryResultMpeg4GifFromJson(
        Map<String, dynamic> json) =>
    InlineQueryResultMpeg4Gif(
      id: json['id'] as String,
      type: json['type'] as String? ?? InlineQueryResult.MPEG4_GIF,
      mpeg4_url: json['mpeg4_url'] as String,
      mpeg4_width: json['mpeg4_width'] as int?,
      mpeg4_height: json['mpeg4_height'] as int?,
      mpeg4_duration: json['mpeg4_duration'] as int?,
      thumb_url: json['thumb_url'] as String,
      thumb_mime_type: json['thumb_mime_type'] as String?,
      title: json['title'] as String?,
      caption: json['caption'] as String?,
      parse_mode: json['parse_mode'] as String?,
      caption_entities: (json['caption_entities'] as List<dynamic>?)
          ?.map((e) => MessageEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      reply_markup: json['reply_markup'] == null
          ? null
          : InlineKeyboardMarkup.fromJson(
              json['reply_markup'] as Map<String, dynamic>),
      input_message_content: json['input_message_content'] == null
          ? null
          : InputMessageContent.fromJson(
              json['input_message_content'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InlineQueryResultMpeg4GifToJson(
    InlineQueryResultMpeg4Gif instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'type': instance.type,
    'mpeg4_url': instance.mpeg4_url,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('mpeg4_width', instance.mpeg4_width);
  writeNotNull('mpeg4_height', instance.mpeg4_height);
  writeNotNull('mpeg4_duration', instance.mpeg4_duration);
  val['thumb_url'] = instance.thumb_url;
  writeNotNull('thumb_mime_type', instance.thumb_mime_type);
  writeNotNull('title', instance.title);
  writeNotNull('caption', instance.caption);
  writeNotNull('parse_mode', instance.parse_mode);
  writeNotNull('caption_entities',
      instance.caption_entities?.map((e) => e.toJson()).toList());
  writeNotNull('reply_markup', instance.reply_markup?.toJson());
  writeNotNull(
      'input_message_content', instance.input_message_content?.toJson());
  return val;
}

InlineQueryResultVideo _$InlineQueryResultVideoFromJson(
        Map<String, dynamic> json) =>
    InlineQueryResultVideo(
      id: json['id'] as String,
      type: json['type'] as String? ?? InlineQueryResult.VIDEO,
      video_url: json['video_url'] as String,
      mime_type: json['mime_type'] as String,
      thumb_url: json['thumb_url'] as String,
      title: json['title'] as String,
      caption: json['caption'] as String?,
      parse_mode: json['parse_mode'] as String?,
      video_width: json['video_width'] as int?,
      video_height: json['video_height'] as int?,
      video_duration: json['video_duration'] as int?,
      description: json['description'] as String?,
      caption_entities: (json['caption_entities'] as List<dynamic>?)
          ?.map((e) => MessageEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      reply_markup: json['reply_markup'] == null
          ? null
          : InlineKeyboardMarkup.fromJson(
              json['reply_markup'] as Map<String, dynamic>),
      input_message_content: json['input_message_content'] == null
          ? null
          : InputMessageContent.fromJson(
              json['input_message_content'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InlineQueryResultVideoToJson(
    InlineQueryResultVideo instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'type': instance.type,
    'video_url': instance.video_url,
    'mime_type': instance.mime_type,
    'thumb_url': instance.thumb_url,
    'title': instance.title,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('caption', instance.caption);
  writeNotNull('parse_mode', instance.parse_mode);
  writeNotNull('video_width', instance.video_width);
  writeNotNull('video_height', instance.video_height);
  writeNotNull('video_duration', instance.video_duration);
  writeNotNull('description', instance.description);
  writeNotNull('caption_entities',
      instance.caption_entities?.map((e) => e.toJson()).toList());
  writeNotNull('reply_markup', instance.reply_markup?.toJson());
  writeNotNull(
      'input_message_content', instance.input_message_content?.toJson());
  return val;
}

InlineQueryResultAudio _$InlineQueryResultAudioFromJson(
        Map<String, dynamic> json) =>
    InlineQueryResultAudio(
      id: json['id'] as String,
      type: json['type'] as String? ?? InlineQueryResult.AUDIO,
      audio_url: json['audio_url'] as String,
      title: json['title'] as String,
      caption: json['caption'] as String?,
      parse_mode: json['parse_mode'] as String?,
      performer: json['performer'] as String?,
      audio_duration: json['audio_duration'] as int?,
      caption_entities: (json['caption_entities'] as List<dynamic>?)
          ?.map((e) => MessageEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      reply_markup: json['reply_markup'] == null
          ? null
          : InlineKeyboardMarkup.fromJson(
              json['reply_markup'] as Map<String, dynamic>),
      input_message_content: json['input_message_content'] == null
          ? null
          : InputMessageContent.fromJson(
              json['input_message_content'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InlineQueryResultAudioToJson(
    InlineQueryResultAudio instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'type': instance.type,
    'audio_url': instance.audio_url,
    'title': instance.title,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('caption', instance.caption);
  writeNotNull('parse_mode', instance.parse_mode);
  writeNotNull('performer', instance.performer);
  writeNotNull('audio_duration', instance.audio_duration);
  writeNotNull('caption_entities',
      instance.caption_entities?.map((e) => e.toJson()).toList());
  writeNotNull('reply_markup', instance.reply_markup?.toJson());
  writeNotNull(
      'input_message_content', instance.input_message_content?.toJson());
  return val;
}

InlineQueryResultVoice _$InlineQueryResultVoiceFromJson(
        Map<String, dynamic> json) =>
    InlineQueryResultVoice(
      id: json['id'] as String,
      type: json['type'] as String? ?? InlineQueryResult.VOICE,
      voice_url: json['voice_url'] as String,
      title: json['title'] as String,
      caption: json['caption'] as String?,
      parse_mode: json['parse_mode'] as String?,
      voice_duration: json['voice_duration'] as int?,
      caption_entities: (json['caption_entities'] as List<dynamic>?)
          ?.map((e) => MessageEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      reply_markup: json['reply_markup'] == null
          ? null
          : InlineKeyboardMarkup.fromJson(
              json['reply_markup'] as Map<String, dynamic>),
      input_message_content: json['input_message_content'] == null
          ? null
          : InputMessageContent.fromJson(
              json['input_message_content'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InlineQueryResultVoiceToJson(
    InlineQueryResultVoice instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'type': instance.type,
    'voice_url': instance.voice_url,
    'title': instance.title,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('caption', instance.caption);
  writeNotNull('parse_mode', instance.parse_mode);
  writeNotNull('voice_duration', instance.voice_duration);
  writeNotNull('caption_entities',
      instance.caption_entities?.map((e) => e.toJson()).toList());
  writeNotNull('reply_markup', instance.reply_markup?.toJson());
  writeNotNull(
      'input_message_content', instance.input_message_content?.toJson());
  return val;
}

InlineQueryResultDocument _$InlineQueryResultDocumentFromJson(
        Map<String, dynamic> json) =>
    InlineQueryResultDocument(
      id: json['id'] as String,
      type: json['type'] as String? ?? InlineQueryResult.DOCUMENT,
      title: json['title'] as String,
      caption: json['caption'] as String?,
      parse_mode: json['parse_mode'] as String?,
      caption_entities: (json['caption_entities'] as List<dynamic>?)
          ?.map((e) => MessageEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      document_url: json['document_url'] as String,
      mime_type: json['mime_type'] as String,
      description: json['description'] as String?,
      reply_markup: json['reply_markup'] == null
          ? null
          : InlineKeyboardMarkup.fromJson(
              json['reply_markup'] as Map<String, dynamic>),
      input_message_content: json['input_message_content'] == null
          ? null
          : InputMessageContent.fromJson(
              json['input_message_content'] as Map<String, dynamic>),
      thumb_url: json['thumb_url'] as String?,
      thumb_width: json['thumb_width'] as int?,
      thumb_height: json['thumb_height'] as int?,
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
  writeNotNull('parse_mode', instance.parse_mode);
  writeNotNull('caption_entities',
      instance.caption_entities?.map((e) => e.toJson()).toList());
  val['document_url'] = instance.document_url;
  val['mime_type'] = instance.mime_type;
  writeNotNull('description', instance.description);
  writeNotNull('reply_markup', instance.reply_markup?.toJson());
  writeNotNull(
      'input_message_content', instance.input_message_content?.toJson());
  writeNotNull('thumb_url', instance.thumb_url);
  writeNotNull('thumb_width', instance.thumb_width);
  writeNotNull('thumb_height', instance.thumb_height);
  return val;
}

InlineQueryResultLocation _$InlineQueryResultLocationFromJson(
        Map<String, dynamic> json) =>
    InlineQueryResultLocation(
      id: json['id'] as String,
      type: json['type'] as String? ?? InlineQueryResult.LOCATION,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      title: json['title'] as String,
      horizontal_accuracy: (json['horizontal_accuracy'] as num?)?.toDouble(),
      live_period: json['live_period'] as int?,
      heading: json['heading'] as int?,
      proximity_alert_radius: json['proximity_alert_radius'] as int?,
      reply_markup: json['reply_markup'] == null
          ? null
          : InlineKeyboardMarkup.fromJson(
              json['reply_markup'] as Map<String, dynamic>),
      input_message_content: json['input_message_content'] == null
          ? null
          : InputMessageContent.fromJson(
              json['input_message_content'] as Map<String, dynamic>),
      thumb_url: json['thumb_url'] as String?,
      thumb_width: json['thumb_width'] as int?,
      thumb_height: json['thumb_height'] as int?,
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

  writeNotNull('horizontal_accuracy', instance.horizontal_accuracy);
  writeNotNull('live_period', instance.live_period);
  writeNotNull('heading', instance.heading);
  writeNotNull('proximity_alert_radius', instance.proximity_alert_radius);
  writeNotNull('reply_markup', instance.reply_markup?.toJson());
  writeNotNull(
      'input_message_content', instance.input_message_content?.toJson());
  writeNotNull('thumb_url', instance.thumb_url);
  writeNotNull('thumb_width', instance.thumb_width);
  writeNotNull('thumb_height', instance.thumb_height);
  return val;
}

InlineQueryResultVenue _$InlineQueryResultVenueFromJson(
        Map<String, dynamic> json) =>
    InlineQueryResultVenue(
      id: json['id'] as String,
      type: json['type'] as String? ?? InlineQueryResult.VENUE,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      title: json['title'] as String,
      address: json['address'] as String,
      foursquare_id: json['foursquare_id'] as String?,
      foursquare_type: json['foursquare_type'] as String?,
      google_place_id: json['google_place_id'] as String?,
      google_place_type: json['google_place_type'] as String?,
      reply_markup: json['reply_markup'] == null
          ? null
          : InlineKeyboardMarkup.fromJson(
              json['reply_markup'] as Map<String, dynamic>),
      input_message_content: json['input_message_content'] == null
          ? null
          : InputMessageContent.fromJson(
              json['input_message_content'] as Map<String, dynamic>),
      thumb_url: json['thumb_url'] as String?,
      thumb_width: json['thumb_width'] as int?,
      thumb_height: json['thumb_height'] as int?,
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

  writeNotNull('foursquare_id', instance.foursquare_id);
  writeNotNull('foursquare_type', instance.foursquare_type);
  writeNotNull('google_place_id', instance.google_place_id);
  writeNotNull('google_place_type', instance.google_place_type);
  writeNotNull('reply_markup', instance.reply_markup?.toJson());
  writeNotNull(
      'input_message_content', instance.input_message_content?.toJson());
  writeNotNull('thumb_url', instance.thumb_url);
  writeNotNull('thumb_width', instance.thumb_width);
  writeNotNull('thumb_height', instance.thumb_height);
  return val;
}

InlineQueryResultContact _$InlineQueryResultContactFromJson(
        Map<String, dynamic> json) =>
    InlineQueryResultContact(
      id: json['id'] as String,
      type: json['type'] as String? ?? InlineQueryResult.CONTACT,
      phone_number: json['phone_number'] as String,
      first_name: json['first_name'] as String,
      last_name: json['last_name'] as String?,
      vcard: json['vcard'] as String?,
      reply_markup: json['reply_markup'] == null
          ? null
          : InlineKeyboardMarkup.fromJson(
              json['reply_markup'] as Map<String, dynamic>),
      input_message_content: json['input_message_content'] == null
          ? null
          : InputMessageContent.fromJson(
              json['input_message_content'] as Map<String, dynamic>),
      thumb_url: json['thumb_url'] as String?,
      thumb_width: json['thumb_width'] as int?,
      thumb_height: json['thumb_height'] as int?,
    );

Map<String, dynamic> _$InlineQueryResultContactToJson(
    InlineQueryResultContact instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'type': instance.type,
    'phone_number': instance.phone_number,
    'first_name': instance.first_name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('last_name', instance.last_name);
  writeNotNull('vcard', instance.vcard);
  writeNotNull('reply_markup', instance.reply_markup?.toJson());
  writeNotNull(
      'input_message_content', instance.input_message_content?.toJson());
  writeNotNull('thumb_url', instance.thumb_url);
  writeNotNull('thumb_width', instance.thumb_width);
  writeNotNull('thumb_height', instance.thumb_height);
  return val;
}

InlineQueryResultGame _$InlineQueryResultGameFromJson(
        Map<String, dynamic> json) =>
    InlineQueryResultGame(
      id: json['id'] as String,
      type: json['type'] as String? ?? InlineQueryResult.GAME,
      game_short_name: json['game_short_name'] as String,
      reply_markup: json['reply_markup'] == null
          ? null
          : InlineKeyboardMarkup.fromJson(
              json['reply_markup'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InlineQueryResultGameToJson(
    InlineQueryResultGame instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'type': instance.type,
    'game_short_name': instance.game_short_name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('reply_markup', instance.reply_markup?.toJson());
  return val;
}

InlineQueryResultCachedPhoto _$InlineQueryResultCachedPhotoFromJson(
        Map<String, dynamic> json) =>
    InlineQueryResultCachedPhoto(
      id: json['id'] as String,
      type: json['type'] as String? ?? InlineQueryResult.PHOTO,
      photo_file_id: json['photo_file_id'] as String,
      title: json['title'] as String?,
      description: json['description'] as String?,
      caption: json['caption'] as String?,
      parse_mode: json['parse_mode'] as String?,
      caption_entities: (json['caption_entities'] as List<dynamic>?)
          ?.map((e) => MessageEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      reply_markup: json['reply_markup'] == null
          ? null
          : InlineKeyboardMarkup.fromJson(
              json['reply_markup'] as Map<String, dynamic>),
      input_message_content: json['input_message_content'] == null
          ? null
          : InputMessageContent.fromJson(
              json['input_message_content'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InlineQueryResultCachedPhotoToJson(
    InlineQueryResultCachedPhoto instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'type': instance.type,
    'photo_file_id': instance.photo_file_id,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('title', instance.title);
  writeNotNull('description', instance.description);
  writeNotNull('caption', instance.caption);
  writeNotNull('parse_mode', instance.parse_mode);
  writeNotNull('caption_entities',
      instance.caption_entities?.map((e) => e.toJson()).toList());
  writeNotNull('reply_markup', instance.reply_markup?.toJson());
  writeNotNull(
      'input_message_content', instance.input_message_content?.toJson());
  return val;
}

InlineQueryResultCachedGif _$InlineQueryResultCachedGifFromJson(
        Map<String, dynamic> json) =>
    InlineQueryResultCachedGif(
      id: json['id'] as String,
      type: json['type'] as String? ?? InlineQueryResult.GIF,
      gif_file_id: json['gif_file_id'] as String,
      title: json['title'] as String?,
      caption: json['caption'] as String?,
      parse_mode: json['parse_mode'] as String?,
      caption_entities: (json['caption_entities'] as List<dynamic>?)
          ?.map((e) => MessageEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      reply_markup: json['reply_markup'] == null
          ? null
          : InlineKeyboardMarkup.fromJson(
              json['reply_markup'] as Map<String, dynamic>),
      input_message_content: json['input_message_content'] == null
          ? null
          : InputMessageContent.fromJson(
              json['input_message_content'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InlineQueryResultCachedGifToJson(
    InlineQueryResultCachedGif instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'type': instance.type,
    'gif_file_id': instance.gif_file_id,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('title', instance.title);
  writeNotNull('caption', instance.caption);
  writeNotNull('parse_mode', instance.parse_mode);
  writeNotNull('caption_entities',
      instance.caption_entities?.map((e) => e.toJson()).toList());
  writeNotNull('reply_markup', instance.reply_markup?.toJson());
  writeNotNull(
      'input_message_content', instance.input_message_content?.toJson());
  return val;
}

InlineQueryResultCachedMpeg4Gif _$InlineQueryResultCachedMpeg4GifFromJson(
        Map<String, dynamic> json) =>
    InlineQueryResultCachedMpeg4Gif(
      id: json['id'] as String,
      type: json['type'] as String? ?? InlineQueryResult.MPEG4_GIF,
      mpeg4_file_id: json['mpeg4_file_id'] as String,
      title: json['title'] as String?,
      caption: json['caption'] as String?,
      parse_mode: json['parse_mode'] as String?,
      caption_entities: (json['caption_entities'] as List<dynamic>?)
          ?.map((e) => MessageEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      reply_markup: json['reply_markup'] == null
          ? null
          : InlineKeyboardMarkup.fromJson(
              json['reply_markup'] as Map<String, dynamic>),
      input_message_content: json['input_message_content'] == null
          ? null
          : InputMessageContent.fromJson(
              json['input_message_content'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InlineQueryResultCachedMpeg4GifToJson(
    InlineQueryResultCachedMpeg4Gif instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'type': instance.type,
    'mpeg4_file_id': instance.mpeg4_file_id,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('title', instance.title);
  writeNotNull('caption', instance.caption);
  writeNotNull('parse_mode', instance.parse_mode);
  writeNotNull('caption_entities',
      instance.caption_entities?.map((e) => e.toJson()).toList());
  writeNotNull('reply_markup', instance.reply_markup?.toJson());
  writeNotNull(
      'input_message_content', instance.input_message_content?.toJson());
  return val;
}

InlineQueryResultCachedSticker _$InlineQueryResultCachedStickerFromJson(
        Map<String, dynamic> json) =>
    InlineQueryResultCachedSticker(
      id: json['id'] as String,
      type: json['type'] as String? ?? InlineQueryResult.STICKER,
      sticker_file_id: json['sticker_file_id'] as String?,
      reply_markup: json['reply_markup'] == null
          ? null
          : InlineKeyboardMarkup.fromJson(
              json['reply_markup'] as Map<String, dynamic>),
      input_message_content: json['input_message_content'] == null
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

  writeNotNull('sticker_file_id', instance.sticker_file_id);
  writeNotNull('reply_markup', instance.reply_markup?.toJson());
  writeNotNull(
      'input_message_content', instance.input_message_content?.toJson());
  return val;
}

InlineQueryResultCachedDocument _$InlineQueryResultCachedDocumentFromJson(
        Map<String, dynamic> json) =>
    InlineQueryResultCachedDocument(
      id: json['id'] as String,
      type: json['type'] as String? ?? InlineQueryResult.DOCUMENT,
      title: json['title'] as String,
      document_file_id: json['document_file_id'] as String,
      description: json['description'] as String?,
      caption: json['caption'] as String?,
      parse_mode: json['parse_mode'] as String?,
      caption_entities: (json['caption_entities'] as List<dynamic>?)
          ?.map((e) => MessageEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      reply_markup: json['reply_markup'] == null
          ? null
          : InlineKeyboardMarkup.fromJson(
              json['reply_markup'] as Map<String, dynamic>),
      input_message_content: json['input_message_content'] == null
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
    'document_file_id': instance.document_file_id,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('description', instance.description);
  writeNotNull('caption', instance.caption);
  writeNotNull('parse_mode', instance.parse_mode);
  writeNotNull('caption_entities',
      instance.caption_entities?.map((e) => e.toJson()).toList());
  writeNotNull('reply_markup', instance.reply_markup?.toJson());
  writeNotNull(
      'input_message_content', instance.input_message_content?.toJson());
  return val;
}

InlineQueryResultCachedVideo _$InlineQueryResultCachedVideoFromJson(
        Map<String, dynamic> json) =>
    InlineQueryResultCachedVideo(
      id: json['id'] as String,
      type: json['type'] as String? ?? InlineQueryResult.VIDEO,
      video_file_id: json['video_file_id'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
      caption: json['caption'] as String?,
      parse_mode: json['parse_mode'] as String?,
      caption_entities: (json['caption_entities'] as List<dynamic>?)
          ?.map((e) => MessageEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      reply_markup: json['reply_markup'] == null
          ? null
          : InlineKeyboardMarkup.fromJson(
              json['reply_markup'] as Map<String, dynamic>),
      input_message_content: json['input_message_content'] == null
          ? null
          : InputMessageContent.fromJson(
              json['input_message_content'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InlineQueryResultCachedVideoToJson(
    InlineQueryResultCachedVideo instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'type': instance.type,
    'video_file_id': instance.video_file_id,
    'title': instance.title,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('description', instance.description);
  writeNotNull('caption', instance.caption);
  writeNotNull('parse_mode', instance.parse_mode);
  writeNotNull('caption_entities',
      instance.caption_entities?.map((e) => e.toJson()).toList());
  writeNotNull('reply_markup', instance.reply_markup?.toJson());
  writeNotNull(
      'input_message_content', instance.input_message_content?.toJson());
  return val;
}

InlineQueryResultCachedVoice _$InlineQueryResultCachedVoiceFromJson(
        Map<String, dynamic> json) =>
    InlineQueryResultCachedVoice(
      id: json['id'] as String,
      type: json['type'] as String? ?? InlineQueryResult.VOICE,
      voice_file_id: json['voice_file_id'] as String,
      title: json['title'] as String,
      caption: json['caption'] as String?,
      parse_mode: json['parse_mode'] as String?,
      caption_entities: (json['caption_entities'] as List<dynamic>?)
          ?.map((e) => MessageEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      reply_markup: json['reply_markup'] == null
          ? null
          : InlineKeyboardMarkup.fromJson(
              json['reply_markup'] as Map<String, dynamic>),
      input_message_content: json['input_message_content'] == null
          ? null
          : InputMessageContent.fromJson(
              json['input_message_content'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InlineQueryResultCachedVoiceToJson(
    InlineQueryResultCachedVoice instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'type': instance.type,
    'voice_file_id': instance.voice_file_id,
    'title': instance.title,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('caption', instance.caption);
  writeNotNull('parse_mode', instance.parse_mode);
  writeNotNull('caption_entities',
      instance.caption_entities?.map((e) => e.toJson()).toList());
  writeNotNull('reply_markup', instance.reply_markup?.toJson());
  writeNotNull(
      'input_message_content', instance.input_message_content?.toJson());
  return val;
}

InlineQueryResultCachedAudio _$InlineQueryResultCachedAudioFromJson(
        Map<String, dynamic> json) =>
    InlineQueryResultCachedAudio(
      id: json['id'] as String,
      type: json['type'] as String? ?? InlineQueryResult.AUDIO,
      audio_file_id: json['audio_file_id'] as String,
      caption: json['caption'] as String?,
      parse_mode: json['parse_mode'] as String?,
      caption_entities: (json['caption_entities'] as List<dynamic>?)
          ?.map((e) => MessageEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      reply_markup: json['reply_markup'] == null
          ? null
          : InlineKeyboardMarkup.fromJson(
              json['reply_markup'] as Map<String, dynamic>),
      input_message_content: json['input_message_content'] == null
          ? null
          : InputMessageContent.fromJson(
              json['input_message_content'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InlineQueryResultCachedAudioToJson(
    InlineQueryResultCachedAudio instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'type': instance.type,
    'audio_file_id': instance.audio_file_id,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('caption', instance.caption);
  writeNotNull('parse_mode', instance.parse_mode);
  writeNotNull('caption_entities',
      instance.caption_entities?.map((e) => e.toJson()).toList());
  writeNotNull('reply_markup', instance.reply_markup?.toJson());
  writeNotNull(
      'input_message_content', instance.input_message_content?.toJson());
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
      message_text: json['message_text'] as String,
      parse_mode: json['parse_mode'] as String?,
      disable_web_page_preview: json['disable_web_page_preview'] as bool?,
    )..entities = (json['entities'] as List<dynamic>?)
        ?.map((e) => MessageEntity.fromJson(e as Map<String, dynamic>))
        .toList();

Map<String, dynamic> _$InputTextMessageContentToJson(
    InputTextMessageContent instance) {
  final val = <String, dynamic>{
    'message_text': instance.message_text,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('parse_mode', instance.parse_mode);
  writeNotNull('entities', instance.entities?.map((e) => e.toJson()).toList());
  writeNotNull('disable_web_page_preview', instance.disable_web_page_preview);
  return val;
}

InputLocationMessageContent _$InputLocationMessageContentFromJson(
        Map<String, dynamic> json) =>
    InputLocationMessageContent(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      horizontal_accuracy: (json['horizontal_accuracy'] as num?)?.toDouble(),
      live_period: json['live_period'] as int?,
      heading: json['heading'] as int?,
      proximity_alert_radius: json['proximity_alert_radius'] as int?,
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

  writeNotNull('horizontal_accuracy', instance.horizontal_accuracy);
  writeNotNull('live_period', instance.live_period);
  writeNotNull('heading', instance.heading);
  writeNotNull('proximity_alert_radius', instance.proximity_alert_radius);
  return val;
}

InputVenueMessageContent _$InputVenueMessageContentFromJson(
        Map<String, dynamic> json) =>
    InputVenueMessageContent(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      title: json['title'] as String,
      address: json['address'] as String,
      foursquare_id: json['foursquare_id'] as String?,
      foursquare_type: json['foursquare_type'] as String?,
      google_place_id: json['google_place_id'] as String?,
      google_place_type: json['google_place_type'] as String?,
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

  writeNotNull('foursquare_id', instance.foursquare_id);
  writeNotNull('foursquare_type', instance.foursquare_type);
  writeNotNull('google_place_id', instance.google_place_id);
  writeNotNull('google_place_type', instance.google_place_type);
  return val;
}

InputContactMessageContent _$InputContactMessageContentFromJson(
        Map<String, dynamic> json) =>
    InputContactMessageContent(
      phone_number: json['phone_number'] as String,
      first_name: json['first_name'] as String,
      last_name: json['last_name'] as String?,
      vcard: json['vcard'] as String?,
    );

Map<String, dynamic> _$InputContactMessageContentToJson(
    InputContactMessageContent instance) {
  final val = <String, dynamic>{
    'phone_number': instance.phone_number,
    'first_name': instance.first_name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('last_name', instance.last_name);
  writeNotNull('vcard', instance.vcard);
  return val;
}

InputInvoiceMessageContent _$InputInvoiceMessageContentFromJson(
        Map<String, dynamic> json) =>
    InputInvoiceMessageContent(
      title: json['title'] as String,
      description: json['description'] as String,
      payload: json['payload'] as String,
      provider_token: json['provider_token'] as String,
      currency: json['currency'] as String,
      prices: (json['prices'] as List<dynamic>)
          .map((e) => LabeledPrice.fromJson(e as Map<String, dynamic>))
          .toList(),
      max_tip_amount: json['max_tip_amount'] as int?,
      suggested_tip_amounts: (json['suggested_tip_amounts'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
      provider_data: json['provider_data'] as String?,
      photo_size: json['photo_size'] as int?,
      photo_width: json['photo_width'] as int?,
      photo_height: json['photo_height'] as int?,
      need_name: json['need_name'] as bool?,
      need_phone_number: json['need_phone_number'] as bool?,
      need_email: json['need_email'] as bool?,
      need_shipping_address: json['need_shipping_address'] as bool?,
      send_phone_number_to_provider:
          json['send_phone_number_to_provider'] as bool?,
      send_email_to_provider: json['send_email_to_provider'] as bool?,
      is_flexible: json['is_flexible'] as bool?,
    )..photo_url = json['photo_url'] as String?;

Map<String, dynamic> _$InputInvoiceMessageContentToJson(
    InputInvoiceMessageContent instance) {
  final val = <String, dynamic>{
    'title': instance.title,
    'description': instance.description,
    'payload': instance.payload,
    'provider_token': instance.provider_token,
    'currency': instance.currency,
    'prices': instance.prices.map((e) => e.toJson()).toList(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('max_tip_amount', instance.max_tip_amount);
  writeNotNull('suggested_tip_amounts', instance.suggested_tip_amounts);
  writeNotNull('provider_data', instance.provider_data);
  writeNotNull('photo_url', instance.photo_url);
  writeNotNull('photo_size', instance.photo_size);
  writeNotNull('photo_width', instance.photo_width);
  writeNotNull('photo_height', instance.photo_height);
  writeNotNull('need_name', instance.need_name);
  writeNotNull('need_phone_number', instance.need_phone_number);
  writeNotNull('need_email', instance.need_email);
  writeNotNull('need_shipping_address', instance.need_shipping_address);
  writeNotNull(
      'send_phone_number_to_provider', instance.send_phone_number_to_provider);
  writeNotNull('send_email_to_provider', instance.send_email_to_provider);
  writeNotNull('is_flexible', instance.is_flexible);
  return val;
}

ChosenInlineResult _$ChosenInlineResultFromJson(Map<String, dynamic> json) =>
    ChosenInlineResult(
      result_id: json['result_id'] as String,
      from: User.fromJson(json['from'] as Map<String, dynamic>),
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
      inline_message_id: json['inline_message_id'] as String?,
      query: json['query'] as String,
    );

Map<String, dynamic> _$ChosenInlineResultToJson(ChosenInlineResult instance) {
  final val = <String, dynamic>{
    'result_id': instance.result_id,
    'from': instance.from.toJson(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('location', instance.location?.toJson());
  writeNotNull('inline_message_id', instance.inline_message_id);
  val['query'] = instance.query;
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

Invoice _$InvoiceFromJson(Map<String, dynamic> json) => Invoice(
      title: json['title'] as String,
      description: json['description'] as String,
      start_parameter: json['start_parameter'] as String,
      currency: json['currency'] as String,
      total_amount: json['total_amount'] as int,
    );

Map<String, dynamic> _$InvoiceToJson(Invoice instance) => <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'start_parameter': instance.start_parameter,
      'currency': instance.currency,
      'total_amount': instance.total_amount,
    };

ShippingAddress _$ShippingAddressFromJson(Map<String, dynamic> json) =>
    ShippingAddress(
      country_code: json['country_code'] as String,
      state: json['state'] as String,
      city: json['city'] as String,
      street_line1: json['street_line1'] as String,
      street_line2: json['street_line2'] as String,
      post_code: json['post_code'] as String,
    );

Map<String, dynamic> _$ShippingAddressToJson(ShippingAddress instance) =>
    <String, dynamic>{
      'country_code': instance.country_code,
      'state': instance.state,
      'city': instance.city,
      'street_line1': instance.street_line1,
      'street_line2': instance.street_line2,
      'post_code': instance.post_code,
    };

OrderInfo _$OrderInfoFromJson(Map<String, dynamic> json) => OrderInfo(
      name: json['name'] as String?,
      phone_number: json['phone_number'] as String?,
      email: json['email'] as String?,
      shippingAddress: json['shippingAddress'] == null
          ? null
          : ShippingAddress.fromJson(
              json['shippingAddress'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrderInfoToJson(OrderInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('phone_number', instance.phone_number);
  writeNotNull('email', instance.email);
  writeNotNull('shippingAddress', instance.shippingAddress?.toJson());
  return val;
}

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

SuccessfulPayment _$SuccessfulPaymentFromJson(Map<String, dynamic> json) =>
    SuccessfulPayment(
      currency: json['currency'] as String,
      total_amount: json['total_amount'] as int,
      invoice_payload: json['invoice_payload'] as String,
      shipping_option_id: json['shipping_option_id'] as String?,
      order_info: json['order_info'] == null
          ? null
          : OrderInfo.fromJson(json['order_info'] as Map<String, dynamic>),
      telegram_payment_charge_id: json['telegram_payment_charge_id'] as String,
      provider_payment_charge_id: json['provider_payment_charge_id'] as String,
    );

Map<String, dynamic> _$SuccessfulPaymentToJson(SuccessfulPayment instance) {
  final val = <String, dynamic>{
    'currency': instance.currency,
    'total_amount': instance.total_amount,
    'invoice_payload': instance.invoice_payload,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('shipping_option_id', instance.shipping_option_id);
  writeNotNull('order_info', instance.order_info?.toJson());
  val['telegram_payment_charge_id'] = instance.telegram_payment_charge_id;
  val['provider_payment_charge_id'] = instance.provider_payment_charge_id;
  return val;
}

ShippingQuery _$ShippingQueryFromJson(Map<String, dynamic> json) =>
    ShippingQuery(
      id: json['id'] as String,
      from: User.fromJson(json['from'] as Map<String, dynamic>),
      invoice_payload: json['invoice_payload'] as String,
      shipping_address: ShippingAddress.fromJson(
          json['shipping_address'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ShippingQueryToJson(ShippingQuery instance) =>
    <String, dynamic>{
      'id': instance.id,
      'from': instance.from.toJson(),
      'invoice_payload': instance.invoice_payload,
      'shipping_address': instance.shipping_address.toJson(),
    };

PreCheckoutQuery _$PreCheckoutQueryFromJson(Map<String, dynamic> json) =>
    PreCheckoutQuery(
      id: json['id'] as String,
      from: User.fromJson(json['from'] as Map<String, dynamic>),
      currency: json['currency'] as String,
      total_amount: json['total_amount'] as int,
      invoice_payload: json['invoice_payload'] as String,
      shipping_option_id: json['shipping_option_id'] as String?,
      order_info: json['order_info'] == null
          ? null
          : OrderInfo.fromJson(json['order_info'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PreCheckoutQueryToJson(PreCheckoutQuery instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'from': instance.from.toJson(),
    'currency': instance.currency,
    'total_amount': instance.total_amount,
    'invoice_payload': instance.invoice_payload,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('shipping_option_id', instance.shipping_option_id);
  writeNotNull('order_info', instance.order_info?.toJson());
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

PassportFile _$PassportFileFromJson(Map<String, dynamic> json) => PassportFile(
      file_id: json['file_id'] as String,
      file_unique_id: json['file_unique_id'] as String,
      file_size: json['file_size'] as int,
      file_date: json['file_date'] as int,
    );

Map<String, dynamic> _$PassportFileToJson(PassportFile instance) =>
    <String, dynamic>{
      'file_id': instance.file_id,
      'file_unique_id': instance.file_unique_id,
      'file_size': instance.file_size,
      'file_date': instance.file_date,
    };

EncryptedPassportElement _$EncryptedPassportElementFromJson(
        Map<String, dynamic> json) =>
    EncryptedPassportElement(
      type: json['type'] as String,
      data: json['data'] as String?,
      phone_number: json['phone_number'] as String?,
      email: json['email'] as String?,
      files: (json['files'] as List<dynamic>?)
          ?.map((e) => PassportFile.fromJson(e as Map<String, dynamic>))
          .toList(),
      front_side: json['front_side'] == null
          ? null
          : PassportFile.fromJson(json['front_side'] as Map<String, dynamic>),
      reverse_side: json['reverse_side'] == null
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
  writeNotNull('phone_number', instance.phone_number);
  writeNotNull('email', instance.email);
  writeNotNull('files', instance.files?.map((e) => e.toJson()).toList());
  writeNotNull('front_side', instance.front_side?.toJson());
  writeNotNull('reverse_side', instance.reverse_side?.toJson());
  writeNotNull('selfie', instance.selfie?.toJson());
  writeNotNull(
      'translation', instance.translation?.map((e) => e.toJson()).toList());
  val['hash'] = instance.hash;
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

PassportElementErrorDataField _$PassportElementErrorDataFieldFromJson(
        Map<String, dynamic> json) =>
    PassportElementErrorDataField(
      source: json['source'] as String,
      type: json['type'] as String,
      message: json['message'] as String,
      field_name: json['field_name'] as String,
      data_hash: json['data_hash'] as String,
    );

Map<String, dynamic> _$PassportElementErrorDataFieldToJson(
        PassportElementErrorDataField instance) =>
    <String, dynamic>{
      'source': instance.source,
      'type': instance.type,
      'message': instance.message,
      'field_name': instance.field_name,
      'data_hash': instance.data_hash,
    };

PassportElementErrorFrontSide _$PassportElementErrorFrontSideFromJson(
        Map<String, dynamic> json) =>
    PassportElementErrorFrontSide(
      source: json['source'] as String,
      type: json['type'] as String,
      message: json['message'] as String,
      file_hash: json['file_hash'] as String,
    );

Map<String, dynamic> _$PassportElementErrorFrontSideToJson(
        PassportElementErrorFrontSide instance) =>
    <String, dynamic>{
      'source': instance.source,
      'type': instance.type,
      'message': instance.message,
      'file_hash': instance.file_hash,
    };

PassportElementErrorReverseSide _$PassportElementErrorReverseSideFromJson(
        Map<String, dynamic> json) =>
    PassportElementErrorReverseSide(
      source: json['source'] as String,
      type: json['type'] as String,
      message: json['message'] as String,
      file_hash: json['file_hash'] as String,
    );

Map<String, dynamic> _$PassportElementErrorReverseSideToJson(
        PassportElementErrorReverseSide instance) =>
    <String, dynamic>{
      'source': instance.source,
      'type': instance.type,
      'message': instance.message,
      'file_hash': instance.file_hash,
    };

PassportElementErrorSelfie _$PassportElementErrorSelfieFromJson(
        Map<String, dynamic> json) =>
    PassportElementErrorSelfie(
      source: json['source'] as String,
      type: json['type'] as String,
      message: json['message'] as String,
      file_hash: json['file_hash'] as String,
    );

Map<String, dynamic> _$PassportElementErrorSelfieToJson(
        PassportElementErrorSelfie instance) =>
    <String, dynamic>{
      'source': instance.source,
      'type': instance.type,
      'message': instance.message,
      'file_hash': instance.file_hash,
    };

PassportElementErrorFile _$PassportElementErrorFileFromJson(
        Map<String, dynamic> json) =>
    PassportElementErrorFile(
      source: json['source'] as String,
      type: json['type'] as String,
      message: json['message'] as String,
      file_hash: json['file_hash'] as String,
    );

Map<String, dynamic> _$PassportElementErrorFileToJson(
        PassportElementErrorFile instance) =>
    <String, dynamic>{
      'source': instance.source,
      'type': instance.type,
      'message': instance.message,
      'file_hash': instance.file_hash,
    };

PassportElementErrorFiles _$PassportElementErrorFilesFromJson(
        Map<String, dynamic> json) =>
    PassportElementErrorFiles(
      source: json['source'] as String,
      type: json['type'] as String,
      message: json['message'] as String,
      file_hashes: (json['file_hashes'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$PassportElementErrorFilesToJson(
        PassportElementErrorFiles instance) =>
    <String, dynamic>{
      'source': instance.source,
      'type': instance.type,
      'message': instance.message,
      'file_hashes': instance.file_hashes,
    };

PassportElementErrorTranslationFile
    _$PassportElementErrorTranslationFileFromJson(Map<String, dynamic> json) =>
        PassportElementErrorTranslationFile(
          source: json['source'] as String,
          type: json['type'] as String,
          message: json['message'] as String,
          file_hash: json['file_hash'] as String,
        );

Map<String, dynamic> _$PassportElementErrorTranslationFileToJson(
        PassportElementErrorTranslationFile instance) =>
    <String, dynamic>{
      'source': instance.source,
      'type': instance.type,
      'message': instance.message,
      'file_hash': instance.file_hash,
    };

PassportElementErrorTranslationFiles
    _$PassportElementErrorTranslationFilesFromJson(Map<String, dynamic> json) =>
        PassportElementErrorTranslationFiles(
          source: json['source'] as String,
          type: json['type'] as String,
          message: json['message'] as String,
          file_hashes: (json['file_hashes'] as List<dynamic>)
              .map((e) => e as String)
              .toList(),
        );

Map<String, dynamic> _$PassportElementErrorTranslationFilesToJson(
        PassportElementErrorTranslationFiles instance) =>
    <String, dynamic>{
      'source': instance.source,
      'type': instance.type,
      'message': instance.message,
      'file_hashes': instance.file_hashes,
    };

PassportElementErrorUnspecified _$PassportElementErrorUnspecifiedFromJson(
        Map<String, dynamic> json) =>
    PassportElementErrorUnspecified(
      source: json['source'] as String,
      type: json['type'] as String,
      message: json['message'] as String,
      element_hash: json['element_hash'] as String,
    );

Map<String, dynamic> _$PassportElementErrorUnspecifiedToJson(
        PassportElementErrorUnspecified instance) =>
    <String, dynamic>{
      'source': instance.source,
      'type': instance.type,
      'message': instance.message,
      'element_hash': instance.element_hash,
    };

Game _$GameFromJson(Map<String, dynamic> json) => Game(
      title: json['title'] as String,
      description: json['description'] as String,
      photo: (json['photo'] as List<dynamic>)
          .map((e) => PhotoSize.fromJson(e as Map<String, dynamic>))
          .toList(),
      text: json['text'] as String?,
      text_entities: (json['text_entities'] as List<dynamic>?)
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
      'text_entities', instance.text_entities?.map((e) => e.toJson()).toList());
  writeNotNull('animation', instance.animation?.toJson());
  return val;
}

CallbackGame _$CallbackGameFromJson(Map<String, dynamic> json) =>
    CallbackGame();

Map<String, dynamic> _$CallbackGameToJson(CallbackGame instance) =>
    <String, dynamic>{};

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
