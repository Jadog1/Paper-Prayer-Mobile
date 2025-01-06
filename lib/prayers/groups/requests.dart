import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prayer_ml/prayers/groups/models/contact_model.dart';
import 'package:prayer_ml/prayers/groups/models/request_model.dart';
import 'package:prayer_ml/prayers/groups/repos/repo.dart';
import 'package:prayer_ml/shared/widgets.dart';
import 'package:intl/intl.dart';

class PrayerRequestConsumer extends ConsumerWidget {
  const PrayerRequestConsumer({super.key, required this.user});

  final Contact user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var viewModel = ref.watch(fetchPrayerRequestsProvider(user.id));
    return switch(viewModel) {
      AsyncData(:final value) => PrayerRequestView(viewModel: value),
      AsyncError(:final error, :final stackTrace) => PrintError(caller: "PrayerRequestConsumer", error: error, stackTrace: stackTrace),
      _ => const CircularProgressIndicator(),
    };
  }
}

class PrayerRequestView extends ConsumerWidget {
  const PrayerRequestView({super.key, required this.viewModel});

  final List<PrayerRequest> viewModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var theme = Theme.of(context);

    var user = const Contact(id: 0, name: "", createdAt: "");
    var contactGroup = const ContactGroupPairs(id: 0, contactId: 0, groupId: 0, createdAt: "");
    if (viewModel.map((request) => request.user).toSet().length == 1) {
      user = viewModel[0].user;
      contactGroup = viewModel[0].group;
    }


    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
      ),
      body: Column(
        children: [
          Expanded(child: PrayerRequests(viewModel: viewModel,)),
          ElevatedButton(
          onPressed: () => editPrayerRequestBottomSheet(context, ref, PrayerRequest(id: 0, request: "", user: user, group: contactGroup)),
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(theme.colorScheme.primary),
          ),
          child: Icon(Icons.add, color: theme.colorScheme.onPrimary),
        ),
        ],
      ),
    );
  }
}

class PrayerRequests extends StatelessWidget {
  const PrayerRequests({super.key, required this.viewModel});

  final List<PrayerRequest> viewModel;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: viewModel.length,
      itemBuilder: (context, index) => RequestCard(request: viewModel[index]),
    );
  }
}

class RequestCard extends StatelessWidget {
  const RequestCard({super.key, required this.request});

  final PrayerRequest request;

  String dateTimeToDate(String dateTime) {
    var format = DateFormat('yMd');
    var date = DateTime.parse(dateTime).toLocal();
    return format.format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10, top: 10),
      child: ListTile(
        title: Text(request.request),
        subtitle: Text(dateTimeToDate(request.createdAt)),
        trailing: sentimentIcon(request.sentiment),
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const RequestDashboard())
        ),
      ),
    );
  }
}

Icon sentimentIcon(String? sentiment) {
  switch (sentiment) {
    case 'positive':
      return const Icon(Icons.sentiment_satisfied);
    case 'negative':
      return const Icon(Icons.sentiment_dissatisfied);
    case 'neutral':
      return const Icon(Icons.sentiment_neutral);
    default:
      return const Icon(Icons.question_mark);
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
          ElevatedButton(
            onPressed: () => {
              ref.read(prayerRequestRepoProvider().notifier).saveRequest(request.copyWith(request: newRequest)),
              Navigator.of(context).pop(),
            },
            style: saveButtonStyle,
            child: const Text('Save'),
          ),
        ],
      );
    },
  );
}

class RequestDashboard extends StatelessWidget {
  const RequestDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    // Build a dashboard component that shows similar history, stats, and other information
    return const Row(
      children: <Widget> [
        Text("History"),
        Text("Stats"),
      ],
    );
  }
}