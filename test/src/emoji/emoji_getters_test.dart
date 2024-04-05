import 'package:emoji_extension/emoji_extension.dart';
import 'package:test/test.dart';

import '../../_tools/tools.dart';

void main() {
  group('EmojiGetters', () {
    $({
      '😀': ':grinning_face:',
      '🩷': ':pink_heart:',
    }).forEach((input, expected) {
      test('shortcode returns $expected when emoji is: $input', () {
        expect(Emojis.getOne(input).shortcode, expected);
      });
    });

    $({
      '😀': ':grinning_face:',
      '🩷': ':pink_heart:',
    }).forEach((input, expected) {
      test('cldrShortcode returns $expected when emoji is: $input', () {
        expect(Emojis.getOne(input).cldrShortcode, expected);
      });
    });

    $({
      '😀': ':grinning:',
      '🩷': null,
    }).forEach((input, expected) {
      test('discordShortcode returns $expected when emoji is: $input', () {
        expect(Emojis.getOne(input).discordShortcode, expected);
      });
    });

    $({
      '😀': ':grinning:',
      '🩷': null,
    }).forEach((input, expected) {
      test('githubShortcode returns $expected when emoji is: $input', () {
        expect(Emojis.getOne(input).githubShortcode, expected);
      });
    });

    $({
      '😀': ':grinning:',
      '🩷': null,
    }).forEach((input, expected) {
      test('slackShortcode returns $expected when emoji is: $input', () {
        expect(Emojis.getOne(input).slackShortcode, expected);
      });
    });

    $({
      '👍': false,
      '👍🏻': true,
      '👍🏼': true,
      '👍🏽': true,
      '👍🏾': true,
      '👍🏿': true,
      '🏻': true,
      '🏼': true,
      '🏽': true,
      '🏾': true,
      '🏿': true,
    }).forEach((input, expected) {
      test('hasSkinTone returns $expected when emoji is: $input', () {
        expect(Emojis.getOne(input).hasSkinTone, expected);
      });
    });

    $({
      '👨': false,
      '👨‍🦰': true,
      '👨‍🦱': true,
      '👨‍🦳': true,
      '👨‍🦲': true,
      '🦰': true,
      '🦱': true,
      '🦳': true,
      '🦲': true,
    }).forEach((input, expected) {
      test('hasHairStyle returns $expected when emoji is: $input', () {
        expect(Emojis.getOne(input).hasHairStyle, expected);
      });
    });

    $({
      '👨': false,
      '🧑‍🤝‍🧑': true,
      '💏': true,
      '💑🏻': true,
      '👨‍👩‍👧‍👦': true,
      '👪': true,
      '🧑‍🧑‍🧒‍🧒': true,
    }).forEach((input, expected) {
      test('isMultiPerson returns $expected when emoji is: $input', () {
        expect(Emojis.getOne(input).isMultiPerson, expected);
      });

      $({
        '😀': true,
        '😶‍🌫': false,
        '☹': false,
        '🏻': false,
      }).forEach((input, expected) {
        test('isFullyQualified returns $expected when emoji is: $input', () {
          expect(Emojis.getOne(input).isFullyQualified, expected);
        });
      });

      $({
        '😶‍🌫': true,
        '😀': false,
        '☹': false,
        '🏻': false,
      }).forEach((input, expected) {
        test('isMinimallyQualified returns $expected when emoji is: $input',
            () {
          expect(Emojis.getOne(input).isMinimallyQualified, expected);
        });
      });

      $({
        '☹': true,
        '😀': false,
        '😶‍🌫': false,
        '🏻': false,
      }).forEach((input, expected) {
        test('isUnqualified returns $expected when emoji is: $input', () {
          expect(Emojis.getOne(input).isUnqualified, expected);
        });
      });

      $({
        '🏻': true,
        '😀': false,
        '😶‍🌫': false,
        '☹': false,
      }).forEach((input, expected) {
        test('isComponent returns $expected when emoji is: $input', () {
          expect(Emojis.getOne(input).isComponent, expected);
        });

        $({
          '😃': true,
          '😐': false,
          '😑': false,
          '🤥': false,
          '🤮': false,
          '🥵': false,
          '🥱': false,
          '🧑‍🦰': false,
          '🥷': false,
          '💏🏻': false,
          '🪸': false,
          '🪼': false,
          '🍋‍🟩': false,
        }).forEach((input, expected) {
          test('isV6_0 returns $expected when emoji is: $input', () {
            expect(Emojis.getOne(input).isV6_0, expected);
          });
        });

        $({
          '😐': true,
          '😃': false,
          '😑': false,
          '🤥': false,
          '🤮': false,
          '🥵': false,
          '🥱': false,
          '🧑‍🦰': false,
          '🥷': false,
          '💏🏻': false,
          '🪸': false,
          '🪼': false,
          '🍋‍🟩': false,
        }).forEach((input, expected) {
          test('isV7_0 returns $expected when emoji is: $input', () {
            expect(Emojis.getOne(input).isV7_0, expected);
          });
        });

        $({
          '😃': false,
          '😐': false,
          '😑': true,
          '🤥': false,
          '🤮': false,
          '🥵': false,
          '🥱': false,
          '🧑‍🦰': false,
          '🥷': false,
          '💏🏻': false,
          '🪸': false,
          '🪼': false,
          '🍋‍🟩': false,
        }).forEach((input, expected) {
          test('isV8_0 returns $expected when emoji is: $input', () {
            expect(Emojis.getOne(input).isV8_0, expected);
          });
        });

        $({
          '🤥': true,
          '😃': false,
          '😐': false,
          '😑': false,
          '🤮': false,
          '🥵': false,
          '🥱': false,
          '🧑‍🦰': false,
          '🥷': false,
          '💏🏻': false,
          '🪸': false,
          '🪼': false,
          '🍋‍🟩': false,
        }).forEach((input, expected) {
          test('isV9_0 returns $expected when emoji is: $input', () {
            expect(Emojis.getOne(input).isV9_0, expected);
          });
        });

        $({
          '🤮': true,
          '😃': false,
          '😐': false,
          '😑': false,
          '🤥': false,
          '🥵': false,
          '🥱': false,
          '🧑‍🦰': false,
          '🥷': false,
          '💏🏻': false,
          '🪸': false,
          '🪼': false,
          '🍋‍🟩': false,
        }).forEach((input, expected) {
          test('isV10_0 returns $expected when emoji is: $input', () {
            expect(Emojis.getOne(input).isV10_0, expected);
          });
        });

        $({
          '🥵': true,
          '😃': false,
          '😐': false,
          '😑': false,
          '🤥': false,
          '🤮': false,
          '🥱': false,
          '🧑‍🦰': false,
          '🥷': false,
          '💏🏻': false,
          '🪸': false,
          '🪼': false,
          '🍋‍🟩': false,
        }).forEach((input, expected) {
          test('isV11_0 returns $expected when emoji is: $input', () {
            expect(Emojis.getOne(input).isV11_0, expected);
          });
        });

        $({
          '🥱': true,
          '😃': false,
          '😐': false,
          '😑': false,
          '🤥': false,
          '🤮': false,
          '🥵': false,
          '🧑‍🦰': false,
          '🥷': false,
          '💏🏻': false,
          '🪸': false,
          '🪼': false,
          '🍋‍🟩': false,
        }).forEach((input, expected) {
          test('isV12_0 returns $expected when emoji is: $input', () {
            expect(Emojis.getOne(input).isV12_0, expected);
          });
        });

        $({
          '🧑‍🦰': true,
          '😃': false,
          '😐': false,
          '😑': false,
          '🤥': false,
          '🤮': false,
          '🥵': false,
          '🥱': false,
          '🥷': false,
          '💏🏻': false,
          '🪸': false,
          '🪼': false,
          '🍋‍🟩': false,
        }).forEach((input, expected) {
          test('isV12_1 returns $expected when emoji is: $input', () {
            expect(Emojis.getOne(input).isV12_1, expected);
          });
        });

        $({
          '🥷': true,
          '😃': false,
          '😐': false,
          '😑': false,
          '🤥': false,
          '🤮': false,
          '🥵': false,
          '🥱': false,
          '🧑‍🦰': false,
          '💏🏻': false,
          '🪸': false,
          '🪼': false,
          '🍋‍🟩': false,
        }).forEach((input, expected) {
          test('isV13_0 returns $expected when emoji is: $input', () {
            expect(Emojis.getOne(input).isV13_0, expected);
          });
        });

        $({
          '💏🏻': true,
          '😃': false,
          '😐': false,
          '😑': false,
          '🤥': false,
          '🤮': false,
          '🥵': false,
          '🥱': false,
          '🧑‍🦰': false,
          '🥷': false,
          '🪸': false,
          '🪼': false,
          '🍋‍🟩': false,
        }).forEach((input, expected) {
          test('isV13_1 returns $expected when emoji is: $input', () {
            expect(Emojis.getOne(input).isV13_1, expected);
          });
        });

        $({
          '🪸': true,
          '😃': false,
          '😐': false,
          '😑': false,
          '🤥': false,
          '🤮': false,
          '🥵': false,
          '🥱': false,
          '🧑‍🦰': false,
          '🥷': false,
          '💏🏻': false,
          '🪼': false,
          '🍋‍🟩': false,
        }).forEach((input, expected) {
          test('isV14_0 returns $expected when emoji is: $input', () {
            expect(Emojis.getOne(input).isV14_0, expected);
          });
        });

        $({
          '🪼': true,
          '😃': false,
          '😐': false,
          '😑': false,
          '🤥': false,
          '🤮': false,
          '🥵': false,
          '🥱': false,
          '🧑‍🦰': false,
          '🥷': false,
          '💏🏻': false,
          '🪸': false,
          '🍋‍🟩': false,
        }).forEach((input, expected) {
          test('isV15_0 returns $expected when emoji is: $input', () {
            expect(Emojis.getOne(input).isV15_0, expected);
          });
        });

        $({
          '🍋‍🟩': true,
          '😃': false,
          '😐': false,
          '😑': false,
          '🤥': false,
          '🤮': false,
          '🥵': false,
          '🥱': false,
          '🧑‍🦰': false,
          '🥷': false,
          '💏🏻': false,
          '🪸': false,
          '🪼': false,
        }).forEach((input, expected) {
          test('isV15_1 returns $expected when emoji is: $input', () {
            expect(Emojis.getOne(input).isV15_1, expected);
          });
        });

        $({
          '🏁': true,
          '😃': false,
        }).forEach((input, expected) {
          test('isFlag returns $expected when emoji is: $input', () {
            expect(Emojis.getOne(input).isFlag, expected);
          });
        });

        $({
          '🍇': true,
          '😃': false,
        }).forEach((input, expected) {
          test('isFruit returns $expected when emoji is: $input', () {
            expect(Emojis.getOne(input).isFruit, expected);
          });
        });

        $({
          '🍆': true,
          '😃': false,
        }).forEach((input, expected) {
          test('isVegetable returns $expected when emoji is: $input', () {
            expect(Emojis.getOne(input).isVegetable, expected);
          });
        });

        $({
          '🐵': true,
          '🦃': true,
          '🐸': true,
          '🐊': true,
          '🐳': true,
          '🐌': true,
          '😃': false,
        }).forEach((input, expected) {
          test('isAnimal returns $expected when emoji is: $input', () {
            expect(Emojis.getOne(input).isAnimal, expected);
          });
        });

        $({
          '💐': true,
          '😃': false,
        }).forEach((input, expected) {
          test('isFlower returns $expected when emoji is: $input', () {
            expect(Emojis.getOne(input).isFlower, expected);
          });
        });

        $({
          '🏧': true,
          '😃': false,
        }).forEach((input, expected) {
          test('isSymbol returns $expected when emoji is: $input', () {
            expect(Emojis.getOne(input).isSymbol, expected);
          });
        });

        $({
          '🔴': true,
          '😃': false,
        }).forEach((input, expected) {
          test('isGeometric returns $expected when emoji is: $input', () {
            expect(Emojis.getOne(input).isGeometric, expected);
          });
        });

        $({
          '😃': true,
          '🙂‍↔️': true,
          '🤯': true,
          '💀': true,
          '👹': true,
          '😺': true,
          '🙉': true,
          '🐶': true,
          '🐲': true,
          '🌚': true,
          '🔴': false,
        }).forEach((input, expected) {
          test('hasFace returns $expected when emoji is: $input', () {
            expect(Emojis.getOne(input).hasFace, expected);
          });
        });

        $({
          '👶': true,
          '🙍': true,
          '🙍🏻‍♂️': true,
          '🧑‍⚕️': true,
          '🎅': true,
          '💇‍♂️': true,
          '🏂': true,
          '🧘': true,
          '🔴': false,
        }).forEach((input, expected) {
          test('isPerson returns $expected when emoji is: $input', () {
            expect(Emojis.getOne(input).isPerson, expected);
          });
        });
      });
    });
  });
}
