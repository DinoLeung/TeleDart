import 'dart:async';
import 'package:dartson/dartson.dart';
import 'package:http/http.dart' as http;

import './Model.dart';
import './HttpClient.dart';

class Telegram {

  final String _baseUrl = 'https://api.telegram.org/bot';
  String _token;
  Telegram(this._token);

  final _dson = new Dartson.JSON();
  final _client = new HttpClient();

  Future<List<Update>> getUpdates({int offset, int limit, int timeout}) async {

    String requestUrl = '${_baseUrl}${_token}/getUpdates?'
      + (offset == null ? '' : 'offset=${offset}&')
      + (limit == null ? '' : 'limit=${limit}&')
      + (timeout == null ? '' : 'timeout=${timeout}');

    return _client.httpGet(requestUrl, returnType: new Update(), isList: true);
  }

  Future<bool> setWebhook(String url,
      {List<int> certificate, int max_connections,
        List<String> allowed_updates}) async {
    String requestUrl = '${_baseUrl}${_token}/setWebhook';
    Map body = {
      'url': url,
      'max_connections': max_connections == null ? '' : '${max_connections}',
      'allowed_updates': allowed_updates == null ? '' : '${allowed_updates}'
    };
    if(certificate.length > 0){
      http.MultipartFile file = new http.MultipartFile.fromBytes('certificate',
          certificate, filename: '${certificate.length}');
      return _client.httpMultipartPost(requestUrl, file, body: body);
    }
    else {
      return _client.httpPost(requestUrl, body: body);
    }
  }

  Future<bool> deleteWebhook() async {
    return _client.httpGet('${_baseUrl}${_token}/deleteWebhook');

  }

  Future<WebhookInfo> getWebhookInfo() async {
    return _client.httpGet('${_baseUrl}${_token}/getWebhookInfo', returnType: new WebhookInfo());
  }

  Future<User> getMe() async {
    return _client.httpGet('${_baseUrl}${_token}/getMe', returnType: new User());
  }

  Future<Message> sendMessage(chat_id, String text,
      {String parse_mode, bool disable_web_page_preview, bool disable_notification,
        int reply_to_message_id, ReplyMarkup reply_markup}) async {
    String requestUrl = '${_baseUrl}${_token}/sendMessage';
    Map body = {
      'chat_id': '${chat_id}',
      'text': text,
      'parse_mode': (parse_mode == null ? '' : '${parse_mode}'),
      'disable_web_page_preview': (disable_web_page_preview == null ? '' : '${disable_web_page_preview}'),
      'disable_notification': (disable_notification == null ? '' : '${disable_notification}'),
      'reply_to_message_id': (reply_to_message_id == null ? '' : '${reply_to_message_id}'),
      'reply_markup': (reply_markup == null ? '' : _dson.encode(reply_markup))
    };
    return _client.httpPost(requestUrl, body: body, returnType: new Message());
  }

  Future<Message> forwardMessage(chat_id, int from_char_id, int message_id,
      {bool disable_notification}) async {
    String requestUrl = '${_baseUrl}${_token}/forwardMessage';
    Map body = {
      'chat_id': '${chat_id}',
      'from_char_id': '${from_char_id}',
      'message_id': '${message_id}',
      'disable_notification': (disable_notification == null ? '' : '${disable_notification}')
    };
    return _client.httpPost(requestUrl, body: body, returnType: new Message());
  }

  Future<Message> sendPhoto(chat_id, photo,
      {String caption, String parse_mode, bool disable_notification,
        int reply_to_message_id, ReplyMarkup reply_markup}) async {
    String requestUrl = '${_baseUrl}${_token}/sendPhoto';
    Map body = {
      'chat_id': '${chat_id}',
      'caption': (caption == null ? '' : '${caption}'),
      'parse_mode': (parse_mode == null ? '' : '${parse_mode}'),
      'disable_notification': (disable_notification == null ? '' : '${disable_notification}'),
      'reply_to_message_id': (reply_to_message_id == null ? '' : '${reply_to_message_id}'),
      'reply_markup': (reply_markup == null ? '' : _dson.encode(reply_markup))
    };

    if(photo is List<int>) {
      // filename cannot be empty to post to Telegram server
      http.MultipartFile file = new http.MultipartFile.fromBytes('photo', photo,
          filename: '${photo.length}');
      return _client.httpMultipartPost(requestUrl, file, body: body, returnType: new Message());
    }
    else if(photo is String) {
      body.addAll({'photo': photo});
      return _client.httpPost(requestUrl, body: body, returnType: new Message());
    }
    else {
      return new Future.error('Telegram Error: Attribute \'photo\' can only be either List<int> (file in bytes) or String (Telegram file_id or image url)');
    }
  }

  Future<Message> sendAudio(chat_id, audio,
      {String caption, String parse_mode, int duration,
        String performer, String title, bool disable_notification,
        int reply_to_message_id, ReplyMarkup reply_markup}) async {
    String requestUrl = '${_baseUrl}${_token}/sendAudio';
    Map body = {
      'chat_id': '${chat_id}',
      'caption': (caption == null ? '' : '${caption}'),
      'parse_mode': (parse_mode == null ? '' : '${parse_mode}'),
      'duration': (duration == null ? '' : '${duration}'),
      'performer': (performer == null ? '' : performer),
      'title': (title == null ? '' : title),
      'disable_notification': (disable_notification == null ? '' : '${disable_notification}'),
      'reply_to_message_id': (reply_to_message_id == null ? '' : '${reply_to_message_id}'),
      'reply_markup': (reply_markup == null ? '' : _dson.encode(reply_markup))
    };

    if(audio is List<int>) {
      // filename cannot be empty to post to Telegram server
      http.MultipartFile file = new http.MultipartFile.fromBytes('audio', audio,
          filename: '${audio.length}');
      return _client.httpMultipartPost(requestUrl, file, body: body, returnType: new Message());
    }
    else if(audio is String) {
      body.addAll({'audio': audio});
      return _client.httpPost(requestUrl, body: body, returnType: new Message());
    }
    else {
      return new Future.error('Telegram Error: Attribute \'audio\' can only be either List<int> (file in bytes) or String (Telegram file_id or image url)');
    }
  }

  Future<Message> sendDocument(chat_id, document,
      {String caption, String parse_mode, bool disable_notification,
        int reply_to_message_id, ReplyMarkup reply_markup}) async {
    String requestUrl = '${_baseUrl}${_token}/sendDocument';
    Map body = {
      'chat_id': '${chat_id}',
      'caption': (caption == null ? '' : '${caption}'),
      'parse_mode': (parse_mode == null ? '' : '${parse_mode}'),
      'disable_notification': (disable_notification == null ? '' : '${disable_notification}'),
      'reply_to_message_id': (reply_to_message_id == null ? '' : '${reply_to_message_id}'),
      'reply_markup': (reply_markup == null ? '' : _dson.encode(reply_markup))
    };

    if(document is List<int>) {
      // filename cannot be empty to post to Telegram server
      http.MultipartFile file = new http.MultipartFile.fromBytes('document', document,
          filename: '${document.length}');
      return _client.httpMultipartPost(requestUrl, file, body: body, returnType: new Message());
    }
    else if(document is String) {
      body.addAll({'document': document});
      return _client.httpPost(requestUrl, body: body, returnType: new Message());
    }
    else {
      return new Future.error('Telegram Error: Attribute \'document\' can only be either List<int> (file in bytes) or String (Telegram file_id or image url)');
    }
  }

  Future<Message> sendVideo(chat_id, video,
      {int duration, int width, int height, String caption, String parse_mode,
        bool supports_streaming, bool disable_notification,
        int reply_to_message_id, ReplyMarkup reply_markup}) async {
    String requestUrl = '${_baseUrl}${_token}/sendVideo';
    Map body = {
      'chat_id': '${chat_id}',
      'duration': (duration == null ? '' : '${duration}'),
      'width': (width == null ? '' : '${width}'),
      'height': (height == null ? '' : '${height}'),
      'caption': (caption == null ? '' : '${caption}'),
      'parse_mode': (parse_mode == null ? '' : '${parse_mode}'),
      'supports_streaming': (supports_streaming == null ? '' : '${supports_streaming}'),
      'disable_notification': (disable_notification == null ? '' : '${disable_notification}'),
      'reply_to_message_id': (reply_to_message_id == null ? '' : '${reply_to_message_id}'),
      'reply_markup': (reply_markup == null ? '' : _dson.encode(reply_markup))
    };

    if(video is List<int>) {
      // filename cannot be empty to post to Telegram server
      http.MultipartFile file = new http.MultipartFile.fromBytes('video', video,
          filename: '${video.length}');
      return _client.httpMultipartPost(requestUrl, file, body: body, returnType: new Message());
    }
    else if(video is String) {
      body.addAll({'video': video});
      return _client.httpPost(requestUrl, body: body, returnType: new Message());
    }
    else {
      return new Future.error('Telegram Error: Attribute \'video\' can only be either List<int> (file in bytes) or String (Telegram file_id or image url)');
    }
  }

  Future<Message> sendVoice(chat_id, voice,
      {String caption, String parse_mode, int duration,
        bool disable_notification, int reply_to_message_id,
        ReplyMarkup reply_markup}) async {
    String requestUrl = '${_baseUrl}${_token}/sendVoice';
    Map body = {
      'chat_id': '${chat_id}',
      'caption': (caption == null ? '' : '${caption}'),
      'parse_mode': (parse_mode == null ? '' : '${parse_mode}'),
      'duration': (duration == null ? '' : '${duration}'),
      'disable_notification': (disable_notification == null ? '' : '${disable_notification}'),
      'reply_to_message_id': (reply_to_message_id == null ? '' : '${reply_to_message_id}'),
      'reply_markup': (reply_markup == null ? '' : _dson.encode(reply_markup))
    };

    if(voice is List<int>) {
      // filename cannot be empty to post to Telegram server
      http.MultipartFile file = new http.MultipartFile.fromBytes('voice', voice,
          filename: '${voice.length}');
      return _client.httpMultipartPost(requestUrl, file, body: body, returnType: new Message());
    }
    else if(voice is String) {
      body.addAll({'voice': voice});
      return _client.httpPost(requestUrl, body: body, returnType: new Message());
    }
    else {
      return new Future.error('Telegram Error: Attribute \'voice\' can only be either List<int> (file in bytes) or String (Telegram file_id or image url)');
    }
  }

  Future<Message> sendVideoNote(chat_id, video_note,
      {int duration, int length, bool disable_notification,
        int reply_to_message_id, ReplyMarkup reply_markup}) async {
    String requestUrl = '${_baseUrl}${_token}/sendVideoNote';
    Map body = {
      'chat_id': '${chat_id}',
      'duration': (duration == null ? '' : '${duration}'),
      'length': (length == null ? '' : '${length}'),
      'disable_notification': (disable_notification == null ? '' : '${disable_notification}'),
      'reply_to_message_id': (reply_to_message_id == null ? '' : '${reply_to_message_id}'),
      'reply_markup': (reply_markup == null ? '' : _dson.encode(reply_markup))
    };

    if(video_note is List<int>) {
      // filename cannot be empty to post to Telegram server
      http.MultipartFile file = new http.MultipartFile.fromBytes('video_note', video_note,
          filename: '${video_note.length}');
      return _client.httpMultipartPost(requestUrl, file, body: body, returnType: new Message());
    }
    else if(video_note is String) {
      body.addAll({'video_note': video_note});
      return _client.httpPost(requestUrl, body: body, returnType: new Message());
    }
    else {
      return new Future.error('Telegram Error: Attribute \'video_note\' can only be either List<int> (file in bytes) or String (Telegram file_id or image url)');
    }
  }

  Future<Message> sendMediaGroup(chat_id, List<InputMedia> media,
      {bool disable_notification, int reply_to_message_id}) async {
    String requestUrl = '${_baseUrl}${_token}/sendMediaGroup';
    Map body = {
      'chat_id': '${chat_id}',
      'media': _dson.encode(media),
      'disable_notification': (disable_notification == null ? '' : '${disable_notification}'),
      'reply_to_message_id': (reply_to_message_id == null ? '' : '${reply_to_message_id}')
    };
    return _client.httpPost(requestUrl, body: body, returnType: new Message());
  }

  Future<Message> sendLocation(chat_id, double latitude, double longitude,
      {int live_period, bool disable_notification, int reply_to_message_id,
        ReplyMarkup reply_markup}) async {
    String requestUrl = '${_baseUrl}${_token}/sendLocation';
    Map body = {
      'chat_id': '${chat_id}',
      'latitude': '${latitude}',
      'longitude': '${longitude}',
      'disable_notification': (disable_notification == null ? '' : '${disable_notification}'),
      'reply_to_message_id': (reply_to_message_id == null ? '' : '${reply_to_message_id}'),
      'reply_markup': (reply_markup == null ? '' : _dson.encode(reply_markup))
    };
    return _client.httpPost(requestUrl, body: body, returnType: new Message());
  }

  Future<Message> editMessageLiveLocation(double latitude, double longitude,
      {chat_id, int message_id, String inline_message_id,
        ReplyMarkup reply_markup}) async {
    if (chat_id == null && message_id == null && inline_message_id == null)
      return new Future.error('Telegram Error: Require either \'chat_id\', \'message_id\', or \'inline_message_id\'');
    String requestUrl = '${_baseUrl}${_token}/editMessageLiveLocation';
    Map body = {
      'latitude': '${latitude}',
      'longitude': '${longitude}',
      'chat_id': (chat_id == null ? '' : '${chat_id}'),
      'message_id': (message_id == null ? '' : '${message_id}'),
      'inline_message_id': (inline_message_id == null ? '' : inline_message_id),
      'reply_markup': (reply_markup == null ? '' : _dson.encode(reply_markup))
    };
    return _client.httpPost(requestUrl, body: body, returnType: new Message());
  }

  Future<Message> stopMessageLiveLocation(
      {chat_id, int message_id, String inline_message_id,
        ReplyMarkup reply_markup}) async {
    if (chat_id == null && message_id == null && inline_message_id == null)
      return new Future.error('Telegram Error: Require either \'chat_id\', \'message_id\', or \'inline_message_id\'');
    String requestUrl = '${_baseUrl}${_token}/stopMessageLiveLocation';
    Map body = {
      'chat_id': (chat_id == null ? '' : '${chat_id}'),
      'message_id': (message_id == null ? '' : '${message_id}'),
      'inline_message_id': (inline_message_id == null ? '' : inline_message_id),
      'reply_markup': (reply_markup == null ? '' : _dson.encode(reply_markup))
    };
    return _client.httpPost(requestUrl, body: body, returnType: new Message());
  }

  Future<Message> sendVenue(chat_id, double latitude, double longitude,
      String title, String address,
      {String foursquare_id, bool disable_notification, int reply_to_message_id,
        ReplyMarkup reply_markup}) async {
    String requestUrl = '${_baseUrl}${_token}/sendVenue';
    Map body = {
      'chat_id': '${chat_id}',
      'latitude': '${latitude}',
      'longitude': '${longitude}',
      'title': title,
      'address': address,
      'foursquare_id': (foursquare_id == null ? '' : foursquare_id),
      'disable_notification': (disable_notification == null ? '' : '${disable_notification}'),
      'reply_to_message_id': (reply_to_message_id == null ? '' : '${reply_to_message_id}'),
      'reply_markup': (reply_markup == null ? '' : _dson.encode(reply_markup))
    };
    return _client.httpPost(requestUrl, body: body, returnType: new Message());
  }

  Future<Message> sendContact(chat_id, String phone_number, String first_name,
      {String last_name, bool disable_notification, int reply_to_message_id,
        ReplyMarkup reply_markup}) async {
    String requestUrl = '${_baseUrl}${_token}/sendContact';
    Map body = {
      'chat_id': '${chat_id}',
      'phone_number': phone_number,
      'first_name': first_name,
      'last_name': (last_name == null ? '' : last_name),
      'disable_notification': (disable_notification == null ? '' : '${disable_notification}'),
      'reply_to_message_id': (reply_to_message_id == null ? '' : '${reply_to_message_id}'),
      'reply_markup': (reply_markup == null ? '' : _dson.encode(reply_markup))
    };
    return _client.httpPost(requestUrl, body: body, returnType: new Message());
  }

  Future<bool> sendChatAction(chat_id, String action) async {
    String requestUrl = '${_baseUrl}${_token}/sendChatAction';
    Map body = {
      'chat_id': '${chat_id}',
      'action': action
    };
    return _client.httpPost(requestUrl, body: body);
  }

  Future<List<UserProfilePhotos>> getUserProfilePhotos(user_id,
      {int offset, int limit}) async {
    String requestUrl = '${_baseUrl}${_token}/getUserProfilePhotos';
    Map body = {
      'user_id': '${user_id}',
      'offset': (offset == null ? '' : '${offset}'),
      'limit': (limit == null ? '' : '${limit}')
    };
    return _client.httpPost(requestUrl, body: body,  returnType: new UserProfilePhotos(),
        isList: true, jsonItem: 'photos');
  }

  Future<File> getFile(String file_id) async {
    String requestUrl = '${_baseUrl}${_token}/getFile';
    Map body = { 'file_id': file_id };
    return _client.httpPost(requestUrl, body: body, returnType: new File());
  }

  Future<bool> kickChatMember(chat_id, int user_id,
      {int until_date}) async {
    String requestUrl = '${_baseUrl}${_token}/kickChatMember';
    Map body = {
      'chat_id': '${chat_id}',
      'user_id': '${user_id}',
      'until_date': (until_date == null ? '' : '${until_date}')
    };
    return _client.httpPost(requestUrl, body: body);
  }

  Future<bool> unbanChatMember(chat_id, int user_id) async {
    String requestUrl = '${_baseUrl}${_token}/unbanChatMember';
    Map body = {
      'chat_id': '${chat_id}',
      'user_id': '${user_id}'
    };
    return _client.httpPost(requestUrl, body: body);
  }

  Future<bool> restrictChatMember(chat_id, int user_id,
      {int until_date, bool can_send_messages, bool can_send_media_messages,
        bool can_send_other_messages, bool can_add_web_page_previews}) async {
    String requestUrl = '${_baseUrl}${_token}/unbanChatMember';
    Map body = {
      'chat_id': '${chat_id}',
      'user_id': '${user_id}',
      'until_date': (until_date == null ? '' : '${until_date}'),
      'can_send_messages': (can_send_messages == null ? '' : '${can_send_messages}'),
      'can_send_media_messages': (can_send_media_messages == null ? '' : '${can_send_media_messages}'),
      'can_send_other_messages': (can_send_other_messages == null ? '' : '${can_send_other_messages}'),
      'can_add_web_page_previews': (can_add_web_page_previews == null ? '' : '${can_add_web_page_previews}')
    };
    return _client.httpPost(requestUrl, body: body);
  }

  Future<bool> promoteChatMember(chat_id, int user_id,
      {bool can_change_info, bool can_post_messages, bool can_edit_messages,
        bool can_delete_messages, bool can_invite_users, bool can_restrict_members,
        bool can_pin_messages, bool can_promote_members}) async {
    String requestUrl = '${_baseUrl}${_token}/promoteChatMember';
    Map body = {
      'chat_id': '${chat_id}',
      'user_id': '${user_id}',
      'can_change_info': (can_change_info == null ? '' : '${can_change_info}'),
      'can_post_messages': (can_post_messages == null ? '' : '${can_post_messages}'),
      'can_edit_messages': (can_edit_messages == null ? '' : '${can_edit_messages}'),
      'can_delete_messages': (can_delete_messages == null ? '' : '${can_delete_messages}'),
      'can_invite_users': (can_invite_users == null ? '' : '${can_invite_users}'),
      'can_restrict_members': (can_restrict_members == null ? '' : '${can_restrict_members}'),
      'can_pin_messages': (can_pin_messages == null ? '' : '${can_pin_messages}'),
      'can_promote_members': (can_promote_members == null ? '' : '${can_promote_members}')
    };
    return _client.httpPost(requestUrl, body: body);
  }

  Future<String> exportChatInviteLink(chat_id) async {
    String requestUrl = '${_baseUrl}${_token}/exportChatInviteLink';
    Map body = { 'chat_id': '${chat_id}' };
    return _client.httpPost(requestUrl, body: body);
  }

  Future<bool> setChatPhoto(chat_id, List<int> photo) async {
    String requestUrl = '${_baseUrl}${_token}/setChatPhoto';
    Map body = { 'chat_id': '${chat_id}' };
    http.MultipartFile file = new http.MultipartFile.fromBytes('photo', photo,
        filename: '${photo.length}');
    return _client.httpMultipartPost(requestUrl, file, body: body);
  }

  Future<bool> deleteChatPhoto(chat_id) async {
    String requestUrl = '${_baseUrl}${_token}/deleteChatPhoto';
    Map body = { 'chat_id': '${chat_id}' };
    return _client.httpPost(requestUrl, body: body);
  }

  Future<bool> setChatTitle(chat_id, String title) async {
    String requestUrl = '${_baseUrl}${_token}/setChatTitle';
    Map body = {
      'chat_id': '${chat_id}',
      'title': title
    };
    return _client.httpPost(requestUrl, body: body);
  }

  Future<bool> setChatDescription(chat_id,
      {String description}) async {
    String requestUrl = '${_baseUrl}${_token}/setChatDescription';
    Map body = {
      'chat_id': '${chat_id}',
      'description': (description == null ? '' : description)
    };
    return _client.httpPost(requestUrl, body: body);
  }

  Future<bool> pinChatMessage(chat_id, int message_id,
      {bool disable_notification}) async {
    String requestUrl = '${_baseUrl}${_token}/pinChatMessage';
    Map body = {
      'chat_id': '${chat_id}',
      'message_id': '${message_id}',
      'disable_notification': (disable_notification == null ? '' : disable_notification)
    };
    return _client.httpPost(requestUrl, body: body);
  }

  Future<bool> unpinChatMessage(chat_id) async {
    String requestUrl = '${_baseUrl}${_token}/unpinChatMessage';
    Map body = { 'chat_id': '${chat_id}' };
    return _client.httpPost(requestUrl, body: body);
  }

  Future<bool> leaveChat(chat_id) async {
    String requestUrl = '${_baseUrl}${_token}/leaveChat';
    Map body = { 'chat_id': '${chat_id}' };
    return _client.httpPost(requestUrl, body: body);
  }

  Future<Chat> getChat(chat_id) async {
    String requestUrl = '${_baseUrl}${_token}/getChat';
    Map body = { 'chat_id': '${chat_id}' };
    return _client.httpPost(requestUrl, body: body, returnType: new Chat());
  }

  Future<List<ChatMember>> getChatAdministrators(chat_id) async {
    String requestUrl = '${_baseUrl}${_token}/getChatAdministrators';
    Map body = { 'chat_id': '${chat_id}' };
    return _client.httpPost(requestUrl, body: body, returnType: new ChatMember(), isList: true);
  }

  Future<int> getChatMembersCount(chat_id) async {
    String requestUrl = '${_baseUrl}${_token}/getChatMembersCount';
    Map body = { 'chat_id': '${chat_id}' };
    return _client.httpPost(requestUrl, body: body);
  }

  Future<ChatMember> getChatMember(chat_id, int user_id) async {
    String requestUrl = '${_baseUrl}${_token}/getChatMember';
    Map body = {
      'chat_id': '${chat_id}',
      'user_id': '${user_id}'
    };
    return _client.httpPost(requestUrl, body: body, returnType: new ChatMember());
  }

  Future<bool> setChatStickerSet(chat_id, String sticker_set_name) async {
    String requestUrl = '${_baseUrl}${_token}/setChatStickerSet';
    Map body = {
      'chat_id': '${chat_id}',
      'sticker_set_name': sticker_set_name
    };
    return _client.httpPost(requestUrl, body: body);
  }

  Future<bool> deleteChatStickerSet(chat_id) async {
    String requestUrl = '${_baseUrl}${_token}/deleteChatStickerSet';
    Map body = { 'chat_id': '${chat_id}' };
    return _client.httpPost(requestUrl, body: body);
  }

  Future<bool> answerCallbackQuery(String callback_query_id,
      {String text, bool show_alert, String url, int cache_time}) async {
    String requestUrl = '${_baseUrl}${_token}/answerCallbackQuery';
    Map body = {
      'callback_query_id': callback_query_id,
      'text': (text == null ? '' : text),
      'show_alert': (show_alert == null ? '' : '${show_alert}'),
      'url': (url == null ? '' : url),
      'cache_time': (cache_time == null ? '' : '${cache_time}')
    };
    return _client.httpPost(requestUrl, body: body);
  }

  Future<Message> editMessageText(String text,
      {chat_id, int message_id, String inline_message_id, String parse_mode,
        bool disable_web_page_preview, InlineKeyboardMarkup reply_markup}) async {
    if (chat_id == null && message_id == null && inline_message_id == null)
      return new Future.error('Telegram Error: Require either \'chat_id\', \'message_id\', or \'inline_message_id\'');
    String requestUrl = '${_baseUrl}${_token}/editMessageText';
    Map body = {
      'chat_id': (chat_id == null ? '' : '${chat_id}'),
      'message_id': (message_id == null ? '' : '${message_id}'),
      'inline_message_id': (inline_message_id == null ? '' : inline_message_id),
      'text': text,
      'parse_mode': (parse_mode == null ? '' : parse_mode),
      'disable_web_page_preview': (disable_web_page_preview == null ? '' : '${disable_web_page_preview}'),
      'reply_markup': (reply_markup == null ? '' : _dson.encode(reply_markup))
    };
    var res = await _client.httpPost(requestUrl, body: body);
    if(res == true)
      return new Future.error('Telegram Error: Edited message is NOT sent by the bot');
    else
      return _dson.decode(res, new Message());
  }

  Future<Message> editMessageCaption(
      {chat_id, int message_id, String inline_message_id, String caption,
        String parse_mode, InlineKeyboardMarkup reply_markup}) async {
    if (chat_id == null && message_id == null && inline_message_id == null)
      return new Future.error('Telegram Error: Require either \'chat_id\', \'message_id\', or \'inline_message_id\'');
    String requestUrl = '${_baseUrl}${_token}/editMessageCaption';
    Map body = {
      'chat_id': (chat_id == null ? '' : '${chat_id}'),
      'message_id': (message_id == null ? '' : '${message_id}'),
      'inline_message_id': (inline_message_id == null ? '' : inline_message_id),
      'caption': (caption == null ? '' : caption),
      'parse_mode': (parse_mode == null ? '' : parse_mode),
      'reply_markup': (reply_markup == null ? '' : _dson.encode(reply_markup))
    };
    var res = await _client.httpPost(requestUrl, body: body);
    if(res == true)
      return new Future.error('Telegram Error: Edited message is NOT sent by the bot');
    else
      return _dson.decode(res, new Message());
  }

  Future<Message> editMessageReplyMarkup(
      {chat_id, int message_id, String inline_message_id,
        InlineKeyboardMarkup reply_markup}) async {
    if (chat_id == null && message_id == null && inline_message_id == null)
      return new Future.error('Telegram Error: Require either \'chat_id\', \'message_id\', or \'inline_message_id\'');
    String requestUrl = '${_baseUrl}${_token}/editMessageReplyMarkup';
    Map body = {
      'chat_id': (chat_id == null ? '' : '${chat_id}'),
      'message_id': (message_id == null ? '' : '${message_id}'),
      'inline_message_id': (inline_message_id == null ? '' : inline_message_id),
      'reply_markup': (reply_markup == null ? '' : _dson.encode(reply_markup))
    };
    var res = await _client.httpPost(requestUrl, body: body);
    if(res == true)
      return new Future.error('Telegram Error: Edited message is NOT sent by the bot');
    else
      return _dson.decode(res, new Message());
  }

  Future<bool> deleteMessage(chat_id, int message_id) async {
    String requestUrl = '${_baseUrl}${_token}/deleteMessage';
    Map body = {
      'chat_id': '${chat_id}',
      'message_id': '${message_id}'
    };
    return _client.httpPost(requestUrl, body: body);
  }

  Future<Message> sendSticker(chat_id, sticker,
      {bool disable_notification, int reply_to_message_id,
        ReplyMarkup reply_markup}) async {
    String requestUrl = '${_baseUrl}${_token}/sendSticker';
    Map body = {
      'chat_id': '${chat_id}',
      'disable_notification': (disable_notification == null ? '' : '${disable_notification}'),
      'reply_to_message_id': (reply_to_message_id == null ? '' : '${reply_to_message_id}'),
      'reply_markup': (reply_markup == null ? '' : _dson.encode(reply_markup))
    };

    if(sticker is List<int>) {
      // filename cannot be empty to post to Telegram server
      http.MultipartFile file = new http.MultipartFile.fromBytes('sticker', sticker,
          filename: '${sticker.length}');
      return _client.httpMultipartPost(requestUrl, file, body: body, returnType: new Message());
    }
    else if(sticker is String) {
      body.addAll({'sticker': sticker});
      return _client.httpPost(requestUrl, body: body, returnType: new Message());
    }
    else {
      return new Future.error('Telegram Error: Attribute \'sticker\' can only be either List<int> (file in bytes) or String (Telegram file_id or image url)');
    }
  }

  Future<StickerSet> getStickerSet(String name) async {
    String requestUrl = '${_baseUrl}${_token}/getStickerSet';
    Map body = { 'name': name };
    return _client.httpPost(requestUrl, body: body, returnType: new StickerSet(), isList: true);
  }

  Future<File> uploadStickerFile(int user_id, List<int> png_sticker) async {
    String requestUrl = '${_baseUrl}${_token}/uploadStickerFile';
    Map body = { 'user_id': '${user_id}' };
    http.MultipartFile file = new http.MultipartFile.fromBytes('png_sticker', png_sticker,
        filename: '${png_sticker.length}');
    return _client.httpMultipartPost(requestUrl, file, body: body, returnType: new File());
  }

  Future<bool> createNewStickerSet(int user_id, String name, String title,
      png_sticker, String emojis,
      {bool contains_masks, MaskPosition mask_position}) async {
    String requestUrl = '${_baseUrl}${_token}/createNewStickerSet';
    User botInfo = await getMe();
    Map body = {
      'user_id': '${user_id}',
      'name': '${name}_by_${botInfo.username}',
      'title': title,
      'emojis': emojis,
      'contains_masks': (contains_masks == null ? '' : '${contains_masks}'),
      'mask_position': (mask_position == null ? '' : _dson.encode(mask_position))
    };

    if(png_sticker is List<int>) {
      // filename cannot be empty to post to Telegram server
      http.MultipartFile file = new http.MultipartFile.fromBytes('png_sticker', png_sticker,
          filename: '${png_sticker.length}');
      return _client.httpMultipartPost(requestUrl, file, body: body);
    }
    else if(png_sticker is String) {
      body.addAll({'png_sticker': png_sticker});
      return _client.httpPost(requestUrl, body: body);
    }
    else {
      return new Future.error('Telegram Error: Attribute \'png_sticker\' can only be either List<int> (file in bytes) or String (Telegram file_id or image url)');
    }
  }

  Future<bool> addStickerToSet(int user_id, String name, List<int> png_sticker,
      String emojis,
      {MaskPosition mask_position}) async {
    String requestUrl = '${_baseUrl}${_token}/addStickerToSet';
    Map body = {
      'user_id': '${user_id}',
      'name': name,
      'emojis': emojis,
      'mask_position': (mask_position == null ? '' : _dson.encode(mask_position))
    };

    if(png_sticker is List<int>) {
      // filename cannot be empty to post to Telegram server
      http.MultipartFile file = new http.MultipartFile.fromBytes('png_sticker', png_sticker,
          filename: '${png_sticker.length}');
      return _client.httpMultipartPost(requestUrl, file, body: body);
    }
    else if(png_sticker is String) {
      body.addAll({'png_sticker': png_sticker});
      return _client.httpPost(requestUrl, body: body);
    }
    else {
      return new Future.error('Telegram Error: Attribute \'png_sticker\' can only be either List<int> (file in bytes) or String (Telegram file_id or image url)');
    }
  }

  Future<bool> setStickerPositionInSet(String sticker, int position) async {
    String requestUrl = '${_baseUrl}${_token}/setStickerPositionInSet';
    Map body = {
      'sticker': sticker,
      'position': '${position}'
    };
    return _client.httpPost(requestUrl, body: body);
  }

  Future<bool> deleteStickerFromSet(String sticker) async {
    String requestUrl = '${_baseUrl}${_token}/deleteStickerFromSet';
    Map body = { 'sticker': sticker };
    return _client.httpPost(requestUrl, body: body);
  }
}