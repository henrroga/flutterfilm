import '/backend/api_requests/api_calls.dart';
import '/components/movie_card/movie_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/skeletons/search_results_loading/search_results_loading_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'search_model.dart';
export 'search_model.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  late SearchModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
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
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100.0),
          child: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primary,
            automaticallyImplyLeading: false,
            title: Text(
              'Explore',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Outfit',
                    color: Colors.white,
                    fontSize: 22.0,
                  ),
            ),
            actions: const [],
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(70.0),
              child: Container(
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                  child: TextFormField(
                    controller: _model.textController,
                    focusNode: _model.textFieldFocusNode,
                    onChanged: (_) => EasyDebounce.debounce(
                      '_model.textController',
                      const Duration(milliseconds: 2000),
                      () async {
                        setState(() {
                          _model.input = _model.textController.text;
                        });
                      },
                    ),
                    autofocus: true,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelStyle: FlutterFlowTheme.of(context).labelMedium,
                      hintText: 'Search for movies...',
                      hintStyle: FlutterFlowTheme.of(context).labelMedium,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).alternate,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primary,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedErrorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      prefixIcon: const Icon(
                        Icons.search_sharp,
                      ),
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          color: FlutterFlowTheme.of(context).info,
                        ),
                    validator:
                        _model.textControllerValidator.asValidator(context),
                  ),
                ),
              ),
            ),
            centerTitle: false,
            elevation: 2.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Builder(
                  builder: (context) {
                    if (_model.input != null && _model.input != '') {
                      return FutureBuilder<ApiCallResponse>(
                        future: MovieSearchCall.call(
                          query: valueOrDefault<String>(
                            _model.input,
                            'any',
                          ),
                          tmdbKey: FFAppConstants.tmdbKey,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return const SearchResultsLoadingWidget();
                          }
                          final listViewMovieSearchResponse = snapshot.data!;
                          return Builder(
                            builder: (context) {
                              final result = MovieSearchCall.results(
                                    listViewMovieSearchResponse.jsonBody,
                                  )?.toList() ??
                                  [];
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.vertical,
                                itemCount: result.length,
                                itemBuilder: (context, resultIndex) {
                                  final resultItem = result[resultIndex];
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
                                              resultItem,
                                              r'''$.id''',
                                            ),
                                            ParamType.int,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                    child: MovieCardWidget(
                                      key: Key(
                                          'Keyyqc_${resultIndex}_of_${result.length}'),
                                      name: getJsonField(
                                        resultItem,
                                        r'''$.title''',
                                      ).toString(),
                                      poster: valueOrDefault<String>(
                                        getJsonField(
                                                  resultItem,
                                                  r'''$.poster_path''',
                                                ) !=
                                                null
                                            ? 'https://image.tmdb.org/t/p/original${getJsonField(
                                                resultItem,
                                                r'''$.poster_path''',
                                              ).toString()}'
                                            : 'https://media.comicbook.com/files/img/default-movie.png',
                                        'https://media.comicbook.com/files/img/default-movie.png',
                                      ),
                                      id: getJsonField(
                                        resultItem,
                                        r'''$.id''',
                                      ).toString(),
                                      year: functions.getYear(getJsonField(
                                        resultItem,
                                        r'''$.release_date''',
                                      ).toString()),
                                    ),
                                  );
                                },
                              );
                            },
                          );
                        },
                      );
                    } else {
                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Search for any movie above',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    }
                  },
                ),
              ),
            ].divide(const SizedBox(height: 8.0)).addToStart(const SizedBox(height: 8.0)),
          ),
        ),
      ),
    );
  }
}
