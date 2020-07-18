## 0.0.43

- Added onPollAnswer teledart shorthand

## 0.0.42

- Support API 4.9
- Added poll answer event

## 0.0.41

- Fixed answerPreCheckoutQuery typo

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
- Updated onMessage (and related functions) to accept String as well as RegExp (#92)

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

- Prepare for upcoming change to HttpRequest and HttpClientResponse

## 0.0.31

- Fixed styling with if statments
- Updated readme and example

## 0.0.30

### Breaking change
- Changed `startFetching()` into `start()`, and it returns a `User` object which represents the bot

## 0.0.29

- Fixed up webhook workflow
- Added example to setup webhook
- Support API 4.2

## 0.0.28

- Modulised model files
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

- Hot fix #36, toJSON() passing null values explicitly

## 0.0.20

- Hot fix #34 400 Bad Request: field "keyboard" of the ReplyKeyboardMarkup should be an Array of Arrays
- Fixed getUserProfilePhotos() returns UserProfilePhotos instead of List<UserProfilePhotos>

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

- Hot fix inline_keyboard variable in InlineKeyboardMarkup

## 0.0.14

- Add shortcuts

## 0.0.13

- Supports API 4.0

## 0.0.12

- Depends on json_serializable/json_annotation handling json objects
- Fixes typos in model.dart

## 0.0.11

- Supports regular expression in onMessage()

## 0.0.10

- Fixes pubspec.ymal SDK constraint to support Dart 2 release
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
- Rename ChosenInlineQuery into ChosenInlineResult and associated objects
- Add missing InlineQueryResultVoice to model
- Bug fixes

## 0.0.6

- Edit README.md

## 0.0.5

- Add onMessage short-cuts
- Add sendMessage short-cuts
- Add missing ShippingQuery to Update

## 0.0.4

- More editing on README.md

## 0.0.3

- Edited README.md

## 0.0.2

- First release

## 0.0.1

- Initial version, created by Stagehand