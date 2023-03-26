import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'session.g.dart';

part 'session.freezed.dart';

@freezed
class Session with _$Session {
  const factory Session({
    required String accessToken,
    required String refreshToken,
    @Default("Bearer") String tokenType,
    required String accessTokenExpiresIn,
    required String refreshTokenExpiresIn,
  }) = _Session;

  factory Session.fromJson(Map<String, dynamic> json) =>
      _$SessionFromJson(json);
}
