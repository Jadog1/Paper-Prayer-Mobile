import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prayer_ml/prayers/groups/batch_paper_mode/models/batch_content_item.dart';
import 'package:prayer_ml/prayers/groups/batch_paper_mode/models/batch_paper_mode_config.dart';
import 'package:prayer_ml/prayers/groups/batch_paper_mode/providers/batch_paper_mode_provider.dart';
import 'package:prayer_ml/prayers/groups/models/contact_model.dart';

/// Read mode view with draggable items, click to edit, swipe to delete
class ReadModeView extends ConsumerStatefulWidget {
  const ReadModeView({
    super.key,
    required this.config,
  });

  final BatchPaperModeConfig config;

  @override
  ConsumerState<ReadModeView> createState() => _ReadModeViewState();
}

class _ReadModeViewState extends ConsumerState<ReadModeView> {
  bool _tipsExpanded = true;

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(batchPaperModeNotifierProvider(widget.config));
    final notifier = ref.read(batchPaperModeNotifierProvider(widget.config).notifier);

    if (state.parsedItems.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.inbox_outlined, size: 64, color: Colors.grey.shade400),
            const SizedBox(height: 16),
            Text(
              'No content to display',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey.shade600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Switch to Edit Mode to add content',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade500,
              ),
            ),
          ],
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Collapsible Instructions
        InkWell(
          onTap: () {
            setState(() {
              _tipsExpanded = !_tipsExpanded;
            });
          },
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.green.shade50,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.check_circle_outline, color: Colors.green.shade700, size: 20),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Read Mode - Review & Organize',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.green.shade700,
                        ),
                      ),
                    ),
                    Icon(
                      _tipsExpanded ? Icons.expand_less : Icons.expand_more,
                      color: Colors.green.shade700,
                    ),
                  ],
                ),
                if (_tipsExpanded) ...[
                  const SizedBox(height: 8),
                  _buildTip(Icons.edit, 'To edit, tap the eye button at the top'),
                  _buildTip(Icons.drag_indicator, 'Drag items to reorder'),
                  _buildTip(Icons.touch_app, 'Tap to edit content or change type'),
                  _buildTip(Icons.swipe, 'Swipe left to delete'),
                  if (state.hasUnresolvedContacts) ...[
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.warning_amber, color: Colors.orange.shade700, size: 16),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'Please resolve ambiguous contacts before submitting',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.orange.shade700,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),

        // Reorderable list
        Expanded(
          child: ReorderableListView.builder(
            onReorder: (oldIndex, newIndex) {
              notifier.reorderItems(oldIndex, newIndex);
            },
            itemCount: state.parsedItems.length,
            itemBuilder: (context, index) {
              final item = state.parsedItems[index];
              return _buildContentItem(
                context,
                ref,
                item,
                index,
                notifier,
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildTip(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Row(
        children: [
          Icon(icon, size: 14, color: Colors.grey.shade600),
          const SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContentItem(
    BuildContext context,
    WidgetRef ref,
    BatchContentItem item,
    int index,
    BatchPaperModeNotifier notifier,
  ) {
    final isFirstItemUnderContact = item.isPrayerRequest && index > 0 && 
        ref.read(batchPaperModeNotifierProvider(widget.config)).parsedItems[index - 1].isContact;

    return Dismissible(
      key: Key(item.id),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) async {
        return await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Delete Item'),
            content: const Text('Are you sure you want to delete this item?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                style: TextButton.styleFrom(foregroundColor: Colors.red),
                child: const Text('Delete'),
              ),
            ],
          ),
        ) ?? false;
      },
      onDismissed: (direction) {
        notifier.deleteItem(item.id);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Item deleted')),
        );
      },
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 16),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      child: Card(
        margin: EdgeInsets.only(
          bottom: 8,
          left: item.isPrayerRequest && isFirstItemUnderContact ? 24 : 0,
        ),
        elevation: item.isAmbiguousContact ? 4 : 2,
        color: item.isContact
            ? Colors.blue.shade50
            : item.isAmbiguousContact
                ? Colors.orange.shade50
                : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(
            color: item.isAmbiguousContact
                ? Colors.orange.shade400
                : item.isContact
                    ? Colors.blue.shade300
                    : Colors.grey.shade300,
            width: item.isAmbiguousContact ? 2 : 1,
          ),
        ),
        child: InkWell(
          onTap: () => _showEditDialog(context, item, notifier),
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                // Drag handle
                Icon(
                  Icons.drag_indicator,
                  color: Colors.grey.shade400,
                ),
                const SizedBox(width: 12),

                // Icon based on type
                Icon(
                  item.isContact
                      ? Icons.person
                      : item.isAmbiguousContact
                          ? Icons.help_outline
                          : Icons.note_add,
                  color: item.isContact
                      ? Colors.blue.shade700
                      : item.isAmbiguousContact
                          ? Colors.orange.shade700
                          : Colors.grey.shade600,
                  size: item.isPrayerRequest ? 8 : 20,
                ),
                const SizedBox(width: 12),

                // Content
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.isContact && item.contact != null
                            ? item.contact!.name
                            : item.content,
                        style: TextStyle(
                          fontSize: item.isContact ? 16 : 14,
                          fontWeight: item.isContact ? FontWeight.bold : FontWeight.normal,
                          color: item.isContact
                              ? Colors.blue.shade900
                              : item.isAmbiguousContact
                                  ? Colors.orange.shade900
                                  : Colors.grey.shade800,
                        ),
                      ),
                      if (item.isAmbiguousContact) ...[
                        const SizedBox(height: 4),
                        Text(
                          'Ambiguous contact - tap to resolve',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.orange.shade700,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),

                // Edit icon
                Icon(
                  Icons.edit_outlined,
                  color: Colors.grey.shade500,
                  size: 18,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showEditDialog(
    BuildContext context,
    BatchContentItem item,
    BatchPaperModeNotifier notifier,
  ) {
    if (item.isAmbiguousContact) {
      _showResolveContactDialog(context, item, notifier);
    } else {
      _showEditContentDialog(context, item, notifier);
    }
  }

  void _showResolveContactDialog(
    BuildContext context,
    BatchContentItem item,
    BatchPaperModeNotifier notifier,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Resolve Ambiguous Contact'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Multiple contacts match "${item.content}". Please select the correct one:',
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 16),
            ...item.possibleContacts!.map((contact) => ListTile(
                  leading: const Icon(Icons.person),
                  title: Text(contact.name),
                  subtitle: contact.description != null && contact.description!.isNotEmpty
                      ? Text(contact.description!)
                      : null,
                  onTap: () {
                    notifier.resolveAmbiguousContact(item.id, contact);
                    Navigator.of(context).pop();
                  },
                )),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }

  void _showEditContentDialog(
    BuildContext context,
    BatchContentItem item,
    BatchPaperModeNotifier notifier,
  ) {
    final controller = TextEditingController(
      text: item.isContact && item.contact != null 
        ? item.contact!.name 
        : item.content
    );
    var selectedType = item.type;
    Contact? selectedContact = item.contact;
    
    final availableContacts = widget.config.groupContacts?.members ?? [];

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit Item'),
        content: SingleChildScrollView(
          child: StatefulBuilder(
            builder: (context, setState) => Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Type:', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                SegmentedButton<BatchContentItemType>(
                  segments: const [
                    ButtonSegment(
                      value: BatchContentItemType.prayerRequest,
                      label: Text('Prayer Request'),
                      icon: Icon(Icons.note_add, size: 8),
                    ),
                    ButtonSegment(
                      value: BatchContentItemType.contact,
                      label: Text('Contact'),
                      icon: Icon(Icons.person),
                    ),
                  ],
                  selected: {selectedType},
                  onSelectionChanged: (Set<BatchContentItemType> newSelection) {
                    setState(() {
                      selectedType = newSelection.first;
                      // Reset contact selection when switching away from contact type
                      if (selectedType != BatchContentItemType.contact) {
                        selectedContact = null;
                      }
                    });
                  },
                ),
                const SizedBox(height: 16),
                if (selectedType == BatchContentItemType.contact) ...[
                  const Text('Contact:', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  DropdownButtonFormField<Contact>(
                    value: selectedContact,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Select a contact...',
                    ),
                    items: availableContacts.map((contact) {
                      return DropdownMenuItem<Contact>(
                        value: contact,
                        child: Text(contact.name),
                      );
                    }).toList(),
                    onChanged: (Contact? newValue) {
                      setState(() {
                        selectedContact = newValue;
                        if (newValue != null) {
                          controller.text = newValue.name;
                        }
                      });
                    },
                  ),
                ] else ...[
                  const Text('Content:', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  TextField(
                    controller: controller,
                    maxLines: 3,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter prayer request...',
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (selectedType == BatchContentItemType.contact) {
                if (selectedContact != null) {
                  final updatedItem = item.copyWith(
                    content: selectedContact!.name,
                    type: selectedType,
                    contact: selectedContact,
                  );
                  notifier.updateItem(item.id, updatedItem);
                  Navigator.of(context).pop();
                } else {
                  // Show error if no contact selected
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please select a contact'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              } else {
                final updatedItem = item.copyWith(
                  content: controller.text,
                  type: selectedType,
                  contact: null, // Clear contact when changing to prayer request
                );
                notifier.updateItem(item.id, updatedItem);
                Navigator.of(context).pop();
              }
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
