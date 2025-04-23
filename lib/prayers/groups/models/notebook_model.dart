import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:prayer_ml/prayers/groups/models/collection_model.dart';
import 'package:prayer_ml/prayers/groups/models/request_model.dart';

part 'generated/notebook_model.freezed.dart';
part 'generated/notebook_model.g.dart';

@freezed
class CursorPagination with _$CursorPagination {
  const factory CursorPagination({
    required int limit,
    required String? cursor,
  }) = _CursorPagination;

  factory CursorPagination.fromJson(Map<String, dynamic> json) => _$CursorPaginationFromJson(json);
}

@freezed
class PaginatedPrayerRequests with _$PaginatedPrayerRequests {
  const factory PaginatedPrayerRequests({
    @JsonKey(name: 'has_next') required bool hasNext,
    @JsonKey(name: 'prayer_requests') required List<PrayerRequest> prayerRequests,
    required CursorPagination pagination,
  }) = _PaginatedPrayerRequests;

  factory PaginatedPrayerRequests.fromJson(Map<String, dynamic> json) => _$PaginatedPrayerRequestsFromJson(json);
}

@freezed
class PaginatedCollections with _$PaginatedCollections {
  const factory PaginatedCollections({
    @JsonKey(name: 'has_next') required bool hasNext,
    @JsonKey(name: 'collections') required List<Collection> collections,
    required CursorPagination pagination,
  }) = _PaginatedCollections;

  factory PaginatedCollections.fromJson(Map<String, dynamic> json) => _$PaginatedCollectionsFromJson(json);
}