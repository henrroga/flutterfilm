// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CrewStruct extends BaseStruct {
  CrewStruct({
    int? id,
    String? name,
    String? job,
    String? profilePath,
  })  : _id = id,
        _name = name,
        _job = job,
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

  // "job" field.
  String? _job;
  String get job => _job ?? '';
  set job(String? val) => _job = val;

  bool hasJob() => _job != null;

  // "profile_path" field.
  String? _profilePath;
  String get profilePath => _profilePath ?? '';
  set profilePath(String? val) => _profilePath = val;

  bool hasProfilePath() => _profilePath != null;

  static CrewStruct fromMap(Map<String, dynamic> data) => CrewStruct(
        id: castToType<int>(data['id']),
        name: data['name'] as String?,
        job: data['job'] as String?,
        profilePath: data['profile_path'] as String?,
      );

  static CrewStruct? maybeFromMap(dynamic data) =>
      data is Map ? CrewStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'job': _job,
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
        'job': serializeParam(
          _job,
          ParamType.String,
        ),
        'profile_path': serializeParam(
          _profilePath,
          ParamType.String,
        ),
      }.withoutNulls;

  static CrewStruct fromSerializableMap(Map<String, dynamic> data) =>
      CrewStruct(
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
        job: deserializeParam(
          data['job'],
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
  String toString() => 'CrewStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CrewStruct &&
        id == other.id &&
        name == other.name &&
        job == other.job &&
        profilePath == other.profilePath;
  }

  @override
  int get hashCode => const ListEquality().hash([id, name, job, profilePath]);
}

CrewStruct createCrewStruct({
  int? id,
  String? name,
  String? job,
  String? profilePath,
}) =>
    CrewStruct(
      id: id,
      name: name,
      job: job,
      profilePath: profilePath,
    );
