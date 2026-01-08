import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prayer_ml/prayers/groups/repos/repo.dart';
import 'package:prayer_ml/shared/widgets.dart';
import 'group_view.dart';
import 'skeletons.dart';

/// Top-level consumer widget that handles async data loading.
///
/// Watches the groupContactsRepoProvider and displays:
/// - GroupView when data is loaded
/// - Error state with retry button on failure
/// - Skeleton loading state while fetching
class GroupConsumer extends ConsumerWidget {
  const GroupConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(groupContactsRepoProvider);

    return viewModel.when(
      skipLoadingOnRefresh: false,
      data: (value) => GroupView(groupContacts: value),
      loading: () {
        return const GroupViewSkeleton();
      },
      error: (error, stackTrace) => PrintError(
        caller: "GroupConsumer",
        error: error,
        stackTrace: stackTrace,
        onRetry: () => ref.invalidate(groupContactsRepoProvider),
      ),
    );
  }
}
