import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'profile_model.dart';
export 'profile_model.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({super.key});

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  late ProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileModel());
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
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Text(
            'Profile',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: 96.0,
                                height: 96.0,
                                clipBehavior: Clip.antiAlias,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.network(
                                  'https://picsum.photos/seed/257/600',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'name',
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'username',
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ].divide(const SizedBox(width: 16.0)),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Favorites',
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            ],
                          ),
                          ListView(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            children: const [],
                          ),
                        ],
                      ),
                    ].divide(const SizedBox(height: 16.0)),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Dark Mode',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Outfit',
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    Switch.adaptive(
                      value: _model.switchValue ??=
                          Theme.of(context).brightness == Brightness.dark,
                      onChanged: (newValue) async {
                        setState(() => _model.switchValue = newValue);
                        if (newValue) {
                          setDarkModeSetting(context, ThemeMode.dark);
                        } else {
                          setDarkModeSetting(context, ThemeMode.light);
                        }
                      },
                      activeColor: FlutterFlowTheme.of(context).secondary,
                      activeTrackColor: FlutterFlowTheme.of(context).accent1,
                      inactiveTrackColor: FlutterFlowTheme.of(context).accent2,
                      inactiveThumbColor:
                          FlutterFlowTheme.of(context).secondaryText,
                    ),
                  ],
                ),
              ]
                  .addToStart(const SizedBox(height: 16.0))
                  .addToEnd(const SizedBox(height: 16.0)),
            ),
          ),
        ),
      ),
    );
  }
}
