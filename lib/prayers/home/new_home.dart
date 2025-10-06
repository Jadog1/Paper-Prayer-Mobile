import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prayer_ml/prayers/home/current_recommendations.dart';
import 'package:prayer_ml/prayers/home/repos/recommendations_repo.dart';
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
              
              const SizedBox(height: 40),
              
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
              
              // Quick add text field (uneditable placeholder)
              const SizedBox(height: 20),
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
              const SizedBox(height: 20),
            ],
          ),
        ),
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
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              // Icon
              CircleAvatar(
                radius: 24,
                backgroundColor: Colors.blueAccent.withValues(alpha: 0.1),
                child: _getIconForGroup(group.icon),
              ),
              const SizedBox(width: 16),
              
              // Title and description
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      group.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      group.description,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              
              // Arrow icon
              const Icon(Icons.arrow_forward_ios, size: 20, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }

  Icon _getIconForGroup(String iconType) {
    switch (iconType) {
      case "priority":
        return const Icon(Icons.notification_important, color: Colors.blueAccent, size: 28);
      case "contact":
        return const Icon(Icons.person, color: Colors.green, size: 28);
      default:
        return const Icon(Icons.question_mark, color: Colors.grey, size: 28);
    }
  }
}
