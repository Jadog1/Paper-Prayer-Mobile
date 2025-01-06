import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prayer_ml/prayers/groups/models/contact_model.dart';
import 'package:prayer_ml/prayers/groups/models/group_model.dart';
import 'package:prayer_ml/prayers/groups/models/request_model.dart';
import 'package:prayer_ml/shared/config.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/repo.g.dart';

@riverpod
class GroupContactsRepo extends _$GroupContactsRepo {
  late Config config;

  GroupContactsRepo() {
    config = Config();
  }

  @override
  Future<List<GroupContacts>> build() async {
    var contactApi = config.contactApiClient;
    final groups = await contactApi.fetchGroups();
    final contactResults = await contactApi.fetchContacts();
    final contactGroupPairs = await contactApi.fetchContactGroupPairs();
    var groupContacts = groups.map((group) {
      var members = contactGroupPairs.where((contact) => contact.groupId == group.id).toList();
      var contacts = members.map((member) => contactResults.firstWhere((contact) => contact.id == member.contactId)).toList();
      return GroupContacts(group: group, members: contacts);
    }).toList();
    
    return groupContacts;
  }

  Future<void> removeContactFromGroup(int groupId, int contactId) async {
    var contactApi = config.contactApiClient;
    await contactApi.removeContactFromGroup(groupId, contactId);

    ref.invalidateSelf();
  }

  Future<void> removeContact(int contactId) async {
    var contactApi = config.contactApiClient;
    await contactApi.removeContact(contactId);

    ref.invalidateSelf();
  }

  Future<void> removeGroup(int groupId) async {
    var contactApi = config.contactApiClient;
    await contactApi.removeGroup(groupId);

    ref.invalidateSelf();
  }

  Future<void> addContactToGroup(int groupId, int contactId) async {
    var contactApi = config.contactApiClient;
    await contactApi.addContactToGroup(groupId, contactId);

    ref.invalidateSelf();
  }

  Future<void> saveGroup(Group group) async {
    var contactApi = config.contactApiClient;
    await contactApi.saveGroup(group);

    ref.invalidateSelf();
  }

  Future<void> saveContact(Contact contact) async {
    var contactApi = config.contactApiClient;
    await contactApi.saveContact(contact);

    ref.invalidateSelf();
  }
}

@riverpod
class PrayerRequestRepo extends _$PrayerRequestRepo {
  late Config config;

  PrayerRequestRepo() {
    config = Config();
  }

  @override
  Future<List<PrayerRequest>> build(int contactId) async {
    var prayerApi = config.prayerRequestApiClient;
    return prayerApi.fetchPrayerRequests(contactId);
  }

  Future<void> saveRequest(PrayerRequest request) async {
    var prayerApi = config.prayerRequestApiClient;
    if (request.id == 0) {
      await prayerApi.saveRequest(request);
    } else {
      await prayerApi.updateRequest(request);
    }

    ref.invalidateSelf();
  }

  Future<void> removeRequest(PrayerRequest request) async {
    var prayerApi = config.prayerRequestApiClient;
    if (request.id == 0) {
      throw Exception("Cannot remove request that has not been saved");
    }

    await prayerApi.removeRequest(request.id);

    ref.invalidateSelf();
  }
} 

@riverpod
Future<List<PrayerRequest>> fetchSimilarRequests(Ref ref, int requestId) async {
  var config = Config();
  var prayerApi = config.prayerRequestApiClient;
  return prayerApi.fetchSimilarRequests(requestId);
}