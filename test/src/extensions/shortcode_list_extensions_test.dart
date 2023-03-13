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
      const expected = ':${$default}:';
      expect(shortcodes.wherePlatform(Platform.Default), expected);
    });
    test('cldr returns correct value', () {
      const expected = ':$cldr:';
      expect(shortcodes.cldr, expected);
    });

    test('discord returns correct value', () {
      const expected = ':$discord:';
      expect(shortcodes.discord, expected);
    });

    test('slack returns correct value', () {
      const expected = ':$slack:';
      expect(shortcodes.slack, expected);
    });
  });
}
