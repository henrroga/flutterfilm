import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
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
            'FlutterFilm',
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
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
                            final popularPoster = (HomeFeedStruct.maybeFromMap(
                                            carouselPopularResponse.jsonBody)
                                        ?.results
                                        .toList() ??
                                    [])
                                .take(5)
                                .toList();

                            return SizedBox(
                              width: double.infinity,
                              height: 200.0,
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
                                            popularPosterItem.id,
                                            ParamType.int,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.network(
                                        valueOrDefault<String>(
                                          'https://image.tmdb.org/t/p/original${popularPosterItem.backdropPath}',
                                          'https://picsum.photos/seed/243/600',
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  );
                                },
                                carouselController:
                                    _model.carouselController ??=
                                        CarouselSliderController(),
                                options: CarouselOptions(
                                  initialPage:
                                      max(0, min(1, popularPoster.length - 1)),
                                  viewportFraction: 0.95,
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
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'Now Playing',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Outfit',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                      ],
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
                            final nowPlayingMovie = HomeFeedStruct.maybeFromMap(
                                        rowNowPlayingResponse.jsonBody)
                                    ?.results
                                    .toList() ??
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
                                                nowPlayingMovieItem.id,
                                                ParamType.int,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                        child: Hero(
                                          tag: valueOrDefault<String>(
                                            'https://image.tmdb.org/t/p/original${nowPlayingMovieItem.posterPath}',
                                            'https://picsum.photos/seed/293/600' '$nowPlayingMovieIndex',
                                          ),
                                          transitionOnUserGestures: true,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.network(
                                              valueOrDefault<String>(
                                                'https://image.tmdb.org/t/p/original${nowPlayingMovieItem.posterPath}',
                                                'https://picsum.photos/seed/293/600',
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
                                    .divide(const SizedBox(width: 12.0))
                                    .around(const SizedBox(width: 12.0)),
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
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'Upcoming Movies',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Outfit',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                      ],
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
                            final upcomingMovie = (HomeFeedStruct.maybeFromMap(
                                            rowUpcomingMoviesResponse.jsonBody)
                                        ?.results
                                        .toList() ??
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
                                                upcomingMovieItem.id,
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
                                              'https://image.tmdb.org/t/p/original${upcomingMovieItem.posterPath}',
                                              'https://picsum.photos/seed/293/600',
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
                                    .divide(const SizedBox(width: 12.0))
                                    .around(const SizedBox(width: 12.0)),
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
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'Top Rated',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Outfit',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                      ],
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
                            final topRatedMovie = (HomeFeedStruct.maybeFromMap(
                                            rowTopRatedResponse.jsonBody)
                                        ?.results
                                        .toList() ??
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
                                                topRatedMovieItem.id,
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
                                              'https://image.tmdb.org/t/p/original${topRatedMovieItem.posterPath}',
                                              'https://picsum.photos/seed/293/600',
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
                                    .divide(const SizedBox(width: 12.0))
                                    .around(const SizedBox(width: 12.0)),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ].divide(const SizedBox(height: 8.0)),
                ),
              ].divide(const SizedBox(height: 12.0)).addToEnd(const SizedBox(height: 12.0)),
            ),
          ),
        ),
      ),
    );
  }
}
