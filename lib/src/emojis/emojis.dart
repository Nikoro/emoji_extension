import 'package:collection/collection.dart';
import 'package:emoji_extension/src/emojis/emoji.dart';
import 'package:emoji_extension/src/emojis/group.dart';
import 'package:emoji_extension/src/emojis/platform.dart';
import 'package:emoji_extension/src/emojis/shortcode.dart';
import 'package:emoji_extension/src/emojis/status.dart';
import 'package:emoji_extension/src/emojis/subgroup.dart';
import 'package:emoji_extension/src/emojis/version.dart';
import 'package:emoji_extension/src/extensions/extensions.dart';

part 'emojis_data.dart';

/// A class that represents a collection of Emojis.
/// This class provides various methods to retrieve information about the Emojis, including
/// the count, groups and subgroups. It also provides methods to get a single Emoji by value,
/// unicode, name or shortcode, and retrieve a list of Emojis by group or subgroup.
class Emojis {
  /// Creates a new instance of the Emojis class.
  /// This constructor should not be called directly. Instead, use the static factory
  const Emojis._();

  /// Returns a singleton instance of the Emojis class.
  factory Emojis() => _instance;

  /// The singleton instance of the Emojis class.
  static const Emojis _instance = Emojis._();

  /// Returns an unmodifiable list of all the Emojis.
  List<Emoji> get get => _emojis;

  /// Returns the number of Emojis in the collection.
  int get count => _emojis.length;

  /// Returns an unmodifiable list of all the Emoji groups.
  List<Group> get groups => Group.values;

  /// Returns an unmodifiable list of all the Emoji subgroups.
  List<Subgroup> get subgroups => Subgroup.values;

  /// Returns an unmodifiable list of all the unicode emoji versions.
  List<Version> get versions => Version.values;

  /// Returns an unmodifiable list of all the Emoji statuses.
  List<Status> get statuses => Status.values;

  /// Returns a map of all the Emoji groups with their corresponding subgroups.
  Map<Group, List<Subgroup>> get groupsWithSubgroups {
    return {for (final group in groups) group: group.subgroups};
  }

  /// Returns a map of all the Emoji groups with their corresponding subgroups values.
  /// The keys of the map are the values of the Emoji groups, and the values of the map are
  /// lists of the values of the corresponding subgroups.
  Map<String, List<String>> get groupsWithSubgroupsValues {
    return groupsWithSubgroups.map((group, subgroups) {
      return MapEntry(group.value, subgroups.values);
    });
  }

  /// Returns an unmodifiable list of all the platform names for Emoji shortcodes.
  List<String> get shortcodePlatforms {
    return Platform.values.map((e) => e.name).toUnmodifiableList();
  }

  /// Returns the Emoji with the specified value, unicode, name, or shortcode.
  /// If the specified Emoji cannot be found, the orElse parameter is called, and its
  /// return value is returned. If orElse is not specified, a [StateError] is thrown.
  Emoji getOne(String param, {Emoji Function()? orElse}) {
    return _emojis.firstWhere(
      (e) =>
          e.value == param ||
          e.unicode == param ||
          e.name.toLowerCase() == param.toLowerCase() ||
          e.appleName?.toLowerCase() == param.toLowerCase() ||
          e.alsoKnownAs.any((s) => s.toLowerCase() == param.toLowerCase()) ||
          e.shortcodes
              .any((s) => s.values.any((v) => v == param.removeColons())),
      orElse: orElse,
    );
  }

  /// Returns the Emoji with the specified value, unicode, name, or shortcode,
  /// or null if it cannot be found.
  Emoji? getOneOrNull(String param) {
    return _emojis.firstWhereOrNull(
      (e) =>
          e.value == param ||
          e.unicode == param ||
          e.name.toLowerCase() == param.toLowerCase() ||
          e.appleName?.toLowerCase() == param.toLowerCase() ||
          e.alsoKnownAs.any((s) => s.toLowerCase() == param.toLowerCase()) ||
          e.shortcodes
              .any((s) => s.values.any((v) => v == param.removeColons())),
    );
  }

  /// Returns a list of all [Emoji] objects in the _emojis list that belong
  /// to the specified [Group].
  List<Emoji> byGroup(Group group) {
    return _emojis.where((e) => e.group == group).toUnmodifiableList();
  }

  /// Returns a list of all [Emoji] objects in the _emojis list that belong
  /// to the specified [Subgroup].
  List<Emoji> bySubgroup(Subgroup subgroup) {
    return _emojis.where((e) => e.subgroup == subgroup).toUnmodifiableList();
  }

  /// Returns a list of all [Emoji] objects in the _emojis list that belong
  /// to the specified [Version].
  List<Emoji> byVersion(Version version) {
    return _emojis.where((e) => e.version == version).toUnmodifiableList();
  }

  /// Returns a list of all [Emoji] objects in the _emojis list that belong
  /// to the specified [Status].
  List<Emoji> byStatus(Status status) {
    return _emojis.where((e) => e.status == status).toUnmodifiableList();
  }
}
