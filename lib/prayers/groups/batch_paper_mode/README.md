# Batch Paper Mode

A batch insertion interface for importing multiple prayer requests at once, with automatic contact detection and intelligent parsing.

## Features

- **Wizard-based flow**: Guide users through group selection and content entry
- **Smart parsing**: Automatically detect contacts and prayer requests from pasted text
- **Flexible editing**: Switch between edit mode (raw text) and read mode (structured view)
- **Drag and drop**: Reorder items in read mode
- **Ambiguous contact resolution**: Handle cases where a name matches multiple contacts
- **Bulk submission**: Submit all prayer requests at once with proper contact associations

## Usage

### With Group Already Selected

```dart
import 'package:prayer_ml/prayers/groups/batch_paper_mode/batch_paper_mode.dart';

BatchPaperMode(
  config: BatchPaperModeConfig.withGroup(
    groupContacts: groupContacts,
  ),
)
```

### Requires Group Selection

```dart
BatchPaperMode(
  config: BatchPaperModeConfig.requiresGroupSelection(),
)
```

### With Prefilled Content

```dart
BatchPaperMode(
  config: BatchPaperModeConfig.withGroup(
    groupContacts: groupContacts,
    prefillContent: "John Doe\nPray for healing\nJane Smith\nPray for wisdom",
  ),
)
```

## Architecture

### Models

- **BatchPaperModeConfig**: Configuration for the widget (group, prefill content, return widget)
- **BatchPaperModeState**: Current state (wizard step, edit/read mode, parsed items, errors)
- **BatchContentItem**: Represents a single line item (prayer request, contact, or ambiguous contact)

### Components

- **GroupSelector**: Wizard step for selecting a notebook/group
- **EditModeView**: Large text area for entering/editing content
- **ReadModeView**: Structured view with drag-and-drop, edit, and delete capabilities

### Utilities

- **ContentParser**: Logic for converting between raw text and structured items

### Providers

- **BatchPaperModeNotifier**: Riverpod state management for the entire flow

## Parsing Rules

### Text to Items (Edit → Read)

1. Split content by newlines
2. Trim whitespace and skip empty lines
3. Remove bullet points (-, *, •) and numbering (1., 2., etc.)
4. For lines < 150 characters:
   - Check if they match contact names (case-insensitive, partial matches)
   - If exactly one match: Create a contact item
   - If multiple matches: Create an ambiguous contact item (requires user resolution)
   - If matches but has extra text: Treat as prayer request
5. All other lines become prayer requests

### Items to Text (Read → Edit)

1. Contacts become their full name on a line
2. Prayer requests become their content on a line
3. Ambiguous contacts use their original content

## UI Interactions

### Edit Mode

- Large text area for entering content
- Paste & Review button (auto-switches to read mode after paste)
- Preview button to manually switch to read mode

### Read Mode

- **Drag and drop**: Reorder items
- **Tap**: Edit content or change between contact/prayer request
- **Swipe**: Delete item (with confirmation)
- **Ambiguous contacts**: Show warning icon, tap to select correct contact
- Visual grouping: Prayer requests under contacts are indented

### Submission

- Submit All button is disabled until:
  - At least one item exists
  - All ambiguous contacts are resolved
  - Each prayer request has an associated contact
- On success: Returns to provided return widget or pops navigation
- On error: Shows error banner at top of screen

## Testing

### Unit Tests

`test/batch_paper_mode/parsing_test.dart` tests the parsing logic:

- Empty content handling
- Bullet point removal
- Contact name detection
- Ambiguous contact handling
- Round-trip conversion (text → items → text)

### Widget Tests

`test/batch_paper_mode/batch_paper_mode_widget_test.dart` tests UI behavior:

- Group selection skipping
- Edit/read mode toggling
- Button states
- Prefilled content handling

Run tests with:

```bash
flutter test test/batch_paper_mode/
```

## API Integration

The feature uses the batch insert endpoint:

```dart
POST /prayer_requests/batch
{
  "requests": [
    {
      "request": "Prayer text",
      "contact_id": 123,
      "group_id": 456
    },
    ...
  ]
}
```

Returns an array of created PrayerRequest objects.
