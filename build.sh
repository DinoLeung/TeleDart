#!/bin/sh

# json_serializable build .g files
dart pub run build_runner build --enable-experiment non-nullable --delete-conflicting-outputs
