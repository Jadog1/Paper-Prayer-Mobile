import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prayer_ml/prayers/groups/models/contact_model.dart';
import 'package:prayer_ml/prayers/groups/models/request_model.dart';
import 'package:prayer_ml/shared/config.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/related_contacts_repo.g.dart';

/// Fetch all related contacts for a contact
@riverpod
Future<List<RelatedContact>> fetchRelatedContactsForContact(Ref ref, int contactId) async {
  var relatedContactsApi = config.relatedContactsApiClient;
  return await relatedContactsApi.fetchRelatedContactsForContact(contactId);
}

/// Fetch a single related contact by ID
@riverpod
Future<RelatedContact> fetchRelatedContact(Ref ref, int relatedContactId) async {
  var relatedContactsApi = config.relatedContactsApiClient;
  return await relatedContactsApi.fetchRelatedContact(relatedContactId);
}

/// Fetch prayer requests for a related contact
@riverpod
Future<List<PrayerRequest>> fetchPrayerRequestsForRelatedContact(Ref ref, int relatedContactId) async {
  var relatedContactsApi = config.relatedContactsApiClient;
  return await relatedContactsApi.fetchPrayerRequestsForRelatedContact(relatedContactId);
}

/// Fetch the associated contact for a related contact
@riverpod
Future<Contact> fetchContactForRelatedContact(Ref ref, int relatedContactId) async {
  var relatedContactsApi = config.relatedContactsApiClient;
  return await relatedContactsApi.fetchContactForRelatedContact(relatedContactId);
}

/// Data class combining related contact with its data
class RelatedContactWithData {
  final RelatedContact relatedContact;
  final List<PrayerRequest> prayerRequests;
  final Contact contact;

  RelatedContactWithData({
    required this.relatedContact,
    required this.prayerRequests,
    required this.contact,
  });
}

/// Fetch a related contact with all its associated data
@riverpod
Future<RelatedContactWithData> fetchRelatedContactWithData(Ref ref, int relatedContactId) async {
  final relatedContact = await ref.read(fetchRelatedContactProvider(relatedContactId).future);
  final prayerRequests = await ref.read(fetchPrayerRequestsForRelatedContactProvider(relatedContactId).future);
  final contact = await ref.read(fetchContactForRelatedContactProvider(relatedContactId).future);

  return RelatedContactWithData(
    relatedContact: relatedContact,
    prayerRequests: prayerRequests,
    contact: contact,
  );
}

/// Repository for managing related contacts
@riverpod
class RelatedContactsRepo extends _$RelatedContactsRepo {
  late Config config;

  RelatedContactsRepo() {
    config = Config();
  }

  @override
  Future<List<RelatedContact>> build(int contactId) async {
    var relatedContactsApi = config.relatedContactsApiClient;
    return await relatedContactsApi.fetchRelatedContactsForContact(contactId);
  }

  /// Update a related contact
  Future<RelatedContact> updateRelatedContact(RelatedContactUpdate update) async {
    var relatedContactsApi = config.relatedContactsApiClient;
    final updated = await relatedContactsApi.updateRelatedContact(update);
    
    ref.invalidateSelf();
    return updated;
  }

  /// Delete a related contact
  Future<void> deleteRelatedContact(int relatedContactId) async {
    var relatedContactsApi = config.relatedContactsApiClient;
    await relatedContactsApi.deleteRelatedContact(relatedContactId);
    
    ref.invalidateSelf();
  }

  /// Merge two related contacts
  Future<void> mergeRelatedContacts(int fromRelatedContactId, int toRelatedContactId) async {
    var relatedContactsApi = config.relatedContactsApiClient;
    await relatedContactsApi.mergeRelatedContacts(fromRelatedContactId, toRelatedContactId);
    
    ref.invalidateSelf();
  }
}
