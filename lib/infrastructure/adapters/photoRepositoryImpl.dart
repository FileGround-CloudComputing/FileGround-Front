import 'package:dio/dio.dart';
import 'package:file_ground_front/application/ports/photoRepository.dart';
import 'package:file_ground_front/domain/models/photo.dart';
import 'package:file_ground_front/domain/models/user.dart';
import 'package:file_ground_front/domain/result/result.dart';
import 'package:flutter/foundation.dart';
import 'package:image_downloader_web/image_downloader_web.dart';

import '../../domain/failure/failure.dart';

class PhotoRepositoryImpl extends PhotoRepository {
  Dio dioAuth;
  Dio dio;
  PhotoRepositoryImpl({
    required this.dio,
    required this.dioAuth,
  });

  @override
  Future<bool> downloadPhoto(Photo photo) async {
    await WebImageDownloader.downloadImageFromWeb(photo.src);
    return true;
  }

  @override
  Future<bool> getIsDownloaded(Photo photo) {
    // TODO: implement getIsDownloaded
    throw UnimplementedError();
  }

  @override
  Future<bool> getIsUploaded(Photo photo) {
    // TODO: implement getIsUploaded
    throw UnimplementedError();
  }

  @override
  Future<bool> saveIsDownloaded(Photo photo) {
    // TODO: implement saveIsDownloaded
    throw UnimplementedError();
  }
}
