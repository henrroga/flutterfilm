import '/backend/api_requests/api_calls.dart';
import '/components/genre/genre_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
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

    _model.expandableController = ExpandableController(initialExpanded: false);
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
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () async {
                if (FFAppState()
                    .watchlist
                    .contains(widget.movieID?.toString())) {
                  setState(() {
                    FFAppState()
                        .removeFromWatchlist(widget.movieID!.toString());
                  });
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
                  setState(() {
                    FFAppState().addToWatchlist(widget.movieID!.toString());
                  });
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
              backgroundColor: FlutterFlowTheme.of(context).tertiary,
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
                          color: FlutterFlowTheme.of(context).lightCyan,
                          size: 24.0,
                        ),
                        Text(
                          'Add to watchlist',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Readex Pro',
                                color: FlutterFlowTheme.of(context).lightCyan,
                                fontSize: 16.0,
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
                          color: FlutterFlowTheme.of(context).lightCyan,
                          size: 24.0,
                        ),
                        Text(
                          'Remove from watchlist',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Readex Pro',
                                color: FlutterFlowTheme.of(context).lightCyan,
                                fontSize: 16.0,
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
                SliverAppBar(
                  expandedHeight: 250.0,
                  collapsedHeight: 75.0,
                  pinned: true,
                  floating: false,
                  backgroundColor: FlutterFlowTheme.of(context).primary,
                  automaticallyImplyLeading: false,
                  actions: const [],
                  flexibleSpace: FlexibleSpaceBar(
                    title: Text(
                      '${MovieDetailsCall.title(
                        movieDetailsMovieDetailsResponse.jsonBody,
                      )} (${functions.getYear(MovieDetailsCall.date(
                        movieDetailsMovieDetailsResponse.jsonBody,
                      )!)})',
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
                                fontFamily: 'Outfit',
                                color: Colors.white,
                                fontSize: 22.0,
                              ),
                    ),
                    background: ClipRRect(
                      borderRadius: BorderRadius.circular(0.0),
                      child: Image.network(
                        valueOrDefault<String>(
                          getJsonField(
                                    movieDetailsMovieDetailsResponse.jsonBody,
                                    r'''$.backdrop_path''',
                                  ) !=
                                  null
                              ? 'https://image.tmdb.org/t/p/original${getJsonField(
                                  movieDetailsMovieDetailsResponse.jsonBody,
                                  r'''$.backdrop_path''',
                                ).toString()}'
                              : 'https://media.comicbook.com/files/img/default-movie.png',
                          'https://media.comicbook.com/files/img/default-movie.png',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    centerTitle: false,
                    expandedTitleScale: 1.0,
                    titlePadding: const EdgeInsets.all(16.0),
                  ),
                  toolbarHeight: 75.0,
                  elevation: 2.0,
                )
              ],
              body: Builder(
                builder: (context) {
                  return SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        '${MovieDetailsCall.runtime(
                                          movieDetailsMovieDetailsResponse
                                              .jsonBody,
                                        )?.toString()} mins',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                    ].divide(const SizedBox(width: 2.0)),
                                  ),
                                  Container(
                                    height: 180.0,
                                    decoration: const BoxDecoration(),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Builder(
                                            builder: (context) {
                                              final genre =
                                                  MovieDetailsCall.genres(
                                                        movieDetailsMovieDetailsResponse
                                                            .jsonBody,
                                                      )?.toList() ??
                                                      [];
                                              return Wrap(
                                                spacing: 8.0,
                                                runSpacing: 8.0,
                                                alignment: WrapAlignment.start,
                                                crossAxisAlignment:
                                                    WrapCrossAlignment.start,
                                                direction: Axis.horizontal,
                                                runAlignment:
                                                    WrapAlignment.start,
                                                verticalDirection:
                                                    VerticalDirection.down,
                                                clipBehavior: Clip.antiAlias,
                                                children: List.generate(
                                                    genre.length, (genreIndex) {
                                                  final genreItem =
                                                      genre[genreIndex];
                                                  return GenreWidget(
                                                    key: Key(
                                                        'Keygwp_${genreIndex}_of_${genre.length}'),
                                                    name: getJsonField(
                                                      genreItem,
                                                      r'''$.name''',
                                                    ).toString(),
                                                  );
                                                }),
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ].divide(const SizedBox(height: 16.0)),
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.network(
                                    valueOrDefault<String>(
                                      getJsonField(
                                                movieDetailsMovieDetailsResponse
                                                    .jsonBody,
                                                r'''$.poster_path''',
                                              ) !=
                                              null
                                          ? 'https://image.tmdb.org/t/p/original${getJsonField(
                                              movieDetailsMovieDetailsResponse
                                                  .jsonBody,
                                              r'''$.poster_path''',
                                            ).toString()}'
                                          : 'https://media.comicbook.com/files/img/default-movie.png',
                                      'https://media.comicbook.com/files/img/default-movie.png',
                                    ),
                                    width: 150.0,
                                    height: 200.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          ]
                              .divide(const SizedBox(width: 8.0))
                              .addToStart(const SizedBox(width: 16.0))
                              .addToEnd(const SizedBox(width: 16.0)),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            color: const Color(0x00000000),
                            child: ExpandableNotifier(
                              controller: _model.expandableController,
                              child: ExpandablePanel(
                                header: Text(
                                  valueOrDefault<String>(
                                    MovieDetailsCall.tagline(
                                      movieDetailsMovieDetailsResponse.jsonBody,
                                    ),
                                    '[tagline]',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .displaySmall
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                                collapsed: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              valueOrDefault<String>(
                                                MovieDetailsCall.overview(
                                                  movieDetailsMovieDetailsResponse
                                                      .jsonBody,
                                                ),
                                                '[overview]',
                                              ).maybeHandleOverflow(
                                                maxChars: 120,
                                                replacement: '…',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          'View more...',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                expanded: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 8.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          valueOrDefault<String>(
                                            MovieDetailsCall.overview(
                                              movieDetailsMovieDetailsResponse
                                                  .jsonBody,
                                            ),
                                            '[overview]',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                theme: const ExpandableThemeData(
                                  tapHeaderToExpand: false,
                                  tapBodyToExpand: true,
                                  tapBodyToCollapse: true,
                                  headerAlignment:
                                      ExpandablePanelHeaderAlignment.center,
                                  hasIcon: false,
                                ),
                              ),
                            ),
                          ),
                        ),
                        FutureBuilder<ApiCallResponse>(
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
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                ),
                              );
                            }
                            final columnCastAndCrewResponse = snapshot.data!;
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Cast',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ].addToStart(const SizedBox(width: 16.0)),
                                ),
                                Builder(
                                  builder: (context) {
                                    final cast = CastAndCrewCall.cast(
                                          columnCastAndCrewResponse.jsonBody,
                                        )?.toList() ??
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
                                          return Container(
                                            width: 80.0,
                                            height: 120.0,
                                            decoration: const BoxDecoration(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 5.0,
                                                                0.0, 0.0),
                                                    child: Container(
                                                      width: 60.0,
                                                      height: 60.0,
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      decoration: const BoxDecoration(
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Image.network(
                                                        valueOrDefault<String>(
                                                          getJsonField(
                                                                    castItem,
                                                                    r'''$.profile_path''',
                                                                  ) !=
                                                                  null
                                                              ? 'https://image.tmdb.org/t/p/original${getJsonField(
                                                                  castItem,
                                                                  r'''$.profile_path''',
                                                                ).toString()}'
                                                              : 'https://icon-library.com/images/anonymous-avatar-icon/anonymous-avatar-icon-25.jpg',
                                                          'https://icon-library.com/images/anonymous-avatar-icon/anonymous-avatar-icon-25.jpg',
                                                        ),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    AutoSizeText(
                                                      getJsonField(
                                                        castItem,
                                                        r'''$.name''',
                                                      ).toString(),
                                                      textAlign:
                                                          TextAlign.center,
                                                      maxLines: 2,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 12.0,
                                                              ),
                                                      minFontSize: 12.0,
                                                    ),
                                                    AutoSizeText(
                                                      getJsonField(
                                                        castItem,
                                                        r'''$.character''',
                                                      )
                                                          .toString()
                                                          .maybeHandleOverflow(
                                                            maxChars: 100,
                                                            replacement: '…',
                                                          ),
                                                      textAlign:
                                                          TextAlign.center,
                                                      maxLines: 1,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                fontSize: 12.0,
                                                              ),
                                                      minFontSize: 12.0,
                                                    ),
                                                  ],
                                                ),
                                              ].divide(const SizedBox(height: 4.0)),
                                            ),
                                          );
                                        })
                                            .divide(const SizedBox(width: 5.0))
                                            .addToStart(const SizedBox(width: 16.0))
                                            .addToEnd(const SizedBox(width: 16.0)),
                                      ),
                                    );
                                  },
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Crew',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ]
                                      .addToStart(const SizedBox(width: 16.0))
                                      .addToEnd(const SizedBox(width: 16.0)),
                                ),
                                Builder(
                                  builder: (context) {
                                    final crew = CastAndCrewCall.crew(
                                          columnCastAndCrewResponse.jsonBody,
                                        )?.toList() ??
                                        [];
                                    return SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: List.generate(crew.length,
                                                (crewIndex) {
                                          final crewItem = crew[crewIndex];
                                          return Container(
                                            width: 80.0,
                                            height: 120.0,
                                            decoration: const BoxDecoration(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 5.0,
                                                                0.0, 0.0),
                                                    child: Container(
                                                      width: 60.0,
                                                      height: 60.0,
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      decoration: const BoxDecoration(
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Image.network(
                                                        valueOrDefault<String>(
                                                          getJsonField(
                                                                    crewItem,
                                                                    r'''$.profile_path''',
                                                                  ) !=
                                                                  null
                                                              ? 'https://image.tmdb.org/t/p/original${getJsonField(
                                                                  crewItem,
                                                                  r'''$.profile_path''',
                                                                ).toString()}'
                                                              : 'https://icon-library.com/images/anonymous-avatar-icon/anonymous-avatar-icon-25.jpg',
                                                          'https://icon-library.com/images/anonymous-avatar-icon/anonymous-avatar-icon-25.jpg',
                                                        ),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    AutoSizeText(
                                                      getJsonField(
                                                        crewItem,
                                                        r'''$.name''',
                                                      ).toString(),
                                                      textAlign:
                                                          TextAlign.center,
                                                      maxLines: 2,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 12.0,
                                                              ),
                                                      minFontSize: 12.0,
                                                    ),
                                                    AutoSizeText(
                                                      getJsonField(
                                                        crewItem,
                                                        r'''$.job''',
                                                      )
                                                          .toString()
                                                          .maybeHandleOverflow(
                                                            maxChars: 100,
                                                            replacement: '…',
                                                          ),
                                                      textAlign:
                                                          TextAlign.center,
                                                      maxLines: 1,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                fontSize: 12.0,
                                                              ),
                                                      minFontSize: 12.0,
                                                    ),
                                                  ],
                                                ),
                                              ].divide(const SizedBox(height: 4.0)),
                                            ),
                                          );
                                        })
                                            .divide(const SizedBox(width: 5.0))
                                            .addToStart(const SizedBox(width: 16.0))
                                            .addToEnd(const SizedBox(width: 16.0)),
                                      ),
                                    );
                                  },
                                ),
                              ].divide(const SizedBox(height: 8.0)),
                            );
                          },
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: 100.0,
                            decoration: const BoxDecoration(),
                          ),
                        ),
                      ]
                          .divide(const SizedBox(height: 16.0))
                          .addToStart(const SizedBox(height: 16.0))
                          .addToEnd(const SizedBox(height: 16.0)),
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
