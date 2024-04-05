import 'package:emoji_extension/emoji_extension.dart';

Emoji emoji(String value) {
  assert(
    EmojiParser(value).onlyOne,
    "Provided value must be a single emoji"
    "Example: emoji('😀') ✅"
    "Example: emoji('😀😀') ❌"
    "Example: emoji('not an emoji') ❌",
  );
  return Emojis.getOne(value.trim());
}
