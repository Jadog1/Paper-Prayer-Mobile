import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prayer_ml/prayers/groups/batch_paper_mode/batch_paper_mode.dart';
import 'package:prayer_ml/prayers/groups/contact_page_settings.dart';
import 'package:prayer_ml/prayers/groups/contact_view.dart';
import 'package:prayer_ml/prayers/groups/models/contact_model.dart';
import 'package:prayer_ml/prayers/groups/models/group_model.dart';
import 'package:prayer_ml/prayers/groups/group_page_settings.dart';
import 'package:prayer_ml/prayers/groups/repos/repo.dart';
import 'package:prayer_ml/prayers/groups/paper_mode/paper_mode.dart';
import 'package:prayer_ml/prayers/groups/group_access/group_access_page.dart';
import 'package:prayer_ml/shared/widgets.dart';
// import 'view_model.dart';

class Groups extends ConsumerWidget {
  const Groups({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const GroupConsumer();
    // return Navigator(
    //   onGenerateRoute: (settings) => MaterialPageRoute(
    //     builder: (context) => const GroupConsumer(),
    //   ),
    // );
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
          caller: "GroupConsumer",
          error: error,
          stackTrace: stackTrace,
          onRetry: () => ref.invalidate(groupContactsRepoProvider)),
      _ => const GroupViewSkeleton(),
    };
  }
}

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
                    color: const Color(0xFF8B7355).withValues(alpha: 0.3),
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

  final GroupWithMembers groupContacts;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      elevation: 8,
      shadowColor: Colors.black.withValues(alpha: 0.3),
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
                            color: Colors.black.withValues(alpha: 0.2),
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
              padding: const EdgeInsets.only(
                  left: 32, right: 12, top: 12, bottom: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Group Name & Description
                  Expanded(
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => PaperModePermissions(
                                groupContacts: groupContacts)),
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
                                    color: Colors.black.withValues(alpha: 0.1),
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

                  // Bottom Action Bar - Permission Badge + Menu Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildPermissionBadge(context, groupContacts.group),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.6),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: PopupMenuButton<String>(
                          icon: Icon(
                            Icons.more_horiz,
                            color: Colors.grey.shade700,
                            size: 20,
                          ),
                          padding: const EdgeInsets.all(8),
                          tooltip: 'Notebook Options',
                          onSelected: (value) {
                            switch (value) {
                              case 'batch_insert':
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => BatchPaperMode(
                                      config: BatchPaperModeConfig.withGroup(
                                        groupContacts: groupContacts,
                                      ),
                                    ),
                                  ),
                                );
                                break;
                              case 'access':
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => GroupAccessPage(
                                      groupId: groupContacts.group.id,
                                      groupName: groupContacts.group.name,
                                      mode: GroupAccessPageMode.add,
                                    ),
                                  ),
                                );
                                break;
                              case 'settings':
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => GroupSettings(
                                        groupContacts: groupContacts),
                                  ),
                                );
                                break;
                              case 'members':
                                _showMembersModal(context, groupContacts);
                                break;
                            }
                          },
                          itemBuilder: (BuildContext context) =>
                              <PopupMenuEntry<String>>[
                            PopupMenuItem<String>(
                              value: 'batch_insert',
                              enabled: hasPermission(
                                  groupContacts.group, Permission.editPrayers),
                              child: Row(
                                children: [
                                  Icon(Icons.playlist_add,
                                      size: 20, color: Colors.grey.shade700),
                                  const SizedBox(width: 12),
                                  const Text('Batch Insert'),
                                ],
                              ),
                            ),
                            PopupMenuItem<String>(
                              value: 'access',
                              enabled: hasPermission(
                                  groupContacts.group, Permission.editGroup),
                              child: Row(
                                children: [
                                  Icon(Icons.person_add_alt_1,
                                      size: 20, color: Colors.grey.shade700),
                                  const SizedBox(width: 12),
                                  const Text('Manage Access'),
                                ],
                              ),
                            ),
                            PopupMenuItem<String>(
                              value: 'members',
                              child: Row(
                                children: [
                                  Icon(Icons.people,
                                      size: 20, color: Colors.grey.shade700),
                                  const SizedBox(width: 12),
                                  const Text('View Members'),
                                ],
                              ),
                            ),
                            PopupMenuItem<String>(
                              value: 'settings',
                              enabled: hasPermission(
                                  groupContacts.group, Permission.editGroup),
                              child: Row(
                                children: [
                                  Icon(Icons.settings,
                                      size: 20, color: Colors.grey.shade700),
                                  const SizedBox(width: 12),
                                  const Text('Settings'),
                                ],
                              ),
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

  Widget _buildPermissionBadge(
      BuildContext context, GroupWithPermissions group) {
    final bool canEdit = hasPermission(group, Permission.editPrayers);
    final bool canManage = hasPermission(group, Permission.editGroup);

    final Color color;
    final IconData icon;

    if (canManage) {
      color = const Color(0xFF8B7355);
      icon = Icons.admin_panel_settings;
    } else if (canEdit) {
      color = Colors.blue.shade700;
      icon = Icons.edit;
    } else {
      color = Colors.grey.shade600;
      icon = Icons.visibility;
    }

    return GestureDetector(
      onTap: () => _showPermissionsDialog(context, groupContacts),
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.9),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.15),
              blurRadius: 3,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Icon(icon, size: 14, color: Colors.white),
      ),
    );
  }

  void _showPermissionsDialog(
      BuildContext context, GroupWithMembers groupContacts) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFF8B7355).withValues(alpha: 0.15),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.security,
                color: Color(0xFF8B7355),
                size: 24,
              ),
            ),
            const SizedBox(width: 12),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your Permissions',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Access rights for this notebook',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF9E6),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: const Color(0xFF8B7355).withValues(alpha: 0.2),
                  ),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.book,
                      color: Color(0xFF8B7355),
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        groupContacts.group.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'What you can do:',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 8),
              _permissionItem(
                'View content',
                'See prayers and requests in this notebook',
                hasPermission(groupContacts.group, Permission.view),
              ),
              _permissionItem(
                'Edit prayers',
                'Add, edit, and modify prayer requests',
                hasPermission(groupContacts.group, Permission.editPrayers),
              ),
              _permissionItem(
                'Manage notebook',
                'Edit notebook settings and members',
                hasPermission(groupContacts.group, Permission.editGroup),
              ),
              _permissionItem(
                'Delete notebook',
                'Permanently delete this notebook',
                hasPermission(groupContacts.group, Permission.deleteGroup),
              ),
              const Divider(height: 24),
              const Text(
                'Document permissions:',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 8),
              _permissionItem(
                'View documents',
                'Access attached documents',
                hasPermission(groupContacts.group, Permission.viewDocument),
              ),
              _permissionItem(
                'Edit documents',
                'Upload and modify documents',
                hasPermission(groupContacts.group, Permission.editDocument),
              ),
              _permissionItem(
                'Delete documents',
                'Remove documents from notebook',
                hasPermission(groupContacts.group, Permission.deleteDocument),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Close',
              style: TextStyle(color: Color(0xFF8B7355)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _permissionItem(String label, String description, bool granted) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 2),
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: granted
                  ? Colors.green.withValues(alpha: 0.1)
                  : Colors.red.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              granted ? Icons.check : Icons.close,
              color: granted ? Colors.green : Colors.red,
              size: 16,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: granted ? Colors.grey[800] : Colors.grey[500],
                  ),
                ),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 11,
                    color: granted ? Colors.grey[600] : Colors.grey[400],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showMembersModal(BuildContext context, GroupWithMembers groupContacts) {
    Widget? trailingIcon(Contact member) {
      final bool canEdit =
          hasPermission(groupContacts.group, Permission.editGroup);

      if (!canEdit) {
        return null;
      }
      return IconButton(
        icon: Icon(Icons.edit_outlined, color: Colors.grey[600]),
        onPressed: () {
          Navigator.of(context).pop(); // Close modal
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ContactPageSettings(
                contact: member,
                group: groupContacts.group,
              ),
            ),
          );
        },
      );
    }

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return Consumer(
          builder: (context, ref, child) {
            return Container(
              height: MediaQuery.of(context).size.height * 0.7,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Column(
                children: [
                  // Handle bar
                  Container(
                    margin: const EdgeInsets.only(top: 12),
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),

                  // Header
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color:
                                const Color(0xFF8B7355).withValues(alpha: 0.15),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.people,
                            color: Color(0xFF8B7355),
                            size: 24,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Members",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[800],
                                ),
                              ),
                              Text(
                                "${groupContacts.members.length} member${groupContacts.members.length != 1 ? 's' : ''} in ${groupContacts.group.name}",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  Divider(height: 1, color: Colors.grey[200]),

                  // Members list
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      itemCount: groupContacts.members.length,
                      itemBuilder: (context, index) {
                        final member = groupContacts.members[index];
                        return Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.grey[50],
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.grey[200]!),
                          ),
                          child: ListTile(
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            onTap: () {
                              Navigator.of(context).pop(); // Close modal
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => ContactView(
                                    contact: member,
                                    groupId: groupContacts.group.id,
                                  ),
                                ),
                              );
                            },
                            leading: Hero(
                              tag: 'contact_${member.id}',
                              child: Container(
                                width: 48,
                                height: 48,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      Colors.green[400]!,
                                      Colors.green[600]!
                                    ],
                                  ),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.person,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              ),
                            ),
                            title: Text(
                              member.name,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            subtitle: member.description != null &&
                                    member.description!.isNotEmpty
                                ? Text(
                                    member.description!,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey[600],
                                    ),
                                  )
                                : null,
                            trailing: trailingIcon(member),
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

class PaperModePermissions extends StatelessWidget {
  const PaperModePermissions({
    super.key,
    required this.groupContacts,
  });

  final GroupWithMembers groupContacts;

  @override
  Widget build(BuildContext context) {
    if (!hasPermission(groupContacts.group, Permission.view)) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Access Denied"),
          backgroundColor: const Color(0xFF8B7355),
        ),
        body: const Center(
          child: Text(
            "You do not have permission to view this notebook.",
            style: TextStyle(fontSize: 16),
          ),
        ),
      );
    }
    if (!hasPermission(groupContacts.group, Permission.editPrayers)) {
      return PaperMode(
          config: PaperModeConfig.readOnly(groupContacts: groupContacts));
    }
    return PaperMode(
        config: PaperModeConfig.editable(groupContacts: groupContacts));
  }
}

// Custom painter for notebook lines
class NotebookLinesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFE8DCC8).withValues(alpha: 0.4)
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
  SearchState({required List<GroupWithMembers> groupContacts}) {
    _groupContacts = groupContacts;
    _filteredGroupContacts = groupContacts;
  }

  List<GroupWithMembers> _groupContacts = [];
  List<GroupWithMembers> _filteredGroupContacts = [];
  String searchText = "";

  List<GroupWithMembers> get groupContacts => _filteredGroupContacts;

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
    .family<SearchState, List<GroupWithMembers>>((ref, groupContacts) {
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
      shadowColor: Colors.black.withValues(alpha: 0.3),
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
            padding:
                const EdgeInsets.only(left: 32, right: 12, top: 12, bottom: 8),
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
                                  Colors.white.withValues(alpha: 0.3),
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
