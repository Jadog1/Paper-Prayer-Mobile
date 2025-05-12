import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'generated/shared.freezed.dart';
part 'generated/shared.g.dart';

@freezed
class CursorPagination with _$CursorPagination {
  const factory CursorPagination({
    required int limit,
    required String? cursor,
  }) = _CursorPagination;

  factory CursorPagination.fromJson(Map<String, dynamic> json) => _$CursorPaginationFromJson(json);
}