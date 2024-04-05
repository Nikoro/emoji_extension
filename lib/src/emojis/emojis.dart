import 'package:emoji_extension/emoji_extension.dart';

part 'emojis_data.dart';

/// A class that represents a collection of Emojis.
/// This class provides various methods to retrieve information about the Emojis, including
/// the count, groups and subgroups. It also provides methods to get a single Emoji by value,
/// unicode, name or shortcode, and retrieve a list of Emojis by group or subgroup.

abstract class Emojis {
  Emojis._();

  /// Returns an unmodifiable list of all the Emojis.
  static List<Emoji> get all => _emojis;

  /// Returns the number of Emojis in the collection.
  static int get count => _emojis.length;

  /// Returns an unmodifiable list of all the Emoji groups.
  static List<Group> get groups => Group.values;

  /// Returns an unmodifiable list of all the Emoji subgroups.
  static List<Subgroup> get subgroups => Subgroup.values;

  /// Returns an unmodifiable list of all the unicode emoji versions.
  static List<Version> get versions => Version.values;

  /// Returns an unmodifiable list of all the Emoji statuses.
  static List<Status> get statuses => Status.values;

  /// Returns a map of all the Emoji groups with their corresponding subgroups.
  static Map<Group, List<Subgroup>> get groupsWithSubgroups {
    return {for (final group in groups) group: group.subgroups};
  }

  /// Returns a map of all the Emoji groups with their corresponding subgroups values.
  /// The keys of the map are the values of the Emoji groups, and the values of the map are
  /// lists of the values of the corresponding subgroups.
  static Map<String, List<String>> get groupsWithSubgroupsValues {
    return groupsWithSubgroups.map((group, subgroups) {
      return MapEntry(group.value, subgroups.values);
    });
  }

  /// Returns an unmodifiable list of all the platform names for Emoji shortcodes.
  static List<String> get shortcodePlatforms {
    return Platform.values.map((e) => e.name).toUnmodifiableList();
  }

  /// Returns the Emoji with the specified value, unicode, name, or shortcode.
  /// If the specified Emoji cannot be found, the orElse parameter is called, and its
  /// return value is returned. If orElse is not specified, a [StateError] is thrown.
  static Emoji getOne(String param, {Emoji Function()? orElse}) {
    return _emojis.firstWhere(
      (e) =>
          e.value == param ||
          e.unicode == param ||
          e.name.equalsIgnoreCase(param) ||
          (e.appleName != null && e.appleName!.equalsIgnoreCase(param)) ||
          e.alsoKnownAs.any((s) => s.equalsIgnoreCase(param)) ||
          e.shortcodes
              .any((s) => s.values.any((v) => v == param.removeColons())),
      orElse: orElse,
    );
  }

  /// Returns the Emoji with the specified value, unicode, name, or shortcode,
  /// or null if it cannot be found.
  static Emoji? getOneOrNull(String param) {
    return _emojis.firstWhereOrNull(
      (e) =>
          e.value == param ||
          e.unicode == param ||
          e.name.equalsIgnoreCase(param) ||
          (e.appleName != null && e.appleName!.equalsIgnoreCase(param)) ||
          e.alsoKnownAs.any((s) => s.equalsIgnoreCase(param)) ||
          e.shortcodes
              .any((s) => s.values.any((v) => v == param.removeColons())),
    );
  }

  /// Returns a list of all [Emoji] objects in the _emojis list that belong
  /// to the specified [Group].
  static List<Emoji> byGroup(Group group) {
    return _emojis.where((e) => e.group == group).toUnmodifiableList();
  }

  /// Returns a list of all [Emoji] objects in the _emojis list that belong
  /// to the specified [Subgroup].
  static List<Emoji> bySubgroup(Subgroup subgroup) {
    return _emojis.where((e) => e.subgroup == subgroup).toUnmodifiableList();
  }

  /// Returns a list of all [Emoji] objects in the _emojis list that belong
  /// to the specified [Version].
  static List<Emoji> byVersion(Version version) {
    return _emojis.where((e) => e.version == version).toUnmodifiableList();
  }

  /// Returns a list of all [Emoji] objects in the _emojis list that belong
  /// to the specified [Status].
  static List<Emoji> byStatus(Status status) {
    return _emojis.where((e) => e.status == status).toUnmodifiableList();
  }

  /* -------------------------------- Groups -------------------------------- */

  /// Returns a list of emojis under the 'smileys and emotion' group.
  static List<Emoji> get smileysAndEmotion => byGroup(Group.smileysAndEmotion);

  /// Returns a list of emojis under the 'people and body' group.
  static List<Emoji> get peopleAndBody => byGroup(Group.peopleAndBody);

  /// Returns a list of emojis under the 'component' group.
  static List<Emoji> get component => byGroup(Group.component);

  /// Returns a list of emojis under the 'animals and nature' group.
  static List<Emoji> get animalsAndNature => byGroup(Group.animalsAndNature);

  /// Returns a list of emojis under the 'food and drink' group.
  static List<Emoji> get foodAndDrink => byGroup(Group.foodAndDrink);

  /// Returns a list of emojis under the 'travel and places' group.
  static List<Emoji> get travelAndPlaces => byGroup(Group.travelAndPlaces);

  /// Returns a list of emojis under the 'activities' group.
  static List<Emoji> get activities => byGroup(Group.activities);

  /// Returns a list of emojis under the 'objects' group.
  static List<Emoji> get objects => byGroup(Group.objects);

  /// Returns a list of emojis under the 'symbols' group.
  static List<Emoji> get symbols => byGroup(Group.symbols);

  /// Returns a list of emojis under the 'flags' group.
  static List<Emoji> get flags => byGroup(Group.flags);

  /* ------------------------------ Subgroups ------------------------------- */

  /// Returns a list of emojis under the 'face smiling' subgroup.
  static List<Emoji> get faceSmiling => bySubgroup(Subgroup.faceSmiling);

  /// Returns a list of emojis under the 'face affection' subgroup.
  static List<Emoji> get faceAffection => bySubgroup(Subgroup.faceAffection);

  /// Returns a list of emojis under the 'face tongue' subgroup.
  static List<Emoji> get faceTongue => bySubgroup(Subgroup.faceTongue);

  /// Returns a list of emojis under the 'face hand' subgroup.
  static List<Emoji> get faceHand => bySubgroup(Subgroup.faceHand);

  /// Returns a list of emojis under the 'face neutral skeptical' subgroup.
  static List<Emoji> get faceNeutralSkeptical {
    return bySubgroup(Subgroup.faceNeutralSkeptical);
  }

  /// Returns a list of emojis under the 'face sleepy' subgroup.
  static List<Emoji> get faceSleepy => bySubgroup(Subgroup.faceSleepy);

  /// Returns a list of emojis under the 'face unwell' subgroup.
  static List<Emoji> get faceUnwell => bySubgroup(Subgroup.faceUnwell);

  /// Returns a list of emojis under the 'face hat' subgroup.
  static List<Emoji> get faceHat => bySubgroup(Subgroup.faceHat);

  /// Returns a list of emojis under the 'face glasses' subgroup.
  static List<Emoji> get faceGlasses => bySubgroup(Subgroup.faceGlasses);

  /// Returns a list of emojis under the 'face concerned' subgroup.
  static List<Emoji> get faceConcerned => bySubgroup(Subgroup.faceConcerned);

  /// Returns a list of emojis under the 'face negative' subgroup.
  static List<Emoji> get faceNegative => bySubgroup(Subgroup.faceNegative);

  /// Returns a list of emojis under the 'face costume' subgroup.
  static List<Emoji> get faceCostume => bySubgroup(Subgroup.faceCostume);

  /// Returns a list of emojis under the 'cat face' subgroup.
  static List<Emoji> get catFace => bySubgroup(Subgroup.catFace);

  /// Returns a list of emojis under the 'monkey face' subgroup.
  static List<Emoji> get monkeyFace => bySubgroup(Subgroup.monkeyFace);

  /// Returns a list of emojis under the 'heart' subgroup.
  static List<Emoji> get heart => bySubgroup(Subgroup.heart);

  /// Returns a list of emojis under the 'emotion' subgroup.
  static List<Emoji> get emotion => bySubgroup(Subgroup.emotion);

  /// Returns a list of emojis under the 'hand fingers open' subgroup.
  static List<Emoji> get handFingersOpen =>
      bySubgroup(Subgroup.handFingersOpen);

  /// Returns a list of emojis under the 'hand fingers partial' subgroup.
  static List<Emoji> get handFingersPartial =>
      bySubgroup(Subgroup.handFingersPartial);

  /// Returns a list of emojis under the 'hand single finger' subgroup.
  static List<Emoji> get handSingleFinger =>
      bySubgroup(Subgroup.handSingleFinger);

  /// Returns a list of emojis under the 'hand fingers closed' subgroup.
  static List<Emoji> get handFingersClosed =>
      bySubgroup(Subgroup.handFingersClosed);

  /// Returns a list of emojis under the 'hands' subgroup.
  static List<Emoji> get hands => bySubgroup(Subgroup.hands);

  /// Returns a list of emojis under the 'hand prop' subgroup.
  static List<Emoji> get handProp => bySubgroup(Subgroup.handProp);

  /// Returns a list of emojis under the 'body parts' subgroup.
  static List<Emoji> get bodyParts => bySubgroup(Subgroup.bodyParts);

  /// Returns a list of emojis under the 'person' subgroup.
  static List<Emoji> get person => bySubgroup(Subgroup.person);

  /// Returns a list of emojis under the 'person gesture' subgroup.
  static List<Emoji> get personGesture => bySubgroup(Subgroup.personGesture);

  /// Returns a list of emojis under the 'person role' subgroup.
  static List<Emoji> get personRole => bySubgroup(Subgroup.personRole);

  /// Returns a list of emojis under the 'person fantasy' subgroup.
  static List<Emoji> get personFantasy => bySubgroup(Subgroup.personFantasy);

  /// Returns a list of emojis under the 'person activity' subgroup.
  static List<Emoji> get personActivity => bySubgroup(Subgroup.personActivity);

  /// Returns a list of emojis under the 'person sport' subgroup.
  static List<Emoji> get personSport => bySubgroup(Subgroup.personSport);

  /// Returns a list of emojis under the 'person resting' subgroup.
  static List<Emoji> get personResting => bySubgroup(Subgroup.personResting);

  /// Returns a list of emojis under the 'family' subgroup.
  static List<Emoji> get family => bySubgroup(Subgroup.family);

  /// Returns a list of emojis under the 'person symbol' subgroup.
  static List<Emoji> get personSymbol => bySubgroup(Subgroup.personSymbol);

  /// Returns a list of emojis under the 'skin tone' subgroup.
  static List<Emoji> get skinTone => bySubgroup(Subgroup.skinTone);

  /// Returns a list of emojis under the 'hair style' subgroup.
  static List<Emoji> get hairStyle => bySubgroup(Subgroup.hairStyle);

  /// Returns a list of emojis under the 'animal mammal' subgroup.
  static List<Emoji> get animalMammal => bySubgroup(Subgroup.animalMammal);

  /// Returns a list of emojis under the 'animal bird' subgroup.
  static List<Emoji> get animalBird => bySubgroup(Subgroup.animalBird);

  /// Returns a list of emojis under the 'animal amphibian' subgroup.
  static List<Emoji> get animalAmphibian =>
      bySubgroup(Subgroup.animalAmphibian);

  /// Returns a list of emojis under the 'animal reptile' subgroup.
  static List<Emoji> get animalReptile => bySubgroup(Subgroup.animalReptile);

  /// Returns a list of emojis under the 'animal marine' subgroup.
  static List<Emoji> get animalMarine => bySubgroup(Subgroup.animalMarine);

  /// Returns a list of emojis under the 'animal bug' subgroup.
  static List<Emoji> get animalBug => bySubgroup(Subgroup.animalBug);

  /// Returns a list of emojis under the 'plant flower' subgroup.
  static List<Emoji> get plantFlower => bySubgroup(Subgroup.plantFlower);

  /// Returns a list of emojis under the 'plant other' subgroup.
  static List<Emoji> get plantOther => bySubgroup(Subgroup.plantOther);

  /// Returns a list of emojis under the 'food fruit' subgroup.
  static List<Emoji> get foodFruit => bySubgroup(Subgroup.foodFruit);

  /// Returns a list of emojis under the 'food vegetable' subgroup.
  static List<Emoji> get foodVegetable => bySubgroup(Subgroup.foodVegetable);

  /// Returns a list of emojis under the 'food prepared' subgroup.
  static List<Emoji> get foodPrepared => bySubgroup(Subgroup.foodPrepared);

  /// Returns a list of emojis under the 'food asian' subgroup.
  static List<Emoji> get foodAsian => bySubgroup(Subgroup.foodAsian);

  /// Returns a list of emojis under the 'food marine' subgroup.
  static List<Emoji> get foodMarine => bySubgroup(Subgroup.foodMarine);

  /// Returns a list of emojis under the 'food sweet' subgroup.
  static List<Emoji> get foodSweet => bySubgroup(Subgroup.foodSweet);

  /// Returns a list of emojis under the 'drink' subgroup.
  static List<Emoji> get drink => bySubgroup(Subgroup.drink);

  /// Returns a list of emojis under the 'dishware' subgroup.
  static List<Emoji> get dishware => bySubgroup(Subgroup.dishware);

  /// Returns a list of emojis under the 'place map' subgroup.
  static List<Emoji> get placeMap => bySubgroup(Subgroup.placeMap);

  /// Returns a list of emojis under the 'place geographic' subgroup.
  static List<Emoji> get placeGeographic =>
      bySubgroup(Subgroup.placeGeographic);

  /// Returns a list of emojis under the 'place building' subgroup.
  static List<Emoji> get placeBuilding => bySubgroup(Subgroup.placeBuilding);

  /// Returns a list of emojis under the 'place religious' subgroup.
  static List<Emoji> get placeReligious => bySubgroup(Subgroup.placeReligious);

  /// Returns a list of emojis under the 'place other' subgroup.
  static List<Emoji> get placeOther => bySubgroup(Subgroup.placeOther);

  /// Returns a list of emojis under the 'transport ground' subgroup.
  static List<Emoji> get transportGround =>
      bySubgroup(Subgroup.transportGround);

  /// Returns a list of emojis under the 'transport water' subgroup.
  static List<Emoji> get transportWater => bySubgroup(Subgroup.transportWater);

  /// Returns a list of emojis under the 'transport air' subgroup.
  static List<Emoji> get transportAir => bySubgroup(Subgroup.transportAir);

  /// Returns a list of emojis under the 'hotel' subgroup.
  static List<Emoji> get hotel => bySubgroup(Subgroup.hotel);

  /// Returns a list of emojis under the 'time' subgroup.
  static List<Emoji> get time => bySubgroup(Subgroup.time);

  /// Returns a list of emojis under the 'sky and weather' subgroup.
  static List<Emoji> get skyAndWeather => bySubgroup(Subgroup.skyAndWeather);

  /// Returns a list of emojis under the 'event' subgroup.
  static List<Emoji> get event => bySubgroup(Subgroup.event);

  /// Returns a list of emojis under the 'award medal' subgroup.
  static List<Emoji> get awardMedal => bySubgroup(Subgroup.awardMedal);

  /// Returns a list of emojis under the 'sport' subgroup.
  static List<Emoji> get sport => bySubgroup(Subgroup.sport);

  /// Returns a list of emojis under the 'game' subgroup.
  static List<Emoji> get game => bySubgroup(Subgroup.game);

  /// Returns a list of emojis under the 'arts and crafts' subgroup.
  static List<Emoji> get artsAndCrafts => bySubgroup(Subgroup.artsAndCrafts);

  /// Returns a list of emojis under the 'clothing' subgroup.
  static List<Emoji> get clothing => bySubgroup(Subgroup.clothing);

  /// Returns a list of emojis under the 'sound' subgroup.
  static List<Emoji> get sound => bySubgroup(Subgroup.sound);

  /// Returns a list of emojis under the 'music' subgroup.
  static List<Emoji> get music => bySubgroup(Subgroup.music);

  /// Returns a list of emojis under the 'musical instrument' subgroup.
  static List<Emoji> get musicalInstrument =>
      bySubgroup(Subgroup.musicalInstrument);

  /// Returns a list of emojis under the 'phone' subgroup.
  static List<Emoji> get phone => bySubgroup(Subgroup.phone);

  /// Returns a list of emojis under the 'computer' subgroup.
  static List<Emoji> get computer => bySubgroup(Subgroup.computer);

  /// Returns a list of emojis under the 'light and video' subgroup.
  static List<Emoji> get lightAndVideo => bySubgroup(Subgroup.lightAndVideo);

  /// Returns a list of emojis under the 'book paper' subgroup.
  static List<Emoji> get bookPaper => bySubgroup(Subgroup.bookPaper);

  /// Returns a list of emojis under the 'money' subgroup.
  static List<Emoji> get money => bySubgroup(Subgroup.money);

  /// Returns a list of emojis under the 'mail' subgroup.
  static List<Emoji> get mail => bySubgroup(Subgroup.mail);

  /// Returns a list of emojis under the 'writing' subgroup.
  static List<Emoji> get writing => bySubgroup(Subgroup.writing);

  /// Returns a list of emojis under the 'office' subgroup.
  static List<Emoji> get office => bySubgroup(Subgroup.office);

  /// Returns a list of emojis under the 'lock' subgroup.
  static List<Emoji> get lock => bySubgroup(Subgroup.lock);

  /// Returns a list of emojis under the 'tool' subgroup.
  static List<Emoji> get tool => bySubgroup(Subgroup.tool);

  /// Returns a list of emojis under the 'science' subgroup.
  static List<Emoji> get science => bySubgroup(Subgroup.science);

  /// Returns a list of emojis under the 'medical' subgroup.
  static List<Emoji> get medical => bySubgroup(Subgroup.medical);

  /// Returns a list of emojis under the 'household' subgroup.
  static List<Emoji> get household => bySubgroup(Subgroup.household);

  /// Returns a list of emojis under the 'other object' subgroup.
  static List<Emoji> get otherObject => bySubgroup(Subgroup.otherObject);

  /// Returns a list of emojis under the 'transports sign' subgroup.
  static List<Emoji> get transportSign => bySubgroup(Subgroup.transportSign);

  /// Returns a list of emojis under the 'warning' subgroup.
  static List<Emoji> get warning => bySubgroup(Subgroup.warning);

  /// Returns a list of emojis under the 'arrow' subgroup.
  static List<Emoji> get arrow => bySubgroup(Subgroup.arrow);

  /// Returns a list of emojis under the 'religion' subgroup.
  static List<Emoji> get religion => bySubgroup(Subgroup.religion);

  /// Returns a list of emojis under the 'zodiac' subgroup.
  static List<Emoji> get zodiac => bySubgroup(Subgroup.zodiac);

  /// Returns a list of emojis under the 'av symbol' subgroup.
  static List<Emoji> get avSymbol => bySubgroup(Subgroup.avSymbol);

  /// Returns a list of emojis under the 'gender' subgroup.
  static List<Emoji> get gender => bySubgroup(Subgroup.gender);

  /// Returns a list of emojis under the 'math' subgroup.
  static List<Emoji> get math => bySubgroup(Subgroup.math);

  /// Returns a list of emojis under the 'punctuation' subgroup.
  static List<Emoji> get punctuation => bySubgroup(Subgroup.punctuation);

  /// Returns a list of emojis under the 'currency' subgroup.
  static List<Emoji> get currency => bySubgroup(Subgroup.currency);

  /// Returns a list of emojis under the 'other symbol' subgroup.
  static List<Emoji> get otherSymbol => bySubgroup(Subgroup.otherSymbol);

  /// Returns a list of emojis under the 'keycap' subgroup.
  static List<Emoji> get keycap => bySubgroup(Subgroup.keycap);

  /// Returns a list of emojis under the 'alphanum' subgroup.
  static List<Emoji> get alphanum => bySubgroup(Subgroup.alphanum);

  /// Returns a list of emojis under the 'geometric' subgroup.
  static List<Emoji> get geometric => bySubgroup(Subgroup.geometric);

  /// Returns a list of emojis under the 'flag' subgroup.
  static List<Emoji> get flag => bySubgroup(Subgroup.flag);

  /// Returns a list of emojis under the 'country flag' subgroup.
  static List<Emoji> get countryFlag => bySubgroup(Subgroup.countryFlag);

  /// Returns a list of emojis under the 'subdivision flag' subgroup.
  static List<Emoji> get subdivisionFlag =>
      bySubgroup(Subgroup.subdivisionFlag);

  /* ------------------------------ Versions ------------------------------- */

  /// Returns a list of emojis under the Unicode 6.0 version.
  static List<Emoji> get v6_0 => byVersion(Version.v6_0);

  /// Returns a list of emojis under the Unicode 7.0 version.
  static List<Emoji> get v7_0 => byVersion(Version.v7_0);

  /// Returns a list of emojis under the Unicode 8.0 version.
  static List<Emoji> get v8_0 => byVersion(Version.v8_0);

  /// Returns a list of emojis under the Unicode 9.0 version.
  static List<Emoji> get v9_0 => byVersion(Version.v9_0);

  /// Returns a list of emojis under the Unicode 10.0 version.
  static List<Emoji> get v10_0 => byVersion(Version.v10_0);

  /// Returns a list of emojis under the Unicode 11.0 version.
  static List<Emoji> get v11_0 => byVersion(Version.v11_0);

  /// Returns a list of emojis under the Unicode 12.0 version.
  static List<Emoji> get v12_0 => byVersion(Version.v12_0);

  /// Returns a list of emojis under the Unicode 12.1 version.
  static List<Emoji> get v12_1 => byVersion(Version.v12_1);

  /// Returns a list of emojis under the Unicode 13.0 version.
  static List<Emoji> get v13_0 => byVersion(Version.v13_0);

  /// Returns a list of emojis under the Unicode 13.1 version.
  static List<Emoji> get v13_1 => byVersion(Version.v13_1);

  /// Returns a list of emojis under the Unicode 14.0 version.
  static List<Emoji> get v14_0 => byVersion(Version.v14_0);

  /// Returns a list of emojis under the Unicode 15.0 version.
  static List<Emoji> get v15_0 => byVersion(Version.v15_0);

  /// Returns a list of emojis under the Unicode 15.1 version.
  static List<Emoji> get v15_1 => byVersion(Version.v15_1);

  /* ------------------------------ Status ------------------------------- */

  /// Returns a list of emojis under the 'fully-qualified' status.
  static List<Emoji> get fullyQualified => byStatus(Status.fullyQualified);

  /// Returns a list of emojis under the 'minimally-qualified' status.
  static List<Emoji> get minimallyQualified =>
      byStatus(Status.minimallyQualified);

  /// Returns a list of emojis under the 'unqualified' status.
  static List<Emoji> get unqualified => byStatus(Status.unqualified);
}
