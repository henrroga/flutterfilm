import '/flutter_flow/flutter_flow_util.dart';
import 'watchlist_widget.dart' show WatchlistWidget;
import 'package:flutter/material.dart';

class WatchlistModel extends FlutterFlowModel<WatchlistWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
