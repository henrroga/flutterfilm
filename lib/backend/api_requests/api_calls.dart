import 'dart:convert';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class NowPlayingCall {
  static Future<ApiCallResponse> call({
    String? tmdbKey = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Now Playing',
      apiUrl: 'https://api.themoviedb.org/3/movie/now_playing',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $tmdbKey',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List? results(dynamic response) => getJsonField(
        response,
        r'''$.results''',
        true,
      ) as List?;
  static List<int>? movieID(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<double>? moviePopularity(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].popularity''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  static List<String>? movieTitle(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? posters(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].poster_path''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class PopularCall {
  static Future<ApiCallResponse> call({
    String? tmdbKey = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Popular',
      apiUrl: 'https://api.themoviedb.org/3/movie/popular',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $tmdbKey',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List? results(dynamic response) => getJsonField(
        response,
        r'''$.results''',
        true,
      ) as List?;
  static List<int>? movieID(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? movieTitle(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<double>? popularity(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].popularity''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  static List<String>? posters(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].poster_path''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? background(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].backdrop_path''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class MovieSearchCall {
  static Future<ApiCallResponse> call({
    String? query = '',
    int? page = 1,
    String? tmdbKey = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Movie Search',
      apiUrl: 'https://api.themoviedb.org/3/search/movie',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $tmdbKey',
      },
      params: {
        'query': query,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List? results(dynamic response) => getJsonField(
        response,
        r'''$.results''',
        true,
      ) as List?;
  static List<int>? resultID(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? title(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class MovieDetailsCall {
  static Future<ApiCallResponse> call({
    String? movieId = '',
    String? tmdbKey = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Movie Details',
      apiUrl: 'https://api.themoviedb.org/3/movie/$movieId',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $tmdbKey',
      },
      params: {
        'movie_id': movieId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static String? poster(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.poster_path''',
      ));
  static String? title(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.title''',
      ));
  static String? tagline(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.tagline''',
      ));
  static String? overview(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.overview''',
      ));
  static String? scene(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.backdrop_path''',
      ));
  static List? genres(dynamic response) => getJsonField(
        response,
        r'''$.genres''',
        true,
      ) as List?;
  static int? runtime(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.runtime''',
      ));
  static String? date(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.release_date''',
      ));
}

class TopRatedCall {
  static Future<ApiCallResponse> call({
    String? tmdbKey = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Top Rated',
      apiUrl: 'https://api.themoviedb.org/3/movie/top_rated',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $tmdbKey',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List? results(dynamic response) => getJsonField(
        response,
        r'''$.results''',
        true,
      ) as List?;
  static List<String>? poster(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].poster_path''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? title(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? id(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
}

class UpcomingMoviesCall {
  static Future<ApiCallResponse> call({
    String? tmdbKey = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Upcoming Movies',
      apiUrl: 'https://api.themoviedb.org/3/movie/upcoming',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $tmdbKey',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List? results(dynamic response) => getJsonField(
        response,
        r'''$.results''',
        true,
      ) as List?;
  static List<int>? id(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? poster(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].poster_path''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? title(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class CastAndCrewCall {
  static Future<ApiCallResponse> call({
    String? movieId = '',
    String? tmdbKey = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Cast and Crew',
      apiUrl: 'https://api.themoviedb.org/3/movie/$movieId/credits',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $tmdbKey',
      },
      params: {
        'movie_id': movieId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List? cast(dynamic response) => getJsonField(
        response,
        r'''$.cast''',
        true,
      ) as List?;
  static List<int>? castID(dynamic response) => (getJsonField(
        response,
        r'''$.cast[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? castName(dynamic response) => (getJsonField(
        response,
        r'''$.cast[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? castProfile(dynamic response) => (getJsonField(
        response,
        r'''$.cast[:].profile_path''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? castCharacter(dynamic response) => (getJsonField(
        response,
        r'''$.cast[:].character''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? crew(dynamic response) => getJsonField(
        response,
        r'''$.crew''',
        true,
      ) as List?;
  static List<int>? crewID(dynamic response) => (getJsonField(
        response,
        r'''$.crew[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? crewName(dynamic response) => (getJsonField(
        response,
        r'''$.crew[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? crewProfile(dynamic response) => (getJsonField(
        response,
        r'''$.crew[:].profile_path''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? crewJob(dynamic response) => (getJsonField(
        response,
        r'''$.crew[:].job''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
