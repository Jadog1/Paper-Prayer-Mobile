import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prayer_ml/prayers/groups/models/group_model.dart';
import 'package:prayer_ml/shared/config.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/contact_repo.g.dart';

@riverpod
Future<List<GroupContacts>> fetchGroupContacts(Ref ref) async {
    var contactApi = config.contactApiClient;
    final groups = await contactApi.fetchGroups();
    final contactResults = await contactApi.fetchContacts();
    final contactGroupPairs = await contactApi.fetchContactGroupPairs();
    var groupContacts = groups.map((group) {
      var members = contactGroupPairs.where((contact) => contact.groupId == group.id).toList();
      var contacts = members.map((member) => contactResults.firstWhere((contact) => contact.id == member.contactId)).toList();
      return GroupContacts(id: group.id, name: group.name, description: group.description, members: contacts);
    }).toList();
    
    return groupContacts;
}

