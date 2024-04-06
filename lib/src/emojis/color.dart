import 'package:emoji_extension/emoji_extension.dart';

/// Enum representing the color of an emoji.
enum Color {
  red('red'),
  pink('pink'),
  orange('orange'),
  yellow('yellow'),
  green('green'),
  blue('blue'),
  lightBlue('light blue'),
  purple('purple'),
  brown('brown'),
  black('black'),
  grey('grey'),
  white('white');

  const Color(this.value);

  final String value;
}

extension ColorListExtensions on List<Color> {
  List<String> get values => map((c) => c.value).toUnmodifiableList();
}
