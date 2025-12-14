import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prayer_ml/prayers/groups/models/group_model.dart';

/// State manager for local notebook search functionality.
///
/// Supports tracking the original list and filtered results,
/// searching through both contacts and groups.
///
/// In a future iteration, we will support searching from the server. KISS for now.
class SearchState extends ChangeNotifier {
  SearchState({required List<GroupWithMembers> groupContacts}) {
    _groupContacts = groupContacts;
    _filteredGroupContacts = groupContacts;
  }

  List<GroupWithMembers> _groupContacts = [];
  List<GroupWithMembers> _filteredGroupContacts = [];
  String searchText = "";

  List<GroupWithMembers> get groupContacts => _filteredGroupContacts;

  void filter(String text) {
    searchText = text;
    if (text.isEmpty) {
      _filteredGroupContacts = _groupContacts;
    } else {
      _filteredGroupContacts = _groupContacts.where((groupContact) {
        return groupContact.group.name
            .toLowerCase()
            .contains(text.toLowerCase());
      }).toList();
    }
    notifyListeners();
  }
}

/// Provider for search state management.
/// Auto-disposes when no longer needed and is scoped by the groupContacts list.
final searchStateProvider = ChangeNotifierProvider.autoDispose
    .family<SearchState, List<GroupWithMembers>>((ref, groupContacts) {
  return SearchState(groupContacts: groupContacts);
});
