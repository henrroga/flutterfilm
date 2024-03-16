import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'movie_card_model.dart';
export 'movie_card_model.dart';

class MovieCardWidget extends StatefulWidget {
  const MovieCardWidget({
    super.key,
    required this.name,
    required this.poster,
    required this.id,
    required this.year,
  });

  final String? name;
  final String? poster;
  final String? id;
  final String? year;

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
      height: 100.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(0.0),
                          child: Image.network(
                            widget.poster!,
                            width: 75.0,
                            height: 100.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(
                                valueOrDefault<String>(
                                  widget.name,
                                  '[name]',
                                ).maybeHandleOverflow(
                                  maxChars: 50,
                                  replacement: '…',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              valueOrDefault<String>(
                                widget.year,
                                '[year]',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontSize: 12.0,
                                  ),
                            ),
                          ],
                        ),
                      ].divide(const SizedBox(height: 4.0)),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Builder(
                            builder: (context) {
                              if (FFAppState().watchlist.contains(widget.id)) {
                                return FlutterFlowIconButton(
                                  borderRadius: 20.0,
                                  buttonSize: 48.0,
                                  icon: Icon(
                                    Icons.bookmark,
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    size: 30.0,
                                  ),
                                  onPressed: () async {
                                    setState(() {
                                      FFAppState()
                                          .removeFromWatchlist(widget.id!);
                                    });
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'This movie is removed from your watchlist',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16.0,
                                          ),
                                        ),
                                        duration: const Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .tertiary,
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
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    size: 30.0,
                                  ),
                                  onPressed: () async {
                                    setState(() {
                                      FFAppState().addToWatchlist(widget.id!);
                                    });
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'This movie is added to your watchlist',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16.0,
                                          ),
                                        ),
                                        duration: const Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                      ),
                                    );
                                  },
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ].divide(const SizedBox(width: 16.0)),
              ),
            ),
          ),
          const Divider(
            height: 1.0,
            thickness: 1.0,
            color: Color(0x747F8388),
          ),
        ],
      ),
    );
  }
}
