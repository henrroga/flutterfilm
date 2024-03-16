import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'genre_model.dart';
export 'genre_model.dart';

class GenreWidget extends StatefulWidget {
  const GenreWidget({
    super.key,
    required this.name,
  });

  final String? name;

  @override
  State<GenreWidget> createState() => _GenreWidgetState();
}

class _GenreWidgetState extends State<GenreWidget> {
  late GenreModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GenreModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).tertiary,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AutoSizeText(
              valueOrDefault<String>(
                widget.name,
                'name',
              ),
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Readex Pro',
                    color: FlutterFlowTheme.of(context).info,
                    letterSpacing: 0.3,
                    fontWeight: FontWeight.w600,
                  ),
              minFontSize: 12.0,
            ),
          ],
        ),
      ),
    );
  }
}
