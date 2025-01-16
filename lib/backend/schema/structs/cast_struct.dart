// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CastStruct extends BaseStruct {
  CastStruct({
    int? id,
    String? name,
    String? character,
    String? profilePath,
  })  : _id = id,
        _name = name,
        _character = character,
        _profilePath = profilePath;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "character" field.
  String? _character;
  String get character => _character ?? '';
  set character(String? val) => _character = val;

  bool hasCharacter() => _character != null;

  // "profile_path" field.
  String? _profilePath;
  String get profilePath => _profilePath ?? '';
  set profilePath(String? val) => _profilePath = val;

  bool hasProfilePath() => _profilePath != null;

  static CastStruct fromMap(Map<String, dynamic> data) => CastStruct(
        id: castToType<int>(data['id']),
        name: data['name'] as String?,
        character: data['character'] as String?,
        profilePath: data['profile_path'] as String?,
      );

  static CastStruct? maybeFromMap(dynamic data) =>
      data is Map ? CastStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'character': _character,
        'profile_path': _profilePath,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'character': serializeParam(
          _character,
          ParamType.String,
        ),
        'profile_path': serializeParam(
          _profilePath,
          ParamType.String,
        ),
      }.withoutNulls;

  static CastStruct fromSerializableMap(Map<String, dynamic> data) =>
      CastStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        character: deserializeParam(
          data['character'],
          ParamType.String,
          false,
        ),
        profilePath: deserializeParam(
          data['profile_path'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CastStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CastStruct &&
        id == other.id &&
        name == other.name &&
        character == other.character &&
        profilePath == other.profilePath;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, name, character, profilePath]);
}

CastStruct createCastStruct({
  int? id,
  String? name,
  String? character,
  String? profilePath,
}) =>
    CastStruct(
      id: id,
      name: name,
      character: character,
      profilePath: profilePath,
    );
