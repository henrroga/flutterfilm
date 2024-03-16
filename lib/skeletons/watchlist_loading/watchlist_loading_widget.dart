import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'watchlist_loading_model.dart';
export 'watchlist_loading_model.dart';

class WatchlistLoadingWidget extends StatefulWidget {
  const WatchlistLoadingWidget({super.key});

  @override
  State<WatchlistLoadingWidget> createState() => _WatchlistLoadingWidgetState();
}

class _WatchlistLoadingWidgetState extends State<WatchlistLoadingWidget>
    with TickerProviderStateMixin {
  late WatchlistLoadingModel _model;

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        ShimmerEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          color: const Color(0xB27F8388),
          angle: 0.524,
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WatchlistLoadingModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      height: 100.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).alternate,
      ),
    ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!);
  }
}
