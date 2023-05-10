/// A collection of subgroup that categorize emojis in Unicode.
///
/// Each subgroup represents a high-level category of emojis, such as "face-smiling",
/// "face-affection", "face-tongue", etc.
enum Subgroup {
  /// Subgroup of emojis featuring smiling faces.
  faceSmiling('face-smiling'),

  /// Subgroup of emojis featuring faces showing affection.
  faceAffection('face-affection'),

  /// Subgroup of emojis featuring faces sticking out their tongue.
  faceTongue('face-tongue'),

  /// Subgroup of emojis featuring hands making various gestures.
  faceHand('face-hand'),

  /// Subgroup of emojis featuring skeptical and neutral faces.
  faceNeutralSkeptical('face-neutral-skeptical'),

  /// Subgroup of emojis featuring sleepy and tired faces.
  faceSleepy('face-sleepy'),

  /// Subgroup of emojis featuring unwell and sick faces.
  faceUnwell('face-unwell'),

  /// Subgroup of emojis featuring faces wearing hats.
  faceHat('face-hat'),

  /// Subgroup of emojis featuring faces wearing glasses.
  faceGlasses('face-glasses'),

  /// Subgroup of emojis featuring concerned faces.
  faceConcerned('face-concerned'),

  /// Subgroup of emojis featuring negative faces.
  faceNegative('face-negative'),

  /// Subgroup of emojis featuring faces wearing costumes.
  faceCostume('face-costume'),

  /// Subgroup of emojis featuring cat faces.
  catFace('cat-face'),

  /// Subgroup of emojis featuring monkey faces.
  monkeyFace('monkey-face'),

  /// Subgroup of emojis featuring hearts and other love-related symbols.
  heart('heart'),

  /// Subgroup of emojis featuring various emotional states.
  emotion('emotion'),

  /// Subgroup of emojis featuring open hands.
  handFingersOpen('hand-fingers-open'),

  /// Subgroup of emojis featuring partially open hands.
  handFingersPartial('hand-fingers-partial'),

  /// Subgroup of emojis featuring single finger pointing.
  handSingleFinger('hand-single-finger'),

  /// Subgroup of emojis featuring closed hands.
  handFingersClosed('hand-fingers-closed'),

  /// Subgroup of emojis featuring multiple hands.
  hands('hands'),

  /// Subgroup of emojis featuring hands holding props.
  handProp('hand-prop'),

  /// Subgroup of emojis featuring body parts.
  bodyParts('body-parts'),

  /// Subgroup of emojis featuring people.
  person('person'),

  /// Subgroup of emojis featuring people performing gestures.
  personGesture('person-gesture'),

  /// Subgroup of emojis featuring people in various roles (e.g. doctor, teacher, artist).
  personRole('person-role'),

  /// Subgroup of emojis featuring fantastical or imaginary creatures.
  personFantasy('person-fantasy'),

  /// Subgroup of emojis featuring people engaged in various activities (e.g. playing music, swimming).
  personActivity('person-activity'),

  /// Subgroup of emojis featuring people engaged in various sports.
  personSport('person-sport'),

  /// Subgroup of emojis featuring people resting or engaging in leisurely activities.
  personResting('person-resting'),

  /// Subgroup of emojis featuring families of various compositions and sizes.
  family('family'),

  /// Subgroup of emojis featuring symbols representing people or human characteristics.
  personSymbol('person-symbol'),

  /// Subgroup of emojis featuring skin tone variations for emojis featuring people.
  skinTone('skin-tone'),

  /// Subgroup of emojis featuring various hairstyles.
  hairStyle('hair-style'),

  /// Subgroup of emojis featuring various mammalian animals.
  animalMammal('animal-mammal'),

  /// Subgroup of emojis featuring various bird species.
  animalBird('animal-bird'),

  /// Subgroup of emojis featuring various amphibian species.
  animalAmphibian('animal-amphibian'),

  /// Subgroup of emojis featuring various reptile species.
  animalReptile('animal-reptile'),

  /// Subgroup of emojis featuring various marine animals.
  animalMarine('animal-marine'),

  /// Subgroup of emojis featuring various insect and arachnid species.
  animalBug('animal-bug'),

  /// Subgroup of emojis featuring various types of flowers.
  plantFlower('plant-flower'),

  /// Subgroup of emojis featuring various types of plants other than flowers.
  plantOther('plant-other'),

  /// Subgroup of emojis featuring various types of fruits.
  foodFruit('food-fruit'),

  /// Subgroup of emojis featuring various types of vegetables.
  foodVegetable('food-vegetable'),

  /// Subgroup of emojis featuring various types of prepared foods.
  foodPrepared('food-prepared'),

  /// Subgroup of emojis featuring various types of Asian foods.
  foodAsian('food-asian'),

  /// Subgroup of emojis featuring various types of seafood.
  foodMarine('food-marine'),

  /// Subgroup of emojis featuring various types of sweet foods.
  foodSweet('food-sweet'),

  /// Subgroup of emojis featuring various types of drinks.
  drink('drink'),

  /// Subgroup of emojis featuring various types of dishware.
  dishware('dishware'),

  /// Subgroup of emojis featuring maps and other geographic landmarks.
  placeMap('place-map'),

  /// Subgroup of emojis featuring various geographic landmarks other than maps.
  placeGeographic('place-geographic'),

  /// Subgroup of emojis featuring various types of buildings.
  placeBuilding('place-building'),

  /// Subgroup of emojis featuring various religious symbols and places of worship.
  placeReligious('place-religious'),

  /// Subgroup of emojis featuring various other types of landmarks.
  placeOther('place-other'),

  /// Subgroup of emojis featuring various types of ground transportation.
  transportGround('transport-ground'),

  /// Subgroup of emojis featuring various types of water transportation.
  transportWater('transport-water'),

  /// Subgroup of emojis featuring various types of air transportation.
  transportAir('transport-air'),

  /// Subgroup of emojis featuring various types of hotels and lodging.
  hotel('hotel'),

  /// Subgroup of emojis featuring various time-related symbols.
  time('time'),

  /// Subgroup of emojis featuring various types of weather and atmospheric phenomena.
  skyAndWeather('sky & weather'),

  /// Subgroup of emojis featuring symbols related to various events and celebrations.
  event('event'),

  /// Subgroup of emojis featuring various types of awards and medals.
  awardMedal('award-medal'),

  /// Subgroup of emojis related to sports.
  sport('sport'),

  /// Subgroup of emojis related to games.
  game('game'),

  /// Subgroup of emojis related to arts and crafts.
  artsAndCrafts('arts & crafts'),

  /// Subgroup of emojis related to clothing.
  clothing('clothing'),

  /// Subgroup of emojis related to sound.
  sound('sound'),

  /// Subgroup of emojis related to music.
  music('music'),

  /// Subgroup of emojis related to musical instruments.
  musicalInstrument('musical-instrument'),

  /// Subgroup of emojis related to phones.
  phone('phone'),

  /// Subgroup of emojis related to computers.
  computer('computer'),

  /// Subgroup of emojis related to lights and video.
  lightAndVideo('light & video'),

  /// Subgroup of emojis related to books and papers.
  bookPaper('book-paper'),

  /// Subgroup of emojis related to money.
  money('money'),

  /// Subgroup of emojis related to mail.
  mail('mail'),

  /// Subgroup of emojis related to writing.
  writing('writing'),

  /// Subgroup of emojis related to office supplies.
  office('office'),

  /// Subgroup of emojis related to locks.
  lock('lock'),

  /// Subgroup of emojis related to tools.
  tool('tool'),

  /// Subgroup of emojis related to science.
  science('science'),

  /// Subgroup of emojis related to medical items.
  medical('medical'),

  /// Subgroup of emojis related to household items.
  household('household'),

  /// Subgroup of emojis related to other objects.
  otherObject('other-object'),

  /// Subgroup of emojis related to transport signs.
  transportSign('transport-sign'),

  /// Subgroup of emojis related to warning signs.
  warning('warning'),

  /// Subgroup of emojis related to arrows.
  arrow('arrow'),

  /// Subgroup of emojis related to religion.
  religion('religion'),

  /// Subgroup of emojis related to zodiac signs.
  zodiac('zodiac'),

  /// Subgroup of emojis related to audiovisual symbols.
  avSymbol('av-symbol'),

  /// Subgroup of emojis related to gender.
  gender('gender'),

  /// Subgroup of emojis related to math symbols.
  math('math'),

  /// Subgroup of emojis related to punctuation.
  punctuation('punctuation'),

  /// Subgroup of emojis related to currency.
  currency('currency'),

  /// Subgroup of emojis related to other symbols.
  otherSymbol('other-symbol'),

  /// Subgroup of emojis related to keycaps.
  keycap('keycap'),

  /// Subgroup of emojis related to alphanumeric characters.
  alphanum('alphanum'),

  /// Subgroup of emojis related to geometric shapes.
  geometric('geometric'),

  /// Subgroup of emojis related to flags.
  flag('flag'),

  /// Subgroup of emojis related to country flags.
  countryFlag('country-flag'),

  /// Subgroup of emojis related to subdivision flags.
  subdivisionFlag('subdivision-flag');

  /// Creates a new Subgroup object with the given String value.
  const Subgroup(this.value);

  /// Returns the Subgroup enum value that matches the given [value].
  ///
  /// If no match is found, this method throws a [StateError].
  factory Subgroup.from(String value) {
    return values.firstWhere((v) => v.value == value);
  }

  /// The String value of the subgroup.
  final String value;
}
