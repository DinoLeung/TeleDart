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

import 'package:json_annotation/json_annotation.dart';
import '../util/time_helper.dart';

part 'model.g.dart';

part 'models/animation.dart';
part 'models/audio.dart';
part 'models/bot_command_scope_all_chats_administrators.dart';
part 'models/bot_command_scope_all_group_chats.dart';
part 'models/bot_command_scope_all_private_chats.dart';
part 'models/bot_command_scope_chat_administrators.dart';
part 'models/bot_command_scope_chat_member.dart';
part 'models/bot_command_scope_chat.dart';
part 'models/bot_command_scope_default.dart';
part 'models/bot_command_scope.dart';
part 'models/bot_command.dart';
part 'models/bot_name.dart';
part 'models/bot_description.dart';
part 'models/bot_short_description.dart';
part 'models/callback_game.dart';
part 'models/callback_query.dart';
part 'models/chat_administrator_rights.dart';
part 'models/chat_invite_link.dart';
part 'models/chat_join_request.dart';
part 'models/chat_location.dart';
part 'models/chat_member_administrator.dart';
part 'models/chat_member_banned.dart';
part 'models/chat_member_left.dart';
part 'models/chat_member_member.dart';
part 'models/chat_member_owner.dart';
part 'models/chat_member_restricted.dart';
part 'models/chat_member_updated.dart';
part 'models/chat_member.dart';
part 'models/chat_permissions.dart';
part 'models/chat_photo.dart';
part 'models/chat_shared.dart';
part 'models/chat.dart';
part 'models/chosen_inline_result.dart';
part 'models/contact.dart';
part 'models/dice.dart';
part 'models/document.dart';
part 'models/encrypted_credentials.dart';
part 'models/encrypted_passport_element.dart';
part 'models/file.dart';
part 'models/force_reply.dart';
part 'models/forum_topic_closed.dart';
part 'models/forum_topic_created.dart';
part 'models/forum_topic_edited.dart';
part 'models/forum_topic_reopened.dart';
part 'models/forum_topic.dart';
part 'models/game_high_score.dart';
part 'models/game.dart';
part 'models/general_forum_topic_hidden.dart';
part 'models/general_forum_topic_unhidden.dart';
part 'models/inline_keyboard_button.dart';
part 'models/inline_keyboard_markup.dart';
part 'models/inline_query_result_article.dart';
part 'models/inline_query_result_audio.dart';
part 'models/inline_query_result_cached_audio.dart';
part 'models/inline_query_result_cached_document.dart';
part 'models/inline_query_result_cached_gif.dart';
part 'models/inline_query_result_cached_mpeg4_gif.dart';
part 'models/inline_query_result_cached_photo.dart';
part 'models/inline_query_result_cached_sticker.dart';
part 'models/inline_query_result_cached_video.dart';
part 'models/inline_query_result_cached_voice.dart';
part 'models/inline_query_result_contact.dart';
part 'models/inline_query_result_document.dart';
part 'models/inline_query_result_game.dart';
part 'models/inline_query_result_gif.dart';
part 'models/inline_query_result_location.dart';
part 'models/inline_query_result_mpeg4_gif.dart';
part 'models/inline_query_result_photo.dart';
part 'models/inline_query_result_venue.dart';
part 'models/inline_query_result_video.dart';
part 'models/inline_query_result_voice.dart';
part 'models/inline_query_result.dart';
part 'models/inline_query.dart';
part 'models/input_contact_message_content.dart';
part 'models/input_invoice_message_content.dart';
part 'models/input_location_message_content.dart';
part 'models/input_media_animation.dart';
part 'models/input_media_audio.dart';
part 'models/input_media_document.dart';
part 'models/input_media_photo.dart';
part 'models/input_media_video.dart';
part 'models/input_media.dart';
part 'models/input_message_content.dart';
part 'models/input_text_message_content.dart';
part 'models/input_venue_message_content.dart';
part 'models/invoice.dart';
part 'models/keyboard_button_poll_type.dart';
part 'models/keyboard_button_request_chat.dart';
part 'models/keyboard_button_request_user.dart';
part 'models/keyboard_button.dart';
part 'models/labeled_price.dart';
part 'models/location.dart';
part 'models/login_url.dart';
part 'models/mask_position.dart';
part 'models/menu_button_commands.dart';
part 'models/menu_button_default.dart';
part 'models/menu_button_web_app.dart';
part 'models/menu_button.dart';
part 'models/message_auto_delete_timer_changed.dart';
part 'models/message_entity.dart';
part 'models/message_id.dart';
part 'models/message.dart';
part 'models/order_info.dart';
part 'models/passport_data.dart';
part 'models/passport_element_error_data_field.dart';
part 'models/passport_element_error_file.dart';
part 'models/passport_element_error_files.dart';
part 'models/passport_element_error_front_side.dart';
part 'models/passport_element_error_reverse_side.dart';
part 'models/passport_element_error_selfie.dart';
part 'models/passport_element_error_translation_file.dart';
part 'models/passport_element_error_translation_files.dart';
part 'models/passport_element_error_unspecified.dart';
part 'models/passport_element_error.dart';
part 'models/passport_file.dart';
part 'models/photo_size.dart';
part 'models/poll_answer.dart';
part 'models/poll_option.dart';
part 'models/poll.dart';
part 'models/pre_checkout_query.dart';
part 'models/proximity_alert_triggered.dart';
part 'models/reply_keyboard_markup.dart';
part 'models/reply_keyboard_remove.dart';
part 'models/reply_markup.dart';
part 'models/response_parameters.dart';
part 'models/response.dart';
part 'models/sent_web_app_message.dart';
part 'models/shipping_address.dart';
part 'models/shipping_option.dart';
part 'models/shipping_query.dart';
part 'models/sticker_set.dart';
part 'models/sticker.dart';
part 'models/successful_payment.dart';
part 'models/update.dart';
part 'models/user_profile_photos.dart';
part 'models/user_shared.dart';
part 'models/user.dart';
part 'models/venue.dart';
part 'models/video_note.dart';
part 'models/video.dart';
part 'models/voice_chat_ended.dart';
part 'models/voice_chat_participants_invited.dart';
part 'models/voice_chat_scheduled.dart';
part 'models/voice_chat_started.dart';
part 'models/voice.dart';
part 'models/web_app_data.dart';
part 'models/web_app_info.dart';
part 'models/webhook_info.dart';
part 'models/write_access_allowed.dart';
