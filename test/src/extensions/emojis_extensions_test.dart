import 'package:emoji_extension/src/emojis/emojis.dart';
import 'package:emoji_extension/src/extensions/emojis_extensions.dart';
import 'package:test/test.dart';

import '../../_tools/tools.dart';

void main() {
  group('EmojisExtensions', () {
    $({
      Emojis().smileysAndEmotion: 184,
      Emojis().peopleAndBody: 3290,
      Emojis().component: 9,
      Emojis().animalsAndNature: 160,
      Emojis().foodAndDrink: 137,
      Emojis().travelAndPlaces: 267,
      Emojis().activities: 96,
      Emojis().objects: 312,
      Emojis().symbols: 304,
      Emojis().flags: 275,
    }).forEach((input, expected) {
      test('returns $expected emojis', () {
        expect(input.length, expected);
      });
    });

    $({
      Emojis().faceSmiling: 14,
      Emojis().faceAffection: 10,
      Emojis().faceTongue: 6,
      Emojis().faceHand: 7,
      Emojis().faceNeutralSkeptical: 19,
      Emojis().faceSleepy: 5,
      Emojis().faceUnwell: 12,
      Emojis().faceHat: 3,
      Emojis().faceGlasses: 3,
      Emojis().faceConcerned: 27,
      Emojis().faceNegative: 9,
      Emojis().faceCostume: 8,
      Emojis().catFace: 9,
      Emojis().monkeyFace: 3,
      Emojis().heart: 29,
      Emojis().emotion: 20,
      Emojis().handFingersOpen: 67,
      Emojis().handFingersPartial: 55,
      Emojis().handSingleFinger: 43,
      Emojis().handFingersClosed: 36,
      Emojis().hands: 62,
      Emojis().handProp: 19,
      Emojis().bodyParts: 49,
      Emojis().person: 192,
      Emojis().personGesture: 300,
      Emojis().personRole: 635,
      Emojis().personFantasy: 245,
      Emojis().personActivity: 606,
      Emojis().personSport: 395,
      Emojis().personResting: 42,
      Emojis().family: 533,
      Emojis().personSymbol: 11,
      Emojis().skinTone: 5,
      Emojis().hairStyle: 4,
      Emojis().animalMammal: 68,
      Emojis().animalBird: 23,
      Emojis().animalAmphibian: 1,
      Emojis().animalReptile: 8,
      Emojis().animalMarine: 12,
      Emojis().animalBug: 18,
      Emojis().plantFlower: 13,
      Emojis().plantOther: 17,
      Emojis().foodFruit: 20,
      Emojis().foodVegetable: 19,
      Emojis().foodPrepared: 34,
      Emojis().foodAsian: 17,
      Emojis().foodMarine: 5,
      Emojis().foodSweet: 14,
      Emojis().drink: 20,
      Emojis().dishware: 8,
      Emojis().placeMap: 8,
      Emojis().placeGeographic: 16,
      Emojis().placeBuilding: 32,
      Emojis().placeReligious: 7,
      Emojis().placeOther: 19,
      Emojis().transportGround: 55,
      Emojis().transportWater: 12,
      Emojis().transportAir: 16,
      Emojis().hotel: 3,
      Emojis().time: 34,
      Emojis().skyAndWeather: 65,
      Emojis().event: 23,
      Emojis().awardMedal: 7,
      Emojis().sport: 28,
      Emojis().game: 30,
      Emojis().artsAndCrafts: 8,
      Emojis().clothing: 50,
      Emojis().sound: 9,
      Emojis().music: 12,
      Emojis().musicalInstrument: 11,
      Emojis().phone: 7,
      Emojis().computer: 19,
      Emojis().lightAndVideo: 19,
      Emojis().bookPaper: 19,
      Emojis().money: 10,
      Emojis().mail: 15,
      Emojis().writing: 13,
      Emojis().office: 31,
      Emojis().lock: 7,
      Emojis().tool: 37,
      Emojis().science: 8,
      Emojis().medical: 7,
      Emojis().household: 27,
      Emojis().otherObject: 11,
      Emojis().transportSign: 13,
      Emojis().warning: 16,
      Emojis().arrow: 35,
      Emojis().religion: 22,
      Emojis().zodiac: 13,
      Emojis().avSymbol: 34,
      Emojis().gender: 6,
      Emojis().math: 8,
      Emojis().punctuation: 10,
      Emojis().currency: 2,
      Emojis().otherSymbol: 33,
      Emojis().keycap: 25,
      Emojis().alphanum: 49,
      Emojis().geometric: 38,
      Emojis().flag: 14,
      Emojis().countryFlag: 258,
      Emojis().subdivisionFlag: 3,
    }).forEach((input, expected) {
      test('returns $expected emojis', () {
        expect(input.length, expected);
      });
    });

    $({
      Emojis().v6_0: 793,
      Emojis().v7_0: 254,
      Emojis().v8_0: 809,
      Emojis().v9_0: 1187,
      Emojis().v10_0: 339,
      Emojis().v11_0: 188,
      Emojis().v12_0: 266,
      Emojis().v13_0: 146,
      Emojis().v13_1: 422,
      Emojis().v14_0: 112,
      Emojis().v15_0: 31,
      Emojis().v15_1: 301,
    }).forEach((input, expected) {
      test('returns $expected emojis', () {
        expect(input.length, expected);
      });
    });
  });
}
