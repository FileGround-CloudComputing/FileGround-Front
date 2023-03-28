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
    User? maker,
    required String expiresIn,
    @Default([]) List<Photo> photos,
    @Default([]) List<User> currentPeople,
  }) = _Ground;

  factory Ground.fromJson(Map<String, dynamic> json) => _$GroundFromJson(json);
}

@freezed
class Grounds with _$Grounds {
  const factory Grounds({
    @Default([]) List<Ground> data,
  }) = _Grounds;

  factory Grounds.fromJson(Map<String, dynamic> json) =>
      _$GroundsFromJson(json);
}
