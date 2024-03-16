import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'carousel_loading_model.dart';
export 'carousel_loading_model.dart';

class CarouselLoadingWidget extends StatefulWidget {
  const CarouselLoadingWidget({super.key});

  @override
  State<CarouselLoadingWidget> createState() => _CarouselLoadingWidgetState();
}

class _CarouselLoadingWidgetState extends State<CarouselLoadingWidget>
    with TickerProviderStateMixin {
  late CarouselLoadingModel _model;

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
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
    _model = createModel(context, () => CarouselLoadingModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 18.0, 0.0),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        height: 180.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).alternate,
          borderRadius: BorderRadius.circular(8.0),
        ),
      ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
    );
  }
}
