import '/flutter_flow/flutter_flow_util.dart';
import 'movie_details_copy_widget.dart' show MovieDetailsCopyWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class MovieDetailsCopyModel extends FlutterFlowModel<MovieDetailsCopyWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    expandableExpandableController.dispose();
  }
}
