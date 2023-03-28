import 'package:file_ground_front/domain/models/ground.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import '../../../domain/models/user.dart';

part 'mainState.freezed.dart';

@freezed
class MainState with _$MainState {
  const factory MainState({
    required User? user,
    required Grounds grounds,
  }) = _MainState;
}
