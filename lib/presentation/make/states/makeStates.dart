import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'makeStates.freezed.dart';

@freezed
class MakeState with _$MakeState {
  const factory MakeState({
    @Default(Duration(hours: 12)) Duration groundDuration,
    @Default('') String groundTitle,
    @Default(false) bool isValid,
  }) = _MakeState;
}
