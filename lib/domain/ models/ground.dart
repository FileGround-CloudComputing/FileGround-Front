import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'ground.g.dart';
part 'ground.freezed.dart';

@freezed
class Ground with _$Ground {
  const factory Ground({
    required int id,
    required String title,
    required String maker,
    required String accessToken,
  }) = _Ground;

  factory Ground.fromJson(Map<String, dynamic> json) => _$GroundFromJson(json);
}
