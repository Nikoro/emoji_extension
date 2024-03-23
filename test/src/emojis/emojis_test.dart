import 'package:emoji_extension/emoji_extension.dart';
import 'package:emoji_extension/src/emojis/version.dart';
import 'package:test/test.dart';

import '../../_tools/tools.dart';

void main() {
  group('Emojis', () {
    test('is Singleton', () {
      final s1 = Emojis();
      final s2 = Emojis();
      expect(identical(s1, s2), true);
      expect(s1 == s2, true);
    });

    test('count returns correct value', () {
      expect(Emojis().count, 5034);
    });

    test('groups returns correct value', () {
      expect(Emojis().groups, Group.values);
    });

    test('subgroups returns correct value', () {
      expect(Emojis().subgroups, Subgroup.values);
    });

    test('versions returns correct value', () {
      expect(Emojis().versions, Version.values);
    });

    test('groupsWithSubgroups returns correct type', () {
      expect(Emojis().groupsWithSubgroups, isA<Map<Group, List<Subgroup>>>());
    });

    test('groupsWithSubgroupsValues returns correct type', () {
      expect(
        Emojis().groupsWithSubgroupsValues,
        isA<Map<String, List<String>>>(),
      );
    });

    test('shortcodePlatforms returns correct values', () {
      expect(
        Emojis().shortcodePlatforms,
        ['Default', 'CLDR', 'Discord', 'Github', 'Slack'],
      );
    });

    [
      '😀',
      'Grinning face',
      'grinning face',
      'Grinning Face',
      '1F600',
      'grinning_face',
      ':grinning_face:',
      'grinning',
      ':grinning:',
    ].forEach((input) {
      test('getOne() returns correct value when param is: [$input]', () {
        expect(Emojis().getOne(input), TestEmojis.grinningFace);
      });
    });

    $({
      '😀': TestEmojis.grinningFace,
      'Grinning face': TestEmojis.grinningFace,
      'grinning face': TestEmojis.grinningFace,
      'Grinning Face': TestEmojis.grinningFace,
      '1F600': TestEmojis.grinningFace,
      'grinning_face': TestEmojis.grinningFace,
      ':grinning_face:': TestEmojis.grinningFace,
      'grinning': TestEmojis.grinningFace,
      ':grinning:': TestEmojis.grinningFace,
      'some broken text': null,
    }).forEach((input, expected) {
      test('getOneOrNull() returns $expected when param is: [$input]', () {
        expect(Emojis().getOneOrNull(input), expected);
      });
    });

    $({
      Group.smileysAndEmotion: 184,
      Group.peopleAndBody: 3290,
      Group.component: 9,
      Group.animalsAndNature: 160,
      Group.foodAndDrink: 137,
      Group.travelAndPlaces: 267,
      Group.activities: 96,
      Group.objects: 312,
      Group.symbols: 304,
      Group.flags: 275,
    }).forEach((input, expected) {
      test('byGroup() returns $expected emojis when group is: [${input.name}]',
          () {
        expect(Emojis().byGroup(input).length, expected);
      });
    });

    $({
      Subgroup.faceSmiling: 14,
      Subgroup.faceAffection: 10,
      Subgroup.faceTongue: 6,
      Subgroup.faceHand: 7,
      Subgroup.faceNeutralSkeptical: 19,
      Subgroup.faceSleepy: 5,
      Subgroup.faceUnwell: 12,
      Subgroup.faceHat: 3,
      Subgroup.faceGlasses: 3,
      Subgroup.faceConcerned: 27,
      Subgroup.faceNegative: 9,
      Subgroup.faceCostume: 8,
      Subgroup.catFace: 9,
      Subgroup.monkeyFace: 3,
      Subgroup.heart: 29,
      Subgroup.emotion: 20,
      Subgroup.handFingersOpen: 67,
      Subgroup.handFingersPartial: 55,
      Subgroup.handSingleFinger: 43,
      Subgroup.handFingersClosed: 36,
      Subgroup.hands: 62,
      Subgroup.handProp: 19,
      Subgroup.bodyParts: 49,
      Subgroup.person: 192,
      Subgroup.personGesture: 300,
      Subgroup.personRole: 635,
      Subgroup.personFantasy: 245,
      Subgroup.personActivity: 606,
      Subgroup.personSport: 395,
      Subgroup.personResting: 42,
      Subgroup.family: 533,
      Subgroup.personSymbol: 11,
      Subgroup.skinTone: 5,
      Subgroup.hairStyle: 4,
      Subgroup.animalMammal: 68,
      Subgroup.animalBird: 23,
      Subgroup.animalAmphibian: 1,
      Subgroup.animalReptile: 8,
      Subgroup.animalMarine: 12,
      Subgroup.animalBug: 18,
      Subgroup.plantFlower: 13,
      Subgroup.plantOther: 17,
      Subgroup.foodFruit: 20,
      Subgroup.foodVegetable: 19,
      Subgroup.foodPrepared: 34,
      Subgroup.foodAsian: 17,
      Subgroup.foodMarine: 5,
      Subgroup.foodSweet: 14,
      Subgroup.drink: 20,
      Subgroup.dishware: 8,
      Subgroup.placeMap: 8,
      Subgroup.placeGeographic: 16,
      Subgroup.placeBuilding: 32,
      Subgroup.placeReligious: 7,
      Subgroup.placeOther: 19,
      Subgroup.transportGround: 55,
      Subgroup.transportWater: 12,
      Subgroup.transportAir: 16,
      Subgroup.hotel: 3,
      Subgroup.time: 34,
      Subgroup.skyAndWeather: 65,
      Subgroup.event: 23,
      Subgroup.awardMedal: 7,
      Subgroup.sport: 28,
      Subgroup.game: 30,
      Subgroup.artsAndCrafts: 8,
      Subgroup.clothing: 50,
      Subgroup.sound: 9,
      Subgroup.music: 12,
      Subgroup.musicalInstrument: 11,
      Subgroup.phone: 7,
      Subgroup.computer: 19,
      Subgroup.lightAndVideo: 19,
      Subgroup.bookPaper: 19,
      Subgroup.money: 10,
      Subgroup.mail: 15,
      Subgroup.writing: 13,
      Subgroup.office: 31,
      Subgroup.lock: 7,
      Subgroup.tool: 37,
      Subgroup.science: 8,
      Subgroup.medical: 7,
      Subgroup.household: 27,
      Subgroup.otherObject: 11,
      Subgroup.transportSign: 13,
      Subgroup.warning: 16,
      Subgroup.arrow: 35,
      Subgroup.religion: 22,
      Subgroup.zodiac: 13,
      Subgroup.avSymbol: 34,
      Subgroup.gender: 6,
      Subgroup.math: 8,
      Subgroup.punctuation: 10,
      Subgroup.currency: 2,
      Subgroup.otherSymbol: 33,
      Subgroup.keycap: 25,
      Subgroup.alphanum: 49,
      Subgroup.geometric: 38,
      Subgroup.flag: 14,
      Subgroup.countryFlag: 258,
      Subgroup.subdivisionFlag: 3,
    }).forEach((input, expected) {
      test(
          'bySubgroup() returns $expected emojis when group is: [${input.name}]',
          () {
        expect(Emojis().bySubgroup(input).length, expected);
      });
    });

    $({
      Version.v6_0: 793,
      Version.v7_0: 254,
      Version.v8_0: 809,
      Version.v9_0: 1187,
      Version.v10_0: 339,
      Version.v11_0: 188,
      Version.v12_0: 266,
      Version.v13_0: 146,
      Version.v13_1: 422,
      Version.v14_0: 112,
      Version.v15_0: 31,
      Version.v15_1: 301,
    }).forEach((input, expected) {
      test(
          'byVersion() returns $expected emojis when version is: [${input.name}]',
          () {
        expect(Emojis().byVersion(input).length, expected);
      });
    });

    test('get returns correct values', () {
      expect(Emojis().get.values, TestEmojis.values);
    });
  });
}
