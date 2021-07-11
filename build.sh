#!/bin/sh

# json_serializable build .g files
dart run build_runner build --enable-experiment non-nullable --delete-conflicting-outputs
