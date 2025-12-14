import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prayer_ml/prayers/groups/models/group_model.dart';
import 'package:prayer_ml/prayers/groups/group_page_settings.dart';
import '../models/search_state.dart';
import 'search_bar_widget.dart';
import 'group_notebook.dart';

/// Main view displaying the grid of notebooks with search and create functionality.
///
/// Features:
/// - Header with icon and title
/// - Search bar for filtering notebooks
/// - Grid layout of notebook cards
/// - Create new notebook button
class GroupView extends ConsumerWidget {
  const GroupView({super.key, required this.groupContacts});
  final List<GroupWithMembers> groupContacts;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var searchState = ref.watch(searchStateProvider(groupContacts));

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Header text
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  children: [
                    Icon(Icons.book, color: Colors.grey.shade700, size: 28),
                    const SizedBox(width: 8),
                    Text(
                      "Prayer Notebooks",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade800,
                      ),
                    ),
                  ],
                ),
              ),
              SearchBarWidget(searchState: searchState),
              const SizedBox(height: 16),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.85, // Slightly taller for notebook look
                  ),
                  itemCount: searchState.groupContacts.length,
                  itemBuilder: (context, index) {
                    return GroupNotebook(
                        groupContacts: searchState.groupContacts[index]);
                  },
                ),
              ),
              const SizedBox(height: 12),
              // Add a button to create a new group
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const GroupSettings(),
                    ),
                  ),
                  icon: const Icon(Icons.add, size: 20),
                  label: const Text("Create New Notebook"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF8B7355),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 4,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
