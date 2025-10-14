import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:prayer_ml/prayers/groups/models/contact_model.dart';
import 'package:prayer_ml/prayers/groups/models/group_model.dart';
import 'package:prayer_ml/prayers/groups/paper_mode/components/paper_margin_space.dart';
import 'package:prayer_ml/prayers/groups/paper_mode/models/paper_mode_config.dart';
import 'package:prayer_ml/prayers/groups/paper_mode/providers/paper_mode_provider.dart';
import 'package:prayer_ml/prayers/groups/repos/repo.dart';

/// A widget for selecting or creating a user/contact for a prayer request
class UserSelection extends ConsumerStatefulWidget {
  const UserSelection({
    super.key,
    required this.currentGroup,
    required this.focusNode,
    required this.controller,
    required this.config,
    this.changeCallback,
  });

  final GroupWithMembers currentGroup;
  final void Function(ContactAndGroupPair)? changeCallback;
  final TextEditingController controller;
  final FocusNode focusNode;
  final PaperModeConfig config;

  @override
  ConsumerState<UserSelection> createState() => _UserSelectionState();
}

class _UserSelectionState extends ConsumerState<UserSelection> {
  @override
  void initState() {
    super.initState();
    final stateNotifier = ref.read(paperModeStateProvider);
    if (widget.config.skipKeyboardFocusOnLoad == true || stateNotifier.state.createdFirstFocusOnEditMode) {
      return;
    }
    SchedulerBinding.instance.addPostFrameCallback((_) {
      stateNotifier.setCreatedFirstFocusOnEditMode();
      widget.focusNode.requestFocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    final stateNotifier = ref.watch(paperModeStateProvider);
    
    return PaperMarginSpace(
      icon: const Icon(Icons.person_add, size: 16),
      paperLine: Expanded(
        child: TypeAheadField<ContactAndGroupPair>(
          focusNode: widget.focusNode,
          autoFlipDirection: true,
          controller: widget.controller,
          builder: (context, controller, focusNode) => TextField(
            controller: controller,
            focusNode: focusNode,
            textCapitalization: TextCapitalization.words,
            decoration: const InputDecoration(
              hintText: "Who are you praying for?",
              border: UnderlineInputBorder(),
              hintStyle: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),
            ),
          ),
          itemBuilder: (context, ContactAndGroupPair suggestion) {
            if (suggestion.contact.id == 0 &&
                suggestion.contact.name == "Create new contact") {
              return ListTile(
                title: Text(suggestion.contact.name,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
              );
            }
            return ListTile(
              title: Text(suggestion.contact.name),
              subtitle: Text(suggestion.contact.description ?? ""),
            );
          },
          suggestionsCallback: (String suggestion) {
            if (suggestion.startsWith("@")) {
              suggestion = suggestion.substring(1);
            }
            if (suggestion.isEmpty) {
              return Future.value(null);
            }
            var filteredContacts = widget.currentGroup.memberWithContactGroupPairs
                .where((member) {
              return member.contact.name
                  .toLowerCase()
                  .contains(suggestion.toLowerCase());
            }).toList();
            filteredContacts.add(ContactAndGroupPair(
              contact: Contact(
                  id: 0,
                  name: "Create new contact",
                  description: "",
                  createdAt: DateTime.now().toIso8601String(),
                  accountId: 0),
              groupPair: ContactGroupPairs(
                  id: 0,
                  groupId: widget.currentGroup.group.id,
                  contactId: 0,
                  createdAt: DateTime.now().toIso8601String()),
            ));
            return Future.value(filteredContacts);
          },
          onSelected: (value) async {
            if (value.contact.id == 0 &&
                value.contact.name == "Create new contact") {
              try {
                var name = widget.controller.text;
                if (name.startsWith("@")) {
                  name = name.substring(1);
                }
                var newContact = Contact(
                    id: 0,
                    name: name,
                    description: "",
                    createdAt: DateTime.now().toIso8601String(),
                    accountId: 0);
                newContact = await ref
                    .read(groupContactsRepoProvider.notifier)
                    .saveContact(newContact, widget.currentGroup.group);
                var contactGroupPair = await ref.read(
                    fetchContactGroupProvider(
                            newContact.id, widget.currentGroup.group.id)
                        .future);
                value = ContactAndGroupPair(
                    contact: newContact, groupPair: contactGroupPair);
                widget.currentGroup.memberWithContactGroupPairs.add(value);
              } catch (e) {
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text("An error occured. Please try again.")),
                  );
                  log('Error in UserSelection', error: e);
                }
                return;
              }
            }
            stateNotifier.setContact(value);
            setState(() {
              widget.controller.clear();
            });
            if (widget.changeCallback != null) {
              widget.changeCallback!(value);
            }
          },
        ),
      ),
    );
  }
}
