import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo.g.dart';

part 'photo.freezed.dart';

@freezed
class Photo with _$Photo {
  const factory Photo({
    required String id,
    required String src,
    required String thumbnail,
    required String uploadedAt,
    required String uploaderId,
    required String uploaderName,
    @Default(false) bool isDownloaded,
    @Default(false) bool isUploaded,
  }) = _Photo;

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);
}

@freezed
class Photos with _$Photos {
  const factory Photos({
    required List<Photo> data,
  }) = _Photos;

  factory Photos.fromJson(Map<String, dynamic> json) => _$PhotosFromJson(json);
}
