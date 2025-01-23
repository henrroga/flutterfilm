import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'movie_card_model.dart';
export 'movie_card_model.dart';

class MovieCardWidget extends StatefulWidget {
  const MovieCardWidget({
    super.key,
    required this.movie,
  });

  final MovieResultStruct? movie;

  @override
  State<MovieCardWidget> createState() => _MovieCardWidgetState();
}

class _MovieCardWidgetState extends State<MovieCardWidget> {
  late MovieCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MovieCardModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).alternate,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      valueOrDefault<String>(
                        widget.movie?.posterPath != 'null'
                            ? 'https://image.tmdb.org/t/p/original${widget.movie?.posterPath}'
                            : 'https://blocks.astratic.com/img/general-img-portrait.png',
                        'https://blocks.astratic.com/img/general-img-portrait.png',
                      ),
                      width: 100.0,
                      height: 120.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${valueOrDefault<String>(
                                  widget.movie?.title,
                                  '[title]',
                                )} (${functions.getYear(widget.movie!.releaseDate)})',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Outfit',
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Builder(
                builder: (context) {
                  if (FFAppState()
                      .watchlist
                      .contains(widget.movie?.id.toString())) {
                    return FlutterFlowIconButton(
                      borderRadius: 20.0,
                      buttonSize: 48.0,
                      icon: Icon(
                        Icons.bookmark,
                        color: FlutterFlowTheme.of(context).secondary,
                        size: 30.0,
                      ),
                      onPressed: () async {
                        FFAppState()
                            .removeFromWatchlist(widget.movie!.id.toString());
                        safeSetState(() {});
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'This movie is removed from your watchlist',
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context).info,
                                fontWeight: FontWeight.w500,
                                fontSize: 16.0,
                              ),
                            ),
                            duration: const Duration(milliseconds: 4000),
                            backgroundColor:
                                FlutterFlowTheme.of(context).tertiary,
                          ),
                        );
                      },
                    );
                  } else {
                    return FlutterFlowIconButton(
                      borderRadius: 20.0,
                      buttonSize: 48.0,
                      icon: Icon(
                        Icons.bookmark_border,
                        color: FlutterFlowTheme.of(context).secondary,
                        size: 30.0,
                      ),
                      onPressed: () async {
                        FFAppState()
                            .addToWatchlist(widget.movie!.id.toString());
                        safeSetState(() {});
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'This movie is added to your watchlist',
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context).info,
                                fontWeight: FontWeight.w500,
                                fontSize: 16.0,
                              ),
                            ),
                            duration: const Duration(milliseconds: 4000),
                            backgroundColor:
                                FlutterFlowTheme.of(context).secondary,
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ].divide(const SizedBox(width: 16.0)),
          ),
        ],
      ),
    );
  }
}
