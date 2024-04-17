## 1.1.0

- Updated dependencies
- Added 2 Flutter example apps:
  - [Emoji Overview App Example](https://github.com/Nikoro/emoji_extension/tree/develop/flutter_examples/emoji_overview_app_example)
  - [Emoji Chat App Example](https://github.com/Nikoro/emoji_extension/tree/develop/flutter_examples/emoji_chat_app_example)
- Created video tutorial on [YouTube](https://youtu.be/fLPVkksEpJw)

<p align="center">
  <a href="https://youtu.be/fLPVkksEpJw"><img src="https://raw.githubusercontent.com/nikoro/emoji_extension/develop/images/youtube.webp" width="600"/></a>
</p>

## 1.0.0

**BREAKING CHANGES**:
>
> Changed `Emojis()` class API to static
> 
> Generally `Emojis()` becomes simply `Emojis` (without brackets at the end):
```dart
/*Old*/ Emojis()                   /*New*/ Emojis

/*Old*/ Emojis().smileysAndEmotion /*New*/ Emojis.smileysAndEmotion

/*Old*/ Emojis().groups            /*New*/ Emojis.groups

/*Old*/ Emojis().getOne()          /*New*/ Emojis.getOne()

// etc...
```
> Changed `Emojis().get` to `Emojis.all`:
```dart
/*Old*/ Emojis().get        /*New*/ Emojis.all

/*Old*/ Emojis().get.values /*New*/ Emojis.all.values

/*Old*/ Emojis().get.names  /*New*/ Emojis.all.names

// etc...
```
> 
> Removed `any` getter -> use `contains` instead
>
> Removed `replaceEach` method -> use `replaceWith` instead
>
> Removed `hasAny` method -> use `anyOf` instead
>
> Removed `hasEach` method -> use `containsOf` instead
>
> Removed `everyOf` method -> use `containsOf` instead

- Introduced new `Emoji()` constructor that takes single emoji as parameter
```dart
Emoji('🦊')
           .name // Fox
           .appleName // Fox Face
           .unicode // 1F98A
           .shortcode // :fox:
           .discordShortcode // :fox:
           .discordShortcodes // [:fox:, :fox_face:]
                             .first // :fox:
                             .second // :fox_face:
           .version // Version.v9_0
                   .value // 9.0
           .isAnimal // true
           .isFlag // false
           .isFlower // false
           .isFruit // false
           .isGeometric // false
           .isMan // false
           .isWoman // false
           .isVegetable // false
           .isPerson // false
           .isMultiPerson // false
           .isSymbol // false
           .isV9_0 // true
           .hasBeard // false
           .hasFace // true
           .hasHairStyle // false
           .hasSkinTone // false
           .hasColor // false
           .color // null
           .skinTone // null
           .hairStyle // null
```

- Added new methods and getters:

**first**
```dart
'🔴te👍🏻xt👍🏼te👍🏽xt👍🏾te👍🏿xt'.emojis.first // Emoji(value: 🔴, ...)
```
**firstOrNull**
```dart
'🔴te👍🏻xt👍🏼te👍🏽xt👍🏾te👍🏿xt'.emojis.firstOrNull // Emoji(value: 🔴, ...)
'text'.emojis.firstOrNull; // null
```
**second**
```dart
'👍️te🔴xt👍🏼te👍🏽xt👍🏾te👍🏿xt'.emojis.second // Emoji(value: 🔴, ...)
```
**secondOrNull**
```dart
'👍️te🔴xt👍🏼te👍🏽xt👍🏾te👍🏿xt'.emojis.secondOrNull // Emoji(value: 🔴, ...)
'text'.emojis.secondOrNull; // null
```
**third**
```dart
'👍️te🔴xt👍🏼te👍🏽xt👍🏾te👍🏿xt'.emojis.third // Emoji(value: 🔴, ...)
```
**thirdOrNull**
```dart
'👍️te🔴xt👍🏼te👍🏽xt👍🏾te👍🏿xt'.emojis.thirdOrNull // Emoji(value: 🔴, ...)
'text'.emojis.thirdOrNull; // null
```
**fourth**
```dart
'👍️te👍🏻xt👍🏼te🔴xt👍🏾te👍🏿xt'.emojis.fourth // Emoji(value: 🔴, ...)
```
**fourthOrNull**
```dart
'👍️te👍🏻xt👍🏼te🔴xt👍🏾te👍🏿xt'.emojis.fourthOrNull // Emoji(value: 🔴, ...)
'text'.emojis.fourthOrNull; // null
```
**fifth**
```dart
'👍️te👍🏻xt👍🏼te👍🏽xt🔴te👍🏿xt'.emojis.fifth // Emoji(value: 🔴, ...)
```
**fifthOrNull**
```dart
'👍️te👍🏻xt👍🏼te👍🏽xt🔴te👍🏿xt'.emojis.fifthOrNull // Emoji(value: 🔴, ...)
'text'.emojis.fifthOrNull; // null
```
**sixth**
```dart
'👍️te👍🏻xt👍🏼te👍🏽xt👍🏾te🔴xt'.emojis.sixth // Emoji(value: 🔴, ...)
```
**sixthOrNull**
```dart
'👍️te👍🏻xt👍🏼te👍🏽xt👍🏾te🔴xt'.emojis.sixthOrNull // Emoji(value: 🔴, ...)
'text'.emojis.sixthOrNull; // null
```
**penultimate**
```dart
'👍️te👍🏻xt👍🏼te👍🏽xt🔴te👍🏿xt'.emojis.penultimate // Emoji(value: 🔴, ...)
```
**penultimateOrNull**
```dart
'👍️te👍🏻xt👍🏼te👍🏽xt🔴te👍🏿xt'.emojis.penultimateOrNull // Emoji(value: 🔴, ...)
'text'.emojis.penultimateOrNull; // null
```
**last**
```dart
'👍️te👍🏻xt👍🏼te👍🏽xt👍🏾te🔴xt'.emojis.last // Emoji(value: 🔴, ...)
```
**lastOrNull**
```dart
'👍️te👍🏻xt👍🏼te👍🏽xt👍🏾te🔴xt'.emojis.lastOrNull // Emoji(value: 🔴, ...)
'text'.emojis.lastOrNull; // null
```
**removeFirst**
```dart
'🔴te👍🏻xt👍🏼te👍🏽xt👍🏾te👍🏿xt'.emojis.removeFirst; // te👍🏻xt👍🏼te👍🏽xt👍🏾te👍🏿xt
```
**removeSecond**
```dart
'👍️te🔴xt👍🏼te👍🏽xt👍🏾te👍🏿xt'.emojis.removeSecond; // 👍️text👍🏼te👍🏽xt👍🏾te👍🏿xt
```
**removeThird**
```dart
'👍️te👍🏻xt🔴te👍🏽xt👍🏾te👍🏿xt'.emojis.removeThird; // 👍️te👍🏻xtte👍🏽xt👍🏾te👍🏿xt
```
**removeFourth**
```dart
'👍️te👍🏻xt👍🏼te🔴xt👍🏾te👍🏿xt'.emojis.removeFourth; // 👍️te👍🏻xt👍🏼text👍🏾te👍🏿xt
```
**removeFifth**
```dart
'👍️te👍🏻xt👍🏼te👍🏽xt🔴te👍🏿xt'.emojis.removeFifth; // 👍️te👍🏻xt👍🏼te👍🏽xtte👍🏿xt
```
**removeSixth**
```dart
'👍️te👍🏻xt👍🏼te👍🏽xt👍🏾te🔴xt'.emojis.removeSixth; // 👍️te👍🏻xt👍🏼te👍🏽xt👍🏾text
```
**removePenultimate**
```dart
'👍️te👍🏻xt👍🏼te👍🏽xt🔴te👍🏿xt'.emojis.removePenultimate; // 👍️te👍🏻xt👍🏼te👍🏽xtte👍🏿xt
```
**removeLast**
```dart
'👍️te👍🏻xt👍🏼te👍🏽xt👍🏾te🔴xt'.emojis.removeLast; // 👍️te👍🏻xt👍🏼te👍🏽xt👍🏾text
```
**any()**
```dart
'😀text🤦🏾‍♀️'.emojis.any((e) => e.value == '😀'); // true
'😀text🤦🏾‍♀️'.emojis.any((e) => e.value == '👍🏻'); // false
```
**containsOf()**
```dart
'😀text🤦🏾‍♀️'.emojis.containsOf(['😀']); // true
'😀text🤦🏾‍♀️'.emojis.containsOf(['😀', '🤦🏾‍♀️']); // true
'😀text🤦🏾‍♀️'.emojis.containsOf(['😀', '👍🏻']); // false
'😀text🤦🏾‍♀️'.emojis.containsOf(['👍🏻']); // false
```
**containsExactlyOf()**
```dart
'😀text🤦🏾‍♀️'.emojis.containsExactlyOf(['😀']); // false
'😀text🤦🏾‍♀️'.emojis.containsExactlyOf(['😀', '🤦🏾‍♀️']); // true
'😀text🤦🏾‍♀️text😀'.emojis.containsExactlyOf(['😀', '🤦🏾‍♀️']); // true
'😀text🤦🏾‍♀️'.emojis.containsExactlyOf(['👍🏻']); // false
```
**containsOne()**
```dart
'😀text🤦🏾‍♀️text😀'.emojis.containsOne((e) => e.value == '🤦🏾‍♀️'); // true
'😀text🤦🏾‍♀️text😀'.emojis.containsOne((e) => e.value == '👍🏻'); // false
'😀text🤦🏾‍♀️text😀'.emojis.containsOne((e) => e.value == '😀'); // false
```
**containsOneOf()**
```dart
'😀text🤦🏾‍♀️'.emojis.containsOneOf({'🤦🏾‍♀️'}); // true
'😀text🤦🏾‍♀️'.emojis.containsOneOf({'😀', '🤦🏾‍♀️'}); // true
'😀text🤦🏾‍♀️'.emojis.containsOneOf('😀', '🤦🏾‍♀️', '👍🏻'}); // false
'😀text🤦🏾‍♀️text😀'.emojis.containsOneOf({'😀'}); // false
```
**containsExactlyOne()**
```dart
'😀text'.emojis.containsExactlyOne((e) => e.value == '😀'); // true
'😀text🤦🏾‍♀️'.emojis.containsExactlyOne((e) => e.value == '😀'); // false
'text'.emojis.containsExactlyOne((e) => e.value == '😀'); // false
```
**containsExactlyOneOf()**
```dart
'😀text🤦🏾‍♀️'.emojis.containsExactlyOneOf({'😀', '🤦🏾‍♀️'}); // true
'😀text🤦🏾‍♀️text😀'.emojis.containsExactlyOneOf({'😀', '🤦🏾‍♀️'}); // false
'😀text🤦🏾‍♀️'.emojis.containsExactlyOneOf({'😀'}); // false
'😀text🤦🏾‍♀️'.emojis.containsExactlyOneOf({'😀', '👍🏻'}); // false
```
**countWhere()**
```dart
'😀text🤦🏾‍♀️text😀'.emojis.countWhere((e) => e.value == '😀'); // 2
```
**countWhereIndexed()**
```dart
'😀text🤦🏾‍♀️text😀'.emojis.countWhereIndexed((i, e) => i == 0 && e.value == '😀'); // 1
```
**every()**
```dart
'😀text😀'.emojis.every((e) => e.value == '😀'); // true
'😀text🤦🏾‍♀️'.emojis.every((e) => e.value == '😀'); // false
'😀text🤦🏾‍♀️'.emojis.every((e) => e.value == '👍🏻'); // false
```
**firstWhere()**
```dart
'🤦🏾‍♀️text😀text🤦🏻‍♀️'.emojis.firstWhere((e) => e.name.contains('Woman')); // Emoji(value: 🤦🏾‍♀️, ...)
```
**firstWhereIndexed()**
```dart
'🤦🏾‍♀️text😀text🤦🏻‍♀️'.emojis.firstWhereIndexed((i, e) => i > 0 && e.name.contains('Woman')); // Emoji(value: 🤦🏻‍♀️, ...)
```
**firstWhereOrNull()**
```dart
'🤦🏾‍♀️text😀text🤦🏻‍♀️'.emojis.firstWhereOrNull((e) => e.name.contains('Woman')); // Emoji(value: 🤦🏾‍♀️, ...)

'🤦🏾‍♀️text😀text🤦🏻‍♀️'.emojis.firstWhereOrNull((e) => e.value == '👍🏻'); // null
```
**firstWhereIndexedOrNull()**
```dart
'🤦🏾‍♀️text😀text🤦🏻‍♀️'.emojis.firstWhereIndexedOrNull((i, e) => i == 0 && e.name.contains('Woman')); // Emoji(value: 🤦🏾‍♀️, ...)

'🤦🏾‍♀️text😀text🤦🏻‍♀️'.emojis.firstWhereIndexedOrNull((i, e) => i == 0 && e.value == '😀'); // null
```
**fold()**
```dart
'😀text🤦🏾‍♀️'.emojis.fold('start', (p, c) => p + c.value); // start😀🤦🏾‍♀️
```
**foldIndexed()**
```dart
'😀text🤦🏾‍♀️'.emojis.foldIndexed('start', (i, p ,c) => '$p${c.value}$i'); // start😀0🤦🏾‍♀️1
```
**forEach()**
```dart
'😀text🤦🏾‍♀️'.emojis.forEach((e) => print(e.value)); // 😀 🤦🏾‍♀️
```
**forEachIndexed()**
```dart
'😀text🤦🏾‍♀️'.emojis.forEachIndexed(i,e) => print('$i:${e.value}')); // 0:😀 1:🤦🏾‍♀️
```
**forEachWhile()**
```dart
'😀text🤦🏾‍♀️text😀'.emojis.forEachWhile((e) {
                                          print(e.value);
                                          return e.value == '😀';
                                          }); // 😀 🤦🏾‍♀️
```
**forEachIndexedWhile()**
```dart
'😀text🤦🏾‍♀️text😀'.emojis.forEachIndexedWhile((i, e) {
                                                    print('$i:${e.value}');
                                                    return e.value == '😀';
                                                    }); // 0:😀 1:🤦🏾‍♀️
```
**join()**
```dart
'😀text🤦🏾‍♀️'.emojis.join((e) => e.value, 
                              separator: '.', 
                              prefix: 'prefix', 
                              suffix: 'suffix'); // 'prefix😀.🤦🏾‍♀️suffix'
```
**map()**
```dart
'😀text🤦🏾‍♀️'.emojis.map((e) => 'Emoji: ${e.name}'); // [Emoji: Grinning Face, Emoji: Woman Facepalming: Medium-Dark Skin Tone]
```
**mapIndexed()**
```dart
'😀text🤦🏾‍♀️'.emojis.mapIndexed((i, e) => '$i: ${e.name}'); // [0: Grinning Face, 1: Woman Facepalming: Medium-Dark Skin Tone]
```
**none()**
```dart
'😀text🤦🏾‍♀️'.emojis.none((e) => e.value == '👍🏻'); // true
'😀text🤦🏾‍♀️'.emojis.none((e) => e.value == '😀'); // false
```
**noneOf()**
```dart
'😀text🤦🏾‍♀️'.emojis.noneOf(['👍🏻']); // true
'😀text🤦🏾‍♀️'.emojis.noneOf(['👍🏻', '🤦🏾‍♀️']); // false
'😀text🤦🏾‍♀️'.emojis.noneOf(['😀', '🤦🏾‍♀️']); // false
```
**removeAt()**
```dart
'😀text🤦🏾‍♀️'.emojis.removeAt(0); // text🤦🏾‍♀️
'😀text🤦🏾‍♀️'.emojis.removeAt(10); // 😀text🤦🏾‍♀️
```
**removeFromEnd()**
```dart
'😀text🤦🏾‍♀️'.emojis.removeFromEnd(0); // 😀text
'😀text🤦🏾‍♀️'.emojis.removeFromEnd(10); // 😀text🤦🏾‍♀️
```
**removeEveryOf()**
```dart
'😀text🤦🏾‍♀️text👍🏻text😀'.emojis.removeEveryOf(['😀', '👍🏻']); // text🤦🏾‍♀️texttext
```
**removeWhereIndexed()**
```dart
'😀text🤦🏾‍♀️text😀'.emojis.removeWhereIndexed((i, e) => i == 0 && e.value == '😀'); // text🤦🏾‍♀️text😀
```
**replaceWhereIndexed()**
```dart
'😀text🤦🏾‍♀️text😀'.emojis.replaceWhereIndexed((i, e) => i == 1 ? '_123_' : null); // 😀text_123_text😀
```
**skip()**
```dart
'😀text🤦🏾‍♀️text👍🏻'.emojis.skip(1); // [Emoji(value: 🤦🏾‍♀️, ...), Emoji(value: 👍🏻, ...)]
```
**skipLast()**
```dart
'😀text🤦🏾‍♀️text👍🏻'.emojis.skipLast(1); // [Emoji(value: 😀, ...), Emoji(value: 🤦🏾‍♀️, ...)]
```
**skipWhile()**
```dart
'😀text🤦🏾‍♀️text👍🏻'.emojis.skipWhile((e) => e.value == '😀'); // [Emoji(value: 🤦🏾‍♀️, ...), Emoji(value: 👍🏻, ...)]
```
**some()**
```dart
'😀text🤦🏾‍♀️'.emojis.some((e) => e.value == '😀'); // true
'😀text🤦🏾‍♀️'.emojis.some((e) => e.value == '👍🏻'); // false
```
**someOf()**
```dart
'😀text🤦🏾‍♀️'.emojis.someOf(['😀']); // true
'😀text🤦🏾‍♀️'.emojis.someOf(['😀', '👍🏻']); // true
'😀text🤦🏾‍♀️'.emojis.someOf(['👍🏻']); // false
```
**splitWhere()**
```dart
'😀text🤦🏾‍♀️text😀'.emojis.splitWhere((e) => e.value == '🤦🏾‍♀️'); // [😀text, text😀]
```
**splitWhereIndexed()**
```dart
'😀text🤦🏾‍♀️text😀'.emojis.splitWhereIndexed((i, e) => i == 1 && e.value == '🤦🏾‍♀️'); // [😀text, text😀]
```
**lastWhere()**
```dart
'🤦🏾‍♀️text😀text🤦🏻‍♀️'.emojis.lastWhere((e) => e.name.contains('Woman')); // Emoji(value: 🤦🏻‍♀️, ...)
```
**lastWhereIndexed()**
```dart
'🤦🏾‍♀️text😀text🤦🏻‍♀️'.emojis.lastWhereIndexed((i, e) => i == 0 && e.name.contains('Woman')); // Emoji(value: 🤦🏾‍♀️, ...)
```
**lastWhereOrNull()**
```dart
'🤦🏾‍♀️text😀text🤦🏻‍♀️'.emojis.lastWhereOrNull((e) => e.name.contains('Woman')); // Emoji(value: 🤦🏻‍♀️, ...)

'🤦🏾‍♀️text😀text🤦🏻‍♀️'.emojis.lastWhereOrNull((e) => e.value == '👍🏻'); // null
```
**lastWhereIndexedOrNull()**
```dart
'🤦🏾‍♀️text😀text🤦🏻‍♀️'.emojis.lastWhereIndexedOrNull((i, e) => i == 0 && e.name.contains('Woman')); // Emoji(value: 🤦🏾‍♀️, ...)

'🤦🏾‍♀️text😀text🤦🏻‍♀️'.emojis.lastWhereIndexedOrNull((i, e) => i == 0 && e.value == '😀'); // null
```
**take()**
```dart
'😀text🤦🏾‍♀️text👍🏻'.emojis.take(2); // [Emoji(value: 😀, ...), Emoji(value: 🤦🏾‍♀️, ...)]
```
**takeLast()**
```dart
'😀text🤦🏾‍♀️text👍🏻'.emojis.takeLast(2); // [Emoji(value: 🤦🏾‍♀️, ...), Emoji(value: 👍🏻, ...)]
```
**takeWhile()**
```dart
'😀text🤦🏾‍♀️text👍🏻'.emojis.takeWhile((e) => e.value == '😀'); // [Emoji(value: 😀, ...)]
```
**where()**
```dart
'🤦🏾‍♀️text😀text🤦🏻‍♀️'.emojis.where((e) => e.name.contains('Woman')); // [Emoji(value: 🤦🏾‍♀️, ...), Emoji(value: 🤦🏻‍♀️, ...)]
```
**whereIndexed()**
```dart
'🤦🏾‍♀️text😀text🤦🏻‍♀️'.emojis.whereIndexed((i, e) => i == 0 && e.name.contains('Woman')); // [Emoji(value: 🤦🏾‍♀️, ...)]
```
**whereNot()**
```dart
'🤦🏾‍♀️text😀text🤦🏻‍♀️'.emojis.whereNot((e) => e.name.contains('Woman')); // [Emoji(value: 😀, ...)]
```
**whereNotIndexed()**
```dart
'🤦🏾‍♀️text😀text🤦🏻‍♀️'.emojis.whereNotIndexed((i, e) => i == 0 && e.name.contains('Woman')); // [Emoji(value: 😀, ...), Emoji(value: 🤦🏻‍♀️, ...)]
```

## 0.3.0

- Updated emoji dataset to newest [Unicode 15.1](https://www.unicode.org/reports/tr51/)
- Extended data about emoji including:
  - apple name      
  - also known as   
  - version         
  - status          

Example:
```
Emoji(
  value: 😆,
  unicode: 1F606,
  name: Grinning Squinting Face,
  appleName: Grinning Face with Squinting Eyes,
  alsoKnownAs: [><, Closed-Eyes Smile, Big Grin, Laughing, XD],
  group: Smileys & Emotion,
  subgroup: face-smiling,
  version: 6.0,
  status: fully-qualified,
  shortcodes: [
    Shortcode(
    platform: Default,
    values: [grinning_squinting_face]
  ), 
    Shortcode(
    platform: CLDR,
    values: [grinning_squinting_face]
  ), 
    Shortcode(
    platform: Discord,
    values: [laughing, satisfied]
  ), 
    Shortcode(
    platform: Github,
    values: [laughing, satisfied]
  ), 
    Shortcode(
    platform: Slack,
    values: [laughing, satisfied]
  )]
)
```
- Added `replaceWhere` method:
```dart
'😀_text_👍🏻'.emojis.replaceWhere((e) => e.value == '👍🏻' ? 'OK' : null); // 😀_text_OK

'😀_text_👍🏻'.emojis.replaceWhere((e) => {'😀':'ABC', '👍🏻':'123'}[e.value]); // ABC_text_123
```
> **Warning**
>
> Deprecated `any` getter -> use `contains` instead
>
> Deprecated `replaceEach` method -> use `replaceWith` instead
>
> Deprecated `hasAny` method -> use `anyOf` instead
>
> Deprecated `hasEach` method -> use `everyOf` instead

## 0.2.0

- Added optional fallback function `onUnknownShortcode` when parsing String with unknown shortcode:
```dart
const text = ':man: :this-shortcode-does-not-exist: :woman:';
final result = text.fromShortcodes(onUnknownShortcode: (_) => '🤷');
print(result); // '👨 🤷 👩'
```
- Added support for parsing chained emojis:
```dart
const text = ':otter::woman-facepalming::skin-tone-5::santa::dancer::skin-tone-4::female-astronaut::skin-tone-5:';
final result = text.fromShortcodes();
print(result); // '🦦🤦🏾‍♀️🎅💃🏽👩🏾‍🚀'
```
- Improved [README](https://github.com/Nikoro/emoji_extension/blob/main/README.md)

## 0.1.3

- Updated description
- Updated [README](https://github.com/Nikoro/emoji_extension/blob/main/README.md)

## 0.1.2

- Updated dependencies
- Updated the SDK constraint to '>=2.18.6 <4.0.0'

## 0.1.1

- Formatted code
- Updated  description
- Updated lint rules
- Improved documentation
- Improved [README](https://github.com/Nikoro/emoji_extension/blob/main/README.md)

## 0.1.0

Initial release 🎉