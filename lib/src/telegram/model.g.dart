// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Update _$UpdateFromJson(Map<String, dynamic> json) {
  return Update(
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
        : Message.fromJson(json['edited_channel_post'] as Map<String, dynamic>),
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
  );
}

Map<String, dynamic> _$UpdateToJson(Update instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('update_id', instance.update_id);
  writeNotNull('message', instance.message);
  writeNotNull('edited_message', instance.edited_message);
  writeNotNull('channel_post', instance.channel_post);
  writeNotNull('edited_channel_post', instance.edited_channel_post);
  writeNotNull('inline_query', instance.inline_query);
  writeNotNull('chosen_inline_result', instance.chosen_inline_result);
  writeNotNull('callback_query', instance.callback_query);
  writeNotNull('shipping_query', instance.shipping_query);
  writeNotNull('pre_checkout_query', instance.pre_checkout_query);
  writeNotNull('poll', instance.poll);
  return val;
}

WebhookInfo _$WebhookInfoFromJson(Map<String, dynamic> json) {
  return WebhookInfo(
    url: json['url'] as String,
    has_custom_certificate: json['has_custom_certificate'] as bool,
    pending_update_count: json['pending_update_count'] as int,
    last_error_date: json['last_error_date'] as int,
    last_error_message: json['last_error_message'] as String,
    max_connections: json['max_connections'] as int,
    allowed_updates:
        (json['allowed_updates'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$WebhookInfoToJson(WebhookInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('url', instance.url);
  writeNotNull('has_custom_certificate', instance.has_custom_certificate);
  writeNotNull('pending_update_count', instance.pending_update_count);
  writeNotNull('last_error_date', instance.last_error_date);
  writeNotNull('last_error_message', instance.last_error_message);
  writeNotNull('max_connections', instance.max_connections);
  writeNotNull('allowed_updates', instance.allowed_updates);
  return val;
}

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    id: json['id'] as int,
    is_bot: json['is_bot'] as bool,
    first_name: json['first_name'] as String,
    last_name: json['last_name'] as String,
    username: json['username'] as String,
    language_code: json['language_code'] as String,
  );
}

Map<String, dynamic> _$UserToJson(User instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('is_bot', instance.is_bot);
  writeNotNull('first_name', instance.first_name);
  writeNotNull('last_name', instance.last_name);
  writeNotNull('username', instance.username);
  writeNotNull('language_code', instance.language_code);
  return val;
}

Chat _$ChatFromJson(Map<String, dynamic> json) {
  return Chat(
    id: json['id'] as int,
    type: json['type'] as String,
    title: json['title'] as String,
    username: json['username'] as String,
    first_name: json['first_name'] as String,
    last_name: json['last_name'] as String,
    all_members_are_administrators:
        json['all_members_are_administrators'] as bool,
    photo: json['photo'] == null
        ? null
        : ChatPhoto.fromJson(json['photo'] as Map<String, dynamic>),
    description: json['description'] as String,
    invite_link: json['invite_link'] as String,
    pinned_message: json['pinned_message'] == null
        ? null
        : Message.fromJson(json['pinned_message'] as Map<String, dynamic>),
    permissions: json['permissions'] == null
        ? null
        : ChatPermissions.fromJson(json['permissions'] as Map<String, dynamic>),
    sticker_set_name: json['sticker_set_name'] as String,
    can_set_sticker_set: json['can_set_sticker_set'] as bool,
  );
}

Map<String, dynamic> _$ChatToJson(Chat instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('type', instance.type);
  writeNotNull('title', instance.title);
  writeNotNull('username', instance.username);
  writeNotNull('first_name', instance.first_name);
  writeNotNull('last_name', instance.last_name);
  writeNotNull('all_members_are_administrators',
      instance.all_members_are_administrators);
  writeNotNull('photo', instance.photo);
  writeNotNull('description', instance.description);
  writeNotNull('invite_link', instance.invite_link);
  writeNotNull('pinned_message', instance.pinned_message);
  writeNotNull('permissions', instance.permissions);
  writeNotNull('sticker_set_name', instance.sticker_set_name);
  writeNotNull('can_set_sticker_set', instance.can_set_sticker_set);
  return val;
}

Message _$MessageFromJson(Map<String, dynamic> json) {
  return Message(
    message_id: json['message_id'] as int,
    from: json['from'] == null
        ? null
        : User.fromJson(json['from'] as Map<String, dynamic>),
    date: json['date'] as int,
    chat: json['chat'] == null
        ? null
        : Chat.fromJson(json['chat'] as Map<String, dynamic>),
    forward_from: json['forward_from'] == null
        ? null
        : User.fromJson(json['forward_from'] as Map<String, dynamic>),
    forward_from_chat: json['forward_from_chat'] == null
        ? null
        : Chat.fromJson(json['forward_from_chat'] as Map<String, dynamic>),
    forward_from_message_id: json['forward_from_message_id'] as int,
    forward_signature: json['forward_signature'] as String,
    forward_sender_name: json['forward_sender_name'] as String,
    forward_date: json['forward_date'] as int,
    reply_to_message: json['reply_to_message'] == null
        ? null
        : Message.fromJson(json['reply_to_message'] as Map<String, dynamic>),
    edit_date: json['edit_date'] as int,
    media_group_id: json['media_group_id'] as String,
    author_signature: json['author_signature'] as String,
    text: json['text'] as String,
    entities: (json['entities'] as List)
        ?.map((e) => e == null
            ? null
            : MessageEntity.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    caption_entities: (json['caption_entities'] as List)
        ?.map((e) => e == null
            ? null
            : MessageEntity.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    audio: json['audio'] == null
        ? null
        : Audio.fromJson(json['audio'] as Map<String, dynamic>),
    document: json['document'] == null
        ? null
        : Document.fromJson(json['document'] as Map<String, dynamic>),
    animation: json['animation'] == null
        ? null
        : Animation.fromJson(json['animation'] as Map<String, dynamic>),
    game: json['game'] == null
        ? null
        : Game.fromJson(json['game'] as Map<String, dynamic>),
    photo: (json['photo'] as List)
        ?.map((e) =>
            e == null ? null : PhotoSize.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    sticker: json['sticker'] == null
        ? null
        : Sticker.fromJson(json['sticker'] as Map<String, dynamic>),
    video: json['video'] == null
        ? null
        : Video.fromJson(json['video'] as Map<String, dynamic>),
    voice: json['voice'] == null
        ? null
        : Voice.fromJson(json['voice'] as Map<String, dynamic>),
    video_note: json['video_note'] == null
        ? null
        : VideoNote.fromJson(json['video_note'] as Map<String, dynamic>),
    caption: json['caption'] as String,
    contact: json['contact'] == null
        ? null
        : Contact.fromJson(json['contact'] as Map<String, dynamic>),
    location: json['location'] == null
        ? null
        : Location.fromJson(json['location'] as Map<String, dynamic>),
    venue: json['venue'] == null
        ? null
        : Venue.fromJson(json['venue'] as Map<String, dynamic>),
    poll: json['poll'] == null
        ? null
        : Poll.fromJson(json['poll'] as Map<String, dynamic>),
    new_chat_members: (json['new_chat_members'] as List)
        ?.map(
            (e) => e == null ? null : User.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    left_chat_member: json['left_chat_member'] == null
        ? null
        : User.fromJson(json['left_chat_member'] as Map<String, dynamic>),
    new_chat_title: json['new_chat_title'] as String,
    new_chat_photo: (json['new_chat_photo'] as List)
        ?.map((e) =>
            e == null ? null : PhotoSize.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    delete_chat_photo: json['delete_chat_photo'] as bool,
    group_chat_created: json['group_chat_created'] as bool,
    supergroup_chat_created: json['supergroup_chat_created'] as bool,
    channel_chat_created: json['channel_chat_created'] as bool,
    migrate_to_chat_id: json['migrate_to_chat_id'] as int,
    migrate_from_chat_id: json['migrate_from_chat_id'] as int,
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
    connected_website: json['connected_website'] as String,
    passport_data: json['passport_data'] == null
        ? null
        : PassportData.fromJson(json['passport_data'] as Map<String, dynamic>),
    reply_markup: json['reply_markup'] == null
        ? null
        : InlineKeyboardMarkup.fromJson(
            json['reply_markup'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MessageToJson(Message instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('message_id', instance.message_id);
  writeNotNull('from', instance.from);
  writeNotNull('date', instance.date);
  writeNotNull('chat', instance.chat);
  writeNotNull('forward_from', instance.forward_from);
  writeNotNull('forward_from_chat', instance.forward_from_chat);
  writeNotNull('forward_from_message_id', instance.forward_from_message_id);
  writeNotNull('forward_signature', instance.forward_signature);
  writeNotNull('forward_sender_name', instance.forward_sender_name);
  writeNotNull('forward_date', instance.forward_date);
  writeNotNull('reply_to_message', instance.reply_to_message);
  writeNotNull('edit_date', instance.edit_date);
  writeNotNull('media_group_id', instance.media_group_id);
  writeNotNull('author_signature', instance.author_signature);
  writeNotNull('text', instance.text);
  writeNotNull('entities', instance.entities);
  writeNotNull('caption_entities', instance.caption_entities);
  writeNotNull('audio', instance.audio);
  writeNotNull('document', instance.document);
  writeNotNull('animation', instance.animation);
  writeNotNull('game', instance.game);
  writeNotNull('photo', instance.photo);
  writeNotNull('sticker', instance.sticker);
  writeNotNull('video', instance.video);
  writeNotNull('voice', instance.voice);
  writeNotNull('video_note', instance.video_note);
  writeNotNull('caption', instance.caption);
  writeNotNull('contact', instance.contact);
  writeNotNull('location', instance.location);
  writeNotNull('venue', instance.venue);
  writeNotNull('poll', instance.poll);
  writeNotNull('new_chat_members', instance.new_chat_members);
  writeNotNull('left_chat_member', instance.left_chat_member);
  writeNotNull('new_chat_title', instance.new_chat_title);
  writeNotNull('new_chat_photo', instance.new_chat_photo);
  writeNotNull('delete_chat_photo', instance.delete_chat_photo);
  writeNotNull('group_chat_created', instance.group_chat_created);
  writeNotNull('supergroup_chat_created', instance.supergroup_chat_created);
  writeNotNull('channel_chat_created', instance.channel_chat_created);
  writeNotNull('migrate_to_chat_id', instance.migrate_to_chat_id);
  writeNotNull('migrate_from_chat_id', instance.migrate_from_chat_id);
  writeNotNull('pinned_message', instance.pinned_message);
  writeNotNull('invoice', instance.invoice);
  writeNotNull('successful_payment', instance.successful_payment);
  writeNotNull('connected_website', instance.connected_website);
  writeNotNull('passport_data', instance.passport_data);
  writeNotNull('reply_markup', instance.reply_markup);
  return val;
}

MessageEntity _$MessageEntityFromJson(Map<String, dynamic> json) {
  return MessageEntity(
    type: json['type'] as String,
    offset: json['offset'] as int,
    length: json['length'] as int,
    url: json['url'] as String,
    user: json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MessageEntityToJson(MessageEntity instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('type', instance.type);
  writeNotNull('offset', instance.offset);
  writeNotNull('length', instance.length);
  writeNotNull('url', instance.url);
  writeNotNull('user', instance.user);
  return val;
}

PhotoSize _$PhotoSizeFromJson(Map<String, dynamic> json) {
  return PhotoSize(
    file_id: json['file_id'] as String,
    width: json['width'] as int,
    height: json['height'] as int,
    file_size: json['file_size'] as int,
  );
}

Map<String, dynamic> _$PhotoSizeToJson(PhotoSize instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('file_id', instance.file_id);
  writeNotNull('width', instance.width);
  writeNotNull('height', instance.height);
  writeNotNull('file_size', instance.file_size);
  return val;
}

Audio _$AudioFromJson(Map<String, dynamic> json) {
  return Audio(
    file_id: json['file_id'] as String,
    duration: json['duration'] as int,
    performer: json['performer'] as String,
    title: json['title'] as String,
    mime_type: json['mime_type'] as String,
    file_size: json['file_size'] as int,
    thumb: json['thumb'] == null
        ? null
        : PhotoSize.fromJson(json['thumb'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AudioToJson(Audio instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('file_id', instance.file_id);
  writeNotNull('duration', instance.duration);
  writeNotNull('performer', instance.performer);
  writeNotNull('title', instance.title);
  writeNotNull('mime_type', instance.mime_type);
  writeNotNull('file_size', instance.file_size);
  writeNotNull('thumb', instance.thumb);
  return val;
}

Document _$DocumentFromJson(Map<String, dynamic> json) {
  return Document(
    file_id: json['file_id'] as String,
    thumb: json['thumb'] == null
        ? null
        : PhotoSize.fromJson(json['thumb'] as Map<String, dynamic>),
    file_name: json['file_name'] as String,
    mime_type: json['mime_type'] as String,
    file_size: json['file_size'] as int,
  );
}

Map<String, dynamic> _$DocumentToJson(Document instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('file_id', instance.file_id);
  writeNotNull('thumb', instance.thumb);
  writeNotNull('file_name', instance.file_name);
  writeNotNull('mime_type', instance.mime_type);
  writeNotNull('file_size', instance.file_size);
  return val;
}

Video _$VideoFromJson(Map<String, dynamic> json) {
  return Video(
    file_id: json['file_id'] as String,
    width: json['width'] as int,
    height: json['height'] as int,
    duration: json['duration'] as int,
    thumb: json['thumb'] == null
        ? null
        : PhotoSize.fromJson(json['thumb'] as Map<String, dynamic>),
    mime_type: json['mime_type'] as String,
    file_size: json['file_size'] as int,
  );
}

Map<String, dynamic> _$VideoToJson(Video instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('file_id', instance.file_id);
  writeNotNull('width', instance.width);
  writeNotNull('height', instance.height);
  writeNotNull('duration', instance.duration);
  writeNotNull('thumb', instance.thumb);
  writeNotNull('mime_type', instance.mime_type);
  writeNotNull('file_size', instance.file_size);
  return val;
}

Animation _$AnimationFromJson(Map<String, dynamic> json) {
  return Animation(
    file_id: json['file_id'] as String,
    width: json['width'] as int,
    height: json['height'] as int,
    duration: json['duration'] as int,
    thumb: json['thumb'] == null
        ? null
        : PhotoSize.fromJson(json['thumb'] as Map<String, dynamic>),
    file_name: json['file_name'] as String,
    mime_type: json['mime_type'] as String,
    file_size: json['file_size'] as int,
  );
}

Map<String, dynamic> _$AnimationToJson(Animation instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('file_id', instance.file_id);
  writeNotNull('width', instance.width);
  writeNotNull('height', instance.height);
  writeNotNull('duration', instance.duration);
  writeNotNull('thumb', instance.thumb);
  writeNotNull('file_name', instance.file_name);
  writeNotNull('mime_type', instance.mime_type);
  writeNotNull('file_size', instance.file_size);
  return val;
}

Voice _$VoiceFromJson(Map<String, dynamic> json) {
  return Voice(
    file_id: json['file_id'] as String,
    duration: json['duration'] as int,
    mime_type: json['mime_type'] as String,
    file_size: json['file_size'] as int,
  );
}

Map<String, dynamic> _$VoiceToJson(Voice instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('file_id', instance.file_id);
  writeNotNull('duration', instance.duration);
  writeNotNull('mime_type', instance.mime_type);
  writeNotNull('file_size', instance.file_size);
  return val;
}

VideoNote _$VideoNoteFromJson(Map<String, dynamic> json) {
  return VideoNote(
    file_id: json['file_id'] as String,
    length: json['length'] as int,
    duration: json['duration'] as int,
    thumb: json['thumb'] == null
        ? null
        : PhotoSize.fromJson(json['thumb'] as Map<String, dynamic>),
    file_size: json['file_size'] as int,
  );
}

Map<String, dynamic> _$VideoNoteToJson(VideoNote instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('file_id', instance.file_id);
  writeNotNull('length', instance.length);
  writeNotNull('duration', instance.duration);
  writeNotNull('thumb', instance.thumb);
  writeNotNull('file_size', instance.file_size);
  return val;
}

Contact _$ContactFromJson(Map<String, dynamic> json) {
  return Contact(
    phone_number: json['phone_number'] as String,
    first_name: json['first_name'] as String,
    last_name: json['last_name'] as String,
    user_id: json['user_id'] as int,
    vcard: json['vcard'] as String,
  );
}

Map<String, dynamic> _$ContactToJson(Contact instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('phone_number', instance.phone_number);
  writeNotNull('first_name', instance.first_name);
  writeNotNull('last_name', instance.last_name);
  writeNotNull('user_id', instance.user_id);
  writeNotNull('vcard', instance.vcard);
  return val;
}

LoginUrl _$LoginUrlFromJson(Map<String, dynamic> json) {
  return LoginUrl(
    json['url'],
    forward_text: json['forward_text'] as String,
    bot_username: json['bot_username'] as String,
    request_write_access: json['request_write_access'] as bool,
  );
}

Map<String, dynamic> _$LoginUrlToJson(LoginUrl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('url', instance.url);
  writeNotNull('forward_text', instance.forward_text);
  writeNotNull('bot_username', instance.bot_username);
  writeNotNull('request_write_access', instance.request_write_access);
  return val;
}

Location _$LocationFromJson(Map<String, dynamic> json) {
  return Location(
    longitude: (json['longitude'] as num)?.toDouble(),
    latitude: (json['latitude'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$LocationToJson(Location instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('longitude', instance.longitude);
  writeNotNull('latitude', instance.latitude);
  return val;
}

Venue _$VenueFromJson(Map<String, dynamic> json) {
  return Venue(
    location: json['location'] == null
        ? null
        : Location.fromJson(json['location'] as Map<String, dynamic>),
    title: json['title'] as String,
    address: json['address'] as String,
    foursquare_id: json['foursquare_id'] as String,
    foursquare_type: json['foursquare_type'] as String,
  );
}

Map<String, dynamic> _$VenueToJson(Venue instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('location', instance.location);
  writeNotNull('title', instance.title);
  writeNotNull('address', instance.address);
  writeNotNull('foursquare_id', instance.foursquare_id);
  writeNotNull('foursquare_type', instance.foursquare_type);
  return val;
}

PollOption _$PollOptionFromJson(Map<String, dynamic> json) {
  return PollOption(
    text: json['text'] as String,
    voter_count: json['voter_count'] as int,
  );
}

Map<String, dynamic> _$PollOptionToJson(PollOption instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('text', instance.text);
  writeNotNull('voter_count', instance.voter_count);
  return val;
}

Poll _$PollFromJson(Map<String, dynamic> json) {
  return Poll(
    id: json['id'] as String,
    question: json['question'] as String,
    options: (json['options'] as List)
        ?.map((e) =>
            e == null ? null : PollOption.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    is_closed: json['is_closed'] as bool,
  );
}

Map<String, dynamic> _$PollToJson(Poll instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('question', instance.question);
  writeNotNull('options', instance.options);
  writeNotNull('is_closed', instance.is_closed);
  return val;
}

UserProfilePhotos _$UserProfilePhotosFromJson(Map<String, dynamic> json) {
  return UserProfilePhotos(
    total_count: json['total_count'] as int,
    photos: (json['photos'] as List)
        ?.map((e) => (e as List)
            ?.map((e) => e == null
                ? null
                : PhotoSize.fromJson(e as Map<String, dynamic>))
            ?.toList())
        ?.toList(),
  );
}

Map<String, dynamic> _$UserProfilePhotosToJson(UserProfilePhotos instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('total_count', instance.total_count);
  writeNotNull('photos', instance.photos);
  return val;
}

File _$FileFromJson(Map<String, dynamic> json) {
  return File(
    file_id: json['file_id'] as String,
    file_size: json['file_size'] as int,
    file_path: json['file_path'] as String,
  );
}

Map<String, dynamic> _$FileToJson(File instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('file_id', instance.file_id);
  writeNotNull('file_size', instance.file_size);
  writeNotNull('file_path', instance.file_path);
  return val;
}

ReplyMarkup _$ReplyMarkupFromJson(Map<String, dynamic> json) {
  return ReplyMarkup();
}

Map<String, dynamic> _$ReplyMarkupToJson(ReplyMarkup instance) =>
    <String, dynamic>{};

ReplyKeyboardMarkup _$ReplyKeyboardMarkupFromJson(Map<String, dynamic> json) {
  return ReplyKeyboardMarkup(
    keyboard: (json['keyboard'] as List)
        ?.map((e) => (e as List)
            ?.map((e) => e == null
                ? null
                : KeyboardButton.fromJson(e as Map<String, dynamic>))
            ?.toList())
        ?.toList(),
    resize_keyboard: json['resize_keyboard'] as bool,
    one_time_keyboard: json['one_time_keyboard'] as bool,
    selective: json['selective'] as bool,
  );
}

Map<String, dynamic> _$ReplyKeyboardMarkupToJson(ReplyKeyboardMarkup instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('keyboard', instance.keyboard);
  writeNotNull('resize_keyboard', instance.resize_keyboard);
  writeNotNull('one_time_keyboard', instance.one_time_keyboard);
  writeNotNull('selective', instance.selective);
  return val;
}

KeyboardButton _$KeyboardButtonFromJson(Map<String, dynamic> json) {
  return KeyboardButton(
    text: json['text'] as String,
    request_contact: json['request_contact'] as bool,
    request_location: json['request_location'] as bool,
  );
}

Map<String, dynamic> _$KeyboardButtonToJson(KeyboardButton instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('text', instance.text);
  writeNotNull('request_contact', instance.request_contact);
  writeNotNull('request_location', instance.request_location);
  return val;
}

ReplyKeyboardRemove _$ReplyKeyboardRemoveFromJson(Map<String, dynamic> json) {
  return ReplyKeyboardRemove(
    remove_keyboard: json['remove_keyboard'] as bool,
    selective: json['selective'] as bool,
  );
}

Map<String, dynamic> _$ReplyKeyboardRemoveToJson(ReplyKeyboardRemove instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('remove_keyboard', instance.remove_keyboard);
  writeNotNull('selective', instance.selective);
  return val;
}

InlineKeyboardMarkup _$InlineKeyboardMarkupFromJson(Map<String, dynamic> json) {
  return InlineKeyboardMarkup(
    inline_keyboard: (json['inline_keyboard'] as List)
        ?.map((e) => (e as List)
            ?.map((e) => e == null
                ? null
                : InlineKeyboardButton.fromJson(e as Map<String, dynamic>))
            ?.toList())
        ?.toList(),
  );
}

Map<String, dynamic> _$InlineKeyboardMarkupToJson(
    InlineKeyboardMarkup instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('inline_keyboard', instance.inline_keyboard);
  return val;
}

InlineKeyboardButton _$InlineKeyboardButtonFromJson(Map<String, dynamic> json) {
  return InlineKeyboardButton(
    text: json['text'] as String,
    url: json['url'] as String,
    login_url: json['login_url'] == null
        ? null
        : LoginUrl.fromJson(json['login_url'] as Map<String, dynamic>),
    callback_data: json['callback_data'] as String,
    switch_inline_query: json['switch_inline_query'] as String,
    switch_inline_query_current_chat:
        json['switch_inline_query_current_chat'] as String,
    callback_game: json['callback_game'] == null
        ? null
        : CallbackGame.fromJson(json['callback_game'] as Map<String, dynamic>),
    pay: json['pay'] as bool,
  );
}

Map<String, dynamic> _$InlineKeyboardButtonToJson(
    InlineKeyboardButton instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('text', instance.text);
  writeNotNull('url', instance.url);
  writeNotNull('login_url', instance.login_url);
  writeNotNull('callback_data', instance.callback_data);
  writeNotNull('switch_inline_query', instance.switch_inline_query);
  writeNotNull('switch_inline_query_current_chat',
      instance.switch_inline_query_current_chat);
  writeNotNull('callback_game', instance.callback_game);
  writeNotNull('pay', instance.pay);
  return val;
}

CallbackQuery _$CallbackQueryFromJson(Map<String, dynamic> json) {
  return CallbackQuery(
    id: json['id'] as String,
    from: json['from'] == null
        ? null
        : User.fromJson(json['from'] as Map<String, dynamic>),
    message: json['message'] == null
        ? null
        : Message.fromJson(json['message'] as Map<String, dynamic>),
    inline_message_id: json['inline_message_id'] as String,
    chat_instance: json['chat_instance'] as String,
    data: json['data'] as String,
    game_short_name: json['game_short_name'] as String,
  );
}

Map<String, dynamic> _$CallbackQueryToJson(CallbackQuery instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('from', instance.from);
  writeNotNull('message', instance.message);
  writeNotNull('inline_message_id', instance.inline_message_id);
  writeNotNull('chat_instance', instance.chat_instance);
  writeNotNull('data', instance.data);
  writeNotNull('game_short_name', instance.game_short_name);
  return val;
}

ForceReply _$ForceReplyFromJson(Map<String, dynamic> json) {
  return ForceReply(
    force_reply: json['force_reply'] as bool,
    selective: json['selective'] as bool,
  );
}

Map<String, dynamic> _$ForceReplyToJson(ForceReply instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('force_reply', instance.force_reply);
  writeNotNull('selective', instance.selective);
  return val;
}

ChatPhoto _$ChatPhotoFromJson(Map<String, dynamic> json) {
  return ChatPhoto(
    small_file_id: json['small_file_id'] as String,
    big_file_id: json['big_file_id'] as String,
  );
}

Map<String, dynamic> _$ChatPhotoToJson(ChatPhoto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('small_file_id', instance.small_file_id);
  writeNotNull('big_file_id', instance.big_file_id);
  return val;
}

ChatMember _$ChatMemberFromJson(Map<String, dynamic> json) {
  return ChatMember(
    user: json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
    status: json['status'] as String,
    until_date: json['until_date'] as int,
    can_be_edited: json['can_be_edited'] as bool,
    can_change_info: json['can_change_info'] as bool,
    can_post_messages: json['can_post_messages'] as bool,
    can_edit_messages: json['can_edit_messages'] as bool,
    can_delete_messages: json['can_delete_messages'] as bool,
    can_invite_users: json['can_invite_users'] as bool,
    can_restrict_members: json['can_restrict_members'] as bool,
    can_pin_messages: json['can_pin_messages'] as bool,
    can_promote_members: json['can_promote_members'] as bool,
    is_member: json['is_member'] as bool,
    can_send_messages: json['can_send_messages'] as bool,
    can_send_media_messages: json['can_send_media_messages'] as bool,
    can_send_other_messages: json['can_send_other_messages'] as bool,
    can_add_web_page_previews: json['can_add_web_page_previews'] as bool,
  );
}

Map<String, dynamic> _$ChatMemberToJson(ChatMember instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('user', instance.user);
  writeNotNull('status', instance.status);
  writeNotNull('until_date', instance.until_date);
  writeNotNull('can_be_edited', instance.can_be_edited);
  writeNotNull('can_change_info', instance.can_change_info);
  writeNotNull('can_post_messages', instance.can_post_messages);
  writeNotNull('can_edit_messages', instance.can_edit_messages);
  writeNotNull('can_delete_messages', instance.can_delete_messages);
  writeNotNull('can_invite_users', instance.can_invite_users);
  writeNotNull('can_restrict_members', instance.can_restrict_members);
  writeNotNull('can_pin_messages', instance.can_pin_messages);
  writeNotNull('can_promote_members', instance.can_promote_members);
  writeNotNull('is_member', instance.is_member);
  writeNotNull('can_send_messages', instance.can_send_messages);
  writeNotNull('can_send_media_messages', instance.can_send_media_messages);
  writeNotNull('can_send_other_messages', instance.can_send_other_messages);
  writeNotNull('can_add_web_page_previews', instance.can_add_web_page_previews);
  return val;
}

ChatPermissions _$ChatPermissionsFromJson(Map<String, dynamic> json) {
  return ChatPermissions(
    can_send_messages: json['can_send_messages'] as bool,
    can_send_media_messages: json['can_send_media_messages'] as bool,
    can_send_polls: json['can_send_polls'] as bool,
    can_send_other_messages: json['can_send_other_messages'] as bool,
    can_add_web_page_previews: json['can_add_web_page_previews'] as bool,
    can_change_info: json['can_change_info'] as bool,
    can_invite_users: json['can_invite_users'] as bool,
    can_pin_messages: json['can_pin_messages'] as bool,
  );
}

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

ResponseParameters _$ResponseParametersFromJson(Map<String, dynamic> json) {
  return ResponseParameters(
    migrate_to_chat_id: json['migrate_to_chat_id'] as int,
    retry_after: json['retry_after'] as int,
  );
}

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

InputMedia _$InputMediaFromJson(Map<String, dynamic> json) {
  return InputMedia(
    type: json['type'] as String,
    media: json['media'] as String,
    caption: json['caption'] as String,
    parse_mode: json['parse_mode'] as String,
  );
}

Map<String, dynamic> _$InputMediaToJson(InputMedia instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('type', instance.type);
  writeNotNull('media', instance.media);
  writeNotNull('caption', instance.caption);
  writeNotNull('parse_mode', instance.parse_mode);
  return val;
}

InputMediaPhoto _$InputMediaPhotoFromJson(Map<String, dynamic> json) {
  return InputMediaPhoto(
    type: json['type'] as String,
    media: json['media'] as String,
    caption: json['caption'] as String,
    parse_mode: json['parse_mode'] as String,
  );
}

Map<String, dynamic> _$InputMediaPhotoToJson(InputMediaPhoto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('caption', instance.caption);
  writeNotNull('media', instance.media);
  writeNotNull('parse_mode', instance.parse_mode);
  writeNotNull('type', instance.type);
  return val;
}

InputMediaVideo _$InputMediaVideoFromJson(Map<String, dynamic> json) {
  return InputMediaVideo(
    type: json['type'] as String,
    media: json['media'] as String,
    caption: json['caption'] as String,
    parse_mode: json['parse_mode'] as String,
    thumb: json['thumb'],
    width: json['width'] as int,
    height: json['height'] as int,
    duration: json['duration'] as int,
    supports_streaming: json['supports_streaming'] as bool,
  );
}

Map<String, dynamic> _$InputMediaVideoToJson(InputMediaVideo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('caption', instance.caption);
  writeNotNull('media', instance.media);
  writeNotNull('parse_mode', instance.parse_mode);
  writeNotNull('type', instance.type);
  writeNotNull('thumb', instance.thumb);
  writeNotNull('width', instance.width);
  writeNotNull('height', instance.height);
  writeNotNull('duration', instance.duration);
  writeNotNull('supports_streaming', instance.supports_streaming);
  return val;
}

InputMediaAnimation _$InputMediaAnimationFromJson(Map<String, dynamic> json) {
  return InputMediaAnimation(
    type: json['type'] as String,
    media: json['media'] as String,
    thumb: json['thumb'],
    caption: json['caption'] as String,
    parse_mode: json['parse_mode'] as String,
    width: json['width'] as int,
    height: json['height'] as int,
    duration: json['duration'] as int,
  );
}

Map<String, dynamic> _$InputMediaAnimationToJson(InputMediaAnimation instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('caption', instance.caption);
  writeNotNull('media', instance.media);
  writeNotNull('parse_mode', instance.parse_mode);
  writeNotNull('type', instance.type);
  writeNotNull('thumb', instance.thumb);
  writeNotNull('width', instance.width);
  writeNotNull('height', instance.height);
  writeNotNull('duration', instance.duration);
  return val;
}

InputMediaAudio _$InputMediaAudioFromJson(Map<String, dynamic> json) {
  return InputMediaAudio(
    type: json['type'] as String,
    media: json['media'] as String,
    thumb: json['thumb'],
    caption: json['caption'] as String,
    parse_mode: json['parse_mode'] as String,
    duration: json['duration'] as int,
    performer: json['performer'] as String,
    title: json['title'] as String,
  );
}

Map<String, dynamic> _$InputMediaAudioToJson(InputMediaAudio instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('caption', instance.caption);
  writeNotNull('media', instance.media);
  writeNotNull('parse_mode', instance.parse_mode);
  writeNotNull('type', instance.type);
  writeNotNull('thumb', instance.thumb);
  writeNotNull('duration', instance.duration);
  writeNotNull('performer', instance.performer);
  writeNotNull('title', instance.title);
  return val;
}

InputMediaDocument _$InputMediaDocumentFromJson(Map<String, dynamic> json) {
  return InputMediaDocument(
    type: json['type'] as String,
    media: json['media'] as String,
    thumb: json['thumb'],
    caption: json['caption'] as String,
    parse_mode: json['parse_mode'] as String,
  );
}

Map<String, dynamic> _$InputMediaDocumentToJson(InputMediaDocument instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('caption', instance.caption);
  writeNotNull('media', instance.media);
  writeNotNull('parse_mode', instance.parse_mode);
  writeNotNull('type', instance.type);
  writeNotNull('thumb', instance.thumb);
  return val;
}

Sticker _$StickerFromJson(Map<String, dynamic> json) {
  return Sticker(
    file_id: json['file_id'] as String,
    width: json['width'] as int,
    height: json['height'] as int,
    is_animated: json['is_animated'] as bool,
    thumb: json['thumb'] == null
        ? null
        : PhotoSize.fromJson(json['thumb'] as Map<String, dynamic>),
    emoji: json['emoji'] as String,
    set_name: json['set_name'] as String,
    mask_position: json['mask_position'] == null
        ? null
        : MaskPosition.fromJson(json['mask_position'] as Map<String, dynamic>),
    file_size: json['file_size'] as int,
  );
}

Map<String, dynamic> _$StickerToJson(Sticker instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('file_id', instance.file_id);
  writeNotNull('width', instance.width);
  writeNotNull('height', instance.height);
  writeNotNull('is_animated', instance.is_animated);
  writeNotNull('thumb', instance.thumb);
  writeNotNull('emoji', instance.emoji);
  writeNotNull('set_name', instance.set_name);
  writeNotNull('mask_position', instance.mask_position);
  writeNotNull('file_size', instance.file_size);
  return val;
}

StickerSet _$StickerSetFromJson(Map<String, dynamic> json) {
  return StickerSet(
    name: json['name'] as String,
    title: json['title'] as String,
    is_animated: json['is_animated'] as bool,
    contains_masks: json['contains_masks'] as bool,
    stickers: (json['stickers'] as List)
        ?.map((e) =>
            e == null ? null : Sticker.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$StickerSetToJson(StickerSet instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('title', instance.title);
  writeNotNull('is_animated', instance.is_animated);
  writeNotNull('contains_masks', instance.contains_masks);
  writeNotNull('stickers', instance.stickers);
  return val;
}

MaskPosition _$MaskPositionFromJson(Map<String, dynamic> json) {
  return MaskPosition(
    point: json['point'] as String,
    x_shift: (json['x_shift'] as num)?.toDouble(),
    y_shift: (json['y_shift'] as num)?.toDouble(),
    scale: (json['scale'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$MaskPositionToJson(MaskPosition instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('point', instance.point);
  writeNotNull('x_shift', instance.x_shift);
  writeNotNull('y_shift', instance.y_shift);
  writeNotNull('scale', instance.scale);
  return val;
}

InlineQuery _$InlineQueryFromJson(Map<String, dynamic> json) {
  return InlineQuery(
    id: json['id'] as String,
    from: json['from'] == null
        ? null
        : User.fromJson(json['from'] as Map<String, dynamic>),
    location: json['location'] == null
        ? null
        : Location.fromJson(json['location'] as Map<String, dynamic>),
    query: json['query'] as String,
    offset: json['offset'] as String,
  );
}

Map<String, dynamic> _$InlineQueryToJson(InlineQuery instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('from', instance.from);
  writeNotNull('location', instance.location);
  writeNotNull('query', instance.query);
  writeNotNull('offset', instance.offset);
  return val;
}

InlineQueryResult _$InlineQueryResultFromJson(Map<String, dynamic> json) {
  return InlineQueryResult(
    type: json['type'] as String,
    id: json['id'] as String,
  );
}

Map<String, dynamic> _$InlineQueryResultToJson(InlineQueryResult instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('type', instance.type);
  writeNotNull('id', instance.id);
  return val;
}

InlineQueryResultArticle _$InlineQueryResultArticleFromJson(
    Map<String, dynamic> json) {
  return InlineQueryResultArticle(
    id: json['id'] as String,
    type: json['type'] as String,
    title: json['title'] as String,
    input_message_content: json['input_message_content'] == null
        ? null
        : InputMessageContent.fromJson(
            json['input_message_content'] as Map<String, dynamic>),
    reply_markup: json['reply_markup'] == null
        ? null
        : InlineKeyboardMarkup.fromJson(
            json['reply_markup'] as Map<String, dynamic>),
    url: json['url'] as String,
    hide_url: json['hide_url'] as bool,
    description: json['description'] as String,
    thumb_url: json['thumb_url'] as String,
    thumb_width: json['thumb_width'] as String,
    thumb_height: json['thumb_height'] as String,
  );
}

Map<String, dynamic> _$InlineQueryResultArticleToJson(
    InlineQueryResultArticle instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('type', instance.type);
  writeNotNull('title', instance.title);
  writeNotNull('input_message_content', instance.input_message_content);
  writeNotNull('reply_markup', instance.reply_markup);
  writeNotNull('url', instance.url);
  writeNotNull('hide_url', instance.hide_url);
  writeNotNull('description', instance.description);
  writeNotNull('thumb_url', instance.thumb_url);
  writeNotNull('thumb_width', instance.thumb_width);
  writeNotNull('thumb_height', instance.thumb_height);
  return val;
}

InlineQueryResultPhoto _$InlineQueryResultPhotoFromJson(
    Map<String, dynamic> json) {
  return InlineQueryResultPhoto(
    id: json['id'] as String,
    type: json['type'] as String,
    photo_url: json['photo_url'] as String,
    thumb_url: json['thumb_url'] as String,
    photo_width: json['photo_width'] as int,
    photo_height: json['photo_height'] as int,
    title: json['title'] as String,
    description: json['description'] as String,
    caption: json['caption'] as String,
    parse_mode: json['parse_mode'] as String,
    reply_markup: json['reply_markup'] == null
        ? null
        : InlineKeyboardMarkup.fromJson(
            json['reply_markup'] as Map<String, dynamic>),
    input_message_content: json['input_message_content'] == null
        ? null
        : InputMessageContent.fromJson(
            json['input_message_content'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$InlineQueryResultPhotoToJson(
    InlineQueryResultPhoto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('type', instance.type);
  writeNotNull('photo_url', instance.photo_url);
  writeNotNull('thumb_url', instance.thumb_url);
  writeNotNull('photo_width', instance.photo_width);
  writeNotNull('photo_height', instance.photo_height);
  writeNotNull('title', instance.title);
  writeNotNull('description', instance.description);
  writeNotNull('caption', instance.caption);
  writeNotNull('parse_mode', instance.parse_mode);
  writeNotNull('reply_markup', instance.reply_markup);
  writeNotNull('input_message_content', instance.input_message_content);
  return val;
}

InlineQueryResultGif _$InlineQueryResultGifFromJson(Map<String, dynamic> json) {
  return InlineQueryResultGif(
    id: json['id'] as String,
    type: json['type'] as String,
    gif_url: json['gif_url'] as String,
    gif_width: json['gif_width'] as int,
    gif_height: json['gif_height'] as int,
    gif_duration: json['gif_duration'] as int,
    thumb_url: json['thumb_url'] as String,
    title: json['title'] as String,
    caption: json['caption'] as String,
    parse_mode: json['parse_mode'] as String,
    reply_markup: json['reply_markup'] == null
        ? null
        : InlineKeyboardMarkup.fromJson(
            json['reply_markup'] as Map<String, dynamic>),
    input_message_content: json['input_message_content'] == null
        ? null
        : InputMessageContent.fromJson(
            json['input_message_content'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$InlineQueryResultGifToJson(
    InlineQueryResultGif instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('type', instance.type);
  writeNotNull('gif_url', instance.gif_url);
  writeNotNull('gif_width', instance.gif_width);
  writeNotNull('gif_height', instance.gif_height);
  writeNotNull('gif_duration', instance.gif_duration);
  writeNotNull('thumb_url', instance.thumb_url);
  writeNotNull('title', instance.title);
  writeNotNull('caption', instance.caption);
  writeNotNull('parse_mode', instance.parse_mode);
  writeNotNull('reply_markup', instance.reply_markup);
  writeNotNull('input_message_content', instance.input_message_content);
  return val;
}

InlineQueryResultMpeg4Gif _$InlineQueryResultMpeg4GifFromJson(
    Map<String, dynamic> json) {
  return InlineQueryResultMpeg4Gif(
    id: json['id'] as String,
    type: json['type'] as String,
    mpeg4_url: json['mpeg4_url'] as String,
    mpeg4_width: json['mpeg4_width'] as int,
    mpeg4_height: json['mpeg4_height'] as int,
    mpeg4_duration: json['mpeg4_duration'] as int,
    thumb_url: json['thumb_url'] as String,
    title: json['title'] as String,
    caption: json['caption'] as String,
    parse_mode: json['parse_mode'] as String,
    reply_markup: json['reply_markup'] == null
        ? null
        : InlineKeyboardMarkup.fromJson(
            json['reply_markup'] as Map<String, dynamic>),
    input_message_content: json['input_message_content'] == null
        ? null
        : InputMessageContent.fromJson(
            json['input_message_content'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$InlineQueryResultMpeg4GifToJson(
    InlineQueryResultMpeg4Gif instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('type', instance.type);
  writeNotNull('mpeg4_url', instance.mpeg4_url);
  writeNotNull('mpeg4_width', instance.mpeg4_width);
  writeNotNull('mpeg4_height', instance.mpeg4_height);
  writeNotNull('mpeg4_duration', instance.mpeg4_duration);
  writeNotNull('thumb_url', instance.thumb_url);
  writeNotNull('title', instance.title);
  writeNotNull('caption', instance.caption);
  writeNotNull('parse_mode', instance.parse_mode);
  writeNotNull('reply_markup', instance.reply_markup);
  writeNotNull('input_message_content', instance.input_message_content);
  return val;
}

InlineQueryResultVideo _$InlineQueryResultVideoFromJson(
    Map<String, dynamic> json) {
  return InlineQueryResultVideo(
    id: json['id'] as String,
    type: json['type'] as String,
    video_url: json['video_url'] as String,
    mime_type: json['mime_type'] as String,
    thumb_url: json['thumb_url'] as String,
    title: json['title'] as String,
    caption: json['caption'] as String,
    parse_mode: json['parse_mode'] as String,
    video_width: json['video_width'] as int,
    video_height: json['video_height'] as int,
    video_duration: json['video_duration'] as int,
    description: json['description'] as String,
    reply_markup: json['reply_markup'] == null
        ? null
        : InlineKeyboardMarkup.fromJson(
            json['reply_markup'] as Map<String, dynamic>),
    input_message_content: json['input_message_content'] == null
        ? null
        : InputMessageContent.fromJson(
            json['input_message_content'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$InlineQueryResultVideoToJson(
    InlineQueryResultVideo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('type', instance.type);
  writeNotNull('video_url', instance.video_url);
  writeNotNull('mime_type', instance.mime_type);
  writeNotNull('thumb_url', instance.thumb_url);
  writeNotNull('title', instance.title);
  writeNotNull('caption', instance.caption);
  writeNotNull('parse_mode', instance.parse_mode);
  writeNotNull('video_width', instance.video_width);
  writeNotNull('video_height', instance.video_height);
  writeNotNull('video_duration', instance.video_duration);
  writeNotNull('description', instance.description);
  writeNotNull('reply_markup', instance.reply_markup);
  writeNotNull('input_message_content', instance.input_message_content);
  return val;
}

InlineQueryResultAudio _$InlineQueryResultAudioFromJson(
    Map<String, dynamic> json) {
  return InlineQueryResultAudio(
    id: json['id'] as String,
    type: json['type'] as String,
    audio_url: json['audio_url'] as String,
    title: json['title'] as String,
    caption: json['caption'] as String,
    parse_mode: json['parse_mode'] as String,
    performer: json['performer'] as String,
    audio_duration: json['audio_duration'] as int,
    reply_markup: json['reply_markup'] == null
        ? null
        : InlineKeyboardMarkup.fromJson(
            json['reply_markup'] as Map<String, dynamic>),
    input_message_content: json['input_message_content'] == null
        ? null
        : InputMessageContent.fromJson(
            json['input_message_content'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$InlineQueryResultAudioToJson(
    InlineQueryResultAudio instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('type', instance.type);
  writeNotNull('audio_url', instance.audio_url);
  writeNotNull('title', instance.title);
  writeNotNull('caption', instance.caption);
  writeNotNull('parse_mode', instance.parse_mode);
  writeNotNull('performer', instance.performer);
  writeNotNull('audio_duration', instance.audio_duration);
  writeNotNull('reply_markup', instance.reply_markup);
  writeNotNull('input_message_content', instance.input_message_content);
  return val;
}

InlineQueryResultVoice _$InlineQueryResultVoiceFromJson(
    Map<String, dynamic> json) {
  return InlineQueryResultVoice(
    id: json['id'] as String,
    type: json['type'] as String,
    voice_url: json['voice_url'] as String,
    title: json['title'] as String,
    caption: json['caption'] as String,
    parse_mode: json['parse_mode'] as String,
    voice_duration: json['voice_duration'] as int,
    reply_markup: json['reply_markup'] == null
        ? null
        : InlineKeyboardMarkup.fromJson(
            json['reply_markup'] as Map<String, dynamic>),
    input_message_content: json['input_message_content'] == null
        ? null
        : InputMessageContent.fromJson(
            json['input_message_content'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$InlineQueryResultVoiceToJson(
    InlineQueryResultVoice instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('type', instance.type);
  writeNotNull('voice_url', instance.voice_url);
  writeNotNull('title', instance.title);
  writeNotNull('caption', instance.caption);
  writeNotNull('parse_mode', instance.parse_mode);
  writeNotNull('voice_duration', instance.voice_duration);
  writeNotNull('reply_markup', instance.reply_markup);
  writeNotNull('input_message_content', instance.input_message_content);
  return val;
}

InlineQueryResultDocument _$InlineQueryResultDocumentFromJson(
    Map<String, dynamic> json) {
  return InlineQueryResultDocument(
    id: json['id'] as String,
    type: json['type'] as String,
    title: json['title'] as String,
    caption: json['caption'] as String,
    parse_mode: json['parse_mode'] as String,
    document_url: json['document_url'] as String,
    mime_type: json['mime_type'] as String,
    description: json['description'] as String,
    reply_markup: json['reply_markup'] == null
        ? null
        : InlineKeyboardMarkup.fromJson(
            json['reply_markup'] as Map<String, dynamic>),
    input_message_content: json['input_message_content'] == null
        ? null
        : InputMessageContent.fromJson(
            json['input_message_content'] as Map<String, dynamic>),
    thumb_url: json['thumb_url'] as String,
    thumb_width: json['thumb_width'] as int,
    thumb_height: json['thumb_height'] as int,
  );
}

Map<String, dynamic> _$InlineQueryResultDocumentToJson(
    InlineQueryResultDocument instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('type', instance.type);
  writeNotNull('title', instance.title);
  writeNotNull('caption', instance.caption);
  writeNotNull('parse_mode', instance.parse_mode);
  writeNotNull('document_url', instance.document_url);
  writeNotNull('mime_type', instance.mime_type);
  writeNotNull('description', instance.description);
  writeNotNull('reply_markup', instance.reply_markup);
  writeNotNull('input_message_content', instance.input_message_content);
  writeNotNull('thumb_url', instance.thumb_url);
  writeNotNull('thumb_width', instance.thumb_width);
  writeNotNull('thumb_height', instance.thumb_height);
  return val;
}

InlineQueryResultLocation _$InlineQueryResultLocationFromJson(
    Map<String, dynamic> json) {
  return InlineQueryResultLocation(
    id: json['id'] as String,
    type: json['type'] as String,
    latitude: (json['latitude'] as num)?.toDouble(),
    longitude: (json['longitude'] as num)?.toDouble(),
    title: json['title'] as String,
    live_period: json['live_period'] as int,
    reply_markup: json['reply_markup'] == null
        ? null
        : InlineKeyboardMarkup.fromJson(
            json['reply_markup'] as Map<String, dynamic>),
    input_message_content: json['input_message_content'] == null
        ? null
        : InputMessageContent.fromJson(
            json['input_message_content'] as Map<String, dynamic>),
    thumb_url: json['thumb_url'] as String,
    thumb_width: json['thumb_width'] as int,
    thumb_height: json['thumb_height'] as int,
  );
}

Map<String, dynamic> _$InlineQueryResultLocationToJson(
    InlineQueryResultLocation instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('type', instance.type);
  writeNotNull('latitude', instance.latitude);
  writeNotNull('longitude', instance.longitude);
  writeNotNull('title', instance.title);
  writeNotNull('live_period', instance.live_period);
  writeNotNull('reply_markup', instance.reply_markup);
  writeNotNull('input_message_content', instance.input_message_content);
  writeNotNull('thumb_url', instance.thumb_url);
  writeNotNull('thumb_width', instance.thumb_width);
  writeNotNull('thumb_height', instance.thumb_height);
  return val;
}

InlineQueryResultVenue _$InlineQueryResultVenueFromJson(
    Map<String, dynamic> json) {
  return InlineQueryResultVenue(
    id: json['id'] as String,
    type: json['type'] as String,
    latitude: (json['latitude'] as num)?.toDouble(),
    longitude: (json['longitude'] as num)?.toDouble(),
    title: json['title'] as String,
    address: json['address'] as String,
    foursquare_id: json['foursquare_id'] as String,
    foursquare_type: json['foursquare_type'] as String,
    reply_markup: json['reply_markup'] == null
        ? null
        : InlineKeyboardMarkup.fromJson(
            json['reply_markup'] as Map<String, dynamic>),
    input_message_content: json['input_message_content'] == null
        ? null
        : InputMessageContent.fromJson(
            json['input_message_content'] as Map<String, dynamic>),
    thumb_url: json['thumb_url'] as String,
    thumb_width: json['thumb_width'] as int,
    thumb_height: json['thumb_height'] as int,
  );
}

Map<String, dynamic> _$InlineQueryResultVenueToJson(
    InlineQueryResultVenue instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('type', instance.type);
  writeNotNull('latitude', instance.latitude);
  writeNotNull('longitude', instance.longitude);
  writeNotNull('title', instance.title);
  writeNotNull('address', instance.address);
  writeNotNull('foursquare_id', instance.foursquare_id);
  writeNotNull('foursquare_type', instance.foursquare_type);
  writeNotNull('reply_markup', instance.reply_markup);
  writeNotNull('input_message_content', instance.input_message_content);
  writeNotNull('thumb_url', instance.thumb_url);
  writeNotNull('thumb_width', instance.thumb_width);
  writeNotNull('thumb_height', instance.thumb_height);
  return val;
}

InlineQueryResultContact _$InlineQueryResultContactFromJson(
    Map<String, dynamic> json) {
  return InlineQueryResultContact(
    id: json['id'] as String,
    type: json['type'] as String,
    phone_number: json['phone_number'] as String,
    first_name: json['first_name'] as String,
    last_name: json['last_name'] as String,
    vcard: json['vcard'] as String,
    reply_markup: json['reply_markup'] == null
        ? null
        : InlineKeyboardMarkup.fromJson(
            json['reply_markup'] as Map<String, dynamic>),
    input_message_content: json['input_message_content'] == null
        ? null
        : InputMessageContent.fromJson(
            json['input_message_content'] as Map<String, dynamic>),
    thumb_url: json['thumb_url'] as String,
    thumb_width: json['thumb_width'] as int,
    thumb_height: json['thumb_height'] as int,
  );
}

Map<String, dynamic> _$InlineQueryResultContactToJson(
    InlineQueryResultContact instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('type', instance.type);
  writeNotNull('phone_number', instance.phone_number);
  writeNotNull('first_name', instance.first_name);
  writeNotNull('last_name', instance.last_name);
  writeNotNull('vcard', instance.vcard);
  writeNotNull('reply_markup', instance.reply_markup);
  writeNotNull('input_message_content', instance.input_message_content);
  writeNotNull('thumb_url', instance.thumb_url);
  writeNotNull('thumb_width', instance.thumb_width);
  writeNotNull('thumb_height', instance.thumb_height);
  return val;
}

InlineQueryResultGame _$InlineQueryResultGameFromJson(
    Map<String, dynamic> json) {
  return InlineQueryResultGame(
    id: json['id'] as String,
    type: json['type'] as String,
    game_short_name: json['game_short_name'] as String,
    reply_markup: json['reply_markup'] == null
        ? null
        : InlineKeyboardMarkup.fromJson(
            json['reply_markup'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$InlineQueryResultGameToJson(
    InlineQueryResultGame instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('type', instance.type);
  writeNotNull('game_short_name', instance.game_short_name);
  writeNotNull('reply_markup', instance.reply_markup);
  return val;
}

InlineQueryResultCachedPhoto _$InlineQueryResultCachedPhotoFromJson(
    Map<String, dynamic> json) {
  return InlineQueryResultCachedPhoto(
    id: json['id'] as String,
    type: json['type'] as String,
    photo_file_id: json['photo_file_id'] as String,
    title: json['title'] as String,
    description: json['description'] as String,
    caption: json['caption'] as String,
    parse_mode: json['parse_mode'] as String,
    reply_markup: json['reply_markup'] == null
        ? null
        : InlineKeyboardMarkup.fromJson(
            json['reply_markup'] as Map<String, dynamic>),
    input_message_content: json['input_message_content'] == null
        ? null
        : InputMessageContent.fromJson(
            json['input_message_content'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$InlineQueryResultCachedPhotoToJson(
    InlineQueryResultCachedPhoto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('type', instance.type);
  writeNotNull('photo_file_id', instance.photo_file_id);
  writeNotNull('title', instance.title);
  writeNotNull('description', instance.description);
  writeNotNull('caption', instance.caption);
  writeNotNull('parse_mode', instance.parse_mode);
  writeNotNull('reply_markup', instance.reply_markup);
  writeNotNull('input_message_content', instance.input_message_content);
  return val;
}

InlineQueryResultCachedGif _$InlineQueryResultCachedGifFromJson(
    Map<String, dynamic> json) {
  return InlineQueryResultCachedGif(
    id: json['id'] as String,
    type: json['type'] as String,
    gif_file_id: json['gif_file_id'] as String,
    title: json['title'] as String,
    caption: json['caption'] as String,
    parse_mode: json['parse_mode'] as String,
    reply_markup: json['reply_markup'] == null
        ? null
        : InlineKeyboardMarkup.fromJson(
            json['reply_markup'] as Map<String, dynamic>),
    input_message_content: json['input_message_content'] == null
        ? null
        : InputMessageContent.fromJson(
            json['input_message_content'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$InlineQueryResultCachedGifToJson(
    InlineQueryResultCachedGif instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('type', instance.type);
  writeNotNull('gif_file_id', instance.gif_file_id);
  writeNotNull('title', instance.title);
  writeNotNull('caption', instance.caption);
  writeNotNull('parse_mode', instance.parse_mode);
  writeNotNull('reply_markup', instance.reply_markup);
  writeNotNull('input_message_content', instance.input_message_content);
  return val;
}

InlineQueryResultCachedMpeg4Gif _$InlineQueryResultCachedMpeg4GifFromJson(
    Map<String, dynamic> json) {
  return InlineQueryResultCachedMpeg4Gif(
    id: json['id'] as String,
    type: json['type'] as String,
    mpeg4_file_id: json['mpeg4_file_id'] as String,
    title: json['title'] as String,
    caption: json['caption'] as String,
    parse_mode: json['parse_mode'] as String,
    reply_markup: json['reply_markup'] == null
        ? null
        : InlineKeyboardMarkup.fromJson(
            json['reply_markup'] as Map<String, dynamic>),
    input_message_content: json['input_message_content'] == null
        ? null
        : InputMessageContent.fromJson(
            json['input_message_content'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$InlineQueryResultCachedMpeg4GifToJson(
    InlineQueryResultCachedMpeg4Gif instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('type', instance.type);
  writeNotNull('mpeg4_file_id', instance.mpeg4_file_id);
  writeNotNull('title', instance.title);
  writeNotNull('caption', instance.caption);
  writeNotNull('parse_mode', instance.parse_mode);
  writeNotNull('reply_markup', instance.reply_markup);
  writeNotNull('input_message_content', instance.input_message_content);
  return val;
}

InlineQueryResultCachedSticker _$InlineQueryResultCachedStickerFromJson(
    Map<String, dynamic> json) {
  return InlineQueryResultCachedSticker(
    id: json['id'] as String,
    type: json['type'] as String,
    sticker_file_id: json['sticker_file_id'] as String,
    reply_markup: json['reply_markup'] == null
        ? null
        : InlineKeyboardMarkup.fromJson(
            json['reply_markup'] as Map<String, dynamic>),
    input_message_content: json['input_message_content'] == null
        ? null
        : InputMessageContent.fromJson(
            json['input_message_content'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$InlineQueryResultCachedStickerToJson(
    InlineQueryResultCachedSticker instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('type', instance.type);
  writeNotNull('sticker_file_id', instance.sticker_file_id);
  writeNotNull('reply_markup', instance.reply_markup);
  writeNotNull('input_message_content', instance.input_message_content);
  return val;
}

InlineQueryResultCachedDocument _$InlineQueryResultCachedDocumentFromJson(
    Map<String, dynamic> json) {
  return InlineQueryResultCachedDocument(
    id: json['id'] as String,
    type: json['type'] as String,
    title: json['title'] as String,
    document_file_id: json['document_file_id'] as String,
    description: json['description'] as String,
    caption: json['caption'] as String,
    parse_mode: json['parse_mode'] as String,
    reply_markup: json['reply_markup'] == null
        ? null
        : InlineKeyboardMarkup.fromJson(
            json['reply_markup'] as Map<String, dynamic>),
    input_message_content: json['input_message_content'] == null
        ? null
        : InputMessageContent.fromJson(
            json['input_message_content'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$InlineQueryResultCachedDocumentToJson(
    InlineQueryResultCachedDocument instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('type', instance.type);
  writeNotNull('title', instance.title);
  writeNotNull('document_file_id', instance.document_file_id);
  writeNotNull('description', instance.description);
  writeNotNull('caption', instance.caption);
  writeNotNull('parse_mode', instance.parse_mode);
  writeNotNull('reply_markup', instance.reply_markup);
  writeNotNull('input_message_content', instance.input_message_content);
  return val;
}

InlineQueryResultCachedVideo _$InlineQueryResultCachedVideoFromJson(
    Map<String, dynamic> json) {
  return InlineQueryResultCachedVideo(
    id: json['id'] as String,
    type: json['type'] as String,
    video_file_id: json['video_file_id'] as String,
    title: json['title'] as String,
    description: json['description'] as String,
    caption: json['caption'] as String,
    parse_mode: json['parse_mode'] as String,
    reply_markup: json['reply_markup'] == null
        ? null
        : InlineKeyboardMarkup.fromJson(
            json['reply_markup'] as Map<String, dynamic>),
    input_message_content: json['input_message_content'] == null
        ? null
        : InputMessageContent.fromJson(
            json['input_message_content'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$InlineQueryResultCachedVideoToJson(
    InlineQueryResultCachedVideo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('type', instance.type);
  writeNotNull('video_file_id', instance.video_file_id);
  writeNotNull('title', instance.title);
  writeNotNull('description', instance.description);
  writeNotNull('caption', instance.caption);
  writeNotNull('parse_mode', instance.parse_mode);
  writeNotNull('reply_markup', instance.reply_markup);
  writeNotNull('input_message_content', instance.input_message_content);
  return val;
}

InlineQueryResultCachedVoice _$InlineQueryResultCachedVoiceFromJson(
    Map<String, dynamic> json) {
  return InlineQueryResultCachedVoice(
    id: json['id'] as String,
    type: json['type'] as String,
    voice_file_id: json['voice_file_id'] as String,
    title: json['title'] as String,
    caption: json['caption'] as String,
    parse_mode: json['parse_mode'] as String,
    reply_markup: json['reply_markup'] == null
        ? null
        : InlineKeyboardMarkup.fromJson(
            json['reply_markup'] as Map<String, dynamic>),
    input_message_content: json['input_message_content'] == null
        ? null
        : InputMessageContent.fromJson(
            json['input_message_content'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$InlineQueryResultCachedVoiceToJson(
    InlineQueryResultCachedVoice instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('type', instance.type);
  writeNotNull('voice_file_id', instance.voice_file_id);
  writeNotNull('title', instance.title);
  writeNotNull('caption', instance.caption);
  writeNotNull('parse_mode', instance.parse_mode);
  writeNotNull('reply_markup', instance.reply_markup);
  writeNotNull('input_message_content', instance.input_message_content);
  return val;
}

InlineQueryResultCachedAudio _$InlineQueryResultCachedAudioFromJson(
    Map<String, dynamic> json) {
  return InlineQueryResultCachedAudio(
    id: json['id'] as String,
    type: json['type'] as String,
    audio_file_id: json['audio_file_id'] as String,
    caption: json['caption'] as String,
    parse_mode: json['parse_mode'] as String,
    reply_markup: json['reply_markup'] == null
        ? null
        : InlineKeyboardMarkup.fromJson(
            json['reply_markup'] as Map<String, dynamic>),
    input_message_content: json['input_message_content'] == null
        ? null
        : InputMessageContent.fromJson(
            json['input_message_content'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$InlineQueryResultCachedAudioToJson(
    InlineQueryResultCachedAudio instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('type', instance.type);
  writeNotNull('audio_file_id', instance.audio_file_id);
  writeNotNull('caption', instance.caption);
  writeNotNull('parse_mode', instance.parse_mode);
  writeNotNull('reply_markup', instance.reply_markup);
  writeNotNull('input_message_content', instance.input_message_content);
  return val;
}

InputMessageContent _$InputMessageContentFromJson(Map<String, dynamic> json) {
  return InputMessageContent();
}

Map<String, dynamic> _$InputMessageContentToJson(
        InputMessageContent instance) =>
    <String, dynamic>{};

InputTextMessageContent _$InputTextMessageContentFromJson(
    Map<String, dynamic> json) {
  return InputTextMessageContent(
    message_text: json['message_text'] as String,
    parse_mode: json['parse_mode'] as String,
    disable_web_page_preview: json['disable_web_page_preview'] as bool,
  );
}

Map<String, dynamic> _$InputTextMessageContentToJson(
    InputTextMessageContent instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('message_text', instance.message_text);
  writeNotNull('parse_mode', instance.parse_mode);
  writeNotNull('disable_web_page_preview', instance.disable_web_page_preview);
  return val;
}

InputLocationMessageContent _$InputLocationMessageContentFromJson(
    Map<String, dynamic> json) {
  return InputLocationMessageContent(
    latitude: (json['latitude'] as num)?.toDouble(),
    longitude: (json['longitude'] as num)?.toDouble(),
    live_period: json['live_period'] as int,
  );
}

Map<String, dynamic> _$InputLocationMessageContentToJson(
    InputLocationMessageContent instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('latitude', instance.latitude);
  writeNotNull('longitude', instance.longitude);
  writeNotNull('live_period', instance.live_period);
  return val;
}

InputVenueMessageContent _$InputVenueMessageContentFromJson(
    Map<String, dynamic> json) {
  return InputVenueMessageContent(
    latitude: (json['latitude'] as num)?.toDouble(),
    longitude: (json['longitude'] as num)?.toDouble(),
    title: json['title'] as String,
    address: json['address'] as String,
    foursquare_id: json['foursquare_id'] as String,
    foursquare_type: json['foursquare_type'] as String,
  );
}

Map<String, dynamic> _$InputVenueMessageContentToJson(
    InputVenueMessageContent instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('latitude', instance.latitude);
  writeNotNull('longitude', instance.longitude);
  writeNotNull('title', instance.title);
  writeNotNull('address', instance.address);
  writeNotNull('foursquare_id', instance.foursquare_id);
  writeNotNull('foursquare_type', instance.foursquare_type);
  return val;
}

InputContactMessageContent _$InputContactMessageContentFromJson(
    Map<String, dynamic> json) {
  return InputContactMessageContent(
    phone_number: json['phone_number'] as String,
    first_name: json['first_name'] as String,
    last_name: json['last_name'] as String,
    vcard: json['vcard'] as String,
  );
}

Map<String, dynamic> _$InputContactMessageContentToJson(
    InputContactMessageContent instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('phone_number', instance.phone_number);
  writeNotNull('first_name', instance.first_name);
  writeNotNull('last_name', instance.last_name);
  writeNotNull('vcard', instance.vcard);
  return val;
}

ChosenInlineResult _$ChosenInlineResultFromJson(Map<String, dynamic> json) {
  return ChosenInlineResult(
    result_id: json['result_id'] as String,
    from: json['from'] == null
        ? null
        : User.fromJson(json['from'] as Map<String, dynamic>),
    location: json['location'] == null
        ? null
        : Location.fromJson(json['location'] as Map<String, dynamic>),
    inline_message_id: json['inline_message_id'] as String,
    query: json['query'] as String,
  );
}

Map<String, dynamic> _$ChosenInlineResultToJson(ChosenInlineResult instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('result_id', instance.result_id);
  writeNotNull('from', instance.from);
  writeNotNull('location', instance.location);
  writeNotNull('inline_message_id', instance.inline_message_id);
  writeNotNull('query', instance.query);
  return val;
}

LabeledPrice _$LabeledPriceFromJson(Map<String, dynamic> json) {
  return LabeledPrice(
    label: json['label'] as String,
    amount: json['amount'] as int,
  );
}

Map<String, dynamic> _$LabeledPriceToJson(LabeledPrice instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('label', instance.label);
  writeNotNull('amount', instance.amount);
  return val;
}

Invoice _$InvoiceFromJson(Map<String, dynamic> json) {
  return Invoice(
    title: json['title'] as String,
    description: json['description'] as String,
    start_parameter: json['start_parameter'] as String,
    currency: json['currency'] as String,
    total_amount: json['total_amount'] as int,
  );
}

Map<String, dynamic> _$InvoiceToJson(Invoice instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('title', instance.title);
  writeNotNull('description', instance.description);
  writeNotNull('start_parameter', instance.start_parameter);
  writeNotNull('currency', instance.currency);
  writeNotNull('total_amount', instance.total_amount);
  return val;
}

ShippingAddress _$ShippingAddressFromJson(Map<String, dynamic> json) {
  return ShippingAddress(
    country_code: json['country_code'] as String,
    state: json['state'] as String,
    city: json['city'] as String,
    street_line1: json['street_line1'] as String,
    street_line2: json['street_line2'] as String,
    post_code: json['post_code'] as String,
  );
}

Map<String, dynamic> _$ShippingAddressToJson(ShippingAddress instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('country_code', instance.country_code);
  writeNotNull('state', instance.state);
  writeNotNull('city', instance.city);
  writeNotNull('street_line1', instance.street_line1);
  writeNotNull('street_line2', instance.street_line2);
  writeNotNull('post_code', instance.post_code);
  return val;
}

OrderInfo _$OrderInfoFromJson(Map<String, dynamic> json) {
  return OrderInfo(
    name: json['name'] as String,
    phone_number: json['phone_number'] as String,
    email: json['email'] as String,
    shippingAddress: json['shippingAddress'] == null
        ? null
        : ShippingAddress.fromJson(
            json['shippingAddress'] as Map<String, dynamic>),
  );
}

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
  writeNotNull('shippingAddress', instance.shippingAddress);
  return val;
}

ShippingOption _$ShippingOptionFromJson(Map<String, dynamic> json) {
  return ShippingOption(
    id: json['id'] as String,
    title: json['title'] as String,
    prices: (json['prices'] as List)
        ?.map((e) =>
            e == null ? null : LabeledPrice.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ShippingOptionToJson(ShippingOption instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('title', instance.title);
  writeNotNull('prices', instance.prices);
  return val;
}

SuccessfulPayment _$SuccessfulPaymentFromJson(Map<String, dynamic> json) {
  return SuccessfulPayment(
    currency: json['currency'] as String,
    total_amount: json['total_amount'] as int,
    invoice_payload: json['invoice_payload'] as String,
    shipping_option_id: json['shipping_option_id'] as String,
    order_info: json['order_info'] == null
        ? null
        : OrderInfo.fromJson(json['order_info'] as Map<String, dynamic>),
    telegram_payment_charge_id: json['telegram_payment_charge_id'] as String,
    provider_payment_charge_id: json['provider_payment_charge_id'] as String,
  );
}

Map<String, dynamic> _$SuccessfulPaymentToJson(SuccessfulPayment instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('currency', instance.currency);
  writeNotNull('total_amount', instance.total_amount);
  writeNotNull('invoice_payload', instance.invoice_payload);
  writeNotNull('shipping_option_id', instance.shipping_option_id);
  writeNotNull('order_info', instance.order_info);
  writeNotNull(
      'telegram_payment_charge_id', instance.telegram_payment_charge_id);
  writeNotNull(
      'provider_payment_charge_id', instance.provider_payment_charge_id);
  return val;
}

ShippingQuery _$ShippingQueryFromJson(Map<String, dynamic> json) {
  return ShippingQuery(
    id: json['id'] as String,
    from: json['from'] == null
        ? null
        : User.fromJson(json['from'] as Map<String, dynamic>),
    invoice_payload: json['invoice_payload'] as String,
    shipping_address: json['shipping_address'] == null
        ? null
        : ShippingAddress.fromJson(
            json['shipping_address'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ShippingQueryToJson(ShippingQuery instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('from', instance.from);
  writeNotNull('invoice_payload', instance.invoice_payload);
  writeNotNull('shipping_address', instance.shipping_address);
  return val;
}

PreCheckoutQuery _$PreCheckoutQueryFromJson(Map<String, dynamic> json) {
  return PreCheckoutQuery(
    id: json['id'] as String,
    from: json['from'] == null
        ? null
        : User.fromJson(json['from'] as Map<String, dynamic>),
    currency: json['currency'] as String,
    total_amount: json['total_amount'] as int,
    invoice_payload: json['invoice_payload'] as String,
    shipping_option_id: json['shipping_option_id'] as String,
    order_info: json['order_info'] == null
        ? null
        : OrderInfo.fromJson(json['order_info'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PreCheckoutQueryToJson(PreCheckoutQuery instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('from', instance.from);
  writeNotNull('currency', instance.currency);
  writeNotNull('total_amount', instance.total_amount);
  writeNotNull('invoice_payload', instance.invoice_payload);
  writeNotNull('shipping_option_id', instance.shipping_option_id);
  writeNotNull('order_info', instance.order_info);
  return val;
}

PassportData _$PassportDataFromJson(Map<String, dynamic> json) {
  return PassportData(
    data: (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : EncryptedPassportElement.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    credentials: json['credentials'] == null
        ? null
        : EncryptedCredentials.fromJson(
            json['credentials'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PassportDataToJson(PassportData instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('data', instance.data);
  writeNotNull('credentials', instance.credentials);
  return val;
}

PassportFile _$PassportFileFromJson(Map<String, dynamic> json) {
  return PassportFile(
    file_id: json['file_id'] as String,
    file_size: json['file_size'] as int,
    file_date: json['file_date'] as int,
  );
}

Map<String, dynamic> _$PassportFileToJson(PassportFile instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('file_id', instance.file_id);
  writeNotNull('file_size', instance.file_size);
  writeNotNull('file_date', instance.file_date);
  return val;
}

EncryptedPassportElement _$EncryptedPassportElementFromJson(
    Map<String, dynamic> json) {
  return EncryptedPassportElement(
    type: json['type'] as String,
    data: json['data'] as String,
    phone_number: json['phone_number'] as String,
    email: json['email'] as String,
    files: (json['files'] as List)
        ?.map((e) =>
            e == null ? null : PassportFile.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    front_side: json['front_side'] == null
        ? null
        : PassportFile.fromJson(json['front_side'] as Map<String, dynamic>),
    reverse_side: json['reverse_side'] == null
        ? null
        : PassportFile.fromJson(json['reverse_side'] as Map<String, dynamic>),
    selfie: json['selfie'] == null
        ? null
        : PassportFile.fromJson(json['selfie'] as Map<String, dynamic>),
    translation: (json['translation'] as List)
        ?.map((e) =>
            e == null ? null : PassportFile.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    hash: json['hash'] as String,
  );
}

Map<String, dynamic> _$EncryptedPassportElementToJson(
    EncryptedPassportElement instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('type', instance.type);
  writeNotNull('data', instance.data);
  writeNotNull('phone_number', instance.phone_number);
  writeNotNull('email', instance.email);
  writeNotNull('files', instance.files);
  writeNotNull('front_side', instance.front_side);
  writeNotNull('reverse_side', instance.reverse_side);
  writeNotNull('selfie', instance.selfie);
  writeNotNull('translation', instance.translation);
  writeNotNull('hash', instance.hash);
  return val;
}

EncryptedCredentials _$EncryptedCredentialsFromJson(Map<String, dynamic> json) {
  return EncryptedCredentials(
    data: json['data'] as String,
    hash: json['hash'] as String,
    secret: json['secret'] as String,
  );
}

Map<String, dynamic> _$EncryptedCredentialsToJson(
    EncryptedCredentials instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('data', instance.data);
  writeNotNull('hash', instance.hash);
  writeNotNull('secret', instance.secret);
  return val;
}

PassportElementError _$PassportElementErrorFromJson(Map<String, dynamic> json) {
  return PassportElementError(
    source: json['source'] as String,
    type: json['type'] as String,
    message: json['message'] as String,
  );
}

Map<String, dynamic> _$PassportElementErrorToJson(
    PassportElementError instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('source', instance.source);
  writeNotNull('type', instance.type);
  writeNotNull('message', instance.message);
  return val;
}

PassportElementErrorDataField _$PassportElementErrorDataFieldFromJson(
    Map<String, dynamic> json) {
  return PassportElementErrorDataField(
    source: json['source'] as String,
    type: json['type'] as String,
    message: json['message'] as String,
    field_name: json['field_name'] as String,
    data_hash: json['data_hash'] as String,
  );
}

Map<String, dynamic> _$PassportElementErrorDataFieldToJson(
    PassportElementErrorDataField instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('source', instance.source);
  writeNotNull('type', instance.type);
  writeNotNull('message', instance.message);
  writeNotNull('field_name', instance.field_name);
  writeNotNull('data_hash', instance.data_hash);
  return val;
}

PassportElementErrorFrontSide _$PassportElementErrorFrontSideFromJson(
    Map<String, dynamic> json) {
  return PassportElementErrorFrontSide(
    source: json['source'] as String,
    type: json['type'] as String,
    message: json['message'] as String,
    file_hash: json['file_hash'] as String,
  );
}

Map<String, dynamic> _$PassportElementErrorFrontSideToJson(
    PassportElementErrorFrontSide instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('source', instance.source);
  writeNotNull('type', instance.type);
  writeNotNull('message', instance.message);
  writeNotNull('file_hash', instance.file_hash);
  return val;
}

PassportElementErrorReverseSide _$PassportElementErrorReverseSideFromJson(
    Map<String, dynamic> json) {
  return PassportElementErrorReverseSide(
    source: json['source'] as String,
    type: json['type'] as String,
    message: json['message'] as String,
    file_hash: json['file_hash'] as String,
  );
}

Map<String, dynamic> _$PassportElementErrorReverseSideToJson(
    PassportElementErrorReverseSide instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('source', instance.source);
  writeNotNull('type', instance.type);
  writeNotNull('message', instance.message);
  writeNotNull('file_hash', instance.file_hash);
  return val;
}

PassportElementErrorSelfie _$PassportElementErrorSelfieFromJson(
    Map<String, dynamic> json) {
  return PassportElementErrorSelfie(
    source: json['source'] as String,
    type: json['type'] as String,
    message: json['message'] as String,
    file_hash: json['file_hash'] as String,
  );
}

Map<String, dynamic> _$PassportElementErrorSelfieToJson(
    PassportElementErrorSelfie instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('source', instance.source);
  writeNotNull('type', instance.type);
  writeNotNull('message', instance.message);
  writeNotNull('file_hash', instance.file_hash);
  return val;
}

PassportElementErrorFile _$PassportElementErrorFileFromJson(
    Map<String, dynamic> json) {
  return PassportElementErrorFile(
    source: json['source'] as String,
    type: json['type'] as String,
    message: json['message'] as String,
    file_hash: json['file_hash'] as String,
  );
}

Map<String, dynamic> _$PassportElementErrorFileToJson(
    PassportElementErrorFile instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('source', instance.source);
  writeNotNull('type', instance.type);
  writeNotNull('message', instance.message);
  writeNotNull('file_hash', instance.file_hash);
  return val;
}

PassportElementErrorFiles _$PassportElementErrorFilesFromJson(
    Map<String, dynamic> json) {
  return PassportElementErrorFiles(
    source: json['source'] as String,
    type: json['type'] as String,
    message: json['message'] as String,
    file_hashes:
        (json['file_hashes'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$PassportElementErrorFilesToJson(
    PassportElementErrorFiles instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('source', instance.source);
  writeNotNull('type', instance.type);
  writeNotNull('message', instance.message);
  writeNotNull('file_hashes', instance.file_hashes);
  return val;
}

PassportElementErrorTranslationFile
    _$PassportElementErrorTranslationFileFromJson(Map<String, dynamic> json) {
  return PassportElementErrorTranslationFile(
    source: json['source'] as String,
    type: json['type'] as String,
    message: json['message'] as String,
    file_hash: json['file_hash'] as String,
  );
}

Map<String, dynamic> _$PassportElementErrorTranslationFileToJson(
    PassportElementErrorTranslationFile instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('source', instance.source);
  writeNotNull('type', instance.type);
  writeNotNull('message', instance.message);
  writeNotNull('file_hash', instance.file_hash);
  return val;
}

PassportElementErrorTranslationFiles
    _$PassportElementErrorTranslationFilesFromJson(Map<String, dynamic> json) {
  return PassportElementErrorTranslationFiles(
    source: json['source'] as String,
    type: json['type'] as String,
    message: json['message'] as String,
    file_hashes:
        (json['file_hashes'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$PassportElementErrorTranslationFilesToJson(
    PassportElementErrorTranslationFiles instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('source', instance.source);
  writeNotNull('type', instance.type);
  writeNotNull('message', instance.message);
  writeNotNull('file_hashes', instance.file_hashes);
  return val;
}

PassportElementErrorUnspecified _$PassportElementErrorUnspecifiedFromJson(
    Map<String, dynamic> json) {
  return PassportElementErrorUnspecified(
    source: json['source'] as String,
    type: json['type'] as String,
    message: json['message'] as String,
    file_hash: json['file_hash'] as String,
  );
}

Map<String, dynamic> _$PassportElementErrorUnspecifiedToJson(
    PassportElementErrorUnspecified instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('source', instance.source);
  writeNotNull('type', instance.type);
  writeNotNull('message', instance.message);
  writeNotNull('file_hash', instance.file_hash);
  return val;
}

Game _$GameFromJson(Map<String, dynamic> json) {
  return Game(
    title: json['title'] as String,
    description: json['description'] as String,
    photo: (json['photo'] as List)
        ?.map((e) =>
            e == null ? null : PhotoSize.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    text: json['text'] as String,
    text_entities: (json['text_entities'] as List)
        ?.map((e) => e == null
            ? null
            : MessageEntity.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    animation: json['animation'] == null
        ? null
        : Animation.fromJson(json['animation'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GameToJson(Game instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('title', instance.title);
  writeNotNull('description', instance.description);
  writeNotNull('photo', instance.photo);
  writeNotNull('text', instance.text);
  writeNotNull('text_entities', instance.text_entities);
  writeNotNull('animation', instance.animation);
  return val;
}

CallbackGame _$CallbackGameFromJson(Map<String, dynamic> json) {
  return CallbackGame();
}

Map<String, dynamic> _$CallbackGameToJson(CallbackGame instance) =>
    <String, dynamic>{};

GameHighScore _$GameHighScoreFromJson(Map<String, dynamic> json) {
  return GameHighScore(
    position: json['position'] as int,
    user: json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
    score: json['score'] as int,
  );
}

Map<String, dynamic> _$GameHighScoreToJson(GameHighScore instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('position', instance.position);
  writeNotNull('user', instance.user);
  writeNotNull('score', instance.score);
  return val;
}
