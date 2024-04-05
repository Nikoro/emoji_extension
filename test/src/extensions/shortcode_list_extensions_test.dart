import 'package:emoji_extension/src/emojis/platform.dart';
import 'package:emoji_extension/src/emojis/shortcode.dart';
import 'package:emoji_extension/src/extensions/shortcode_list_extensions.dart';
import 'package:test/test.dart';

void main() {
  const $default = 'default';
  const cldr = 'cldr';
  const discord = 'discord';
  const slack = 'slack';

  const shortcodes = [
    Shortcode.$default([$default]),
    Shortcode.cldr([cldr]),
    Shortcode.discord([discord]),
    Shortcode.slack([slack])
  ];

  group('ShortcodeListExtensions', () {
    test('wherePlatform returns correct value', () {
      expect(shortcodes.wherePlatform(Platform.Default), [':${$default}:']);
    });
    test('cldr returns correct value', () {
      expect(shortcodes.cldr, [':$cldr:']);
    });

    test('discord returns correct value', () {
      expect(shortcodes.discord, [':$discord:']);
    });

    test('slack returns correct value', () {
      expect(shortcodes.slack, [':$slack:']);
    });
  });
}
