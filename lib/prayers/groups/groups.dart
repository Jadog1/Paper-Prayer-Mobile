import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prayer_ml/prayers/groups/contact_page_settings.dart';
import 'package:prayer_ml/prayers/groups/models/group_model.dart';
import 'package:prayer_ml/prayers/groups/group_page_settings.dart';
import 'package:prayer_ml/prayers/groups/repos/repo.dart';
import 'package:prayer_ml/prayers/groups/requests.dart';

import 'package:prayer_ml/prayers/groups/models/contact_model.dart';
import 'package:prayer_ml/shared/widgets.dart';
// import 'view_model.dart';

class Groups extends ConsumerWidget {
  const Groups({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Navigator(
      onGenerateRoute: (settings) => MaterialPageRoute(
        builder: (context) => const GroupConsumer(),
      ),
    );
  }
}

class GroupConsumer extends ConsumerWidget {
  const GroupConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var viewModel = ref.watch(groupContactsRepoProvider);

    return switch(viewModel) {
      AsyncData(:final value) => GroupView(groupContacts: value),
      AsyncError(:final error, :final stackTrace) => PrintError(caller: "GroupConsumer", error: error, stackTrace: stackTrace),
      _ => const RefreshProgressIndicator(),
    };
  } // GroupView(viewModel: viewModel)
}

class GroupView extends ConsumerWidget {
  const GroupView({
    super.key,
    required this.groupContacts,
  });

  final List<GroupContacts> groupContacts;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var searchState = ref.watch(searchStateProvider(groupContacts));
    var theme = Theme.of(context);

    return Column(
      children: [
        const Text("Groups", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
        FilterSearchBar(searchState: searchState),
        Flexible(
          child: ListView(
            padding: const EdgeInsets.all(8),
            children: searchState.groupContacts
                .map((group) => GroupCard(groupContacts: group))
                .toList(),
          ),
        ),
        ElevatedButton(
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const GroupSettings(groupContacts: GroupContacts(group: Group(name: "New group"), members: []))),
          ),
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(theme.colorScheme.primary),
          ),
          child: Icon(Icons.add, color: theme.colorScheme.onPrimary),
        ),
      ],
    );
  }
}
class FilterSearchBar extends ConsumerWidget {
  const FilterSearchBar({super.key, required this.searchState});
  
  final SearchState searchState;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ThemeData theme = Theme.of(context);

    return SearchBar(
      // controller: TextEditingController(text: searchState.searchText),
      onChanged: (text) => searchState.filter(text),
      hintText: 'Search by ${searchState.isGroupFilter ? 'Groups' : 'People'}',
      leading: searchState.searchText == "" ? 
        Icon(Icons.search, color: theme.colorScheme.onPrimary) :
        IconButton(
          icon: const Icon(Icons.clear),
          color: theme.colorScheme.onPrimary,
          onPressed: () => searchState.filter(""),
        ),
      backgroundColor: WidgetStatePropertyAll(theme.colorScheme.primary),
      hintStyle: WidgetStatePropertyAll(
        TextStyle(color: theme.colorScheme.onPrimary.withAlpha(150)),
      ),
      textStyle: WidgetStatePropertyAll(
        TextStyle(color: theme.colorScheme.onPrimary),
      ),
      trailing: [
        ElevatedButton.icon(
          onPressed: () => searchState.toggleSearchMode(),
          icon:  searchState.isGroupFilter ? const Icon(Icons.people) : const Icon(Icons.person),
          label: Text(searchState.isGroupFilter ? 'Group' : 'Person'),
        ),
      ],
    );
  }
}
class GroupCard extends StatelessWidget {
  const GroupCard({
    super.key,
    required this.groupContacts,
  });

  final GroupContacts groupContacts;

  @override
  Widget build(BuildContext context) {

    return Card(
      margin: const EdgeInsets.only(bottom: 10, top: 10),
      child: ExpansionTile(
        title: Text(groupContacts.group.name),
        subtitle: Text(groupContacts.group.description ?? ""),
        trailing: IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (context) =>  GroupSettings(groupContacts: groupContacts)),
          ),
        ),
        children: groupContacts.members
            .map((member) => MemberCard(user: member))
            .toList(), // Show member cards when expanded
      ),
    );
  }
}



class MemberCard extends StatelessWidget {
  const MemberCard({super.key, required this.user});

  final Contact user;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Card(
      margin: const EdgeInsets.only(bottom: 10, top: 10),
      color: theme.colorScheme.secondary,
      child: ListTile(

        title: Text(user.name),
        subtitle: Text(user.description ?? ""),
        textColor: theme.colorScheme.onSecondary,
        leading: IconButton( 
          icon: const Icon(Icons.edit),
          color: theme.colorScheme.onSecondaryContainer,
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => ContactPageSettings(contact: user)),
          ),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.remove_red_eye),
          color: theme.colorScheme.onSecondaryContainer,
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => PrayerRequestConsumer(user: user)),
          ),
        ),
      ),
    );
  }
}

// Support local searching
// In a future iteration, we will support searching from the server. KISS for now.
// Search supports tracking the original list and the filtered list, and searching from both contacts and groups
class SearchState extends ChangeNotifier {
  SearchState({required List<GroupContacts> groupContacts}) {
    _groupContacts = groupContacts;
    _filteredGroupContacts = groupContacts;
  }

  List<GroupContacts> _groupContacts = [];
  List<GroupContacts> _filteredGroupContacts = [];
  bool isGroupFilter = true;
  String searchText = "";

  List<GroupContacts> get groupContacts => _filteredGroupContacts;

  void filter(String text) {
    searchText = text;
    if (text.isEmpty) {
      _filteredGroupContacts = _groupContacts;
    } else if (isGroupFilter) {
      _filteredGroupContacts = _groupContacts.where((groupContact) {
        return groupContact.group.name.toLowerCase().contains(text.toLowerCase());
      }).toList();
    } else {
      _filteredGroupContacts = _groupContacts.where((group) {
        return group.members.any((member) => member.name.toLowerCase().contains(text.toLowerCase()));
      }).map((groupContact) {
        return GroupContacts(
          group: groupContact.group,
          members: groupContact.members.where((member) => member.name.toLowerCase().contains(text.toLowerCase())).toList(),
        );
      }).toList();
    }
    notifyListeners();
  }

  void toggleSearchMode() {
    isGroupFilter = !isGroupFilter;
    filter(searchText);
  }
}
final searchStateProvider = ChangeNotifierProvider.autoDispose.family<SearchState, List<GroupContacts>>((ref, groupContacts) {
  return SearchState(groupContacts: groupContacts);
});