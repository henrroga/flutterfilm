import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'search_results_loading_model.dart';
export 'search_results_loading_model.dart';

class SearchResultsLoadingWidget extends StatefulWidget {
  const SearchResultsLoadingWidget({super.key});

  @override
  State<SearchResultsLoadingWidget> createState() =>
      _SearchResultsLoadingWidgetState();
}

class _SearchResultsLoadingWidgetState extends State<SearchResultsLoadingWidget>
    with TickerProviderStateMixin {
  late SearchResultsLoadingModel _model;

  final animationsMap = {
    'containerOnPageLoadAnimation1': AnimationInfo(
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
    'containerOnPageLoadAnimation2': AnimationInfo(
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
    'containerOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        ShimmerEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          color: const Color(0xB37F8388),
          angle: 0.524,
        ),
      ],
    ),
    'containerOnPageLoadAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        ShimmerEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          color: const Color(0xB37F8388),
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
    _model = createModel(context, () => SearchResultsLoadingModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          height: 100.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).alternate,
            borderRadius: BorderRadius.circular(0.0),
          ),
        ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation1']!),
        Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          height: 100.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).alternate,
            borderRadius: BorderRadius.circular(0.0),
          ),
        ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation2']!),
        Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          height: 100.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).alternate,
            borderRadius: BorderRadius.circular(0.0),
          ),
        ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation3']!),
        Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          height: 100.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).alternate,
            borderRadius: BorderRadius.circular(0.0),
          ),
        ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation4']!),
      ],
    );
  }
}
