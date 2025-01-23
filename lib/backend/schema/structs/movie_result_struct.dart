// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MovieResultStruct extends BaseStruct {
  MovieResultStruct({
    int? id,
    String? title,
    String? posterPath,
    String? backdropPath,
    String? releaseDate,
  })  : _id = id,
        _title = title,
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

  static MovieResultStruct fromMap(Map<String, dynamic> data) =>
      MovieResultStruct(
        id: castToType<int>(data['id']),
        title: data['title'] as String?,
        posterPath: data['poster_path'] as String?,
        backdropPath: data['backdrop_path'] as String?,
        releaseDate: data['release_date'] as String?,
      );

  static MovieResultStruct? maybeFromMap(dynamic data) => data is Map
      ? MovieResultStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'title': _title,
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

  static MovieResultStruct fromSerializableMap(Map<String, dynamic> data) =>
      MovieResultStruct(
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
  String toString() => 'MovieResultStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MovieResultStruct &&
        id == other.id &&
        title == other.title &&
        posterPath == other.posterPath &&
        backdropPath == other.backdropPath &&
        releaseDate == other.releaseDate;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([id, title, posterPath, backdropPath, releaseDate]);
}

MovieResultStruct createMovieResultStruct({
  int? id,
  String? title,
  String? posterPath,
  String? backdropPath,
  String? releaseDate,
}) =>
    MovieResultStruct(
      id: id,
      title: title,
      posterPath: posterPath,
      backdropPath: backdropPath,
      releaseDate: releaseDate,
    );
