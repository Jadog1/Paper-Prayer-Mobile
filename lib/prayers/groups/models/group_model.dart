import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:prayer_ml/prayers/groups/models/contact_model.dart';

part 'generated/group_model.freezed.dart';
part 'generated/group_model.g.dart';

// Create an enum of permissions
enum Permission {
  view("View"),
  editGroup("Edit Group"),
  editPrayers("Edit Prayers"),
  deleteGroup("Delete Group"),
  viewDocument("View Document"),
  editDocument("Edit Document"),
  deleteDocument("Delete Document");

  const Permission(this.value);
  final String value;
}

@freezed
class GroupWithPermissions with _$GroupWithPermissions {
  const factory GroupWithPermissions({
    @Default(0) int id,
    required String name,
    @Default("") String? description,
    @Default([]) List<String> permissions,
  }) = _GroupWithPermissions;

  factory GroupWithPermissions.fromJson(Map<String, dynamic> json) =>
      _$GroupWithPermissionsFromJson(json);
}

class ContactAndGroupPair {
  const ContactAndGroupPair({
    required this.contact,
    required this.groupPair,
  });
  final Contact contact;
  final ContactGroupPairs groupPair;
}

class GroupWithMembers {
  const GroupWithMembers({
    required this.group,
    required this.members,
    required this.memberWithContactGroupPairs,
  });

  final GroupWithPermissions group;
  final List<Contact> members;
  final List<ContactAndGroupPair> memberWithContactGroupPairs;
}
