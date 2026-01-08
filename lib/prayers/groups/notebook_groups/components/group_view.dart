import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prayer_ml/prayers/groups/models/group_model.dart';
import 'package:prayer_ml/prayers/groups/group_page_settings.dart';
import 'package:prayer_ml/prayers/groups/repos/pending_invites_repo.dart';
import 'package:prayer_ml/prayers/groups/repos/repo.dart';
import 'package:prayer_ml/prayers/groups/group_access/pending_invites_page.dart';
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

  Future<void> _refreshAll(WidgetRef ref) async {
    ref.invalidate(groupContactsRepoProvider);
    ref.invalidate(hasPendingInvitesProvider);

    await Future.wait([
      ref.read(groupContactsRepoProvider.future),
      ref.read(hasPendingInvitesProvider.future),
    ]);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var searchState = ref.watch(searchStateProvider(groupContacts));
    final hasPendingInvites = ref.watch(hasPendingInvitesProvider);

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
                    const Spacer(),
                    // Pending invites notification badge
                    hasPendingInvites.when(
                      data: (hasInvites) {
                        if (!hasInvites) return const SizedBox.shrink();
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    const PendingInvitesPage(),
                              ),
                            );
                          },
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.orange.shade100,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: Colors.orange.shade300,
                                width: 1,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.notifications_active,
                                  color: Colors.orange.shade700,
                                  size: 20,
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  'Invites',
                                  style: TextStyle(
                                    color: Colors.orange.shade700,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      loading: () => const SizedBox.shrink(),
                      error: (_, __) => const SizedBox.shrink(),
                    ),
                  ],
                ),
              ),
              SearchBarWidget(searchState: searchState),
              const SizedBox(height: 16),
              Expanded(
                child: RefreshIndicator(
                  notificationPredicate: (notification) {
                    if (notification.metrics.axis != Axis.vertical) {
                      return false;
                    }
                    return notification.metrics.pixels <= 0.0;
                  },
                  onRefresh: () => _refreshAll(ref),
                  child: GridView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio:
                          0.85, // Slightly taller for notebook look
                    ),
                    itemCount: searchState.groupContacts.length,
                    itemBuilder: (context, index) {
                      return GroupNotebook(
                        groupContacts: searchState.groupContacts[index],
                      );
                    },
                  ),
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
