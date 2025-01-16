// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ResultsStruct extends BaseStruct {
  ResultsStruct({
    bool? adult,
    String? backdropPath,
    List<int>? genreIds,
    int? id,
    String? originalLanguage,
    String? originalTitle,
    String? overview,
    double? popularity,
    String? posterPath,
    String? releaseDate,
    String? title,
    bool? video,
    double? voteAverage,
    int? voteCount,
  })  : _adult = adult,
        _backdropPath = backdropPath,
        _genreIds = genreIds,
        _id = id,
        _originalLanguage = originalLanguage,
        _originalTitle = originalTitle,
        _overview = overview,
        _popularity = popularity,
        _posterPath = posterPath,
        _releaseDate = releaseDate,
        _title = title,
        _video = video,
        _voteAverage = voteAverage,
        _voteCount = voteCount;

  // "adult" field.
  bool? _adult;
  bool get adult => _adult ?? false;
  set adult(bool? val) => _adult = val;

  bool hasAdult() => _adult != null;

  // "backdrop_path" field.
  String? _backdropPath;
  String get backdropPath => _backdropPath ?? '';
  set backdropPath(String? val) => _backdropPath = val;

  bool hasBackdropPath() => _backdropPath != null;

  // "genre_ids" field.
  List<int>? _genreIds;
  List<int> get genreIds => _genreIds ?? const [];
  set genreIds(List<int>? val) => _genreIds = val;

  void updateGenreIds(Function(List<int>) updateFn) {
    updateFn(_genreIds ??= []);
  }

  bool hasGenreIds() => _genreIds != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "original_language" field.
  String? _originalLanguage;
  String get originalLanguage => _originalLanguage ?? '';
  set originalLanguage(String? val) => _originalLanguage = val;

  bool hasOriginalLanguage() => _originalLanguage != null;

  // "original_title" field.
  String? _originalTitle;
  String get originalTitle => _originalTitle ?? '';
  set originalTitle(String? val) => _originalTitle = val;

  bool hasOriginalTitle() => _originalTitle != null;

  // "overview" field.
  String? _overview;
  String get overview => _overview ?? '';
  set overview(String? val) => _overview = val;

  bool hasOverview() => _overview != null;

  // "popularity" field.
  double? _popularity;
  double get popularity => _popularity ?? 0.0;
  set popularity(double? val) => _popularity = val;

  void incrementPopularity(double amount) => popularity = popularity + amount;

  bool hasPopularity() => _popularity != null;

  // "poster_path" field.
  String? _posterPath;
  String get posterPath => _posterPath ?? '';
  set posterPath(String? val) => _posterPath = val;

  bool hasPosterPath() => _posterPath != null;

  // "release_date" field.
  String? _releaseDate;
  String get releaseDate => _releaseDate ?? '';
  set releaseDate(String? val) => _releaseDate = val;

  bool hasReleaseDate() => _releaseDate != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "video" field.
  bool? _video;
  bool get video => _video ?? false;
  set video(bool? val) => _video = val;

  bool hasVideo() => _video != null;

  // "vote_average" field.
  double? _voteAverage;
  double get voteAverage => _voteAverage ?? 0.0;
  set voteAverage(double? val) => _voteAverage = val;

  void incrementVoteAverage(double amount) =>
      voteAverage = voteAverage + amount;

  bool hasVoteAverage() => _voteAverage != null;

  // "vote_count" field.
  int? _voteCount;
  int get voteCount => _voteCount ?? 0;
  set voteCount(int? val) => _voteCount = val;

  void incrementVoteCount(int amount) => voteCount = voteCount + amount;

  bool hasVoteCount() => _voteCount != null;

  static ResultsStruct fromMap(Map<String, dynamic> data) => ResultsStruct(
        adult: data['adult'] as bool?,
        backdropPath: data['backdrop_path'] as String?,
        genreIds: getDataList(data['genre_ids']),
        id: castToType<int>(data['id']),
        originalLanguage: data['original_language'] as String?,
        originalTitle: data['original_title'] as String?,
        overview: data['overview'] as String?,
        popularity: castToType<double>(data['popularity']),
        posterPath: data['poster_path'] as String?,
        releaseDate: data['release_date'] as String?,
        title: data['title'] as String?,
        video: data['video'] as bool?,
        voteAverage: castToType<double>(data['vote_average']),
        voteCount: castToType<int>(data['vote_count']),
      );

  static ResultsStruct? maybeFromMap(dynamic data) =>
      data is Map ? ResultsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'adult': _adult,
        'backdrop_path': _backdropPath,
        'genre_ids': _genreIds,
        'id': _id,
        'original_language': _originalLanguage,
        'original_title': _originalTitle,
        'overview': _overview,
        'popularity': _popularity,
        'poster_path': _posterPath,
        'release_date': _releaseDate,
        'title': _title,
        'video': _video,
        'vote_average': _voteAverage,
        'vote_count': _voteCount,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'adult': serializeParam(
          _adult,
          ParamType.bool,
        ),
        'backdrop_path': serializeParam(
          _backdropPath,
          ParamType.String,
        ),
        'genre_ids': serializeParam(
          _genreIds,
          ParamType.int,
          isList: true,
        ),
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'original_language': serializeParam(
          _originalLanguage,
          ParamType.String,
        ),
        'original_title': serializeParam(
          _originalTitle,
          ParamType.String,
        ),
        'overview': serializeParam(
          _overview,
          ParamType.String,
        ),
        'popularity': serializeParam(
          _popularity,
          ParamType.double,
        ),
        'poster_path': serializeParam(
          _posterPath,
          ParamType.String,
        ),
        'release_date': serializeParam(
          _releaseDate,
          ParamType.String,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'video': serializeParam(
          _video,
          ParamType.bool,
        ),
        'vote_average': serializeParam(
          _voteAverage,
          ParamType.double,
        ),
        'vote_count': serializeParam(
          _voteCount,
          ParamType.int,
        ),
      }.withoutNulls;

  static ResultsStruct fromSerializableMap(Map<String, dynamic> data) =>
      ResultsStruct(
        adult: deserializeParam(
          data['adult'],
          ParamType.bool,
          false,
        ),
        backdropPath: deserializeParam(
          data['backdrop_path'],
          ParamType.String,
          false,
        ),
        genreIds: deserializeParam<int>(
          data['genre_ids'],
          ParamType.int,
          true,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        originalLanguage: deserializeParam(
          data['original_language'],
          ParamType.String,
          false,
        ),
        originalTitle: deserializeParam(
          data['original_title'],
          ParamType.String,
          false,
        ),
        overview: deserializeParam(
          data['overview'],
          ParamType.String,
          false,
        ),
        popularity: deserializeParam(
          data['popularity'],
          ParamType.double,
          false,
        ),
        posterPath: deserializeParam(
          data['poster_path'],
          ParamType.String,
          false,
        ),
        releaseDate: deserializeParam(
          data['release_date'],
          ParamType.String,
          false,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        video: deserializeParam(
          data['video'],
          ParamType.bool,
          false,
        ),
        voteAverage: deserializeParam(
          data['vote_average'],
          ParamType.double,
          false,
        ),
        voteCount: deserializeParam(
          data['vote_count'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'ResultsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ResultsStruct &&
        adult == other.adult &&
        backdropPath == other.backdropPath &&
        listEquality.equals(genreIds, other.genreIds) &&
        id == other.id &&
        originalLanguage == other.originalLanguage &&
        originalTitle == other.originalTitle &&
        overview == other.overview &&
        popularity == other.popularity &&
        posterPath == other.posterPath &&
        releaseDate == other.releaseDate &&
        title == other.title &&
        video == other.video &&
        voteAverage == other.voteAverage &&
        voteCount == other.voteCount;
  }

  @override
  int get hashCode => const ListEquality().hash([
        adult,
        backdropPath,
        genreIds,
        id,
        originalLanguage,
        originalTitle,
        overview,
        popularity,
        posterPath,
        releaseDate,
        title,
        video,
        voteAverage,
        voteCount
      ]);
}

ResultsStruct createResultsStruct({
  bool? adult,
  String? backdropPath,
  int? id,
  String? originalLanguage,
  String? originalTitle,
  String? overview,
  double? popularity,
  String? posterPath,
  String? releaseDate,
  String? title,
  bool? video,
  double? voteAverage,
  int? voteCount,
}) =>
    ResultsStruct(
      adult: adult,
      backdropPath: backdropPath,
      id: id,
      originalLanguage: originalLanguage,
      originalTitle: originalTitle,
      overview: overview,
      popularity: popularity,
      posterPath: posterPath,
      releaseDate: releaseDate,
      title: title,
      video: video,
      voteAverage: voteAverage,
      voteCount: voteCount,
    );
