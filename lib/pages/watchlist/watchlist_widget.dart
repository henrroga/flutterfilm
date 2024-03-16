import '/backend/api_requests/api_calls.dart';
import '/components/empty_list/empty_list_widget.dart';
import '/components/movie_card/movie_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/skeletons/watchlist_loading/watchlist_loading_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'watchlist_model.dart';
export 'watchlist_model.dart';

class WatchlistWidget extends StatefulWidget {
  const WatchlistWidget({super.key});

  @override
  State<WatchlistWidget> createState() => _WatchlistWidgetState();
}

class _WatchlistWidgetState extends State<WatchlistWidget> {
  late WatchlistModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WatchlistModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Text(
            'Watchlist',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Builder(
                  builder: (context) {
                    final id = FFAppState().watchlist.toList();
                    if (id.isEmpty) {
                      return const EmptyListWidget();
                    }
                    return ListView.builder(
                      padding: const EdgeInsets.fromLTRB(
                        0,
                        8.0,
                        0,
                        0,
                      ),
                      scrollDirection: Axis.vertical,
                      itemCount: id.length,
                      itemBuilder: (context, idIndex) {
                        final idItem = id[idIndex];
                        return FutureBuilder<ApiCallResponse>(
                          future: MovieDetailsCall.call(
                            movieId: idItem,
                            tmdbKey: FFAppConstants.tmdbKey,
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return const WatchlistLoadingWidget();
                            }
                            final movieCardMovieDetailsResponse =
                                snapshot.data!;
                            return InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed(
                                  'MovieDetails',
                                  queryParameters: {
                                    'movieID': serializeParam(
                                      getJsonField(
                                        movieCardMovieDetailsResponse.jsonBody,
                                        r'''$.id''',
                                      ),
                                      ParamType.int,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              child: MovieCardWidget(
                                key: Key('Keyr2n_${idIndex}_of_${id.length}'),
                                name: MovieDetailsCall.title(
                                  movieCardMovieDetailsResponse.jsonBody,
                                )!,
                                poster: valueOrDefault<String>(
                                  MovieDetailsCall.poster(
                                                movieCardMovieDetailsResponse
                                                    .jsonBody,
                                              ) !=
                                              null &&
                                          MovieDetailsCall.poster(
                                                movieCardMovieDetailsResponse
                                                    .jsonBody,
                                              ) !=
                                              ''
                                      ? 'https://image.tmdb.org/t/p/original${MovieDetailsCall.poster(
                                          movieCardMovieDetailsResponse
                                              .jsonBody,
                                        )}'
                                      : 'https://media.comicbook.com/files/img/default-movie.png',
                                  'https://media.comicbook.com/files/img/default-movie.png',
                                ),
                                id: idItem,
                                year: functions.getYear(MovieDetailsCall.date(
                                  movieCardMovieDetailsResponse.jsonBody,
                                )!),
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
