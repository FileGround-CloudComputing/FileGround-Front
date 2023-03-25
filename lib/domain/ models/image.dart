import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'image.g.dart';
part 'image.freezed.dart';

@freezed
class Image with _$Image {
  const factory Image({
    required int id,
    required String title,
    required String url,
    required String uploadedAt,
    @Default(false) bool isDownloaded,
  }) = _Image;

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);
}
