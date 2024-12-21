import 'package:emoji_extension/emoji_extension.dart';
import 'package:test/test.dart';

import '../../../_tools/tools.dart';

void main() {
  group('EmojiGetters', () {
    $({
      '😀': ':grinning_face:',
      '🩷': ':pink_heart:',
    }).forEach((input, expected) {
      test('shortcode returns $expected when emoji is: $input', () {
        expect(Emoji(input).shortcode, expected);
      });
    });

    $({
      '😀': ':grinning_face:',
      '🩷': ':pink_heart:',
    }).forEach((input, expected) {
      test('cldrShortcode returns $expected when emoji is: $input', () {
        expect(Emoji(input).cldrShortcode, expected);
      });
    });

    $({
      '😀': ':grinning:',
      '🩷': null,
    }).forEach((input, expected) {
      test('discordShortcode returns $expected when emoji is: $input', () {
        expect(Emoji(input).discordShortcode, expected);
      });
    });

    $({
      '😀': ':grinning:',
      '🩷': null,
    }).forEach((input, expected) {
      test('githubShortcode returns $expected when emoji is: $input', () {
        expect(Emoji(input).githubShortcode, expected);
      });
    });

    $({
      '😀': ':grinning:',
      '🩷': null,
    }).forEach((input, expected) {
      test('slackShortcode returns $expected when emoji is: $input', () {
        expect(Emoji(input).slackShortcode, expected);
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
        expect(Emoji(input).hasSkinTone, expected);
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
        expect(Emoji(input).hasHairStyle, expected);
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
        expect(Emoji(input).isMultiPerson, expected);
      });

      $({
        '😀': true,
        '😶‍🌫': false,
        '☹': false,
        '🏻': false,
      }).forEach((input, expected) {
        test('isFullyQualified returns $expected when emoji is: $input', () {
          expect(Emoji(input).isFullyQualified, expected);
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
          expect(Emoji(input).isMinimallyQualified, expected);
        });
      });

      $({
        '☹': true,
        '😀': false,
        '😶‍🌫': false,
        '🏻': false,
      }).forEach((input, expected) {
        test('isUnqualified returns $expected when emoji is: $input', () {
          expect(Emoji(input).isUnqualified, expected);
        });
      });

      $({
        '🏻': true,
        '😀': false,
        '😶‍🌫': false,
        '☹': false,
      }).forEach((input, expected) {
        test('isComponent returns $expected when emoji is: $input', () {
          expect(Emoji(input).isComponent, expected);
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
          '🫩': false,
        }).forEach((input, expected) {
          test('isV6_0 returns $expected when emoji is: $input', () {
            expect(Emoji(input).isV6_0, expected);
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
          '🫩': false,
        }).forEach((input, expected) {
          test('isV7_0 returns $expected when emoji is: $input', () {
            expect(Emoji(input).isV7_0, expected);
          });
        });

        $({
          '😑': true,
          '😃': false,
          '😐': false,
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
          '🫩': false,
        }).forEach((input, expected) {
          test('isV8_0 returns $expected when emoji is: $input', () {
            expect(Emoji(input).isV8_0, expected);
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
          '🫩': false,
        }).forEach((input, expected) {
          test('isV9_0 returns $expected when emoji is: $input', () {
            expect(Emoji(input).isV9_0, expected);
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
          '🫩': false,
        }).forEach((input, expected) {
          test('isV10_0 returns $expected when emoji is: $input', () {
            expect(Emoji(input).isV10_0, expected);
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
          '🫩': false,
        }).forEach((input, expected) {
          test('isV11_0 returns $expected when emoji is: $input', () {
            expect(Emoji(input).isV11_0, expected);
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
          '🫩': false,
        }).forEach((input, expected) {
          test('isV12_0 returns $expected when emoji is: $input', () {
            expect(Emoji(input).isV12_0, expected);
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
          '🫩': false,
        }).forEach((input, expected) {
          test('isV12_1 returns $expected when emoji is: $input', () {
            expect(Emoji(input).isV12_1, expected);
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
          '🫩': false,
        }).forEach((input, expected) {
          test('isV13_0 returns $expected when emoji is: $input', () {
            expect(Emoji(input).isV13_0, expected);
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
          '🫩': false,
        }).forEach((input, expected) {
          test('isV13_1 returns $expected when emoji is: $input', () {
            expect(Emoji(input).isV13_1, expected);
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
          '🫩': false,
        }).forEach((input, expected) {
          test('isV14_0 returns $expected when emoji is: $input', () {
            expect(Emoji(input).isV14_0, expected);
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
          '🫩': false,
        }).forEach((input, expected) {
          test('isV15_0 returns $expected when emoji is: $input', () {
            expect(Emoji(input).isV15_0, expected);
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
            expect(Emoji(input).isV15_1, expected);
          });
        });

        $({
          '🫩': true,
          '🍋‍🟩': false,
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
          test('isV16_0 returns $expected when emoji is: $input', () {
            expect(Emoji(input).isV16_0, expected);
          });
        });

        $({
          '🏁': true,
          '😃': false,
        }).forEach((input, expected) {
          test('isFlag returns $expected when emoji is: $input', () {
            expect(Emoji(input).isFlag, expected);
          });
        });

        $({
          '🍇': true,
          '😃': false,
        }).forEach((input, expected) {
          test('isFruit returns $expected when emoji is: $input', () {
            expect(Emoji(input).isFruit, expected);
          });
        });

        $({
          '🍆': true,
          '😃': false,
        }).forEach((input, expected) {
          test('isVegetable returns $expected when emoji is: $input', () {
            expect(Emoji(input).isVegetable, expected);
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
            expect(Emoji(input).isAnimal, expected);
          });
        });

        $({
          '💐': true,
          '😃': false,
        }).forEach((input, expected) {
          test('isFlower returns $expected when emoji is: $input', () {
            expect(Emoji(input).isFlower, expected);
          });
        });

        $({
          '🏧': true,
          '😃': false,
        }).forEach((input, expected) {
          test('isSymbol returns $expected when emoji is: $input', () {
            expect(Emoji(input).isSymbol, expected);
          });
        });

        $({
          '🔴': true,
          '😃': false,
        }).forEach((input, expected) {
          test('isGeometric returns $expected when emoji is: $input', () {
            expect(Emoji(input).isGeometric, expected);
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
            expect(Emoji(input).isPerson, expected);
          });
        });

        $({
          '👨': true,
          '👩': false,
          '🔴': false,
        }).forEach((input, expected) {
          test('isMan returns $expected when emoji is: $input', () {
            expect(Emoji(input).isMan, expected);
          });
        });

        $({
          '👩': true,
          '👨': false,
          '🔴': false,
        }).forEach((input, expected) {
          test('isWoman returns $expected when emoji is: $input', () {
            expect(Emoji(input).isWoman, expected);
          });
        });

        $({
          '👪': true,
          '👨': false,
          '🔴': false,
        }).forEach((input, expected) {
          test('isMultiPerson returns $expected when emoji is: $input', () {
            expect(Emoji(input).isMultiPerson, expected);
          });
        });

        $({
          '👩🏻': true,
          '👩': false,
          '🔴': false,
        }).forEach((input, expected) {
          test('hasSkinTone returns $expected when emoji is: $input', () {
            expect(Emoji(input).hasSkinTone, expected);
          });
        });

        $({
          '👩🏻': SkinTone.light,
          '👩🏼': SkinTone.mediumLight,
          '👩🏽': SkinTone.medium,
          '👩🏾': SkinTone.mediumDark,
          '👩🏿': SkinTone.dark,
          '👩': null,
          '🔴': null,
        }).forEach((input, expected) {
          test('skinTone returns $expected when emoji is: $input', () {
            expect(Emoji(input).skinTone, expected);
          });
        });

        $({
          '👱‍♂️': true,
          '👨‍🦰': true,
          '👨': false,
          '🔴': false,
        }).forEach((input, expected) {
          test('hasHairStyle returns $expected when emoji is: $input', () {
            expect(Emoji(input).hasHairStyle, expected);
          });
        });

        $({
          '👱‍♂️': HairStyle.blond,
          '👨‍🦰': HairStyle.red,
          '👨‍🦱': HairStyle.curly,
          '👨‍🦳': HairStyle.white,
          '👨‍🦲': HairStyle.bald,
          '👨': null,
          '🔴': null,
        }).forEach((input, expected) {
          test('hairStyle returns $expected when emoji is: $input', () {
            expect(Emoji(input).hairStyle, expected);
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
            expect(Emoji(input).hasFace, expected);
          });
        });

        $({
          '🔴': true,
          '🩵': true,
          '😃': false,
        }).forEach((input, expected) {
          test('hasColor returns $expected when emoji is: $input', () {
            expect(Emoji(input).hasColor, expected);
          });
        });

        $({
          '❤️': Color.red,
          '🩷': Color.pink,
          '🧡': Color.orange,
          '💛': Color.yellow,
          '💚': Color.green,
          '💙': Color.blue,
          '🩵': Color.lightBlue,
          '💜': Color.purple,
          '🤎': Color.brown,
          '🖤': Color.black,
          '🩶': Color.grey,
          '🤍': Color.white,
          '😃': null,
        }).forEach((input, expected) {
          test('color returns $expected when emoji is: $input', () {
            expect(Emoji(input).color, expected);
          });
        });

        $({
          '🧔': true,
          '🧑': false,
          '😃': false,
        }).forEach((input, expected) {
          test('hasBeard returns $expected when emoji is: $input', () {
            expect(Emoji(input).hasBeard, expected);
          });
        });
      });
    });
  });
}
