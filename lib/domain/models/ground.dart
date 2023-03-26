import 'package:file_ground_front/domain/models/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import 'photo.dart';
part 'ground.g.dart';
part 'ground.freezed.dart';

@freezed
class Ground with _$Ground {
  const factory Ground({
    required int id,
    required String coordinate,
    required String title,
    required User maker,
    required String expiresIn,
    @Default([]) List<Photo> photos,
    @Default([]) List<User> currentPeople,
  }) = _Ground;

  factory Ground.fromJson(Map<String, dynamic> json) => _$GroundFromJson(json);
}
