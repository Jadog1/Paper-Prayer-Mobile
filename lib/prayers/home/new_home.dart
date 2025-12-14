import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prayer_ml/prayers/home/current_recommendations.dart';
import 'package:prayer_ml/prayers/home/repos/recommendations_repo.dart';
import 'package:prayer_ml/prayers/home/views/historical_recommendations_view.dart';
import 'package:prayer_ml/prayers/home/views/unresolved_followups_view.dart';
import 'package:prayer_ml/prayers/home/widgets/upcoming_events_preview.dart';
import 'package:prayer_ml/prayers/settings/settings.dart';
import 'package:prayer_ml/shared/widgets.dart';

class NewHomePage extends ConsumerWidget {
  const NewHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const NewHomePageConsumer();
    // return Navigator(
    //   onGenerateRoute: (settings) => MaterialPageRoute(
    //     builder: (context) => const NewHomePageConsumer(),
    //   ),
    // );
  }
}

class NewHomePageConsumer extends ConsumerWidget {
  const NewHomePageConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var viewModel = ref.watch(recommendationRepoProvider);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Account/Settings button at the top right
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const AccountSettingsPage(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.manage_accounts),
                    iconSize: 28,
                    color: Colors.blueAccent,
                    tooltip: 'Account Settings',
                  ),
                ],
              ),

              // Title
              const Text(
                "Paper Prayer",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                  letterSpacing: 1.2,
                ),
              ),

              const SizedBox(height: 12),

              // Subtitle/Description
              Text(
                "Prayer requests to follow up on",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                  fontStyle: FontStyle.italic,
                ),
              ),

              const SizedBox(height: 8),

              // Divider to separate header from content
              Divider(
                height: 32,
                thickness: 1.5,
                color: Colors.blue[100],
                indent: 40,
                endIndent: 40,
              ),

              // Recommendations Section - Flexible with minimum height
              Flexible(
                flex: 1,
                child: viewModel.when(
                  data: (recommendationGroups) {
                    return ListView.builder(
                      itemCount: recommendationGroups.length,
                      itemBuilder: (context, index) {
                        final group = recommendationGroups[index];
                        return _RecommendationGroupButton(
                          group: group,
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    CurrentRecommendationsView(
                                  recommendationGroup: group,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                  loading: () => const _RecommendationGroupsSkeleton(),
                  error: (error, stackTrace) => PrintError(
                    caller: "NewHomePage",
                    error: error,
                    stackTrace: stackTrace,
                    onRetry: () => ref.invalidate(recommendationRepoProvider),
                    compact: true,
                  ),
                ),
              ),

              // Upcoming Events Preview Section - Limited height
              const Flexible(
                flex: 2,
                child: UpcomingEventsPreview(),
              ),

              // Additional view buttons
              const SizedBox(height: 8),
              const _AdditionalViewButtons(),
            ],
          ),
        ),
      ),
    );
  }
}

class _AdditionalViewButtons extends StatelessWidget {
  const _AdditionalViewButtons();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton.icon(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        const UnresolvedFollowupsView(lookbackDays: 30),
                  ),
                );
              },
              icon: const Icon(Icons.follow_the_signs_outlined, size: 18),
              label: const Text(
                "Unresolved",
                style: TextStyle(fontSize: 14),
              ),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.orange[700],
                side: BorderSide(color: Colors.orange[300]!),
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: OutlinedButton.icon(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const HistoricalRecommendationsView(),
                  ),
                );
              },
              icon: const Icon(Icons.history, size: 18),
              label: const Text(
                "History",
                style: TextStyle(fontSize: 14),
              ),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.purple[700],
                side: BorderSide(color: Colors.purple[300]!),
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _RecommendationGroupButton extends StatelessWidget {
  final dynamic group; // RecommendationGroup
  final VoidCallback onTap;

  const _RecommendationGroupButton({
    required this.group,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 4.0),
        child: Row(
          children: [
            // Simple icon without background
            Icon(
              _getIconForGroup(group.icon).icon,
              color: _getIconColor(group.icon),
              size: 24,
            ),
            const SizedBox(width: 12),

            // Title and description
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    group.title,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    group.description,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey[600],
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),

            // Simple arrow
            Icon(Icons.chevron_right, size: 20, color: Colors.grey[400]),
          ],
        ),
      ),
    );
  }

  Icon _getIconForGroup(String iconType) {
    switch (iconType) {
      case "priority":
        return const Icon(Icons.notification_important);
      case "contact":
        return const Icon(Icons.person);
      default:
        return const Icon(Icons.question_mark);
    }
  }

  Color _getIconColor(String iconType) {
    switch (iconType) {
      case "priority":
        return Colors.blueAccent;
      case "contact":
        return Colors.green;
      default:
        return Colors.grey;
    }
  }
}

// Skeleton loading state for recommendation groups
class _RecommendationGroupsSkeleton extends StatelessWidget {
  const _RecommendationGroupsSkeleton();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 4, // Show 4 skeleton items
      itemBuilder: (context, index) {
        return const _RecommendationGroupSkeletonItem();
      },
    );
  }
}

// Individual skeleton item with shimmer animation
class _RecommendationGroupSkeletonItem extends StatefulWidget {
  const _RecommendationGroupSkeletonItem();

  @override
  State<_RecommendationGroupSkeletonItem> createState() =>
      _RecommendationGroupSkeletonItemState();
}

class _RecommendationGroupSkeletonItemState
    extends State<_RecommendationGroupSkeletonItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat();
    _animation = Tween<double>(begin: -2, end: 2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 4.0),
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Stack(
            children: [
              Row(
                children: [
                  // Icon skeleton
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  const SizedBox(width: 12),

                  // Title and description skeleton
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 17,
                          width: double.infinity * 0.6,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Container(
                          height: 13,
                          width: double.infinity * 0.85,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Container(
                          height: 13,
                          width: double.infinity * 0.7,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Arrow skeleton
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ],
              ),
              // Shimmer overlay
              Positioned.fill(
                child: ClipRect(
                  child: Transform.translate(
                    offset: Offset(_animation.value * 150, 0),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            Colors.white.withValues(alpha: 0.4),
                            Colors.transparent,
                          ],
                          stops: const [0.0, 0.5, 1.0],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
