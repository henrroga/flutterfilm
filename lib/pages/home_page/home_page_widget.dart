import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/skeletons/carousel_loading/carousel_loading_widget.dart';
import '/skeletons/posters_loading/posters_loading_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            'FlutterFilm',
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Featuring',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ],
                      ),
                    ),
                    FutureBuilder<ApiCallResponse>(
                      future: PopularCall.call(
                        tmdbKey: FFAppConstants.tmdbKey,
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return const CarouselLoadingWidget();
                        }
                        final carouselPopularResponse = snapshot.data!;
                        return Builder(
                          builder: (context) {
                            final popularPoster = (PopularCall.results(
                                      carouselPopularResponse.jsonBody,
                                    )?.toList() ??
                                    [])
                                .take(5)
                                .toList();
                            return SizedBox(
                              width: double.infinity,
                              height: 180.0,
                              child: CarouselSlider.builder(
                                itemCount: popularPoster.length,
                                itemBuilder: (context, popularPosterIndex, _) {
                                  final popularPosterItem =
                                      popularPoster[popularPosterIndex];
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
                                            PopularCall.movieID(
                                              carouselPopularResponse.jsonBody,
                                            )?[popularPosterIndex],
                                            ParamType.int,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.network(
                                        valueOrDefault<String>(
                                          getJsonField(
                                                    popularPosterItem,
                                                    r'''$.backdrop_path''',
                                                  ) !=
                                                  null
                                              ? 'https://image.tmdb.org/t/p/original${getJsonField(
                                                  popularPosterItem,
                                                  r'''$.backdrop_path''',
                                                ).toString()}'
                                              : 'https://media.comicbook.com/files/img/default-movie.png',
                                          'https://media.comicbook.com/files/img/default-movie.png',
                                        ),
                                        width: 300.0,
                                        height: 200.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  );
                                },
                                carouselController:
                                    _model.carouselController ??=
                                        CarouselController(),
                                options: CarouselOptions(
                                  initialPage: min(1, popularPoster.length - 1),
                                  viewportFraction: 0.9,
                                  disableCenter: true,
                                  enlargeCenterPage: true,
                                  enlargeFactor: 0.25,
                                  enableInfiniteScroll: true,
                                  scrollDirection: Axis.horizontal,
                                  autoPlay: false,
                                  onPageChanged: (index, _) =>
                                      _model.carouselCurrentIndex = index,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ].divide(const SizedBox(height: 16.0)),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Now Playing',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Readex Pro',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                      ].addToStart(const SizedBox(width: 16.0)),
                    ),
                    FutureBuilder<ApiCallResponse>(
                      future: NowPlayingCall.call(
                        tmdbKey: FFAppConstants.tmdbKey,
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return const PostersLoadingWidget();
                        }
                        final rowNowPlayingResponse = snapshot.data!;
                        return Builder(
                          builder: (context) {
                            final nowPlayingMovie = NowPlayingCall.results(
                                  rowNowPlayingResponse.jsonBody,
                                )?.toList() ??
                                [];
                            return SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: List.generate(nowPlayingMovie.length,
                                        (nowPlayingMovieIndex) {
                                  final nowPlayingMovieItem =
                                      nowPlayingMovie[nowPlayingMovieIndex];
                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                            'MovieDetails',
                                            queryParameters: {
                                              'movieID': serializeParam(
                                                NowPlayingCall.movieID(
                                                  rowNowPlayingResponse
                                                      .jsonBody,
                                                )?[nowPlayingMovieIndex],
                                                ParamType.int,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                        child: Hero(
                                          tag: valueOrDefault<String>(
                                            getJsonField(
                                                      nowPlayingMovieItem,
                                                      r'''$.poster_path''',
                                                    ) !=
                                                    null
                                                ? 'https://image.tmdb.org/t/p/original${getJsonField(
                                                    nowPlayingMovieItem,
                                                    r'''$.poster_path''',
                                                  ).toString()}'
                                                : 'https://media.comicbook.com/files/img/default-movie.png',
                                            'https://media.comicbook.com/files/img/default-movie.png' '$nowPlayingMovieIndex',
                                          ),
                                          transitionOnUserGestures: true,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.network(
                                              valueOrDefault<String>(
                                                getJsonField(
                                                          nowPlayingMovieItem,
                                                          r'''$.poster_path''',
                                                        ) !=
                                                        null
                                                    ? 'https://image.tmdb.org/t/p/original${getJsonField(
                                                        nowPlayingMovieItem,
                                                        r'''$.poster_path''',
                                                      ).toString()}'
                                                    : 'https://media.comicbook.com/files/img/default-movie.png',
                                                'https://media.comicbook.com/files/img/default-movie.png',
                                              ),
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.25,
                                              height: 150.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                })
                                    .divide(const SizedBox(width: 8.0))
                                    .addToStart(const SizedBox(width: 16.0))
                                    .addToEnd(const SizedBox(width: 16.0)),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ].divide(const SizedBox(height: 8.0)),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Upcoming Movies',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Readex Pro',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                      ]
                          .addToStart(const SizedBox(width: 16.0))
                          .addToEnd(const SizedBox(width: 16.0)),
                    ),
                    FutureBuilder<ApiCallResponse>(
                      future: UpcomingMoviesCall.call(
                        tmdbKey: FFAppConstants.tmdbKey,
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return const PostersLoadingWidget();
                        }
                        final rowUpcomingMoviesResponse = snapshot.data!;
                        return Builder(
                          builder: (context) {
                            final upcomingMovie = (UpcomingMoviesCall.results(
                                      rowUpcomingMoviesResponse.jsonBody,
                                    )?.toList() ??
                                    [])
                                .take(10)
                                .toList();
                            return SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: List.generate(upcomingMovie.length,
                                        (upcomingMovieIndex) {
                                  final upcomingMovieItem =
                                      upcomingMovie[upcomingMovieIndex];
                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                            'MovieDetails',
                                            queryParameters: {
                                              'movieID': serializeParam(
                                                UpcomingMoviesCall.id(
                                                  rowUpcomingMoviesResponse
                                                      .jsonBody,
                                                )?[upcomingMovieIndex],
                                                ParamType.int,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.network(
                                            valueOrDefault<String>(
                                              getJsonField(
                                                        upcomingMovieItem,
                                                        r'''$.poster_path''',
                                                      ) !=
                                                      null
                                                  ? 'https://image.tmdb.org/t/p/original${getJsonField(
                                                      upcomingMovieItem,
                                                      r'''$.poster_path''',
                                                    ).toString()}'
                                                  : 'https://media.comicbook.com/files/img/default-movie.png',
                                              'https://media.comicbook.com/files/img/default-movie.png',
                                            ),
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.25,
                                            height: 150.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                })
                                    .divide(const SizedBox(width: 8.0))
                                    .addToStart(const SizedBox(width: 16.0))
                                    .addToEnd(const SizedBox(width: 16.0)),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ].divide(const SizedBox(height: 8.0)),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Top Rated',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Readex Pro',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                      ]
                          .addToStart(const SizedBox(width: 16.0))
                          .addToEnd(const SizedBox(width: 16.0)),
                    ),
                    FutureBuilder<ApiCallResponse>(
                      future: TopRatedCall.call(
                        tmdbKey: FFAppConstants.tmdbKey,
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return const PostersLoadingWidget();
                        }
                        final rowTopRatedResponse = snapshot.data!;
                        return Builder(
                          builder: (context) {
                            final topRatedMovie = (TopRatedCall.results(
                                      rowTopRatedResponse.jsonBody,
                                    )?.toList() ??
                                    [])
                                .take(10)
                                .toList();
                            return SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: List.generate(topRatedMovie.length,
                                        (topRatedMovieIndex) {
                                  final topRatedMovieItem =
                                      topRatedMovie[topRatedMovieIndex];
                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                            'MovieDetails',
                                            queryParameters: {
                                              'movieID': serializeParam(
                                                TopRatedCall.id(
                                                  rowTopRatedResponse.jsonBody,
                                                )?[topRatedMovieIndex],
                                                ParamType.int,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.network(
                                            valueOrDefault<String>(
                                              getJsonField(
                                                        topRatedMovieItem,
                                                        r'''$.poster_path''',
                                                      ) !=
                                                      null
                                                  ? 'https://image.tmdb.org/t/p/original${getJsonField(
                                                      topRatedMovieItem,
                                                      r'''$.poster_path''',
                                                    ).toString()}'
                                                  : 'https://media.comicbook.com/files/img/default-movie.png',
                                              'https://media.comicbook.com/files/img/default-movie.png',
                                            ),
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.25,
                                            height: 150.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                })
                                    .divide(const SizedBox(width: 8.0))
                                    .addToStart(const SizedBox(width: 16.0))
                                    .addToEnd(const SizedBox(width: 16.0)),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ].divide(const SizedBox(height: 8.0)),
                ),
              ]
                  .divide(const SizedBox(height: 32.0))
                  .addToStart(const SizedBox(height: 16.0))
                  .addToEnd(const SizedBox(height: 16.0)),
            ),
          ),
        ),
      ),
    );
  }
}
