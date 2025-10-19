# Calendar Library

A modular, configurable calendar interface for viewing prayer collection events in daily, weekly, or monthly formats with detailed event views.

## Features

- ✅ **Multiple View Types**: Daily, weekly, and monthly calendar views
- ✅ **Flexible Filtering**: Filter by contact, collection, or view all events
- ✅ **Configurable Display**: Customize app bars, navigation, and behavior
- ✅ **Event Details**: Detailed event view with prayer request integration
- ✅ **Modular Architecture**: Clean separation of concerns
- ✅ **Reusable Components**: Can be embedded or standalone
- ✅ **Type-Safe**: Strong typing with proper configuration
- ✅ **Navigation Ready**: Built-in or custom navigation callbacks

## Structure

```text
calendar/
├── calendar.dart                     # Public API entry point
├── README.md                        # This file
├── models/
│   ├── calendar_config.dart         # Calendar configuration
│   └── event_details_config.dart    # Event details configuration
└── components/                       # Internal UI components
    ├── calendar_widget.dart         # Main calendar widget
    ├── event_details_widget.dart    # Event details widget
    ├── daily_view.dart             # Daily calendar view
    ├── weekly_view.dart            # Weekly calendar view
    ├── monthly_view.dart           # Monthly calendar view
    └── event_card.dart             # Event card component
```

## Quick Start

### Basic Calendar Usage

```dart
import 'package:prayer_ml/prayers/home/calendar/calendar.dart';

// Full-featured calendar with all events
CalendarWidget(
  config: CalendarConfig.all(),
)

// Calendar filtered by contact
CalendarWidget(
  config: CalendarConfig.forContact(
    contactId: 123,
    contactName: "John Doe",
  ),
)

// Calendar filtered by collection
CalendarWidget(
  config: CalendarConfig.forCollection(
    collectionId: 456,
    collectionName: "Church Events",
  ),
)

// Embedded calendar (no app bar)
CalendarWidget(
  config: CalendarConfig.embedded(
    contactId: 123,
    initialViewType: CalendarViewType.weekly,
  ),
)
```

### Event Details Usage

```dart
import 'package:prayer_ml/prayers/home/calendar/calendar.dart';

// Full event details
EventDetailsWidget(
  event: myEvent,
  config: EventDetailsConfig.full(),
)

// Read-only event details (no delete)
EventDetailsWidget(
  event: myEvent,
  config: EventDetailsConfig.readOnly(),
)

// Embedded event details
EventDetailsWidget(
  event: myEvent,
  config: EventDetailsConfig.embedded(),
)

// Show full collection by default
EventDetailsWidget(
  event: myEvent,
  config: EventDetailsConfig.collectionView(),
)
```

### Direct Navigation

```dart
// Navigate to calendar
Navigator.of(context).push(
  MaterialPageRoute(
    builder: (context) => CalendarWidget(
      config: CalendarConfig.forContact(
        contactId: userId,
      ),
    ),
  ),
);

// Navigate to event details
Navigator.of(context).push(
  MaterialPageRoute(
    builder: (context) => EventDetailsWidget(
      event: selectedEvent,
      config: EventDetailsConfig.full(
        onEventDeleted: () {
          Navigator.of(context).pop();
        },
      ),
    ),
  ),
);
```

## Configuration Options

### CalendarConfig

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `showAppBar` | `bool` | `true` | Show app bar with title and controls |
| `showNavigationHeader` | `bool` | `true` | Show date navigation header |
| `initialViewType` | `CalendarViewType` | `monthly` | Starting view (daily/weekly/monthly) |
| `initialDate` | `DateTime` | `now()` | Starting date for calendar |
| `contactId` | `int?` | `null` | Filter events by contact |
| `collectionId` | `int?` | `null` | Filter events by collection |
| `title` | `String?` | `null` | Custom app bar title |
| `appBarColor` | `Color` | `Colors.blueAccent` | App bar background color |
| `eventLimit` | `int` | `100` | Maximum events to fetch |
| `onEventTap` | `Function?` | `null` | Custom event tap callback |
| `allowViewTypeChange` | `bool` | `true` | Allow switching view types |

### CalendarConfig Factory Constructors

#### `CalendarConfig.all()`

View all events without filtering.

```dart
CalendarConfig.all({
  CalendarViewType initialViewType = CalendarViewType.monthly,
  DateTime? initialDate,
  bool showAppBar = true,
})
```

#### `CalendarConfig.forContact()`

View events for a specific contact.

```dart
CalendarConfig.forContact({
  required int contactId,
  CalendarViewType initialViewType = CalendarViewType.monthly,
  DateTime? initialDate,
  bool showAppBar = true,
  String? contactName,
})
```

#### `CalendarConfig.forCollection()`

View events for a specific collection.

```dart
CalendarConfig.forCollection({
  required int collectionId,
  CalendarViewType initialViewType = CalendarViewType.monthly,
  DateTime? initialDate,
  bool showAppBar = true,
  String? collectionName,
})
```

#### `CalendarConfig.embedded()`

Minimal calendar for embedding in other views.

```dart
CalendarConfig.embedded({
  int? contactId,
  int? collectionId,
  CalendarViewType initialViewType = CalendarViewType.monthly,
  DateTime? initialDate,
})
```

### EventDetailsConfig

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `showAppBar` | `bool` | `true` | Show app bar |
| `showDeleteButton` | `bool` | `true` | Show delete event button |
| `showCollectionLink` | `bool` | `true` | Show link to collection |
| `showFilterToggle` | `bool` | `true` | Show event/collection toggle |
| `defaultShowEventOnly` | `bool` | `true` | Default filter state |
| `title` | `String?` | `null` | Custom app bar title |
| `appBarColor` | `Color` | `Colors.blueAccent` | App bar background color |
| `onEventDeleted` | `Function?` | `null` | Callback after deletion |
| `onCollectionTap` | `Function?` | `null` | Custom collection tap callback |

### EventDetailsConfig Factory Constructors

#### `EventDetailsConfig.full()`

Full-featured event details with all controls.

```dart
EventDetailsConfig.full({
  String? title,
  void Function()? onEventDeleted,
})
```

#### `EventDetailsConfig.readOnly()`

Read-only view without delete button.

```dart
EventDetailsConfig.readOnly({
  String? title,
  bool showCollectionLink = true,
  bool showFilterToggle = true,
})
```

#### `EventDetailsConfig.embedded()`

Minimal view for embedding.

```dart
EventDetailsConfig.embedded({
  bool showFilterToggle = true,
  bool defaultShowEventOnly = true,
})
```

#### `EventDetailsConfig.collectionView()`

Show full collection by default.

```dart
EventDetailsConfig.collectionView({
  String? title,
  bool showDeleteButton = true,
})
```

## Examples

### Scenario 1: User's personal calendar

```dart
CalendarWidget(
  config: CalendarConfig.forContact(
    contactId: currentUser.id,
    contactName: currentUser.name,
    initialViewType: CalendarViewType.monthly,
  ),
)
```

### Scenario 2: Collection events in weekly view

```dart
CalendarWidget(
  config: CalendarConfig.forCollection(
    collectionId: collection.id,
    collectionName: collection.title,
    initialViewType: CalendarViewType.weekly,
  ),
)
```

### Scenario 3: Embedded mini calendar

```dart
Card(
  child: SizedBox(
    height: 400,
    child: CalendarWidget(
      config: CalendarConfig.embedded(
        contactId: userId,
        initialViewType: CalendarViewType.monthly,
      ),
    ),
  ),
)
```

### Scenario 4: Custom event tap handler

```dart
CalendarWidget(
  config: CalendarConfig.all(
    onEventTap: (context, event) {
      // Custom behavior instead of default navigation
      showDialog(
        context: context,
        builder: (context) => EventQuickView(event: event),
      );
    },
  ),
)
```

### Scenario 5: Event details with custom deletion

```dart
EventDetailsWidget(
  event: selectedEvent,
  config: EventDetailsConfig.full(
    onEventDeleted: () {
      // Custom cleanup after deletion
      _refreshEventsList();
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Event deleted successfully')),
      );
    },
  ),
)
```

### Scenario 6: Read-only event preview

```dart
EventDetailsWidget(
  event: upcomingEvent,
  config: EventDetailsConfig.readOnly(
    title: "Upcoming Event Preview",
    showFilterToggle: false,
  ),
)
```

## Integration with Existing Code

### Replace CalendarView

Old:

```dart
Navigator.of(context).push(
  MaterialPageRoute(
    builder: (context) => CalendarView(
      contactId: userId,
    ),
  ),
);
```

New:

```dart
Navigator.of(context).push(
  MaterialPageRoute(
    builder: (context) => CalendarWidget(
      config: CalendarConfig.forContact(
        contactId: userId,
      ),
    ),
  ),
);
```

### Replace EventDetailsView

Old:

```dart
Navigator.of(context).push(
  MaterialPageRoute(
    builder: (context) => EventDetailsView(
      event: selectedEvent,
    ),
  ),
);
```

New:

```dart
Navigator.of(context).push(
  MaterialPageRoute(
    builder: (context) => EventDetailsWidget(
      event: selectedEvent,
      config: EventDetailsConfig.full(),
    ),
  ),
);
```

## Design Principles

1. **Configuration Over Hard-coding**: All behavior controlled via config objects
2. **Reusability**: Components work standalone or embedded
3. **Flexibility**: Support multiple use cases with factory constructors
4. **Type Safety**: Strong typing with enums and proper validation
5. **Separation of Concerns**: Clear model/component/widget separation
6. **Callback Support**: Custom behavior via optional callbacks

## API Surface

### Exported from `calendar.dart`

**Widgets:**

- `CalendarWidget` - Main calendar display
- `EventDetailsWidget` - Event details display

**Models:**

- `CalendarConfig` - Calendar configuration
- `EventDetailsConfig` - Event details configuration
- `CalendarViewType` - Enum for view types

**Components (Internal):**

- Calendar view components (daily, weekly, monthly)
- Event card component
- Navigation components

## Future Enhancements

- [ ] Event creation from calendar
- [ ] Drag-and-drop event editing
- [ ] Multi-select events
- [ ] Export calendar to iCal
- [ ] Recurring event support
- [ ] Event reminders/notifications
- [ ] Custom color coding
- [ ] Accessibility improvements
- [ ] Offline support
