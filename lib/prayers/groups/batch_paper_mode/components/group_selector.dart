import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prayer_ml/prayers/groups/batch_paper_mode/models/batch_paper_mode_config.dart';
import 'package:prayer_ml/prayers/groups/batch_paper_mode/providers/batch_paper_mode_provider.dart';
import 'package:prayer_ml/prayers/groups/models/group_model.dart';
import 'package:prayer_ml/prayers/groups/repos/repo.dart';
import 'package:prayer_ml/shared/widgets.dart';

/// Group selector wizard step for choosing which group to work with
class GroupSelector extends ConsumerWidget {
  const GroupSelector({
    super.key,
    required this.config,
  });

  final BatchPaperModeConfig config;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groupContactsAsync = ref.watch(groupContactsRepoProvider);

    return switch (groupContactsAsync) {
      AsyncData(:final value) => _buildGroupList(context, ref, value),
      AsyncError(:final error, :final stackTrace) => PrintError(
          caller: "GroupSelector",
          error: error,
          stackTrace: stackTrace,
          onRetry: () => ref.invalidate(groupContactsRepoProvider)),
      _ => const Center(child: CircularProgressIndicator()),
    };
  }

  Widget _buildGroupList(
    BuildContext context,
    WidgetRef ref,
    List<GroupWithMembers> groups,
  ) {
    final notifier = ref.read(batchPaperModeNotifierProvider(config).notifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Header
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFF8B7355).withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.book, color: Colors.grey.shade700, size: 24),
                  const SizedBox(width: 12),
                  const Text(
                    'Select a Notebook',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                'Choose which notebook to add prayer requests to',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),

        // Group list
        Expanded(
          child: groups.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.inbox_outlined,
                          size: 64, color: Colors.grey.shade400),
                      const SizedBox(height: 16),
                      Text(
                        'No notebooks available',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Create a notebook first to use batch mode',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  itemCount: groups.length,
                  itemBuilder: (context, index) {
                    final group = groups[index];
                    return Card(
                      margin: const EdgeInsets.only(bottom: 12),
                      elevation: 2,
                      child: InkWell(
                        onTap: () => notifier.selectGroup(group),
                        borderRadius: BorderRadius.circular(8),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            children: [
                              // Icon
                              Container(
                                width: 48,
                                height: 48,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF8B7355)
                                      .withValues(alpha: 0.15),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.book,
                                  color: Color(0xFF8B7355),
                                  size: 24,
                                ),
                              ),
                              const SizedBox(width: 16),

                              // Group info
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      group.group.name,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    if (group.group.description != null &&
                                        group
                                            .group.description!.isNotEmpty) ...[
                                      const SizedBox(height: 4),
                                      Text(
                                        group.group.description!,
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey.shade600,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                    const SizedBox(height: 4),
                                    Text(
                                      '${group.members.length} member${group.members.length != 1 ? 's' : ''}',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey.shade500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              // Arrow
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                                color: Colors.grey.shade400,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}
