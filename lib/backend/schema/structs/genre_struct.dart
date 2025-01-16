// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GenreStruct extends BaseStruct {
  GenreStruct({
    int? id,
    String? name,
  })  : _id = id,
        _name = name;

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

  static GenreStruct fromMap(Map<String, dynamic> data) => GenreStruct(
        id: castToType<int>(data['id']),
        name: data['name'] as String?,
      );

  static GenreStruct? maybeFromMap(dynamic data) =>
      data is Map ? GenreStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
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
      }.withoutNulls;

  static GenreStruct fromSerializableMap(Map<String, dynamic> data) =>
      GenreStruct(
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
      );

  @override
  String toString() => 'GenreStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is GenreStruct && id == other.id && name == other.name;
  }

  @override
  int get hashCode => const ListEquality().hash([id, name]);
}

GenreStruct createGenreStruct({
  int? id,
  String? name,
}) =>
    GenreStruct(
      id: id,
      name: name,
    );
