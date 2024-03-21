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