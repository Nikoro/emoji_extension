import 'package:emoji_extension/emoji_extension.dart';
import 'package:emoji_extension/src/emojis/emoji.dart';

/// An extension that provides convenient methods for filtering and accessing
/// emojis in a given Emojis list.
extension EmojisExtensions on Emojis {
  /* -------------------------------- Groups -------------------------------- */
  List<Emoji> get smileysAndEmotion => byGroup(Group.smileysAndEmotion);

  List<Emoji> get peopleAndBody => byGroup(Group.peopleAndBody);

  List<Emoji> get component => byGroup(Group.component);

  List<Emoji> get animalsAndNature => byGroup(Group.animalsAndNature);

  List<Emoji> get foodAndDrink => byGroup(Group.foodAndDrink);

  List<Emoji> get travelAndPlaces => byGroup(Group.travelAndPlaces);

  List<Emoji> get activities => byGroup(Group.activities);

  List<Emoji> get objects => byGroup(Group.objects);

  List<Emoji> get symbols => byGroup(Group.symbols);

  List<Emoji> get flags => byGroup(Group.flags);

  /* ------------------------------ Subgroups ------------------------------- */
  List<Emoji> get faceSmiling => bySubgroup(Subgroup.faceSmiling);

  List<Emoji> get faceAffection => bySubgroup(Subgroup.faceAffection);

  List<Emoji> get faceTongue => bySubgroup(Subgroup.faceTongue);

  List<Emoji> get faceHand => bySubgroup(Subgroup.faceHand);

  List<Emoji> get faceNeutralSkeptical {
    return bySubgroup(Subgroup.faceNeutralSkeptical);
  }

  List<Emoji> get faceSleepy => bySubgroup(Subgroup.faceSleepy);

  List<Emoji> get faceUnwell => bySubgroup(Subgroup.faceUnwell);

  List<Emoji> get faceHat => bySubgroup(Subgroup.faceHat);

  List<Emoji> get faceGlasses => bySubgroup(Subgroup.faceGlasses);

  List<Emoji> get faceConcerned => bySubgroup(Subgroup.faceConcerned);

  List<Emoji> get faceNegative => bySubgroup(Subgroup.faceNegative);

  List<Emoji> get faceCostume => bySubgroup(Subgroup.faceCostume);

  List<Emoji> get catFace => bySubgroup(Subgroup.catFace);

  List<Emoji> get monkeyFace => bySubgroup(Subgroup.monkeyFace);

  List<Emoji> get heart => bySubgroup(Subgroup.heart);

  List<Emoji> get emotion => bySubgroup(Subgroup.emotion);

  List<Emoji> get handFingersOpen => bySubgroup(Subgroup.handFingersOpen);

  List<Emoji> get handFingersPartial => bySubgroup(Subgroup.handFingersPartial);

  List<Emoji> get handSingleFinger => bySubgroup(Subgroup.handSingleFinger);

  List<Emoji> get handFingersClosed => bySubgroup(Subgroup.handFingersClosed);

  List<Emoji> get hands => bySubgroup(Subgroup.hands);

  List<Emoji> get handProp => bySubgroup(Subgroup.handProp);

  List<Emoji> get bodyParts => bySubgroup(Subgroup.bodyParts);

  List<Emoji> get person => bySubgroup(Subgroup.person);

  List<Emoji> get personGesture => bySubgroup(Subgroup.personGesture);

  List<Emoji> get personRole => bySubgroup(Subgroup.personRole);

  List<Emoji> get personFantasy => bySubgroup(Subgroup.personFantasy);

  List<Emoji> get personActivity => bySubgroup(Subgroup.personActivity);

  List<Emoji> get personSport => bySubgroup(Subgroup.personSport);

  List<Emoji> get personResting => bySubgroup(Subgroup.personResting);

  List<Emoji> get family => bySubgroup(Subgroup.family);

  List<Emoji> get personSymbol => bySubgroup(Subgroup.personSymbol);

  List<Emoji> get skinTone => bySubgroup(Subgroup.skinTone);

  List<Emoji> get hairStyle => bySubgroup(Subgroup.hairStyle);

  List<Emoji> get animalMammal => bySubgroup(Subgroup.animalMammal);

  List<Emoji> get animalBird => bySubgroup(Subgroup.animalBird);

  List<Emoji> get animalAmphibian => bySubgroup(Subgroup.animalAmphibian);

  List<Emoji> get animalReptile => bySubgroup(Subgroup.animalReptile);

  List<Emoji> get animalMarine => bySubgroup(Subgroup.animalMarine);

  List<Emoji> get animalBug => bySubgroup(Subgroup.animalBug);

  List<Emoji> get plantFlower => bySubgroup(Subgroup.plantFlower);

  List<Emoji> get plantOther => bySubgroup(Subgroup.plantOther);

  List<Emoji> get foodFruit => bySubgroup(Subgroup.foodFruit);

  List<Emoji> get foodVegetable => bySubgroup(Subgroup.foodVegetable);

  List<Emoji> get foodPrepared => bySubgroup(Subgroup.foodPrepared);

  List<Emoji> get foodAsian => bySubgroup(Subgroup.foodAsian);

  List<Emoji> get foodMarine => bySubgroup(Subgroup.foodMarine);

  List<Emoji> get foodSweet => bySubgroup(Subgroup.foodSweet);

  List<Emoji> get drink => bySubgroup(Subgroup.drink);

  List<Emoji> get dishware => bySubgroup(Subgroup.dishware);

  List<Emoji> get placeMap => bySubgroup(Subgroup.placeMap);

  List<Emoji> get placeGeographic => bySubgroup(Subgroup.placeGeographic);

  List<Emoji> get placeBuilding => bySubgroup(Subgroup.placeBuilding);

  List<Emoji> get placeReligious => bySubgroup(Subgroup.placeReligious);

  List<Emoji> get placeOther => bySubgroup(Subgroup.placeOther);

  List<Emoji> get transportGround => bySubgroup(Subgroup.transportGround);

  List<Emoji> get transportWater => bySubgroup(Subgroup.transportWater);

  List<Emoji> get transportAir => bySubgroup(Subgroup.transportAir);

  List<Emoji> get hotel => bySubgroup(Subgroup.hotel);

  List<Emoji> get time => bySubgroup(Subgroup.time);

  List<Emoji> get skyAndWeather => bySubgroup(Subgroup.skyAndWeather);

  List<Emoji> get event => bySubgroup(Subgroup.event);

  List<Emoji> get awardMedal => bySubgroup(Subgroup.awardMedal);

  List<Emoji> get sport => bySubgroup(Subgroup.sport);

  List<Emoji> get game => bySubgroup(Subgroup.game);

  List<Emoji> get artsAndCrafts => bySubgroup(Subgroup.artsAndCrafts);

  List<Emoji> get clothing => bySubgroup(Subgroup.clothing);

  List<Emoji> get sound => bySubgroup(Subgroup.sound);

  List<Emoji> get music => bySubgroup(Subgroup.music);

  List<Emoji> get musicalInstrument => bySubgroup(Subgroup.musicalInstrument);

  List<Emoji> get phone => bySubgroup(Subgroup.phone);

  List<Emoji> get computer => bySubgroup(Subgroup.computer);

  List<Emoji> get lightAndVideo => bySubgroup(Subgroup.lightAndVideo);

  List<Emoji> get bookPaper => bySubgroup(Subgroup.bookPaper);

  List<Emoji> get money => bySubgroup(Subgroup.money);

  List<Emoji> get mail => bySubgroup(Subgroup.mail);

  List<Emoji> get writing => bySubgroup(Subgroup.writing);

  List<Emoji> get office => bySubgroup(Subgroup.office);

  List<Emoji> get lock => bySubgroup(Subgroup.lock);

  List<Emoji> get tool => bySubgroup(Subgroup.tool);

  List<Emoji> get science => bySubgroup(Subgroup.science);

  List<Emoji> get medical => bySubgroup(Subgroup.medical);

  List<Emoji> get household => bySubgroup(Subgroup.household);

  List<Emoji> get otherObject => bySubgroup(Subgroup.otherObject);

  List<Emoji> get transportSign => bySubgroup(Subgroup.transportSign);

  List<Emoji> get warning => bySubgroup(Subgroup.warning);

  List<Emoji> get arrow => bySubgroup(Subgroup.arrow);

  List<Emoji> get religion => bySubgroup(Subgroup.religion);

  List<Emoji> get zodiac => bySubgroup(Subgroup.zodiac);

  List<Emoji> get avSymbol => bySubgroup(Subgroup.avSymbol);

  List<Emoji> get gender => bySubgroup(Subgroup.gender);

  List<Emoji> get math => bySubgroup(Subgroup.math);

  List<Emoji> get punctuation => bySubgroup(Subgroup.punctuation);

  List<Emoji> get currency => bySubgroup(Subgroup.currency);

  List<Emoji> get otherSymbol => bySubgroup(Subgroup.otherSymbol);

  List<Emoji> get keycap => bySubgroup(Subgroup.keycap);

  List<Emoji> get alphanum => bySubgroup(Subgroup.alphanum);

  List<Emoji> get geometric => bySubgroup(Subgroup.geometric);

  List<Emoji> get flag => bySubgroup(Subgroup.flag);

  List<Emoji> get countryFlag => bySubgroup(Subgroup.countryFlag);

  List<Emoji> get subdivisionFlag => bySubgroup(Subgroup.subdivisionFlag);
}
