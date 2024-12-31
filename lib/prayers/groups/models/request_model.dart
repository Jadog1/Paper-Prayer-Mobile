import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'contact_model.dart';

part 'generated/request_model.freezed.dart';
part 'generated/request_model.g.dart';

@freezed
class PrayerRequest with _$PrayerRequest {
  const factory PrayerRequest({
    required int id,
    required String request,
    required Contact user,
  }) = _PrayerRequest;

  factory PrayerRequest.fromJson(Map<String, dynamic> json) => _$PrayerRequestFromJson(json);
}