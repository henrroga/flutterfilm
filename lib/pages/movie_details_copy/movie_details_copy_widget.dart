import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/genre/genre_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'movie_details_copy_model.dart';
export 'movie_details_copy_model.dart';

class MovieDetailsCopyWidget extends StatefulWidget {
  const MovieDetailsCopyWidget({
    super.key,
    required this.movieID,
  });

  final int? movieID;

  @override
  State<MovieDetailsCopyWidget> createState() => _MovieDetailsCopyWidgetState();
}

class _MovieDetailsCopyWidgetState extends State<MovieDetailsCopyWidget> {
  late MovieDetailsCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MovieDetailsCopyModel());

    _model.expandableExpandableController =
        ExpandableController(initialExpanded: false);
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
        final movieDetailsCopyMovieDetailsResponse = snapshot.data!;

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
                            movieDetailsCopyMovieDetailsResponse.jsonBody)
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
                                  '${MovieStruct.maybeFromMap(movieDetailsCopyMovieDetailsResponse.jsonBody)?.title} (${functions.getYear(MovieStruct.maybeFromMap(movieDetailsCopyMovieDetailsResponse.jsonBody)!.releaseDate)})'
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
                            'https://image.tmdb.org/t/p/original${MovieStruct.maybeFromMap(movieDetailsCopyMovieDetailsResponse.jsonBody)?.backdropPath}',
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
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                                        movieDetailsCopyMovieDetailsResponse
                                                            .jsonBody)
                                                    ?.posterPath !=
                                                'null'
                                            ? 'https://image.tmdb.org/t/p/original${MovieStruct.maybeFromMap(movieDetailsCopyMovieDetailsResponse.jsonBody)?.posterPath}'
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
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (MovieStruct.maybeFromMap(
                                                movieDetailsCopyMovieDetailsResponse
                                                    .jsonBody)
                                            ?.backdropPath ==
                                        'null')
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
                                                            movieDetailsCopyMovieDetailsResponse
                                                                .jsonBody)
                                                        ?.title,
                                                    'Title',
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
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 4.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            '${MovieDetailsCall.runtime(
                                              movieDetailsCopyMovieDetailsResponse
                                                  .jsonBody,
                                            )?.toString()} mins',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ].divide(const SizedBox(width: 2.0)),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 0.0),
                                        child: Builder(
                                          builder: (context) {
                                            final genre = MovieStruct.maybeFromMap(
                                                        movieDetailsCopyMovieDetailsResponse
                                                            .jsonBody)
                                                    ?.genres
                                                    .toList() ??
                                                [];

                                            return Wrap(
                                              spacing: 8.0,
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
                                                  genre.length, (genreIndex) {
                                                final genreItem =
                                                    genre[genreIndex];
                                                return GenreWidget(
                                                  key: Key(
                                                      'Keyl8n_${genreIndex}_of_${genre.length}'),
                                                  name: genreItem.name,
                                                );
                                              }),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ]
                                .divide(const SizedBox(width: 16.0))
                                .around(const SizedBox(width: 16.0)),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                color: const Color(0x00000000),
                                child: ExpandableNotifier(
                                  controller:
                                      _model.expandableExpandableController,
                                  child: ExpandablePanel(
                                    header: Text(
                                      valueOrDefault<String>(
                                        MovieStruct.maybeFromMap(
                                                movieDetailsCopyMovieDetailsResponse
                                                    .jsonBody)
                                            ?.tagline,
                                        '[tagline]',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .displaySmall
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                    collapsed: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 8.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  valueOrDefault<String>(
                                                    MovieStruct.maybeFromMap(
                                                            movieDetailsCopyMovieDetailsResponse
                                                                .jsonBody)
                                                        ?.overview,
                                                    '[overview]',
                                                  ).maybeHandleOverflow(
                                                    maxChars: 120,
                                                    replacement: '…',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        letterSpacing: 0.0,
                                                      ),
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
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        letterSpacing: 0.0,
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
                                                MovieStruct.maybeFromMap(
                                                        movieDetailsCopyMovieDetailsResponse
                                                            .jsonBody)
                                                    ?.overview,
                                                '[overview]',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        letterSpacing: 0.0,
                                                      ),
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
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            'Cast',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
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
                                              return Container(
                                                width: 80.0,
                                                height: 120.0,
                                                decoration: const BoxDecoration(),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
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
                                                                .fromSTEB(
                                                                    0.0,
                                                                    5.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Container(
                                                          width: 60.0,
                                                          height: 60.0,
                                                          clipBehavior:
                                                              Clip.antiAlias,
                                                          decoration:
                                                              const BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: Image.network(
                                                            valueOrDefault<
                                                                String>(
                                                              castItem.profilePath !=
                                                                      'null'
                                                                  ? 'https://image.tmdb.org/t/p/original${castItem.profilePath}'
                                                                  : 'https://icon-library.com/images/anonymous-avatar-icon/anonymous-avatar-icon-25.jpg',
                                                              'https://icon-library.com/images/anonymous-avatar-icon/anonymous-avatar-icon-25.jpg',
                                                            ),
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child: AutoSizeText(
                                                              valueOrDefault<
                                                                  String>(
                                                                castItem.name,
                                                                '[name]',
                                                              ).maybeHandleOverflow(
                                                                maxChars: 60,
                                                                replacement:
                                                                    '…',
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              maxLines: 2,
                                                              minFontSize: 12.0,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Outfit',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: AutoSizeText(
                                                              valueOrDefault<
                                                                  String>(
                                                                castItem
                                                                    .character,
                                                                '[character]',
                                                              ).maybeHandleOverflow(
                                                                maxChars: 30,
                                                                replacement:
                                                                    '…',
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              maxLines: 1,
                                                              minFontSize: 12.0,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Outfit',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    fontSize:
                                                                        12.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ].divide(
                                                      const SizedBox(height: 4.0)),
                                                ),
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
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            'Crew',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Builder(
                                      builder: (context) {
                                        final crew =
                                            CastAndCrewStruct.maybeFromMap(
                                                        columnCastAndCrewResponse
                                                            .jsonBody)
                                                    ?.crew
                                                    .toList() ??
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
                                                  mainAxisSize:
                                                      MainAxisSize.max,
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
                                                                .fromSTEB(
                                                                    0.0,
                                                                    5.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Container(
                                                          width: 60.0,
                                                          height: 60.0,
                                                          clipBehavior:
                                                              Clip.antiAlias,
                                                          decoration:
                                                              const BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: Image.network(
                                                            valueOrDefault<
                                                                String>(
                                                              crewItem.profilePath !=
                                                                      'null'
                                                                  ? 'https://image.tmdb.org/t/p/original${crewItem.profilePath}'
                                                                  : 'https://icon-library.com/images/anonymous-avatar-icon/anonymous-avatar-icon-25.jpg',
                                                              'https://icon-library.com/images/anonymous-avatar-icon/anonymous-avatar-icon-25.jpg',
                                                            ),
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child: AutoSizeText(
                                                              valueOrDefault<
                                                                  String>(
                                                                crewItem.name,
                                                                '[name]',
                                                              ).maybeHandleOverflow(
                                                                maxChars: 60,
                                                                replacement:
                                                                    '…',
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              maxLines: 2,
                                                              minFontSize: 12.0,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Outfit',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: AutoSizeText(
                                                              valueOrDefault<
                                                                  String>(
                                                                crewItem.job,
                                                                '[job]',
                                                              ).maybeHandleOverflow(
                                                                maxChars: 30,
                                                                replacement:
                                                                    '…',
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              maxLines: 1,
                                                              minFontSize: 12.0,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Outfit',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    fontSize:
                                                                        12.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ].divide(
                                                      const SizedBox(height: 4.0)),
                                                ),
                                              );
                                            })
                                                .divide(const SizedBox(width: 5.0))
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
                            .addToStart(const SizedBox(height: 16.0))
                            .addToEnd(const SizedBox(height: 20.0)),
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
