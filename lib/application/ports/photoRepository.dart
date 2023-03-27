import '../../domain/models/photo.dart';

abstract class PhotoRepository {
  Future<bool> getIsUploaded(Photo photo);
  Future<bool> getIsDownloaded(Photo photo);
}
