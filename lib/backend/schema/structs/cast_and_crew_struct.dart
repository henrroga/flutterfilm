// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CastAndCrewStruct extends BaseStruct {
  CastAndCrewStruct({
    List<CastStruct>? cast,
    List<CrewStruct>? crew,
  })  : _cast = cast,
        _crew = crew;

  // "cast" field.
  List<CastStruct>? _cast;
  List<CastStruct> get cast => _cast ?? const [];
  set cast(List<CastStruct>? val) => _cast = val;

  void updateCast(Function(List<CastStruct>) updateFn) {
    updateFn(_cast ??= []);
  }

  bool hasCast() => _cast != null;

  // "crew" field.
  List<CrewStruct>? _crew;
  List<CrewStruct> get crew => _crew ?? const [];
  set crew(List<CrewStruct>? val) => _crew = val;

  void updateCrew(Function(List<CrewStruct>) updateFn) {
    updateFn(_crew ??= []);
  }

  bool hasCrew() => _crew != null;

  static CastAndCrewStruct fromMap(Map<String, dynamic> data) =>
      CastAndCrewStruct(
        cast: getStructList(
          data['cast'],
          CastStruct.fromMap,
        ),
        crew: getStructList(
          data['crew'],
          CrewStruct.fromMap,
        ),
      );

  static CastAndCrewStruct? maybeFromMap(dynamic data) => data is Map
      ? CastAndCrewStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'cast': _cast?.map((e) => e.toMap()).toList(),
        'crew': _crew?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'cast': serializeParam(
          _cast,
          ParamType.DataStruct,
          isList: true,
        ),
        'crew': serializeParam(
          _crew,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static CastAndCrewStruct fromSerializableMap(Map<String, dynamic> data) =>
      CastAndCrewStruct(
        cast: deserializeStructParam<CastStruct>(
          data['cast'],
          ParamType.DataStruct,
          true,
          structBuilder: CastStruct.fromSerializableMap,
        ),
        crew: deserializeStructParam<CrewStruct>(
          data['crew'],
          ParamType.DataStruct,
          true,
          structBuilder: CrewStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'CastAndCrewStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is CastAndCrewStruct &&
        listEquality.equals(cast, other.cast) &&
        listEquality.equals(crew, other.crew);
  }

  @override
  int get hashCode => const ListEquality().hash([cast, crew]);
}

CastAndCrewStruct createCastAndCrewStruct() => CastAndCrewStruct();
