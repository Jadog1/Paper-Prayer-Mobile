# Paper Mode Package

A modular, configurable interface for viewing and editing prayer requests in a paper-like format with AI-powered features.

## Features

- ✅ **Modular Architecture**: Clean separation between models, providers, and UI components
- ✅ **Flexible Configuration**: Easy to customize behavior without tight coupling
- ✅ **Immutable State**: Predictable state management with clear update paths
- ✅ **Independent Components**: Reusable widgets that can work standalone
- ✅ **Type-Safe**: Strong typing with proper assertions and validation
- ✅ **Testable**: Decoupled components are easy to test
- ✅ **AI Integration**: Background feature generation and smart summaries
- ✅ **Read-Only & Editable Modes**: Support for different use cases

## Structure

```text
paper_mode/
├── paper_mode.dart              # Public API entry point
├── MIGRATION_GUIDE.md          # Migration from old structure
├── README.md                   # This file
├── models/
│   ├── paper_mode_config.dart  # Configuration options
│   └── paper_mode_state.dart   # State management
├── providers/
│   └── paper_mode_provider.dart # Riverpod providers
└── components/                  # Internal UI components
    ├── breaks.dart
    ├── editable_request.dart
    ├── loadable_widgets.dart
    ├── paper_margin_space.dart
    ├── recommended_requests.dart
    └── viewable_request.dart
```

## Quick Start

### Basic Usage

```dart
import 'package:prayer_ml/prayers/groups/paper_mode/paper_mode.dart';

// Read-only view
PaperMode(
  config: PaperModeConfig.readOnly(
    contactId: userId,
    showHeader: false,
  ),
)

// Editable view with full group context
PaperMode(
  config: PaperModeConfig.editable(
    groupContacts: myGroupContacts,
    showHeader: true,
  ),
)
```

### Advanced Configuration

```dart
PaperModeConfig(
  readOnly: false,
  showHeader: true,
  contactId: 123,              // Filter by contact
  eventId: 456,                // Filter by event
  groupContacts: group,        // Full group object
  // OR
  groupId: 5,                  // Just the ID
  enableBackgroundFeatureCheck: true,
  aiModeDefault: true,
  pageSize: 15,
)
```

### State Management

```dart
// Watch state
final stateNotifier = ref.watch(paperModeStateProvider);
final currentUser = stateNotifier.state.selectedUser;
final isAiMode = stateNotifier.state.aiMode;

// Update state
ref.read(paperModeStateProvider).setAiMode(false);
ref.read(paperModeStateProvider).setContact(contactPair);
ref.read(paperModeStateProvider).hidePrayerRequest(requestId);

// With config
final notifier = ref.watch(paperModeStateWithConfigProvider(config));
```

## Configuration Options

### PaperModeConfig

| Parameter | Type | Default | Description |
| `readOnly` | `bool` | `false` | Disable editing features |
| `showHeader` | `bool` | `true` | Show navigation and AI toggle |
| `contactId` | `int?` | `null` | Filter requests by contact |
| `eventId` | `int?` | `null` | Filter requests by event |
| `groupContacts` | `GroupContacts?` | `null` | Full group context |
| `groupId` | `int?` | `null` | Alternative to groupContacts |
| `enableBackgroundFeatureCheck` | `bool` | `true` | Auto-check for AI features |
| `aiModeDefault` | `bool` | `true` | Start in AI summary mode |
| `pageSize` | `int` | `10` | Pagination size |

### Factory Constructors

#### `PaperModeConfig.readOnly()`

Creates a read-only configuration, ideal for viewing requests without edit capabilities.

```dart
PaperModeConfig.readOnly({
  int? contactId,
  int? eventId,
  bool showHeader = false,
})
```

#### `PaperModeConfig.editable()`

Creates an editable configuration with full group context.

```dart
PaperModeConfig.editable({
  required GroupContacts groupContacts,
  bool showHeader = true,
  int? contactId,
  int? eventId,
})
```

## State Model

### PaperModeState (Immutable)

```dart
class PaperModeState {
  final ContactAndGroupPair? selectedUser;
  final bool aiMode;
  final Map<int, bool> hiddenPrayerRequests;
  final Set<int> prayerIdsInOverrideEditMode;
  final List<PrayerRequest> newRequests;
  
  // Immutable updates
  PaperModeState copyWith({...});
}
```

### PaperModeStateNotifier (Mutable Operations)

```dart
class PaperModeStateNotifier extends ChangeNotifier {
  PaperModeState get state;
  
  void setContact(ContactAndGroupPair contact);
  void clearContact();
  void setEditModeOverride(int prayerId, bool isEditing);
  void setAiMode(bool mode);
  void addDefaultPrayerRequest(ContactAndGroupPair user);
  void hidePrayerRequest(int id);
  void updateNewRequest(int id, PrayerRequest updatedRequest);
  void startBackgroundFeatureCheck(Function fetchUpdatedPrayerRequest);
}
```

## Components

### Internal Components

These components are not exported in the public API but power the PaperMode interface:

- **PaperMarginSpace**: Consistent margin/line decoration
- **ViewableRequest**: Read-only prayer with summary
- **EditableRequest**: Editable prayer with auto-save
- **LoadableBibleVerses**: Async Bible verse loading
- **LoadableRelatedContacts**: Async related contacts
- **LoadableCollection**: Async collection loading
- **RecommendedPrayerRequests**: AI-powered recommendations
- **Breaks**: Date and username separators

## Design Principles

1. **Separation of Concerns**: Models, state, providers, and UI are clearly separated
2. **Immutability**: State is immutable with explicit copy methods
3. **Configurability**: Behavior is controlled via config, not hard-coded
4. **Reusability**: Components can work independently
5. **Type Safety**: Strong typing with runtime assertions
6. **Testability**: Pure functions and isolated components

## Migration from Old Structure

See [MIGRATION_GUIDE.md](./MIGRATION_GUIDE.md) for detailed migration instructions from the previous monolithic structure.

## Examples

### Scenario 1: View all requests for a contact (read-only)

```dart
PaperMode(
  config: PaperModeConfig.readOnly(
    contactId: myContact.id,
    showHeader: false,
  ),
)
```

### Scenario 2: Edit requests in a group

```dart
PaperMode(
  config: PaperModeConfig.editable(
    groupContacts: currentGroup,
    showHeader: true,
  ),
)
```

### Scenario 3: Event-specific requests with custom page size

```dart
PaperMode(
  config: PaperModeConfig(
    eventId: myEvent.id,
    groupId: groupId,
    readOnly: true,
    pageSize: 20,
    aiModeDefault: false,
  ),
)
```

### Scenario 4: Programmatic state control

```dart
class MyWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(paperModeStateProvider);
    final isAiMode = notifier.state.aiMode;
    
    return Column(
      children: [
        Switch(
          value: isAiMode,
          onChanged: (val) => notifier.setAiMode(val),
        ),
        Expanded(
          child: PaperMode(
            config: PaperModeConfig.editable(
              groupContacts: myGroup,
              aiModeDefault: isAiMode,
            ),
          ),
        ),
      ],
    );
  }
}
```

## Testing

The modular structure makes testing much easier:

```dart
void main() {
  test('PaperModeState should update immutably', () {
    final state = PaperModeState.initial();
    expect(state.aiMode, true);
    
    final newState = state.copyWith(aiMode: false);
    expect(state.aiMode, true); // Original unchanged
    expect(newState.aiMode, false); // New state updated
  });
  
  test('PaperModeConfig validates required fields', () {
    expect(
      () => PaperModeConfig(readOnly: false), // No group info
      throwsAssertionError,
    );
    
    // Should work
    PaperModeConfig.readOnly(); // OK in read-only
    PaperModeConfig(groupId: 5); // OK with groupId
  });
}
```

## Contributing

When adding new features:

1. Keep models immutable
2. Add configuration options to `PaperModeConfig`
3. Create new components in `components/`
4. Export only public API from `paper_mode.dart`
5. Update this README and migration guide
6. Add tests for new functionality

## Future Enhancements

- [ ] Complete widget migration to new structure
- [ ] Add more configuration hooks
- [ ] Improve background sync options
- [ ] Add offline support configuration
- [ ] Create widget catalog/storybook
- [ ] Performance optimization options
- [ ] Accessibility improvements
