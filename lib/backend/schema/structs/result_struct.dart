// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ResultStruct extends BaseStruct {
  ResultStruct({
    List<MovieResultStruct>? results,
    int? page,
    int? totalPages,
  })  : _results = results,
        _page = page,
        _totalPages = totalPages;

  // "results" field.
  List<MovieResultStruct>? _results;
  List<MovieResultStruct> get results => _results ?? const [];
  set results(List<MovieResultStruct>? val) => _results = val;

  void updateResults(Function(List<MovieResultStruct>) updateFn) {
    updateFn(_results ??= []);
  }

  bool hasResults() => _results != null;

  // "page" field.
  int? _page;
  int get page => _page ?? 0;
  set page(int? val) => _page = val;

  void incrementPage(int amount) => page = page + amount;

  bool hasPage() => _page != null;

  // "total_pages" field.
  int? _totalPages;
  int get totalPages => _totalPages ?? 0;
  set totalPages(int? val) => _totalPages = val;

  void incrementTotalPages(int amount) => totalPages = totalPages + amount;

  bool hasTotalPages() => _totalPages != null;

  static ResultStruct fromMap(Map<String, dynamic> data) => ResultStruct(
        results: getStructList(
          data['results'],
          MovieResultStruct.fromMap,
        ),
        page: castToType<int>(data['page']),
        totalPages: castToType<int>(data['total_pages']),
      );

  static ResultStruct? maybeFromMap(dynamic data) =>
      data is Map ? ResultStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'results': _results?.map((e) => e.toMap()).toList(),
        'page': _page,
        'total_pages': _totalPages,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'results': serializeParam(
          _results,
          ParamType.DataStruct,
          isList: true,
        ),
        'page': serializeParam(
          _page,
          ParamType.int,
        ),
        'total_pages': serializeParam(
          _totalPages,
          ParamType.int,
        ),
      }.withoutNulls;

  static ResultStruct fromSerializableMap(Map<String, dynamic> data) =>
      ResultStruct(
        results: deserializeStructParam<MovieResultStruct>(
          data['results'],
          ParamType.DataStruct,
          true,
          structBuilder: MovieResultStruct.fromSerializableMap,
        ),
        page: deserializeParam(
          data['page'],
          ParamType.int,
          false,
        ),
        totalPages: deserializeParam(
          data['total_pages'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'ResultStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ResultStruct &&
        listEquality.equals(results, other.results) &&
        page == other.page &&
        totalPages == other.totalPages;
  }

  @override
  int get hashCode => const ListEquality().hash([results, page, totalPages]);
}

ResultStruct createResultStruct({
  int? page,
  int? totalPages,
}) =>
    ResultStruct(
      page: page,
      totalPages: totalPages,
    );
