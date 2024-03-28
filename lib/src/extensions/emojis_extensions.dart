import 'package:emoji_extension/emoji_extension.dart';

/// An extension that provides convenient methods for filtering and accessing
/// emojis in a given Emojis list.
extension EmojisExtensions on Emojis {
  /* -------------------------------- Groups -------------------------------- */

  /// Returns a list of emojis under the 'smileys and emotion' group.
  List<Emoji> get smileysAndEmotion => byGroup(Group.smileysAndEmotion);

  /// Returns a list of emojis under the 'people and body' group.
  List<Emoji> get peopleAndBody => byGroup(Group.peopleAndBody);

  /// Returns a list of emojis under the 'component' group.
  List<Emoji> get component => byGroup(Group.component);

  /// Returns a list of emojis under the 'animals and nature' group.
  List<Emoji> get animalsAndNature => byGroup(Group.animalsAndNature);

  /// Returns a list of emojis under the 'food and drink' group.
  List<Emoji> get foodAndDrink => byGroup(Group.foodAndDrink);

  /// Returns a list of emojis under the 'travel and places' group.
  List<Emoji> get travelAndPlaces => byGroup(Group.travelAndPlaces);

  /// Returns a list of emojis under the 'activities' group.
  List<Emoji> get activities => byGroup(Group.activities);

  /// Returns a list of emojis under the 'objects' group.
  List<Emoji> get objects => byGroup(Group.objects);

  /// Returns a list of emojis under the 'symbols' group.
  List<Emoji> get symbols => byGroup(Group.symbols);

  /// Returns a list of emojis under the 'flags' group.
  List<Emoji> get flags => byGroup(Group.flags);

  /* ------------------------------ Subgroups ------------------------------- */

  /// Returns a list of emojis under the 'face smiling' subgroup.
  List<Emoji> get faceSmiling => bySubgroup(Subgroup.faceSmiling);

  /// Returns a list of emojis under the 'face affection' subgroup.
  List<Emoji> get faceAffection => bySubgroup(Subgroup.faceAffection);

  /// Returns a list of emojis under the 'face tongue' subgroup.
  List<Emoji> get faceTongue => bySubgroup(Subgroup.faceTongue);

  /// Returns a list of emojis under the 'face hand' subgroup.
  List<Emoji> get faceHand => bySubgroup(Subgroup.faceHand);

  /// Returns a list of emojis under the 'face neutral skeptical' subgroup.
  List<Emoji> get faceNeutralSkeptical {
    return bySubgroup(Subgroup.faceNeutralSkeptical);
  }

  /// Returns a list of emojis under the 'face sleepy' subgroup.
  List<Emoji> get faceSleepy => bySubgroup(Subgroup.faceSleepy);

  /// Returns a list of emojis under the 'face unwell' subgroup.
  List<Emoji> get faceUnwell => bySubgroup(Subgroup.faceUnwell);

  /// Returns a list of emojis under the 'face hat' subgroup.
  List<Emoji> get faceHat => bySubgroup(Subgroup.faceHat);

  /// Returns a list of emojis under the 'face glasses' subgroup.
  List<Emoji> get faceGlasses => bySubgroup(Subgroup.faceGlasses);

  /// Returns a list of emojis under the 'face concerned' subgroup.
  List<Emoji> get faceConcerned => bySubgroup(Subgroup.faceConcerned);

  /// Returns a list of emojis under the 'face negative' subgroup.
  List<Emoji> get faceNegative => bySubgroup(Subgroup.faceNegative);

  /// Returns a list of emojis under the 'face costume' subgroup.
  List<Emoji> get faceCostume => bySubgroup(Subgroup.faceCostume);

  /// Returns a list of emojis under the 'cat face' subgroup.
  List<Emoji> get catFace => bySubgroup(Subgroup.catFace);

  /// Returns a list of emojis under the 'monkey face' subgroup.
  List<Emoji> get monkeyFace => bySubgroup(Subgroup.monkeyFace);

  /// Returns a list of emojis under the 'heart' subgroup.
  List<Emoji> get heart => bySubgroup(Subgroup.heart);

  /// Returns a list of emojis under the 'emotion' subgroup.
  List<Emoji> get emotion => bySubgroup(Subgroup.emotion);

  /// Returns a list of emojis under the 'hand fingers open' subgroup.
  List<Emoji> get handFingersOpen => bySubgroup(Subgroup.handFingersOpen);

  /// Returns a list of emojis under the 'hand fingers partial' subgroup.
  List<Emoji> get handFingersPartial => bySubgroup(Subgroup.handFingersPartial);

  /// Returns a list of emojis under the 'hand single finger' subgroup.
  List<Emoji> get handSingleFinger => bySubgroup(Subgroup.handSingleFinger);

  /// Returns a list of emojis under the 'hand fingers closed' subgroup.
  List<Emoji> get handFingersClosed => bySubgroup(Subgroup.handFingersClosed);

  /// Returns a list of emojis under the 'hands' subgroup.
  List<Emoji> get hands => bySubgroup(Subgroup.hands);

  /// Returns a list of emojis under the 'hand prop' subgroup.
  List<Emoji> get handProp => bySubgroup(Subgroup.handProp);

  /// Returns a list of emojis under the 'body parts' subgroup.
  List<Emoji> get bodyParts => bySubgroup(Subgroup.bodyParts);

  /// Returns a list of emojis under the 'person' subgroup.
  List<Emoji> get person => bySubgroup(Subgroup.person);

  /// Returns a list of emojis under the 'person gesture' subgroup.
  List<Emoji> get personGesture => bySubgroup(Subgroup.personGesture);

  /// Returns a list of emojis under the 'person role' subgroup.
  List<Emoji> get personRole => bySubgroup(Subgroup.personRole);

  /// Returns a list of emojis under the 'person fantasy' subgroup.
  List<Emoji> get personFantasy => bySubgroup(Subgroup.personFantasy);

  /// Returns a list of emojis under the 'person activity' subgroup.
  List<Emoji> get personActivity => bySubgroup(Subgroup.personActivity);

  /// Returns a list of emojis under the 'person sport' subgroup.
  List<Emoji> get personSport => bySubgroup(Subgroup.personSport);

  /// Returns a list of emojis under the 'person resting' subgroup.
  List<Emoji> get personResting => bySubgroup(Subgroup.personResting);

  /// Returns a list of emojis under the 'family' subgroup.
  List<Emoji> get family => bySubgroup(Subgroup.family);

  /// Returns a list of emojis under the 'person symbol' subgroup.
  List<Emoji> get personSymbol => bySubgroup(Subgroup.personSymbol);

  /// Returns a list of emojis under the 'skin tone' subgroup.
  List<Emoji> get skinTone => bySubgroup(Subgroup.skinTone);

  /// Returns a list of emojis under the 'hair style' subgroup.
  List<Emoji> get hairStyle => bySubgroup(Subgroup.hairStyle);

  /// Returns a list of emojis under the 'animal mammal' subgroup.
  List<Emoji> get animalMammal => bySubgroup(Subgroup.animalMammal);

  /// Returns a list of emojis under the 'animal bird' subgroup.
  List<Emoji> get animalBird => bySubgroup(Subgroup.animalBird);

  /// Returns a list of emojis under the 'animal amphibian' subgroup.
  List<Emoji> get animalAmphibian => bySubgroup(Subgroup.animalAmphibian);

  /// Returns a list of emojis under the 'animal reptile' subgroup.
  List<Emoji> get animalReptile => bySubgroup(Subgroup.animalReptile);

  /// Returns a list of emojis under the 'animal marine' subgroup.
  List<Emoji> get animalMarine => bySubgroup(Subgroup.animalMarine);

  /// Returns a list of emojis under the 'animal bug' subgroup.
  List<Emoji> get animalBug => bySubgroup(Subgroup.animalBug);

  /// Returns a list of emojis under the 'plant flower' subgroup.
  List<Emoji> get plantFlower => bySubgroup(Subgroup.plantFlower);

  /// Returns a list of emojis under the 'plant other' subgroup.
  List<Emoji> get plantOther => bySubgroup(Subgroup.plantOther);

  /// Returns a list of emojis under the 'food fruit' subgroup.
  List<Emoji> get foodFruit => bySubgroup(Subgroup.foodFruit);

  /// Returns a list of emojis under the 'food vegetable' subgroup.
  List<Emoji> get foodVegetable => bySubgroup(Subgroup.foodVegetable);

  /// Returns a list of emojis under the 'food prepared' subgroup.
  List<Emoji> get foodPrepared => bySubgroup(Subgroup.foodPrepared);

  /// Returns a list of emojis under the 'food asian' subgroup.
  List<Emoji> get foodAsian => bySubgroup(Subgroup.foodAsian);

  /// Returns a list of emojis under the 'food marine' subgroup.
  List<Emoji> get foodMarine => bySubgroup(Subgroup.foodMarine);

  /// Returns a list of emojis under the 'food sweet' subgroup.
  List<Emoji> get foodSweet => bySubgroup(Subgroup.foodSweet);

  /// Returns a list of emojis under the 'drink' subgroup.
  List<Emoji> get drink => bySubgroup(Subgroup.drink);

  /// Returns a list of emojis under the 'dishware' subgroup.
  List<Emoji> get dishware => bySubgroup(Subgroup.dishware);

  /// Returns a list of emojis under the 'place map' subgroup.
  List<Emoji> get placeMap => bySubgroup(Subgroup.placeMap);

  /// Returns a list of emojis under the 'place geographic' subgroup.
  List<Emoji> get placeGeographic => bySubgroup(Subgroup.placeGeographic);

  /// Returns a list of emojis under the 'place building' subgroup.
  List<Emoji> get placeBuilding => bySubgroup(Subgroup.placeBuilding);

  /// Returns a list of emojis under the 'place religious' subgroup.
  List<Emoji> get placeReligious => bySubgroup(Subgroup.placeReligious);

  /// Returns a list of emojis under the 'place other' subgroup.
  List<Emoji> get placeOther => bySubgroup(Subgroup.placeOther);

  /// Returns a list of emojis under the 'transport ground' subgroup.
  List<Emoji> get transportGround => bySubgroup(Subgroup.transportGround);

  /// Returns a list of emojis under the 'transport water' subgroup.
  List<Emoji> get transportWater => bySubgroup(Subgroup.transportWater);

  /// Returns a list of emojis under the 'transport air' subgroup.
  List<Emoji> get transportAir => bySubgroup(Subgroup.transportAir);

  /// Returns a list of emojis under the 'hotel' subgroup.
  List<Emoji> get hotel => bySubgroup(Subgroup.hotel);

  /// Returns a list of emojis under the 'time' subgroup.
  List<Emoji> get time => bySubgroup(Subgroup.time);

  /// Returns a list of emojis under the 'sky and weather' subgroup.
  List<Emoji> get skyAndWeather => bySubgroup(Subgroup.skyAndWeather);

  /// Returns a list of emojis under the 'event' subgroup.
  List<Emoji> get event => bySubgroup(Subgroup.event);

  /// Returns a list of emojis under the 'award medal' subgroup.
  List<Emoji> get awardMedal => bySubgroup(Subgroup.awardMedal);

  /// Returns a list of emojis under the 'sport' subgroup.
  List<Emoji> get sport => bySubgroup(Subgroup.sport);

  /// Returns a list of emojis under the 'game' subgroup.
  List<Emoji> get game => bySubgroup(Subgroup.game);

  /// Returns a list of emojis under the 'arts and crafts' subgroup.
  List<Emoji> get artsAndCrafts => bySubgroup(Subgroup.artsAndCrafts);

  /// Returns a list of emojis under the 'clothing' subgroup.
  List<Emoji> get clothing => bySubgroup(Subgroup.clothing);

  /// Returns a list of emojis under the 'sound' subgroup.
  List<Emoji> get sound => bySubgroup(Subgroup.sound);

  /// Returns a list of emojis under the 'music' subgroup.
  List<Emoji> get music => bySubgroup(Subgroup.music);

  /// Returns a list of emojis under the 'musical instrument' subgroup.
  List<Emoji> get musicalInstrument => bySubgroup(Subgroup.musicalInstrument);

  /// Returns a list of emojis under the 'phone' subgroup.
  List<Emoji> get phone => bySubgroup(Subgroup.phone);

  /// Returns a list of emojis under the 'computer' subgroup.
  List<Emoji> get computer => bySubgroup(Subgroup.computer);

  /// Returns a list of emojis under the 'light and video' subgroup.
  List<Emoji> get lightAndVideo => bySubgroup(Subgroup.lightAndVideo);

  /// Returns a list of emojis under the 'book paper' subgroup.
  List<Emoji> get bookPaper => bySubgroup(Subgroup.bookPaper);

  /// Returns a list of emojis under the 'money' subgroup.
  List<Emoji> get money => bySubgroup(Subgroup.money);

  /// Returns a list of emojis under the 'mail' subgroup.
  List<Emoji> get mail => bySubgroup(Subgroup.mail);

  /// Returns a list of emojis under the 'writing' subgroup.
  List<Emoji> get writing => bySubgroup(Subgroup.writing);

  /// Returns a list of emojis under the 'office' subgroup.
  List<Emoji> get office => bySubgroup(Subgroup.office);

  /// Returns a list of emojis under the 'lock' subgroup.
  List<Emoji> get lock => bySubgroup(Subgroup.lock);

  /// Returns a list of emojis under the 'tool' subgroup.
  List<Emoji> get tool => bySubgroup(Subgroup.tool);

  /// Returns a list of emojis under the 'science' subgroup.
  List<Emoji> get science => bySubgroup(Subgroup.science);

  /// Returns a list of emojis under the 'medical' subgroup.
  List<Emoji> get medical => bySubgroup(Subgroup.medical);

  /// Returns a list of emojis under the 'household' subgroup.
  List<Emoji> get household => bySubgroup(Subgroup.household);

  /// Returns a list of emojis under the 'other object' subgroup.
  List<Emoji> get otherObject => bySubgroup(Subgroup.otherObject);

  /// Returns a list of emojis under the 'transports sign' subgroup.
  List<Emoji> get transportSign => bySubgroup(Subgroup.transportSign);

  /// Returns a list of emojis under the 'warning' subgroup.
  List<Emoji> get warning => bySubgroup(Subgroup.warning);

  /// Returns a list of emojis under the 'arrow' subgroup.
  List<Emoji> get arrow => bySubgroup(Subgroup.arrow);

  /// Returns a list of emojis under the 'religion' subgroup.
  List<Emoji> get religion => bySubgroup(Subgroup.religion);

  /// Returns a list of emojis under the 'zodiac' subgroup.
  List<Emoji> get zodiac => bySubgroup(Subgroup.zodiac);

  /// Returns a list of emojis under the 'av symbol' subgroup.
  List<Emoji> get avSymbol => bySubgroup(Subgroup.avSymbol);

  /// Returns a list of emojis under the 'gender' subgroup.
  List<Emoji> get gender => bySubgroup(Subgroup.gender);

  /// Returns a list of emojis under the 'math' subgroup.
  List<Emoji> get math => bySubgroup(Subgroup.math);

  /// Returns a list of emojis under the 'punctuation' subgroup.
  List<Emoji> get punctuation => bySubgroup(Subgroup.punctuation);

  /// Returns a list of emojis under the 'currency' subgroup.
  List<Emoji> get currency => bySubgroup(Subgroup.currency);

  /// Returns a list of emojis under the 'other symbol' subgroup.
  List<Emoji> get otherSymbol => bySubgroup(Subgroup.otherSymbol);

  /// Returns a list of emojis under the 'keycap' subgroup.
  List<Emoji> get keycap => bySubgroup(Subgroup.keycap);

  /// Returns a list of emojis under the 'alphanum' subgroup.
  List<Emoji> get alphanum => bySubgroup(Subgroup.alphanum);

  /// Returns a list of emojis under the 'geometric' subgroup.
  List<Emoji> get geometric => bySubgroup(Subgroup.geometric);

  /// Returns a list of emojis under the 'flag' subgroup.
  List<Emoji> get flag => bySubgroup(Subgroup.flag);

  /// Returns a list of emojis under the 'country flag' subgroup.
  List<Emoji> get countryFlag => bySubgroup(Subgroup.countryFlag);

  /// Returns a list of emojis under the 'subdivision flag' subgroup.
  List<Emoji> get subdivisionFlag => bySubgroup(Subgroup.subdivisionFlag);

  /* ------------------------------ Versions ------------------------------- */

  /// Returns a list of emojis under the Unicode 6.0 version.
  List<Emoji> get v6_0 => byVersion(Version.v6_0);

  /// Returns a list of emojis under the Unicode 7.0 version.
  List<Emoji> get v7_0 => byVersion(Version.v7_0);

  /// Returns a list of emojis under the Unicode 8.0 version.
  List<Emoji> get v8_0 => byVersion(Version.v8_0);

  /// Returns a list of emojis under the Unicode 9.0 version.
  List<Emoji> get v9_0 => byVersion(Version.v9_0);

  /// Returns a list of emojis under the Unicode 10.0 version.
  List<Emoji> get v10_0 => byVersion(Version.v10_0);

  /// Returns a list of emojis under the Unicode 11.0 version.
  List<Emoji> get v11_0 => byVersion(Version.v11_0);

  /// Returns a list of emojis under the Unicode 12.0 version.
  List<Emoji> get v12_0 => byVersion(Version.v12_0);

  /// Returns a list of emojis under the Unicode 12.1 version.
  List<Emoji> get v12_1 => byVersion(Version.v12_1);

  /// Returns a list of emojis under the Unicode 13.0 version.
  List<Emoji> get v13_0 => byVersion(Version.v13_0);

  /// Returns a list of emojis under the Unicode 13.1 version.
  List<Emoji> get v13_1 => byVersion(Version.v13_1);

  /// Returns a list of emojis under the Unicode 14.0 version.
  List<Emoji> get v14_0 => byVersion(Version.v14_0);

  /// Returns a list of emojis under the Unicode 15.0 version.
  List<Emoji> get v15_0 => byVersion(Version.v15_0);

  /// Returns a list of emojis under the Unicode 15.1 version.
  List<Emoji> get v15_1 => byVersion(Version.v15_1);

  /* ------------------------------ Status ------------------------------- */

  /// Returns a list of emojis under the 'fully-qualified' status.
  List<Emoji> get fullyQualified => byStatus(Status.fullyQualified);

  /// Returns a list of emojis under the 'minimally-qualified' status.
  List<Emoji> get minimallyQualified => byStatus(Status.minimallyQualified);

  /// Returns a list of emojis under the 'unqualified' status.
  List<Emoji> get unqualified => byStatus(Status.unqualified);
}
