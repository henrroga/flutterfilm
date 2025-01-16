import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/genre/genre_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'movie_details_model.dart';
export 'movie_details_model.dart';

class MovieDetailsWidget extends StatefulWidget {
  const MovieDetailsWidget({
    super.key,
    required this.movieID,
  });

  final int? movieID;

  @override
  State<MovieDetailsWidget> createState() => _MovieDetailsWidgetState();
}

class _MovieDetailsWidgetState extends State<MovieDetailsWidget> {
  late MovieDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MovieDetailsModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<ApiCallResponse>(
      future: MovieDetailsCall.call(
        movieId: widget.movieID?.toString(),
        tmdbKey: FFAppConstants.tmdbKey,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        final movieDetailsMovieDetailsResponse = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () async {
                if (FFAppState()
                    .watchlist
                    .contains(widget.movieID?.toString())) {
                  FFAppState().removeFromWatchlist(widget.movieID!.toString());
                  safeSetState(() {});
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text(
                        'This movie is removed from your watchlist',
                        style: TextStyle(
                          color: Color(0xFF3C096C),
                          fontWeight: FontWeight.w500,
                          fontSize: 16.0,
                        ),
                      ),
                      duration: const Duration(milliseconds: 4000),
                      backgroundColor: FlutterFlowTheme.of(context).tertiary,
                    ),
                  );
                } else {
                  FFAppState().addToWatchlist(widget.movieID!.toString());
                  safeSetState(() {});
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'This movie is added to your watchlist',
                        style: TextStyle(
                          color: FlutterFlowTheme.of(context).tertiary,
                          fontWeight: FontWeight.w500,
                          fontSize: 16.0,
                        ),
                      ),
                      duration: const Duration(milliseconds: 4000),
                      backgroundColor: FlutterFlowTheme.of(context).secondary,
                    ),
                  );
                }
              },
              backgroundColor: FlutterFlowTheme.of(context).secondary,
              label: Builder(
                builder: (context) {
                  if (!FFAppState()
                      .watchlist
                      .contains(widget.movieID?.toString())) {
                    return Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(
                          Icons.add,
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          size: 24.0,
                        ),
                        Text(
                          'Add to watchlist',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ].divide(const SizedBox(width: 2.0)),
                    );
                  } else {
                    return Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(
                          Icons.remove,
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          size: 24.0,
                        ),
                        Text(
                          'Remove from watchlist',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ].divide(const SizedBox(width: 2.0)),
                    );
                  }
                },
              ),
            ),
            body: NestedScrollView(
              floatHeaderSlivers: true,
              headerSliverBuilder: (context, _) => [
                if (MovieStruct.maybeFromMap(
                            movieDetailsMovieDetailsResponse.jsonBody)
                        ?.backdropPath !=
                    'null')
                  SliverAppBar(
                    expandedHeight: 250.0,
                    collapsedHeight: 75.0,
                    pinned: true,
                    floating: false,
                    backgroundColor:
                        FlutterFlowTheme.of(context).primaryBackground,
                    automaticallyImplyLeading: false,
                    actions: const [],
                    flexibleSpace: FlexibleSpaceBar(
                      title: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AutoSizeText(
                                  '${MovieStruct.maybeFromMap(movieDetailsMovieDetailsResponse.jsonBody)?.title} (${functions.getYear(MovieStruct.maybeFromMap(movieDetailsMovieDetailsResponse.jsonBody)!.releaseDate)})'
                                      .maybeHandleOverflow(
                                    maxChars: 65,
                                    replacement: '…',
                                  ),
                                  maxLines: 2,
                                  minFontSize: 16.0,
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: Colors.white,
                                        fontSize: 22.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      background: ClipRRect(
                        borderRadius: BorderRadius.circular(0.0),
                        child: Image.network(
                          valueOrDefault<String>(
                            'https://image.tmdb.org/t/p/original${MovieStruct.maybeFromMap(movieDetailsMovieDetailsResponse.jsonBody)?.backdropPath}',
                            'https://picsum.photos/id/115/600',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      centerTitle: false,
                      expandedTitleScale: 1.0,
                      titlePadding: const EdgeInsets.all(16.0),
                    ),
                    toolbarHeight: 75.0,
                    elevation: 0.0,
                  )
              ],
              body: Builder(
                builder: (context) {
                  return SafeArea(
                    top: false,
                    child: SingleChildScrollView(
                      primary: false,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.network(
                                        valueOrDefault<String>(
                                          MovieStruct.maybeFromMap(
                                                          movieDetailsMovieDetailsResponse
                                                              .jsonBody)
                                                      ?.posterPath !=
                                                  'null'
                                              ? valueOrDefault<String>(
                                                  'https://image.tmdb.org/t/p/original${MovieStruct.maybeFromMap(movieDetailsMovieDetailsResponse.jsonBody)?.posterPath}',
                                                  'https://picsum.photos/seed/37/600',
                                                )
                                              : 'https://blocks.astratic.com/img/general-img-portrait.png',
                                          'https://blocks.astratic.com/img/general-img-portrait.png',
                                        ),
                                        width: 130.0,
                                        height: 180.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  valueOrDefault<String>(
                                                    MovieStruct.maybeFromMap(
                                                            movieDetailsMovieDetailsResponse
                                                                .jsonBody)
                                                        ?.title,
                                                    '[title]',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Builder(
                                        builder: (context) {
                                          final genres = MovieStruct.maybeFromMap(
                                                      movieDetailsMovieDetailsResponse
                                                          .jsonBody)
                                                  ?.genres
                                                  .toList() ??
                                              [];

                                          return Wrap(
                                            spacing: 16.0,
                                            runSpacing: 8.0,
                                            alignment: WrapAlignment.start,
                                            crossAxisAlignment:
                                                WrapCrossAlignment.start,
                                            direction: Axis.horizontal,
                                            runAlignment: WrapAlignment.start,
                                            verticalDirection:
                                                VerticalDirection.down,
                                            clipBehavior: Clip.none,
                                            children: List.generate(
                                                genres.length, (genresIndex) {
                                              final genresItem =
                                                  genres[genresIndex];
                                              return GenreWidget(
                                                key: Key(
                                                    'Keydkl_${genresIndex}_of_${genres.length}'),
                                                name: genresItem.name,
                                              );
                                            }),
                                          );
                                        },
                                      ),
                                    ].divide(const SizedBox(height: 16.0)),
                                  ),
                                ),
                              ].divide(const SizedBox(width: 16.0)),
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      valueOrDefault<String>(
                                        MovieStruct.maybeFromMap(
                                                movieDetailsMovieDetailsResponse
                                                    .jsonBody)
                                            ?.tagline,
                                        '[tagline]',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            fontSize: 18.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            valueOrDefault<String>(
                                              MovieStruct.maybeFromMap(
                                                      movieDetailsMovieDetailsResponse
                                                          .jsonBody)
                                                  ?.overview,
                                              '[overview]',
                                            ).maybeHandleOverflow(
                                              maxChars: 120,
                                              replacement: '…',
                                            ),
                                            maxLines: 3,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ].divide(const SizedBox(height: 8.0)),
                          ),
                          Expanded(
                            child: FutureBuilder<ApiCallResponse>(
                              future: CastAndCrewCall.call(
                                movieId: widget.movieID?.toString(),
                                tmdbKey: FFAppConstants.tmdbKey,
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                final columnCastAndCrewResponse =
                                    snapshot.data!;

                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Builder(
                                      builder: (context) {
                                        final cast =
                                            CastAndCrewStruct.maybeFromMap(
                                                        columnCastAndCrewResponse
                                                            .jsonBody)
                                                    ?.cast
                                                    .toList() ??
                                                [];

                                        return SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: List.generate(cast.length,
                                                    (castIndex) {
                                              final castItem = cast[castIndex];
                                              return Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                    width: 100.0,
                                                    height: 100.0,
                                                    decoration: const BoxDecoration(),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Builder(
                                                          builder: (context) {
                                                            if (castItem
                                                                    .profilePath !=
                                                                'null') {
                                                              return Container(
                                                                width: 75.0,
                                                                height: 75.0,
                                                                clipBehavior: Clip
                                                                    .antiAlias,
                                                                decoration:
                                                                    const BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                                child: Image
                                                                    .network(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    'https://image.tmdb.org/t/p/original${castItem.profilePath}',
                                                                    'https://picsum.photos/seed/855/600',
                                                                  ),
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              );
                                                            } else {
                                                              return Container(
                                                                width: 75.0,
                                                                height: 75.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                                child: Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child: FaIcon(
                                                                    FontAwesomeIcons
                                                                        .user,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    size: 36.0,
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    castItem
                                                                        .name,
                                                                    '[name]',
                                                                  ).maybeHandleOverflow(
                                                                    maxChars:
                                                                        30,
                                                                    replacement:
                                                                        '…',
                                                                  ),
                                                                  maxLines: 1,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Outfit',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              );
                                            })
                                                .divide(const SizedBox(width: 8.0))
                                                .addToStart(
                                                    const SizedBox(width: 16.0))
                                                .addToEnd(
                                                    const SizedBox(width: 16.0)),
                                          ),
                                        );
                                      },
                                    ),
                                  ].divide(const SizedBox(height: 8.0)),
                                );
                              },
                            ),
                          ),
                        ]
                            .divide(const SizedBox(height: 16.0))
                            .around(const SizedBox(height: 16.0)),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
