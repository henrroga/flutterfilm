// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MovieStruct extends BaseStruct {
  MovieStruct({
    int? id,
    String? title,
    List<GenreStruct>? genres,
    String? overview,
    int? runtime,
    String? tagline,
    double? voteAverage,
    String? posterPath,
    String? backdropPath,
    String? releaseDate,
  })  : _id = id,
        _title = title,
        _genres = genres,
        _overview = overview,
        _runtime = runtime,
        _tagline = tagline,
        _voteAverage = voteAverage,
        _posterPath = posterPath,
        _backdropPath = backdropPath,
        _releaseDate = releaseDate;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "genres" field.
  List<GenreStruct>? _genres;
  List<GenreStruct> get genres => _genres ?? const [];
  set genres(List<GenreStruct>? val) => _genres = val;

  void updateGenres(Function(List<GenreStruct>) updateFn) {
    updateFn(_genres ??= []);
  }

  bool hasGenres() => _genres != null;

  // "overview" field.
  String? _overview;
  String get overview => _overview ?? '';
  set overview(String? val) => _overview = val;

  bool hasOverview() => _overview != null;

  // "runtime" field.
  int? _runtime;
  int get runtime => _runtime ?? 0;
  set runtime(int? val) => _runtime = val;

  void incrementRuntime(int amount) => runtime = runtime + amount;

  bool hasRuntime() => _runtime != null;

  // "tagline" field.
  String? _tagline;
  String get tagline => _tagline ?? '';
  set tagline(String? val) => _tagline = val;

  bool hasTagline() => _tagline != null;

  // "vote_average" field.
  double? _voteAverage;
  double get voteAverage => _voteAverage ?? 0.0;
  set voteAverage(double? val) => _voteAverage = val;

  void incrementVoteAverage(double amount) =>
      voteAverage = voteAverage + amount;

  bool hasVoteAverage() => _voteAverage != null;

  // "poster_path" field.
  String? _posterPath;
  String get posterPath => _posterPath ?? '';
  set posterPath(String? val) => _posterPath = val;

  bool hasPosterPath() => _posterPath != null;

  // "backdrop_path" field.
  String? _backdropPath;
  String get backdropPath => _backdropPath ?? '';
  set backdropPath(String? val) => _backdropPath = val;

  bool hasBackdropPath() => _backdropPath != null;

  // "release_date" field.
  String? _releaseDate;
  String get releaseDate => _releaseDate ?? '';
  set releaseDate(String? val) => _releaseDate = val;

  bool hasReleaseDate() => _releaseDate != null;

  static MovieStruct fromMap(Map<String, dynamic> data) => MovieStruct(
        id: castToType<int>(data['id']),
        title: data['title'] as String?,
        genres: getStructList(
          data['genres'],
          GenreStruct.fromMap,
        ),
        overview: data['overview'] as String?,
        runtime: castToType<int>(data['runtime']),
        tagline: data['tagline'] as String?,
        voteAverage: castToType<double>(data['vote_average']),
        posterPath: data['poster_path'] as String?,
        backdropPath: data['backdrop_path'] as String?,
        releaseDate: data['release_date'] as String?,
      );

  static MovieStruct? maybeFromMap(dynamic data) =>
      data is Map ? MovieStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'title': _title,
        'genres': _genres?.map((e) => e.toMap()).toList(),
        'overview': _overview,
        'runtime': _runtime,
        'tagline': _tagline,
        'vote_average': _voteAverage,
        'poster_path': _posterPath,
        'backdrop_path': _backdropPath,
        'release_date': _releaseDate,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'genres': serializeParam(
          _genres,
          ParamType.DataStruct,
          isList: true,
        ),
        'overview': serializeParam(
          _overview,
          ParamType.String,
        ),
        'runtime': serializeParam(
          _runtime,
          ParamType.int,
        ),
        'tagline': serializeParam(
          _tagline,
          ParamType.String,
        ),
        'vote_average': serializeParam(
          _voteAverage,
          ParamType.double,
        ),
        'poster_path': serializeParam(
          _posterPath,
          ParamType.String,
        ),
        'backdrop_path': serializeParam(
          _backdropPath,
          ParamType.String,
        ),
        'release_date': serializeParam(
          _releaseDate,
          ParamType.String,
        ),
      }.withoutNulls;

  static MovieStruct fromSerializableMap(Map<String, dynamic> data) =>
      MovieStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        genres: deserializeStructParam<GenreStruct>(
          data['genres'],
          ParamType.DataStruct,
          true,
          structBuilder: GenreStruct.fromSerializableMap,
        ),
        overview: deserializeParam(
          data['overview'],
          ParamType.String,
          false,
        ),
        runtime: deserializeParam(
          data['runtime'],
          ParamType.int,
          false,
        ),
        tagline: deserializeParam(
          data['tagline'],
          ParamType.String,
          false,
        ),
        voteAverage: deserializeParam(
          data['vote_average'],
          ParamType.double,
          false,
        ),
        posterPath: deserializeParam(
          data['poster_path'],
          ParamType.String,
          false,
        ),
        backdropPath: deserializeParam(
          data['backdrop_path'],
          ParamType.String,
          false,
        ),
        releaseDate: deserializeParam(
          data['release_date'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'MovieStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is MovieStruct &&
        id == other.id &&
        title == other.title &&
        listEquality.equals(genres, other.genres) &&
        overview == other.overview &&
        runtime == other.runtime &&
        tagline == other.tagline &&
        voteAverage == other.voteAverage &&
        posterPath == other.posterPath &&
        backdropPath == other.backdropPath &&
        releaseDate == other.releaseDate;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        title,
        genres,
        overview,
        runtime,
        tagline,
        voteAverage,
        posterPath,
        backdropPath,
        releaseDate
      ]);
}

MovieStruct createMovieStruct({
  int? id,
  String? title,
  String? overview,
  int? runtime,
  String? tagline,
  double? voteAverage,
  String? posterPath,
  String? backdropPath,
  String? releaseDate,
}) =>
    MovieStruct(
      id: id,
      title: title,
      overview: overview,
      runtime: runtime,
      tagline: tagline,
      voteAverage: voteAverage,
      posterPath: posterPath,
      backdropPath: backdropPath,
      releaseDate: releaseDate,
    );
