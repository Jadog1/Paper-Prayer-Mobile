import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prayer_ml/prayers/groups/contact_page_settings.dart';
import 'package:prayer_ml/prayers/groups/models/group_model.dart';
import 'package:prayer_ml/prayers/groups/group_page_settings.dart';
import 'package:prayer_ml/prayers/groups/paper_mode.dart';
import 'package:prayer_ml/prayers/groups/repos/repo.dart';
import 'package:prayer_ml/prayers/groups/requests.dart';

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

    return switch (viewModel) {
      AsyncData(:final value) => GroupView(groupContacts: value),
      AsyncError(:final error, :final stackTrace) => PrintError(
          caller: "GroupConsumer", error: error, stackTrace: stackTrace),
      _ => const Center(child: CreativeLoadingScreen()),
    };
  }
}

class GroupView extends ConsumerWidget {
  const GroupView({super.key, required this.groupContacts});
  final List<GroupContacts> groupContacts;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var searchState = ref.watch(searchStateProvider(groupContacts));

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          SearchBarWidget(searchState: searchState),
          const SizedBox(height: 10),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.1,
              ),
              itemCount: searchState.groupContacts.length,
              itemBuilder: (context, index) {
                return GroupNotebook(
                    groupContacts: searchState.groupContacts[index]);
              },
            ),
          ),
          // Add a button to create a new group
          ElevatedButton.icon(
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const GroupSettings(),
              ),
            ),
            icon: const Icon(Icons.add),
            label: const Text("Create New Group"),
            style: saveButtonStyle,
          ),
        ],
      ),
    );
  }
}

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({super.key, required this.searchState});

  final SearchState searchState;

  @override
  _SearchBarWidgetState createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  bool _isFocused = false;

  @override
  Widget build(BuildContext context) {
    return FocusScope(
      onFocusChange: (focused) => setState(() => _isFocused = focused),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: _isFocused
              ? [BoxShadow(color: Colors.grey.shade300, blurRadius: 2)]
              : [],
        ),
        child: TextField(
          onChanged: (text) => widget.searchState.filter(text),
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search),
            hintText: 'Search Groups',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Colors.grey[200],
          ),
        ),
      ),
    );
  }
}

class GroupNotebook extends ConsumerWidget {
  const GroupNotebook({super.key, required this.groupContacts});

  final GroupContacts groupContacts;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      elevation: 6,
      // color: const Color.fromARGB(255, 206, 206, 206),
      color: Theme.of(context).colorScheme.surfaceContainerHigh,
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          children: [
            // Notebook Binding (Left Side)
            Positioned(
              left: 0,
              top: 10,
              bottom: 10,
              child: Container(
                width: 6,
                decoration: BoxDecoration(
                  color: Colors.black.withAlpha(150),
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Group Name & Description
                Expanded(
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            PaperMode(currentGroup: groupContacts),
                      ),
                    ),
                    child: Container(
                      color: Colors.transparent,
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            groupContacts.group.name,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          if (groupContacts.group.description != null)
                            Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: Text(
                                groupContacts.group.description!,
                                style: TextStyle(color: Colors.grey[700]),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Bottom Action Bar (Settings & Members)
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.settings, color: Colors.blueGrey),
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      visualDensity: VisualDensity.compact,
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              GroupSettings(groupContacts: groupContacts),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.people),
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      visualDensity: VisualDensity.compact,
                      onPressed: () =>
                          _showMembersModal(context, groupContacts),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showMembersModal(
      BuildContext context, GroupContacts groupContacts) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Consumer(
          builder: (context, ref, child) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Members of ${groupContacts.group.name}",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 250,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: groupContacts.members.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => PrayerRequestConsumer(
                                  user: groupContacts.members[index],
                                  group: groupContacts.group),
                            ),
                          ),
                          leading:
                              const CircleAvatar(child: Icon(Icons.person)),
                          title: Text(groupContacts.members[index].name),
                          subtitle: Text(
                              groupContacts.members[index].description ?? ""),
                          trailing: IconButton(
                            icon: const Icon(Icons.edit, color: Colors.blue),
                            onPressed: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ContactPageSettings(
                                    contact: groupContacts.members[index],
                                    group: groupContacts.group),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
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
  String searchText = "";

  List<GroupContacts> get groupContacts => _filteredGroupContacts;

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

final searchStateProvider = ChangeNotifierProvider.autoDispose
    .family<SearchState, List<GroupContacts>>((ref, groupContacts) {
  return SearchState(groupContacts: groupContacts);
});
