import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import '../../../domain/models/ground.dart';
part 'connectState.freezed.dart';

@freezed
class ConnectState with _$ConnectState {
  const factory ConnectState({
    @Default('') String currentNums,
    @Default(false) bool isError,
    Ground? currentGround,
  }) = _ConnectState;
}
