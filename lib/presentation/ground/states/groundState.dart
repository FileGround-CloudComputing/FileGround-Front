import 'package:file_ground_front/domain/models/ground.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'groundState.freezed.dart';

@freezed
class GroundState with _$GroundState {
  const factory GroundState({
    Ground? ground,
    @Default(true) bool isLoading,
    @Default(false) bool isSelecting,
    @Default(0) int selectCount,
  }) = _GroundState;
}
