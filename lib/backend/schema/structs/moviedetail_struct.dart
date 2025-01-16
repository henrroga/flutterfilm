// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MoviedetailStruct extends BaseStruct {
  MoviedetailStruct({
    DatesStruct? dates,
    int? page,
    List<ResultsStruct>? results,
    int? totalPages,
    int? totalResults,
  })  : _dates = dates,
        _page = page,
        _results = results,
        _totalPages = totalPages,
        _totalResults = totalResults;

  // "dates" field.
  DatesStruct? _dates;
  DatesStruct get dates => _dates ?? DatesStruct();
  set dates(DatesStruct? val) => _dates = val;

  void updateDates(Function(DatesStruct) updateFn) {
    updateFn(_dates ??= DatesStruct());
  }

  bool hasDates() => _dates != null;

  // "page" field.
  int? _page;
  int get page => _page ?? 0;
  set page(int? val) => _page = val;

  void incrementPage(int amount) => page = page + amount;

  bool hasPage() => _page != null;

  // "results" field.
  List<ResultsStruct>? _results;
  List<ResultsStruct> get results => _results ?? const [];
  set results(List<ResultsStruct>? val) => _results = val;

  void updateResults(Function(List<ResultsStruct>) updateFn) {
    updateFn(_results ??= []);
  }

  bool hasResults() => _results != null;

  // "total_pages" field.
  int? _totalPages;
  int get totalPages => _totalPages ?? 0;
  set totalPages(int? val) => _totalPages = val;

  void incrementTotalPages(int amount) => totalPages = totalPages + amount;

  bool hasTotalPages() => _totalPages != null;

  // "total_results" field.
  int? _totalResults;
  int get totalResults => _totalResults ?? 0;
  set totalResults(int? val) => _totalResults = val;

  void incrementTotalResults(int amount) =>
      totalResults = totalResults + amount;

  bool hasTotalResults() => _totalResults != null;

  static MoviedetailStruct fromMap(Map<String, dynamic> data) =>
      MoviedetailStruct(
        dates: data['dates'] is DatesStruct
            ? data['dates']
            : DatesStruct.maybeFromMap(data['dates']),
        page: castToType<int>(data['page']),
        results: getStructList(
          data['results'],
          ResultsStruct.fromMap,
        ),
        totalPages: castToType<int>(data['total_pages']),
        totalResults: castToType<int>(data['total_results']),
      );

  static MoviedetailStruct? maybeFromMap(dynamic data) => data is Map
      ? MoviedetailStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'dates': _dates?.toMap(),
        'page': _page,
        'results': _results?.map((e) => e.toMap()).toList(),
        'total_pages': _totalPages,
        'total_results': _totalResults,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'dates': serializeParam(
          _dates,
          ParamType.DataStruct,
        ),
        'page': serializeParam(
          _page,
          ParamType.int,
        ),
        'results': serializeParam(
          _results,
          ParamType.DataStruct,
          isList: true,
        ),
        'total_pages': serializeParam(
          _totalPages,
          ParamType.int,
        ),
        'total_results': serializeParam(
          _totalResults,
          ParamType.int,
        ),
      }.withoutNulls;

  static MoviedetailStruct fromSerializableMap(Map<String, dynamic> data) =>
      MoviedetailStruct(
        dates: deserializeStructParam(
          data['dates'],
          ParamType.DataStruct,
          false,
          structBuilder: DatesStruct.fromSerializableMap,
        ),
        page: deserializeParam(
          data['page'],
          ParamType.int,
          false,
        ),
        results: deserializeStructParam<ResultsStruct>(
          data['results'],
          ParamType.DataStruct,
          true,
          structBuilder: ResultsStruct.fromSerializableMap,
        ),
        totalPages: deserializeParam(
          data['total_pages'],
          ParamType.int,
          false,
        ),
        totalResults: deserializeParam(
          data['total_results'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'MoviedetailStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is MoviedetailStruct &&
        dates == other.dates &&
        page == other.page &&
        listEquality.equals(results, other.results) &&
        totalPages == other.totalPages &&
        totalResults == other.totalResults;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([dates, page, results, totalPages, totalResults]);
}

MoviedetailStruct createMoviedetailStruct({
  DatesStruct? dates,
  int? page,
  int? totalPages,
  int? totalResults,
}) =>
    MoviedetailStruct(
      dates: dates ?? DatesStruct(),
      page: page,
      totalPages: totalPages,
      totalResults: totalResults,
    );
