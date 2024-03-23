library emoji_extension;

import 'package:emoji_extension/src/emojis/emoji_parser.dart';

export 'src/emojis/emojis.dart';
export 'src/emojis/group.dart';
export 'src/emojis/subgroup.dart';
export 'src/extensions/emoji_list_extensions.dart';
export 'src/extensions/emojis_extensions.dart';
export 'src/extensions/group_list_extensions.dart';
export 'src/extensions/shortcode_list_extensions.dart';
export 'src/extensions/subgroup_list_extensions.dart';
export 'src/extensions/version_list_extensions.dart';

/// Extension on [String] that adds emoji parsing capabilities.
extension EmojiExtension on String {
  /// Returns an [EmojiParser] instance that can be used to parse
  /// emojis within this string.
  EmojiParser get emojis => EmojiParser(this);
}
