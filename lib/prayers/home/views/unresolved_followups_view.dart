import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prayer_ml/prayers/groups/models/collection_model.dart';
import 'package:prayer_ml/prayers/groups/requests.dart';
import 'package:prayer_ml/prayers/home/repos/recommendations_repo.dart';
import 'package:riverpod_paging_utils/riverpod_paging_utils.dart';

class UnresolvedFollowupsView extends ConsumerWidget {
  final int lookbackDays;

  const UnresolvedFollowupsView({
    super.key,
    this.lookbackDays = 30,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = paginatedUnresolvedFollowupsNotifierProvider(10, lookbackDays: lookbackDays);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Unresolved Follow-ups"),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: PagingHelperView(
          provider: provider,
          futureRefreshable: provider.future,
          notifierRefreshable: provider.notifier,
          contentBuilder: (data, widgetCount, endItemView) => ListView.builder(
            itemCount: widgetCount,
            itemBuilder: (context, index) {
              if (index == widgetCount - 1) {
                return endItemView;
              }
              final collection = data.items[index];
              return _CollectionCard(collection: collection);
            },
          ),
        ),
      ),
    );
  }
}

class _CollectionCard extends StatelessWidget {
  final Collection collection;

  const _CollectionCard({required this.collection});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => RequestDashboardLoader(
              collection: collection,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Collection header with notebook-style left margin
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Left margin line (like notebook paper) - with accent color
                  Column(
                    children: [
                      Expanded(
                        child: Container(
                          width: 3,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Colors.orange[300]!, Colors.orange[200]!],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                            borderRadius: BorderRadius.circular(1.5),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 12),
                  
                  // Content
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Collection title
                        Text(
                          collection.title ?? "Untitled",
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 4),
                        // Who is being prayed for
                        _PrayingForText(collection: collection),
                        const SizedBox(height: 6),
                        // Collection summary
                        if (collection.description != null && collection.description!.isNotEmpty)
                          Text(
                            collection.description!,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[700],
                              height: 1.4,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                      ],
                    ),
                  ),
                  
                  // Arrow icon
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Icon(
                      Icons.chevron_right,
                      color: Colors.grey[400],
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
            
            // Subtle divider between collections
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Divider(
                height: 1,
                thickness: 1,
                color: Colors.grey[200],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PrayingForText extends StatelessWidget {
  final Collection collection;

  const _PrayingForText({required this.collection});

  @override
  Widget build(BuildContext context) {
    String prayingFor = collection.user.name;
    if (collection.relatedContacts.isNotEmpty) {
      final relatedNames = collection.relatedContacts
          .map((contact) => contact.name)
          .join(", ");
      prayingFor += " · $relatedNames";
    }

    return Row(
      children: [
        Icon(Icons.person_outline, size: 14, color: Colors.orange[700]),
        const SizedBox(width: 4),
        Expanded(
          child: Text(
            prayingFor,
            style: TextStyle(
              fontSize: 13,
              color: Colors.orange[700],
              fontWeight: FontWeight.w500,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
