import 'package:emoji_extension/emoji_extension.dart';
import 'package:emoji_extension/src/emojis/subgroup.dart';
import 'package:test/test.dart';

import '../../_tools/tools.dart';

void main() {
  group('Subgroup', () {
    test('values count', () {
      expect(Subgroup.values.length, 101);
    });

    $({
      'face-smiling': Subgroup.faceSmiling,
      'face-affection': Subgroup.faceAffection,
      'face-tongue': Subgroup.faceTongue,
      'face-hand': Subgroup.faceHand,
      'face-neutral-skeptical': Subgroup.faceNeutralSkeptical,
      'face-sleepy': Subgroup.faceSleepy,
      'face-unwell': Subgroup.faceUnwell,
      'face-hat': Subgroup.faceHat,
      'face-glasses': Subgroup.faceGlasses,
      'face-concerned': Subgroup.faceConcerned,
      'face-negative': Subgroup.faceNegative,
      'face-costume': Subgroup.faceCostume,
      'cat-face': Subgroup.catFace,
      'monkey-face': Subgroup.monkeyFace,
      'heart': Subgroup.heart,
      'emotion': Subgroup.emotion,
      'hand-fingers-open': Subgroup.handFingersOpen,
      'hand-fingers-partial': Subgroup.handFingersPartial,
      'hand-single-finger': Subgroup.handSingleFinger,
      'hand-fingers-closed': Subgroup.handFingersClosed,
      'hands': Subgroup.hands,
      'hand-prop': Subgroup.handProp,
      'body-parts': Subgroup.bodyParts,
      'person': Subgroup.person,
      'person-gesture': Subgroup.personGesture,
      'person-role': Subgroup.personRole,
      'person-fantasy': Subgroup.personFantasy,
      'person-activity': Subgroup.personActivity,
      'person-sport': Subgroup.personSport,
      'person-resting': Subgroup.personResting,
      'family': Subgroup.family,
      'person-symbol': Subgroup.personSymbol,
      'skin-tone': Subgroup.skinTone,
      'hair-style': Subgroup.hairStyle,
      'animal-mammal': Subgroup.animalMammal,
      'animal-bird': Subgroup.animalBird,
      'animal-amphibian': Subgroup.animalAmphibian,
      'animal-reptile': Subgroup.animalReptile,
      'animal-marine': Subgroup.animalMarine,
      'animal-bug': Subgroup.animalBug,
      'plant-flower': Subgroup.plantFlower,
      'plant-other': Subgroup.plantOther,
      'food-fruit': Subgroup.foodFruit,
      'food-vegetable': Subgroup.foodVegetable,
      'food-prepared': Subgroup.foodPrepared,
      'food-asian': Subgroup.foodAsian,
      'food-marine': Subgroup.foodMarine,
      'food-sweet': Subgroup.foodSweet,
      'drink': Subgroup.drink,
      'dishware': Subgroup.dishware,
      'place-map': Subgroup.placeMap,
      'place-geographic': Subgroup.placeGeographic,
      'place-building': Subgroup.placeBuilding,
      'place-religious': Subgroup.placeReligious,
      'place-other': Subgroup.placeOther,
      'transport-ground': Subgroup.transportGround,
      'transport-water': Subgroup.transportWater,
      'transport-air': Subgroup.transportAir,
      'hotel': Subgroup.hotel,
      'time': Subgroup.time,
      'sky & weather': Subgroup.skyAndWeather,
      'event': Subgroup.event,
      'award-medal': Subgroup.awardMedal,
      'sport': Subgroup.sport,
      'game': Subgroup.game,
      'arts & crafts': Subgroup.artsAndCrafts,
      'clothing': Subgroup.clothing,
      'sound': Subgroup.sound,
      'music': Subgroup.music,
      'musical-instrument': Subgroup.musicalInstrument,
      'phone': Subgroup.phone,
      'computer': Subgroup.computer,
      'light & video': Subgroup.lightAndVideo,
      'book-paper': Subgroup.bookPaper,
      'money': Subgroup.money,
      'mail': Subgroup.mail,
      'writing': Subgroup.writing,
      'office': Subgroup.office,
      'lock': Subgroup.lock,
      'tool': Subgroup.tool,
      'science': Subgroup.science,
      'medical': Subgroup.medical,
      'household': Subgroup.household,
      'other-object': Subgroup.otherObject,
      'transport-sign': Subgroup.transportSign,
      'warning': Subgroup.warning,
      'arrow': Subgroup.arrow,
      'religion': Subgroup.religion,
      'zodiac': Subgroup.zodiac,
      'av-symbol': Subgroup.avSymbol,
      'gender': Subgroup.gender,
      'math': Subgroup.math,
      'punctuation': Subgroup.punctuation,
      'currency': Subgroup.currency,
      'other-symbol': Subgroup.otherSymbol,
      'keycap': Subgroup.keycap,
      'alphanum': Subgroup.alphanum,
      'geometric': Subgroup.geometric,
      'flag': Subgroup.flag,
      'country-flag': Subgroup.countryFlag,
      'subdivision-flag': Subgroup.subdivisionFlag,
    }).forEach((input, expected) {
      test('from returns returns $expected  when input is: [$input]', () {
        expect(Subgroup.from(input), expected);
      });
    });

    test('from throws State Error when input is invalid', () {
      const input = 'some unknown value';
      expect(() => Subgroup.from(input), throwsStateError);
    });
  });
}
