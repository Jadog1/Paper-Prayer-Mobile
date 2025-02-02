import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prayer_ml/prayers/groups/models/contact_model.dart';
import 'package:prayer_ml/prayers/groups/models/request_model.dart';
import 'package:prayer_ml/prayers/groups/repos/repo.dart';
import 'package:prayer_ml/prayers/groups/view_model.dart';
import 'package:prayer_ml/prayers/prayers_shared/prayers_shared_widgets.dart';
import 'package:prayer_ml/shared/widgets.dart';

class PrayerRequestWithAll {
  final PrayerRequest request;
  final List<RelatedContact> relatedContacts;

  PrayerRequestWithAll({required this.request, required this.relatedContacts});
}

class PrayerRequestConsumer extends ConsumerWidget {
  const PrayerRequestConsumer({super.key, required this.user});

  final Contact user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var viewModel = ref.watch(fetchPrayerRequestContactProvider(user));

    return switch(viewModel) {
      AsyncData(:final value) => PrayerRequestView(prayerRequestContact: value),
      AsyncError(:final error, :final stackTrace) => PrintError(caller: "PrayerRequestConsumer", error: error, stackTrace: stackTrace),
      _ => const CircularProgressIndicator(),
    };
  }
}

class PrayerRequestView extends ConsumerWidget {
  const PrayerRequestView({super.key, required this.prayerRequestContact});

  final PrayerRequestContact prayerRequestContact;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var user = prayerRequestContact.user;
    var contactGroup = const ContactGroupPairs(id: 0, contactId: 0, groupId: 0, createdAt: "");
    if (prayerRequestContact.prayerRequests.isNotEmpty) {
      contactGroup = prayerRequestContact.prayerRequests[0].group;
    }


    return Column(
      children: [
        AppBar(
          title: Text(user.name),
        ),
        Expanded(child: PrayerRequests(prayerRequestContact: prayerRequestContact,)),
        AddPrayerRequest(user: user, contactGroup: contactGroup),
      ],
    );
  }
}

class PrayerRequests extends StatelessWidget {
  const PrayerRequests({super.key, required this.prayerRequestContact});

  final PrayerRequestContact prayerRequestContact;

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: prayerRequestContact.prayerRequests.length,
        reverse: true,
        itemBuilder: (context, index) => CompactRequestCard(
          request: prayerRequestContact.prayerRequests[index], 
          allRelatedContacts: prayerRequestContact.relatedContacts,
          child: CompactRequestButtonGroup(request: prayerRequestContact.prayerRequests[index], allRelatedContacts: prayerRequestContact.relatedContacts),
        ),
      ),
    );
  }
}

class CompactRequestButtonGroup extends ConsumerWidget {
  const CompactRequestButtonGroup({super.key, required this.request, required this.allRelatedContacts});

  final PrayerRequest request;
  final List<RelatedContact> allRelatedContacts;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var prayerWithAll = PrayerRequestWithAll(request: request, relatedContacts: allRelatedContacts);
    return SizedBox(
      height: 26,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        spacing: 25,
        children: [
            IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            style: const ButtonStyle(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap, // the '2023' part
            ),
            visualDensity: VisualDensity.compact,
            icon: const Icon(Icons.dashboard_customize),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => RequestDashboard(prayerWithAll: prayerWithAll)),
            ),
          ),
          const Spacer(),
          IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            style: const ButtonStyle(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap, // the '2023' part
            ),
            visualDensity: VisualDensity.compact,
            icon: const Icon(Icons.edit),
            onPressed: () => editPrayerRequestBottomSheet(context, ref, request),
          ),
          DeleteConfirmationButton(
            onDelete: () => ref.read(prayerRequestRepoProvider(request.user.id).notifier).removeRequest(request),
            onCancel: () => {},
            deleteContext: "prayer request",
            child:  const Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}


Icon sentimentIcon(String? sentiment) {
  switch (sentiment) {
    case 'positive':
      return const Icon(Icons.sentiment_very_satisfied_sharp);
    case 'negative':
      return const Icon(Icons.sentiment_very_dissatisfied);
    case 'neutral':
      return const Icon(Icons.sentiment_neutral_rounded);
    default:
      return const Icon(Icons.question_mark);
  }
}

// AddPrayerRequest will contain a text field to add a new prayer request
// The save button should be hidden unless the text field is not empty
// It should have hint text of "Create a new prayer request"
class AddPrayerRequest extends ConsumerStatefulWidget {
  const AddPrayerRequest({super.key, required this.user, required this.contactGroup});

  final Contact user;
  final ContactGroupPairs contactGroup;

  @override
  ConsumerState<AddPrayerRequest> createState() => _AddPrayerRequestState();
}
class _AddPrayerRequestState extends ConsumerState<AddPrayerRequest> {
  var newRequest = "";

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 200),
      child: Column(
        children: [
          const Text("Create a new prayer request", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Expanded(
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Prayer Request',
              ),
              onChanged: (value) => setState(() => newRequest = value),
              maxLines: 5,
              minLines: 3
            ),
          ),
          newRequest.isEmpty ? const SizedBox.shrink() :
            InteractiveLoadButton(
              customProvider: () => ref.read(prayerRequestRepoProvider(widget.user.id).notifier).saveRequest(PrayerRequest(id: 0, request: newRequest, user: widget.user, group: widget.contactGroup, relatedContactIds: [])),
              buttonText: 'Save',
              buttonStyle: saveButtonStyle,
              successCallback: () => setState(() => newRequest = ""),
            ),
        ],
      ),
    );
  }
}

Future<dynamic> editPrayerRequestBottomSheet(BuildContext context, WidgetRef ref, PrayerRequest request) {
  var newRequest = request.request;
  return showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Column(
        children: [
          const Text("Edit Prayer Request"),
          TextField(
            controller: TextEditingController(text: request.request),
            decoration: const InputDecoration(
              labelText: 'Prayer Request',
            ),
            onChanged: (value) => newRequest = value,
            maxLines: 5,
          ),
          InteractiveLoadButton(
            customProvider: () => ref.read(prayerRequestRepoProvider(request.user.id).notifier).saveRequest(request.copyWith(request: newRequest)),
            buttonText: 'Save',
            buttonStyle: saveButtonStyle,
            successCallback: () => Navigator.of(context).pop(),
          ),
        ],
      );
    },
  );
}

class RequestDashboard extends StatelessWidget {
  const RequestDashboard({super.key, required this.prayerWithAll});

  final PrayerRequestWithAll prayerWithAll;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var headerStyle = TextStyle(fontSize: 20, color: theme.colorScheme.onPrimaryContainer);
    var request = prayerWithAll.request;
    var relatedContacts = findRelatedContacts(prayerWithAll.relatedContacts, request);
    return Column(
      children: <Widget> [
        AppBar(title: const Text("Request Dashboard")),
        Expanded(
          child: Accordion(
            scaleWhenAnimating: false,
            openAndCloseAnimation: true,
            headerBackgroundColor: theme.colorScheme.primaryContainer,
            scrollIntoViewOfItems: ScrollIntoViewOfItems.slow,
            headerPadding: const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
            maxOpenSections: 1,
            contentHorizontalPadding: 20,
            rightIcon: Icon(Icons.arrow_drop_down, color: theme.colorScheme.onPrimaryContainer),
            flipRightIconIfOpen: true,
            children: [
              AccordionSection(
                header: Text("Request Details", style: headerStyle),
                content: Column(
                  children: [
                    Text(request.request),
                    Text("Sentiment: ${request.sentiment}"),
                    Text("Created At: ${dateTimeToDate(request.createdAt)}"),
                    Text("Type: ${request.prayerType}"),
                    Text("Emotion: ${request.emotion}"),
                    Text("Related contacts: ${relatedContactsFullDescription(relatedContacts)}"),
                  ],
                ),
              ),
              AccordionSection(
                isOpen: true,
                header: Text("Related Requests", style: headerStyle),
                content: SizedBox(height: 400, child: RelatedRequests(prayerWithAll: prayerWithAll)),
              ),
              AccordionSection(
                header: Text("Stats", style: headerStyle),
                content: const Placeholder(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class RelatedRequests extends ConsumerWidget {
  const RelatedRequests({super.key, required this.prayerWithAll});

  final PrayerRequestWithAll prayerWithAll;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var request = prayerWithAll.request;
    var viewModel = ref.watch(fetchSimilarRequestsProvider(request.id));
    return switch(viewModel) {
      AsyncData(:final value) => CompactSimplifiedPrayerRequests(requests: value, prayerWithAll: prayerWithAll,), // SimplifiedPrayerRequests(requests: value, prayerWithAll: prayerWithAll),
      AsyncError(:final error, :final stackTrace) => PrintError(caller: "RelatedRequests", error: error, stackTrace: stackTrace),
      _ => const CircularProgressIndicator(),
    };
  }
}

class CompactSimplifiedPrayerRequests extends StatelessWidget {
  const CompactSimplifiedPrayerRequests({super.key, required this.requests, required this.prayerWithAll});

  final List<PrayerRequestScore> requests;
  final PrayerRequestWithAll prayerWithAll;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: requests.length,
      itemBuilder: (context, index) {
        var request = prayerRequestScoreToPrayerRequest(requests[index]);
        var child = Row(
          children: [
            Text(dateTimeToDate(requests[index].createdAt)),
            const Spacer(),
            Text(
              "${(requests[index].score * 100).toStringAsFixed(2)}%", 
              style: const TextStyle(fontStyle: FontStyle.italic),
            ),
          ],
        );
        return CompactRequestCard(request: request, allRelatedContacts: prayerWithAll.relatedContacts, child: child,);
      },
    );
  }
}