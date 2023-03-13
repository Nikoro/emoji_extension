import 'package:emoji_extension/src/emojis/subgroup.dart';

/// A collection of groups that categorize emojis in Unicode.
///
/// Each group represents a high-level category of emojis, such as "Smileys & Emotion",
/// "People & Body", "Animals & Nature", etc.
enum Group {
  smileysAndEmotion('Smileys & Emotion'),
  peopleAndBody('People & Body'),
  component('Component'),
  animalsAndNature('Animals & Nature'),
  foodAndDrink('Food & Drink'),
  travelAndPlaces('Travel & Places'),
  activities('Activities'),
  objects('Objects'),
  symbols('Symbols'),
  flags('Flags');

  /// Creates a new Group object with the given String value.
  const Group(this.value);

  /// Returns the Group enum value that matches the given [value].
  ///
  /// If no match is found, this method throws a [StateError].
  factory Group.from(String value) {
    return values.firstWhere((v) => v.value == value);
  }

  /// The String value of the group.
  final String value;
}

/// Provides extension methods for the [Group] enum.
///
/// These methods help access subgroups within a group.
extension GroupExtensions on Group {
  /// Returns a list of [Subgroup] values that belong to this group.
  List<Subgroup> get subgroups {
    switch (this) {
      case Group.smileysAndEmotion:
        return [
          Subgroup.faceSmiling,
          Subgroup.faceAffection,
          Subgroup.faceTongue,
          Subgroup.faceHand,
          Subgroup.faceNeutralSkeptical,
          Subgroup.faceSleepy,
          Subgroup.faceUnwell,
          Subgroup.faceHat,
          Subgroup.faceGlasses,
          Subgroup.faceConcerned,
          Subgroup.faceNegative,
          Subgroup.faceCostume,
          Subgroup.catFace,
          Subgroup.monkeyFace,
          Subgroup.heart,
          Subgroup.emotion
        ];
      case Group.peopleAndBody:
        return [
          Subgroup.handFingersOpen,
          Subgroup.handFingersPartial,
          Subgroup.handSingleFinger,
          Subgroup.handFingersClosed,
          Subgroup.hands,
          Subgroup.handProp,
          Subgroup.bodyParts,
          Subgroup.person,
          Subgroup.personGesture,
          Subgroup.personRole,
          Subgroup.personFantasy,
          Subgroup.personActivity,
          Subgroup.personSport,
          Subgroup.personResting,
          Subgroup.family,
          Subgroup.personSymbol
        ];
      case Group.component:
        return [
          Subgroup.skinTone,
          Subgroup.hairStyle,
        ];
      case Group.animalsAndNature:
        return [
          Subgroup.animalMammal,
          Subgroup.animalBird,
          Subgroup.animalAmphibian,
          Subgroup.animalReptile,
          Subgroup.animalMarine,
          Subgroup.animalBug,
          Subgroup.plantFlower,
          Subgroup.plantOther,
        ];
      case Group.foodAndDrink:
        return [
          Subgroup.foodFruit,
          Subgroup.foodVegetable,
          Subgroup.foodPrepared,
          Subgroup.foodAsian,
          Subgroup.foodMarine,
          Subgroup.foodSweet,
          Subgroup.drink,
          Subgroup.dishware,
        ];
      case Group.travelAndPlaces:
        return [
          Subgroup.placeMap,
          Subgroup.placeGeographic,
          Subgroup.placeBuilding,
          Subgroup.placeReligious,
          Subgroup.placeOther,
          Subgroup.transportGround,
          Subgroup.transportWater,
          Subgroup.transportAir,
          Subgroup.hotel,
          Subgroup.time,
          Subgroup.skyAndWeather
        ];
      case Group.activities:
        return [
          Subgroup.event,
          Subgroup.awardMedal,
          Subgroup.sport,
          Subgroup.game,
          Subgroup.artsAndCrafts,
        ];
      case Group.objects:
        return [
          Subgroup.clothing,
          Subgroup.sound,
          Subgroup.music,
          Subgroup.musicalInstrument,
          Subgroup.phone,
          Subgroup.computer,
          Subgroup.lightAndVideo,
          Subgroup.bookPaper,
          Subgroup.money,
          Subgroup.mail,
          Subgroup.writing,
          Subgroup.office,
          Subgroup.lock,
          Subgroup.tool,
          Subgroup.science,
          Subgroup.medical,
          Subgroup.household,
          Subgroup.otherObject,
        ];
      case Group.symbols:
        return [
          Subgroup.transportSign,
          Subgroup.warning,
          Subgroup.arrow,
          Subgroup.religion,
          Subgroup.zodiac,
          Subgroup.avSymbol,
          Subgroup.gender,
          Subgroup.math,
          Subgroup.punctuation,
          Subgroup.currency,
          Subgroup.otherSymbol,
          Subgroup.keycap,
          Subgroup.alphanum,
          Subgroup.geometric,
        ];
      case Group.flags:
        return [
          Subgroup.flag,
          Subgroup.countryFlag,
          Subgroup.subdivisionFlag,
        ];
    }
  }
}
