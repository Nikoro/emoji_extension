import 'package:emoji_extension/emoji_extension.dart';
import 'package:test/test.dart';

import '../../_tools/test_emojis.dart';

void main() {
  final emojis = [
    TestEmojis.grinningFace,
    TestEmojis.womanFacepalmingMediumDarkSkinTone,
  ];

  group('EmojiListExtensions', () {
    test('values returns correct value', () {
      expect(emojis.values, [
        TestEmojis.grinningFace.value,
        TestEmojis.womanFacepalmingMediumDarkSkinTone.value,
      ]);
    });

    test('unicodes returns correct value', () {
      expect(emojis.unicodes, [
        TestEmojis.grinningFace.unicode,
        TestEmojis.womanFacepalmingMediumDarkSkinTone.unicode,
      ]);
    });

    test('names returns correct value', () {
      expect(emojis.names, [
        TestEmojis.grinningFace.name,
        TestEmojis.womanFacepalmingMediumDarkSkinTone.name,
      ]);
    });

    test('appleNames returns correct value', () {
      expect(emojis.appleNames, [
        TestEmojis.grinningFace.appleName,
      ]);
    });

    test('alsoKnownAs returns correct value', () {
      expect(emojis.alsoKnownAs, [
        ...TestEmojis.grinningFace.alsoKnownAs,
        ...TestEmojis.womanFacepalmingMediumDarkSkinTone.alsoKnownAs,
      ]);
    });

    test('shortcodes returns correct value', () {
      expect(emojis.shortcodes, [
        TestEmojis.grinningFace.shortcode,
        TestEmojis.womanFacepalmingMediumDarkSkinTone.shortcode,
      ]);
    });

    test('cldrShortcodes returns correct value', () {
      expect(emojis.cldrShortcodes, [
        TestEmojis.grinningFace.cldrShortcode,
        TestEmojis.womanFacepalmingMediumDarkSkinTone.cldrShortcode,
      ]);
    });

    test('discordShortcodes returns correct value', () {
      expect(emojis.discordShortcodes, [
        ...TestEmojis.grinningFace.discordShortcodes,
        ...TestEmojis.womanFacepalmingMediumDarkSkinTone.discordShortcodes,
      ]);
    });

    test('githubShortcodes returns correct value', () {
      expect(emojis.githubShortcodes, [
        ...TestEmojis.grinningFace.githubShortcodes,
      ]);
    });

    test('discordShortcodes returns correct value', () {
      expect(emojis.slackShortcodes, [
        ...TestEmojis.grinningFace.slackShortcodes,
        ...TestEmojis.womanFacepalmingMediumDarkSkinTone.slackShortcodes,
      ]);
    });

    test('groups returns correct value', () {
      expect(emojis.groups, [
        TestEmojis.grinningFace.group,
        TestEmojis.womanFacepalmingMediumDarkSkinTone.group,
      ]);
    });

    test('subgroups returns correct value', () {
      expect(emojis.subgroups, [
        TestEmojis.grinningFace.subgroup,
        TestEmojis.womanFacepalmingMediumDarkSkinTone.subgroup,
      ]);
    });

    test('versions returns correct value', () {
      expect(emojis.versions, [
        TestEmojis.grinningFace.version,
        TestEmojis.womanFacepalmingMediumDarkSkinTone.version,
      ]);
    });

    test('statuses returns correct value', () {
      expect(emojis.statuses, [
        TestEmojis.grinningFace.status,
        TestEmojis.womanFacepalmingMediumDarkSkinTone.status,
      ]);
    });
  });
}
