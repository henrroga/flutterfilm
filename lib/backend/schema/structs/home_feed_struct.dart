// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HomeFeedStruct extends BaseStruct {
  HomeFeedStruct({
    List<MovieHomeFeedStruct>? results,
  }) : _results = results;

  // "results" field.
  List<MovieHomeFeedStruct>? _results;
  List<MovieHomeFeedStruct> get results => _results ?? const [];
  set results(List<MovieHomeFeedStruct>? val) => _results = val;

  void updateResults(Function(List<MovieHomeFeedStruct>) updateFn) {
    updateFn(_results ??= []);
  }

  bool hasResults() => _results != null;

  static HomeFeedStruct fromMap(Map<String, dynamic> data) => HomeFeedStruct(
        results: getStructList(
          data['results'],
          MovieHomeFeedStruct.fromMap,
        ),
      );

  static HomeFeedStruct? maybeFromMap(dynamic data) =>
      data is Map ? HomeFeedStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'results': _results?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'results': serializeParam(
          _results,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static HomeFeedStruct fromSerializableMap(Map<String, dynamic> data) =>
      HomeFeedStruct(
        results: deserializeStructParam<MovieHomeFeedStruct>(
          data['results'],
          ParamType.DataStruct,
          true,
          structBuilder: MovieHomeFeedStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'HomeFeedStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is HomeFeedStruct &&
        listEquality.equals(results, other.results);
  }

  @override
  int get hashCode => const ListEquality().hash([results]);
}

HomeFeedStruct createHomeFeedStruct() => HomeFeedStruct();
