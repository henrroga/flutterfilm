// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DatesStruct extends BaseStruct {
  DatesStruct({
    String? maximum,
    String? minimum,
  })  : _maximum = maximum,
        _minimum = minimum;

  // "maximum" field.
  String? _maximum;
  String get maximum => _maximum ?? '';
  set maximum(String? val) => _maximum = val;

  bool hasMaximum() => _maximum != null;

  // "minimum" field.
  String? _minimum;
  String get minimum => _minimum ?? '';
  set minimum(String? val) => _minimum = val;

  bool hasMinimum() => _minimum != null;

  static DatesStruct fromMap(Map<String, dynamic> data) => DatesStruct(
        maximum: data['maximum'] as String?,
        minimum: data['minimum'] as String?,
      );

  static DatesStruct? maybeFromMap(dynamic data) =>
      data is Map ? DatesStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'maximum': _maximum,
        'minimum': _minimum,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'maximum': serializeParam(
          _maximum,
          ParamType.String,
        ),
        'minimum': serializeParam(
          _minimum,
          ParamType.String,
        ),
      }.withoutNulls;

  static DatesStruct fromSerializableMap(Map<String, dynamic> data) =>
      DatesStruct(
        maximum: deserializeParam(
          data['maximum'],
          ParamType.String,
          false,
        ),
        minimum: deserializeParam(
          data['minimum'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'DatesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DatesStruct &&
        maximum == other.maximum &&
        minimum == other.minimum;
  }

  @override
  int get hashCode => const ListEquality().hash([maximum, minimum]);
}

DatesStruct createDatesStruct({
  String? maximum,
  String? minimum,
}) =>
    DatesStruct(
      maximum: maximum,
      minimum: minimum,
    );
