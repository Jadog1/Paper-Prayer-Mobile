import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prayer_ml/prayers/home/current_recommendations.dart';
import 'package:prayer_ml/prayers/home/repos/recommendations_repo.dart';
import 'package:prayer_ml/prayers/home/views/historical_recommendations_view.dart';
import 'package:prayer_ml/prayers/home/views/unresolved_followups_view.dart';
import 'package:prayer_ml/shared/widgets.dart';

class NewHomePage extends ConsumerWidget {
  const NewHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Navigator(
      onGenerateRoute: (settings) => MaterialPageRoute(
        builder: (context) => const NewHomePageConsumer(),
      ),
    );
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
              // Title
              const SizedBox(height: 20),
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
              
              // Recommendations Section
              Expanded(
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
                                builder: (context) => CurrentRecommendationsView(
                                  recommendationGroup: group,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                  loading: () => const Center(child: CircularProgressIndicator()),
                  error: (error, stackTrace) => PrintError(
                    caller: "NewHomePage",
                    error: error,
                    stackTrace: stackTrace,
                  ),
                ),
              ),
              
              // Additional view buttons
              const SizedBox(height: 8),
              _AdditionalViewButtons(),
              
              // Visual separator before bottom section
              Divider(
                height: 1,
                thickness: 1,
                color: Colors.grey[300],
              ),
              
              // Quick add text field (uneditable placeholder)
              const SizedBox(height: 16),
              TextField(
                enabled: false,
                decoration: InputDecoration(
                  hintText: "Quick add requests",
                  hintStyle: TextStyle(color: Colors.grey[400]),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
              ),
              const SizedBox(height: 16),
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
                    builder: (context) => const UnresolvedFollowupsView(lookbackDays: 30),
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
