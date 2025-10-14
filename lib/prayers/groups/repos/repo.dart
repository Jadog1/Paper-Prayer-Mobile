import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prayer_ml/prayers/groups/models/collection_model.dart';
import 'package:prayer_ml/prayers/groups/models/contact_model.dart';
import 'package:prayer_ml/prayers/groups/models/group_model.dart';
import 'package:prayer_ml/prayers/groups/models/request_model.dart';
import 'package:prayer_ml/prayers/groups/repos/collection_repo.dart';
import 'package:prayer_ml/shared/config.dart';
import 'package:riverpod/src/framework.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/repo.g.dart';

@riverpod
class GroupContactsRepo extends _$GroupContactsRepo {
  late Config config;

  GroupContactsRepo() {
    config = Config();
  }

  // TODO: We need to make this fetchGroups logic to be paginated.
  // Then we can asynchronously build contacts for a group and other data.
  // Additionally, this whole process of building a specialized object is being overused
  // and passed around a good amount. We should consider refactoring this so it's not 
  // so coupled.
  @override
  Future<List<GroupWithMembers>> build() async {
    var contactApi = config.contactApiClient;
    final groups = await contactApi.fetchGroups();
    final contactResults = await contactApi.fetchContacts(); 
    final contactGroupPairs = await contactApi.fetchContactGroupPairs();
    var groupContacts = groups.map((group) {
      var members = contactGroupPairs.where((contact) => contact.groupId == group.id).toList();
      var contacts = members.map((member) => contactResults.firstWhere((contact) => contact.id == member.contactId)).toList();
      var memberWithContactGroupPairs = members.map((member) {
        var contact = contactResults.firstWhere((contact) => contact.id == member.contactId);
        return ContactAndGroupPair(contact: contact, groupPair: member);
      }).toList();
      return GroupWithMembers(group: group, members: contacts, memberWithContactGroupPairs: memberWithContactGroupPairs);
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

  Future<Contact> saveContact(Contact contact, Group group) async {
    var contactApi = config.contactApiClient;
    var newContact = await contactApi.saveContact(contact, group);

    ref.invalidateSelf();
    return newContact;
  }

  Future<Contact> updateContact(Contact contact) async {
    var contactApi = config.contactApiClient;
    var updatedContact = await contactApi.updateContact(contact);

    ref.invalidateSelf();
    return updatedContact;
  }
}

@riverpod
Future<ContactGroupPairs> fetchContactGroup(Ref ref, int contactId, int groupId) async {
  var contactApi = config.contactApiClient;
  return await contactApi.fetchContactGroup(contactId, groupId);
}

class UserCollectionsAndContacts {
  final Contact user;
  final ContactGroupPairs contactGroup;
  final List<RelatedContact> relatedContacts;
  final List<Collection> prayerRequests;

  UserCollectionsAndContacts({required this.user, required this.relatedContacts, required this.prayerRequests, required this.contactGroup});
}

@riverpod
Future<UserCollectionsAndContacts> fetchCollectionsAndContacts(Ref ref, Contact contact, Group group) async {
  var contactApi = config.contactApiClient;
  var prayerRequests = await ref.read(collectionContactRepoProvider(contact.id).future);
  var relatedContacts = await contactApi.fetchRelatedContacts(contact.id);
  var user = contact;
  var contactGroup = await contactApi.fetchContactGroup(contact.id, group.id);

  return UserCollectionsAndContacts(user: user, relatedContacts: relatedContacts, prayerRequests: prayerRequests, contactGroup: contactGroup);
}

@riverpod
Future<List<RelatedContact>> fetchRelatedContacts(Ref ref, int contactId) async {
  var contactApi = config.contactApiClient;
  return await contactApi.fetchRelatedContacts(contactId);
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

  Future<PrayerRequest> saveRequest(PrayerRequest request, {int? enforcedCollectionId}) async {
    var prayerApi = config.prayerRequestApiClient;
    PrayerRequest newRequest;
    if (request.id == 0) {
      newRequest = await prayerApi.saveRequest(request, enforcedCollectionId: enforcedCollectionId);
    } else {
      newRequest = await prayerApi.updateRequest(request);
    }

    ref.invalidateSelf();
    return newRequest;
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
Future<List<PrayerRequestScore>> fetchSimilarRequests(Ref ref, int requestId) async {
  var config = Config();
  var prayerApi = config.prayerRequestApiClient;
  return prayerApi.fetchSimilarRequests(requestId);
}

Future<PrayerRequest> saveNewRequest(PrayerRequest request, {int? enforcedCollectionId}) async {
  var config = Config();
  var prayerApi = config.prayerRequestApiClient;
  return await prayerApi.saveRequest(request, enforcedCollectionId: enforcedCollectionId);
}

Future<PrayerRequest> updateRequest(PrayerRequest request) async {
  var config = Config();
  var prayerApi = config.prayerRequestApiClient;
  return await prayerApi.updateRequest(request);
}

Future<void> removeRequest(PrayerRequest request) async {
  var config = Config();
  var prayerApi = config.prayerRequestApiClient;
  await prayerApi.removeRequest(request.id);
}

Future<PrayerRequest> fetchUpdatedPrayerRequest(int requestId) async {
  var config = Config();
  var prayerApi = config.prayerRequestApiClient;
  return await prayerApi.fetchPrayerRequest(requestId);
}

@riverpod
Future<List<BibleReferenceAndText>> fetchBibleVersesForPrayerRequest(Ref ref, int requestId) async {
  var config = Config();
  var prayerApi = config.prayerRequestApiClient;
  return await prayerApi.fetchBibleVersesForPrayerRequest(requestId);
}

Future<bool> hasGeneratedFeatures(int requestId) async {
  var config = Config();
  var prayerApi = config.prayerRequestApiClient;
  return await prayerApi.requestHasGeneratedFeatures(requestId);
}

Future<void> clearDebounceTimeout(int requestId) async {
  var config = Config();
  var prayerApi = config.prayerRequestApiClient;
  await prayerApi.clearDebounceTimeout(requestId);
}