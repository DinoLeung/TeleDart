## 0.5.5

- Fixed typo in response object

## 0.5.4

- Implemented Telegram bot API response object
- Update long_polling.dart to respect `retry_after` in error response
- Fixed json_serializable deprecation
 
## 0.5.3

- Fixed reply in topic bug

## 0.5.2

- Fixed typos in static constants
- Rolled back 0.5.1 as abstract classes cannot be used with json_serializable

## 0.5.1

- Made classes like `chat_member`, `input_media` and other abstract.

## 0.5.0

- Configured JSON serialiser to map properties from snake case to camel case
- **Breaking** Fully convert all property names and parameter names into camel case, so it aligns with Dart styling guide

## 0.4.0

- Fixed `TEXT_MENTION` bug when using regex
- Support API 6.0, 6.1, 6.2, 6.3, 6.4
- **Breaking** Removed `secretPath` from `webhook` fetcher, should use `secret_token` instead see [setWebhook](https://core.telegram.org/bots/api#setwebhook)

## 0.3.4

- Webhook to throw error when `setWebhook` failed

## 0.3.3

- Support API 5.7
- Show Ukrainian some love

## 0.3.2

- Fixed `onTextMention` type cast bug

## 0.3.1

- Added short-cut to get `TeledartMessage` from `TeleDartCallbackQuery`

## 0.3.0

- Support API 5.4, 5.5 and 5.6
- **Breaking** `TeleDart` now extends `Telegram`, constructor signature has changed, all `Telegram` functions are accessible from `TeleDart`.
- **Breaking** Renamed `TeleDart.setWebhook` into `TeleDart.configureWebhook`
- **Breaking** Removed `TeleDart.editLiveLocation`, should use `Telegram.editMessageLiveLocation` instead
- **Breaking** Removed `TeleDart.stopLiveLocation`, should use `Telegram.stopMessageLiveLocation` instead
- **Breaking** Removed `CallbackQuery` answer short-cut from `TeleDart`, should use short-cut method from `TeleDartCallbackQuery`
- **Breaking** Removed `InlineQuery` answer short-cut from `TeleDart`, should use short-cut method from `TeleDartInlineQuery`
- **Breaking** Removed `Message` reply short-cuts from `TeleDart`, should use short-cut methods from `TeleDartMessage`
- **Breaking** Removed `PreCheckoutQuery` answer short-cut from `TeleDart`, should use short-cut method from `TeleDartPreCheckoutQuery`
- **Breaking** Removed `ShippingQuery` answer short-cut from `TeleDart`, should use short-cut method from `TeleDartShippingQuery`

## 0.2.2

- Improve documentations

## 0.2.1

- Format files to comply with Dart styling guide

## 0.2.0

- Support API 5.2 and 5.3
- Support sound null safety
- Various bug fixes to built-in long poll and webhook fetcher
- **Breaking** `Webhook` can only instantiated with built-in static functions `webhook.createHttpWebhok` and `webhook.createHttpsWebhok`
- **Breaking** `Event` constructor requires bot's username
- **Breaking** `teledart.start()` method no longer returns `Future<User>`

## 0.1.6

- Fixed `jsonEncode` issue caused by `_nullFilter` fix

## 0.1.5

- Added function `getDownloadLink` to `File` object
- Fixed `http_client` `_nullFilter` to allow sending messages `"null"`
- Updated Teledart models and functions to comply with API 5.1

## 0.1.4

- Update function type hints for `onCallbackQuery`, `onShippingQuery` and `onPreCheckoutQuery`
- Fixed Teledart message object typo
- Fixed library export directory

## 0.1.3

- Updated Teledart models and functions to comply with API 5.0
- Added `replyPoll` and `replyDice` Teledart shortcuts

## 0.1.2

- Support API 5.0
- Added emoji static constants to Dice object

## 0.1.1

- Allowed create webhook without key pair

## 0.1.0

- Introduced `AbstractUpdateFetcher`, and now `Webhook` and `LongPoll` extends this class.
- Support custom update fetcher implementations through `AbstractUpdateFetcher`
- Introduced `stop` function to `Teledart` to stop fetching updates.
- Introduced `setWebhook` to `Teledart`, which is an alias to `setWebhook` function in `Webhook`, and it is not required to call this function before starting webhook.
- **Breaking**: Removed `setupLongPolling`, `removeLongPolling` and `setupWebhook` functions from `Teledart`.
- **Breaking**: To setup webhook or custom implementations of update fetcher,
- **Breaking**: The `setupWebhook` method in `Teledart` now takes no parameters.
- **Breaking**: `startWebhook` and `stopWebhook` in `Webhook` has renamed into `start` and `stop`.
- **Breaking**: `startPolling` and `stopPolling` in `LongPoll` has renamed into `start` and `stop`.

## 0.0.50

- Fixed long poll `onError` type mismatch bug
- Enabled `Teledart` to remove webhook without setting up a webhook

## 0.0.49

- Fixed http client exception bug
- Removed redundant error catch
- Temporary accept dynamic `chat_id`

## 0.0.48

- Fixed `restrictChatMember` API URL
- Fixed `toJson` methods in `chat_permissions`, `location` and `login_url` models
- Enabled `explicit_to_json` in `json_serializable` so nested objects can be parsed

## 0.0.47

- Added custom server port to webhook implementation
- Added auto-retry to long poll implementation
  - Gradually increase retry timeout on each retry, initial timeout is 1 minute
  - Automatically retry on exception except HTTP Client error (400)
- Updated multi-part file upload to include original file name

## 0.0.46

- Fixed `removeLongPolling` not stopping recursive long poll
- Fixed long poll not starting with custom long poll configuration
- Fixed missing fields/typos in `InlineQueryResultGif`, `InlineQueryResultMpeg4Gif` and `PassportElementErrorUnspecified`
- updated `restrictChatMember`

## 0.0.45

- Updated example file structure
- Renamed `TeleDartMessage.replyMesasge` into `TeleDartMessage.reply`

## 0.0.44

- Allow overriding webhook server port
- Added reply shortcuts to message
- Added answer shortcuts to callback, inline, pre-checkout and shipping queries

## 0.0.43

- Added `onPollAnswer` `TeleDart` shorthand

## 0.0.42

- Support API 4.9
- Added poll answer event

## 0.0.41

- Fixed `answerPreCheckoutQuery` typo

## 0.0.40

- Support API 4.8
- Fixed disclaimer doc block warnings

## 0.0.39

- Renamed `datetime_duration_converter.dart` into `time_helper.dart`
- Converted `time_helper` into a class

## 0.0.38

- Fixed #98

## 0.0.37

- Support API 4.6
- Support API 4.7
- Utilised native objects for date/time related objects (#91)
- Updated `onMessage` (and related functions) to accept String as well as RegExp (#92)

## 0.0.36

- Support API 4.5

## 0.0.35

- Follow new styling guide
- Update analysis_options file

## 0.0.34

- Support API 4.3
- Support API 4.4

## 0.0.33

- Fixed #70
- Update dependencies

## 0.0.32

- Prepare for upcoming change to `HttpRequest` and `HttpClientResponse`

## 0.0.31

- Fixed styling with if statements
- Updated readme and example

## 0.0.30

### Breaking change

- Changed `startFetching()` into `start()`, and it returns a `User` object which represents the bot

## 0.0.29

- Fixed up webhook workflow
- Added example to setup webhook
- Support API 4.2

## 0.0.28

- Modularised model files
- Updated examples

## 0.0.27

- Fixed #48

## 0.0.26

- Fixed #46

## 0.0.25

- Downgrade http package to ^0.11.3, to be compatible with firebase

## 0.0.24

- Added pedantic package to dev dependencies

## 0.0.23

- Fixes #40
- Fixes #41
- Follow new styling guide

## 0.0.22

- Better dartdoc

## 0.0.21

- Hot fix #36, `toJSON()` passing null values explicitly

## 0.0.20

- Hot fix #34 400 Bad Request: field "keyboard" of the `ReplyKeyboardMarkup` should be an Array of Arrays
- Fixed `getUserProfilePhotos()` returns `UserProfilePhotos` instead of `List<UserProfilePhotos>`

## 0.0.19

- Update readme
- Update description

## 0.0.18

- Update readme

## 0.0.17

- Added Bot API 4.1 support
- Update dependencies

## 0.0.16

- Hot fix model json annotation file

## 0.0.15

- Hot fix inline_keyboard variable in `InlineKeyboardMarkup`

## 0.0.14

- Add shortcuts

## 0.0.13

- Supports API 4.0

## 0.0.12

- Depends on `json_serializable/json_annotation` handling json objects
- Fixes typos in model.dart

## 0.0.11

- Supports regular expression in `onMessage()`

## 0.0.10

- Fixes `pubspec.ymal` SDK constraint to support Dart 2 release
- Edit README.md Dart Version shield to build version

## 0.0.9

- Bug fixes
- Edit example in README.md

## 0.0.8

- Bug fixes
- Edit example

## 0.0.7

- Dart2 ready!
- Add short-cut for inline query
- Rename `ChosenInlineQuery` into `ChosenInlineResult` and associated objects
- Add missing `InlineQueryResultVoice` to model
- Bug fixes

## 0.0.6

- Edit README.md

## 0.0.5

- Add `onMessage` short-cuts
- Add `sendMessage` short-cuts
- Add missing `ShippingQuery` to Update

## 0.0.4

- More editing on README.md

## 0.0.3

- Edited README.md

## 0.0.2

- First release

## 0.0.1

- Initial version, created by Stagehand
