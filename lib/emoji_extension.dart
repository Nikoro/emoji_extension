library emoji_extension;

import 'package:emoji_extension/src/emojis/emoji_parser/emoji_parser.dart';

export 'src/emojis/emoji.dart';
export 'src/emojis/emoji_parser/emoji_parser.dart';
export 'src/emojis/emojis.dart';
export 'src/emojis/group.dart';
export 'src/emojis/shortcode.dart';
export 'src/emojis/status.dart';
export 'src/emojis/subgroup.dart';
export 'src/emojis/version.dart';
export 'src/extensions/extensions.dart';

/// Extension on [String] that adds emoji parsing capabilities.
extension EmojiExtension on String {
  /// Returns an [EmojiParser] instance that can be used to parse
  /// emojis within this string.
  EmojiParser get emojis => EmojiParser(this);
}
