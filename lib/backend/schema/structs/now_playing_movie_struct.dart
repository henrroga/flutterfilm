// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NowPlayingMovieStruct extends BaseStruct {
  NowPlayingMovieStruct({
    int? id,
    String? title,
    String? posterPath,
    DateTime? releaseDate,
  })  : _id = id,
        _title = title,
        _posterPath = posterPath,
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

  // "release_date" field.
  DateTime? _releaseDate;
  DateTime? get releaseDate => _releaseDate;
  set releaseDate(DateTime? val) => _releaseDate = val;

  bool hasReleaseDate() => _releaseDate != null;

  static NowPlayingMovieStruct fromMap(Map<String, dynamic> data) =>
      NowPlayingMovieStruct(
        id: castToType<int>(data['id']),
        title: data['title'] as String?,
        posterPath: data['poster_path'] as String?,
        releaseDate: data['release_date'] as DateTime?,
      );

  static NowPlayingMovieStruct? maybeFromMap(dynamic data) => data is Map
      ? NowPlayingMovieStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'title': _title,
        'poster_path': _posterPath,
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
        'release_date': serializeParam(
          _releaseDate,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static NowPlayingMovieStruct fromSerializableMap(Map<String, dynamic> data) =>
      NowPlayingMovieStruct(
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
        releaseDate: deserializeParam(
          data['release_date'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'NowPlayingMovieStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NowPlayingMovieStruct &&
        id == other.id &&
        title == other.title &&
        posterPath == other.posterPath &&
        releaseDate == other.releaseDate;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, title, posterPath, releaseDate]);
}

NowPlayingMovieStruct createNowPlayingMovieStruct({
  int? id,
  String? title,
  String? posterPath,
  DateTime? releaseDate,
}) =>
    NowPlayingMovieStruct(
      id: id,
      title: title,
      posterPath: posterPath,
      releaseDate: releaseDate,
    );
