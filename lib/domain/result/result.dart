import 'package:file_ground_front/domain/failure/failure.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'result.freezed.dart';

@freezed
class Result<T> with _$Result<T> {
  const factory Result.success(T value) = Success<T>;

  const factory Result.error(Failure failure) = Error;
}
