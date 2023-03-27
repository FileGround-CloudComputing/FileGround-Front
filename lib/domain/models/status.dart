import 'package:file_ground_front/domain/models/session.dart';
import 'package:file_ground_front/domain/models/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'status.freezed.dart';

@freezed
class Status with _$Status {
  const factory Status({
    User? user,
    Session? session,
  }) = _Status;
}
