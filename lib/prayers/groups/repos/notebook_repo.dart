import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prayer_ml/prayers/groups/models/notebook_model.dart';
import 'package:prayer_ml/shared/config.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/notebook_repo.g.dart';

@riverpod
Future<PaginatedPrayerRequests> fetchNotebookRequestsAt(Ref ref, CursorPagination pagination, int groupId) async {
  var config = Config();
  var api = config.notebookApiClient;
  return await api.fetchNotebookRequestsAt(pagination, groupId);
}

@riverpod
Future<PaginatedCollections> fetchNotebookCollectionsAt(Ref ref, CursorPagination pagination, int groupId) async {
  var config = Config();
  var api = config.notebookApiClient;
  return await api.fetchNotebookCollectionsAt(pagination, groupId);
}