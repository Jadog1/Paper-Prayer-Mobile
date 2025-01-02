import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:prayer_ml/prayers/groups/models/contact_model.dart';

part 'generated/group_model.freezed.dart';
part 'generated/group_model.g.dart';

@freezed
class Group with _$Group {
  const factory Group({
    @Default(0) int id,
    required String name,
    @Default("") String? description,
  }) = _Group;

  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);
}

class GroupContacts {
  const GroupContacts({
    required this.group,
    required this.members,
  });

  final Group group;
  final List<Contact> members;
}