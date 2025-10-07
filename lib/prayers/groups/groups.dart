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
      _ => const GroupViewSkeleton(),
    };
  }
}

class GroupView extends ConsumerWidget {
  const GroupView({super.key, required this.groupContacts});
  final List<GroupContacts> groupContacts;

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
        height: 52,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: _isFocused
              ? [
                  BoxShadow(
                    color: const Color(0xFF8B7355).withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  )
                ]
              : [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 4,
                    offset: const Offset(0, 1),
                  )
                ],
        ),
        child: TextField(
          onChanged: (text) => widget.searchState.filter(text),
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              color: _isFocused ? const Color(0xFF8B7355) : Colors.grey[600],
            ),
            hintText: 'Search Notebooks...',
            hintStyle: TextStyle(color: Colors.grey[500]),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(vertical: 16),
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
      elevation: 8,
      shadowColor: Colors.black.withOpacity(0.3),
      color: const Color(0xFFFFF9E6), // Warm paper color
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      child: InkWell(
        borderRadius: BorderRadius.circular(4),
        child: Stack(
          children: [
            // Spiral binding (Left Side)
            Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              child: Container(
                width: 24,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.grey.shade400,
                      Colors.grey.shade300,
                      Colors.grey.shade400,
                    ],
                    stops: const [0.0, 0.5, 1.0],
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4),
                    bottomLeft: Radius.circular(4),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    8,
                    (index) => Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.shade600,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 2,
                            offset: const Offset(1, 1),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // Paper texture lines
            Positioned(
              left: 32,
              right: 8,
              top: 50,
              bottom: 50,
              child: CustomPaint(
                painter: NotebookLinesPainter(),
              ),
            ),

            // Corner fold effect
            Positioned(
              top: 0,
              right: 0,
              child: CustomPaint(
                size: const Size(30, 30),
                painter: CornerFoldPainter(),
              ),
            ),

            // Content
            Padding(
              padding: const EdgeInsets.only(left: 32, right: 12, top: 12, bottom: 8),
              child: Column(
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              groupContacts.group.name,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade900,
                                shadows: [
                                  Shadow(
                                    color: Colors.black.withOpacity(0.1),
                                    offset: const Offset(0.5, 0.5),
                                  ),
                                ],
                              ),
                            ),
                            if (groupContacts.group.description != null)
                              Padding(
                                padding: const EdgeInsets.only(top: 6),
                                child: Text(
                                  groupContacts.group.description!,
                                  style: TextStyle(
                                    color: Colors.grey[700],
                                    fontSize: 13,
                                    height: 1.4,
                                  ),
                                  maxLines: 3,
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
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.settings, 
                                color: Colors.grey.shade700, size: 20),
                              padding: const EdgeInsets.all(8),
                              visualDensity: VisualDensity.compact,
                              onPressed: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      GroupSettings(groupContacts: groupContacts),
                                ),
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.people,
                                color: Colors.grey.shade700, size: 20),
                              padding: const EdgeInsets.all(8),
                              visualDensity: VisualDensity.compact,
                              onPressed: () =>
                                  _showMembersModal(context, groupContacts),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
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

// Custom painter for notebook lines
class NotebookLinesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFE8DCC8).withOpacity(0.4)
      ..strokeWidth = 1.0;

    const lineSpacing = 20.0;
    for (double y = 0; y < size.height; y += lineSpacing) {
      canvas.drawLine(
        Offset(0, y),
        Offset(size.width, y),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Custom painter for corner fold effect
class CornerFoldPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final path = Path()
      ..moveTo(size.width, 0)
      ..lineTo(size.width - size.width, size.height)
      ..lineTo(size.width, size.height)
      ..close();

    final paint = Paint()
      ..color = Colors.grey.shade300
      ..style = PaintingStyle.fill;

    canvas.drawPath(path, paint);

    final borderPaint = Paint()
      ..color = Colors.grey.shade400
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    canvas.drawLine(
      Offset(size.width, size.height),
      Offset(size.width - size.width, size.height),
      borderPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
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

// Skeleton loading state that matches the grid layout
class GroupViewSkeleton extends StatelessWidget {
  const GroupViewSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Header skeleton
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  children: [
                    Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      width: 180,
                      height: 24,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ],
                ),
              ),
              // Search bar skeleton
              Container(
                height: 52,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 4,
                      offset: const Offset(0, 1),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // Grid skeleton
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.85,
                  ),
                  itemCount: 6, // Show 6 skeleton items
                  itemBuilder: (context, index) {
                    return const NotebookSkeleton();
                  },
                ),
              ),
              const SizedBox(height: 12),
              // Button skeleton
              Container(
                width: double.infinity,
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Skeleton for individual notebook cards with shimmer effect
class NotebookSkeleton extends StatefulWidget {
  const NotebookSkeleton({super.key});

  @override
  State<NotebookSkeleton> createState() => _NotebookSkeletonState();
}

class _NotebookSkeletonState extends State<NotebookSkeleton>
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
    return Card(
      elevation: 8,
      shadowColor: Colors.black.withOpacity(0.3),
      color: const Color(0xFFFFF9E6),
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      child: Stack(
        children: [
          // Spiral binding
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            child: Container(
              width: 24,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.grey.shade400,
                    Colors.grey.shade300,
                    Colors.grey.shade400,
                  ],
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(4),
                  bottomLeft: Radius.circular(4),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  8,
                  (index) => Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Content with shimmer
          Padding(
            padding: const EdgeInsets.only(left: 32, right: 12, top: 12, bottom: 8),
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 20,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          height: 14,
                          width: double.infinity * 0.8,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Container(
                          height: 14,
                          width: double.infinity * 0.6,
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
                          offset: Offset(_animation.value * 100, 0),
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.transparent,
                                  Colors.white.withOpacity(0.3),
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
          ),
        ],
      ),
    );
  }
}
