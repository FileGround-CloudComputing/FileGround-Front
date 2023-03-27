import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'authDto.freezed.dart';
part 'authDto.g.dart';

@freezed
class AccessTokenDto with _$AccessTokenDto {
  const factory AccessTokenDto({
    required String accessToken,
    required DateTime accessTokenExpiresIn,
  }) = _AccessTokenDto;

  factory AccessTokenDto.fromJson(Map<String, dynamic> json) =>
      _$AccessTokenDtoFromJson(json);
}
