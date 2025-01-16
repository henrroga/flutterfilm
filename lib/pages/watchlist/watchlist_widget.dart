import '/backend/api_requests/api_calls.dart';
import '/components/empty_list/empty_list_widget.dart';
import '/components/movie_card/movie_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/skeletons/watchlist_loading/watchlist_loading_widget.dart';
import '/backend/schema/structs/index.dart';
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
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          title: Text(
            'Watchlist',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: FlutterFlowTheme.of(context).secondary,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 0.0,
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

                    return ListView.separated(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      scrollDirection: Axis.vertical,
                      itemCount: id.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 16.0),
                      itemBuilder: (context, idIndex) {
                        final idItem = id[idIndex];
                        return Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          child: FutureBuilder<ApiCallResponse>(
                            future: MovieDetailsCall.call(
                              movieId: idItem,
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
                                          movieCardMovieDetailsResponse
                                              .jsonBody,
                                          r'''$.id''',
                                        ),
                                        ParamType.int,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                                child: MovieCardWidget(
                                  key: Key('Keyr2n_${idIndex}_of_${id.length}'),
                                  name: MovieStruct.maybeFromMap(
                                          movieCardMovieDetailsResponse
                                              .jsonBody)!
                                      .title,
                                  poster: valueOrDefault<String>(
                                    MovieStruct.maybeFromMap(
                                                    movieCardMovieDetailsResponse
                                                        .jsonBody)
                                                ?.posterPath !=
                                            'null'
                                        ? 'https://image.tmdb.org/t/p/original${MovieStruct.maybeFromMap(movieCardMovieDetailsResponse.jsonBody)?.posterPath}'
                                        : 'https://blocks.astratic.com/img/general-img-portrait.png',
                                    'https://blocks.astratic.com/img/general-img-portrait.png',
                                  ),
                                  id: idItem,
                                  year: functions.getYear(
                                      MovieStruct.maybeFromMap(
                                              movieCardMovieDetailsResponse
                                                  .jsonBody)!
                                          .releaseDate),
                                ),
                              );
                            },
                          ),
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
