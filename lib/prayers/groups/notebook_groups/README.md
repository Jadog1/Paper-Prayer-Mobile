# Notebook Groups Library

A modular, component-based interface for displaying and managing prayer notebooks with search, permissions, and navigation.

## Features

- ✅ **Modular Architecture**: Clean separation between models, components, and public API
- ✅ **Encapsulated Components**: Internal components hidden from external usage
- ✅ **Search Functionality**: Real-time local search with state management
- ✅ **Permission System**: Role-based access control with visual indicators
- ✅ **Notebook Design**: Beautiful paper-like UI with spiral binding and corner folds
- ✅ **Async Data Loading**: Built-in loading states and error handling
- ✅ **Navigation**: Deep integration with PaperMode for viewing/editing prayers
- ✅ **Type-Safe**: Strong typing with proper assertions and validation

## Structure

```text
notebook_groups/
├── notebook_groups.dart            # Public API entry point
├── README.md                       # This file
├── models/
│   └── search_state.dart          # Search state management
└── components/                     # Internal UI components
    ├── group_consumer.dart        # Async data loading wrapper
    ├── group_view.dart            # Main grid view with search
    ├── search_bar_widget.dart     # Animated search bar
    ├── group_notebook.dart        # Individual notebook card
    ├── permissions_dialog.dart    # User permissions dialog
    ├── members_modal.dart         # Members list modal
    ├── paper_mode_permissions.dart # Permission wrapper for PaperMode
    ├── painters.dart              # Custom painters for notebook effects
    └── skeletons.dart             # Loading state components
```

## Quick Start

### Basic Usage

```dart
import 'package:prayer_ml/prayers/groups/notebook_groups/notebook_groups.dart';

// Display notebooks grid
class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Groups();
  }
}
```

### Integration with Navigation

```dart
Navigator(
  onGenerateRoute: (settings) => MaterialPageRoute(
    builder: (context) => const Groups(),
  ),
)
```

## Architecture

### Component Hierarchy

```text
Groups (Public API)
└── GroupConsumer (Async Handler)
    ├── GroupView (Main UI)
    │   ├── Header
    │   ├── SearchBarWidget
    │   ├── GridView of GroupNotebook cards
    │   └── Create Button
    └── GroupViewSkeleton (Loading State)
        └── Multiple NotebookSkeleton
```

### Data Flow

1. **Data Loading**: `GroupConsumer` watches `groupContactsRepoProvider`
2. **Search State**: `SearchState` filters notebooks locally
3. **Permission Checks**: Each notebook card checks user permissions
4. **Navigation**: Tapping cards opens `PaperModePermissions` → `PaperMode`

## Components

### Public API

#### `Groups`

The only exported widget. Entry point for the notebook grid feature.

```dart
const Groups({super.key})
```

### Internal Components

These are implementation details and not exported:

#### `GroupConsumer`

Handles async data loading from repository.

- Shows `GroupView` on success
- Shows error screen with retry on failure
- Shows `GroupViewSkeleton` while loading

#### `GroupView`

Main scaffold displaying the grid of notebooks.

- Header with "Prayer Notebooks" title
- Search bar for filtering
- 2-column grid of notebook cards
- "Create New Notebook" button

#### `SearchBarWidget`

Animated search input with focus effects.

- Filters notebooks in real-time
- Focus-based shadow animation
- Themed colors matching notebook aesthetic

#### `GroupNotebook`

Individual notebook card with rich interactions.

- Spiral binding design on left
- Paper texture lines
- Corner fold effect
- Permission badge (admin/edit/view)
- Context menu:
  - Batch Insert (edit permission required)
  - Manage Access (admin permission required)
  - View Members
  - Settings (admin permission required)
- Integrates with `PermissionsDialog` and `MembersModal`

#### `PermissionsDialog`

Dialog showing detailed user permissions.

- Visual breakdown of all notebook permissions
- Document permissions section
- Check/cross indicators for granted/denied access
- Notebook name display with themed styling

#### `MembersModal`

Bottom sheet displaying notebook members.

- Scrollable list of all members
- Member count in header
- Edit button per member (if user has permission)
- Hero animation on navigation
- Tap to view member details

#### `PaperModePermissions`

Permission wrapper for navigating to PaperMode.

- Access denied screen if no view permission
- Read-only mode if view-only
- Editable mode if edit permission granted

#### `NotebookLinesPainter` & `CornerFoldPainter`

Custom painters for notebook visual effects.

#### `GroupViewSkeleton` & `NotebookSkeleton`

Loading state components with shimmer animation.

## Models

### SearchState

```dart
class SearchState extends ChangeNotifier {
  List<GroupWithMembers> get groupContacts;
  void filter(String text);
}
```

Manages local search state:

- Tracks original and filtered notebook lists
- Filters by notebook name (case-insensitive)
- Notifies listeners on changes

Provider:

```dart
final searchStateProvider = ChangeNotifierProvider.autoDispose
    .family<SearchState, List<GroupWithMembers>>
```

## Design Principles

1. **Encapsulation**: Only `Groups` widget is exported; internals are hidden
2. **Separation of Concerns**: Models, UI, and state are clearly separated
3. **Reusability**: Components are modular and can be refactored independently
4. **Type Safety**: Strong typing with proper error handling
5. **User Experience**: Loading states, animations, and clear visual feedback
6. **Permission-Aware**: All actions respect user permissions

## Theming

### Color Palette

| Element | Color | Usage |
| Primary | `#8B7355` | Buttons, focus states, admin badge |
| Paper | `#FFF9E6` | Notebook card background |
| Lines | `#E8DCC8` | Notebook ruled lines |
| Edit Badge | Blue 700 | Edit permission indicator |
| View Badge | Grey 600 | View-only permission indicator |

### Visual Effects

- **Spiral Binding**: Left-side gradient with circular "coils"
- **Paper Lines**: Horizontal ruled lines with subtle opacity
- **Corner Fold**: Top-right triangular fold effect
- **Shimmer**: Loading animation in skeletons

## Permission System

Permissions are checked via `hasPermission(group, Permission.*)`:

| Permission | Description | UI Impact |
| `view` | View notebook content | Access to PaperMode |
| `editPrayers` | Edit prayers | Editable mode, batch insert |
| `editGroup` | Manage notebook | Settings, access management |
| `deleteGroup` | Delete notebook | Delete option in settings |
| `viewDocument` | View documents | Document access |
| `editDocument` | Edit documents | Upload/modify documents |
| `deleteDocument` | Delete documents | Remove documents |

## Navigation Flow

```text
Groups
  ├─ Tap Notebook Card → PaperModePermissions → PaperMode
  ├─ Context Menu > Batch Insert → BatchPaperMode
  ├─ Context Menu > Manage Access → GroupAccessPage
  ├─ Context Menu > Settings → GroupSettings
  ├─ Context Menu > View Members → Members Modal
  ├─ Members Modal > Tap Member → ContactView
  ├─ Members Modal > Edit Icon → ContactPageSettings
  └─ Create Button → GroupSettings
```

## Dependencies

### External

- `flutter_riverpod`: State management
- `flutter/material.dart`: UI framework

### Internal

- `prayer_ml/prayers/groups/models/`: Group and contact models
- `prayer_ml/prayers/groups/repos/repo.dart`: Data repository
- `prayer_ml/prayers/groups/paper_mode/paper_mode.dart`: Prayer view/edit
- `prayer_ml/prayers/groups/batch_paper_mode/`: Batch operations
- `prayer_ml/prayers/groups/group_access/`: Access management
- `prayer_ml/prayers/groups/contact_view.dart`: Contact details
- `prayer_ml/shared/widgets.dart`: Common widgets (PrintError)

## Future Enhancements

- [ ] Server-side search (currently local only)
- [ ] Sorting options (name, date, members)
- [ ] Filter by permission level
- [ ] Drag-to-reorder notebooks
- [ ] Favorite/pin notebooks
- [ ] Offline sync indicators
- [ ] Bulk actions (archive, delete)
- [ ] Tags/categories for notebooks
- [ ] Export notebook data

## Testing

The modular structure makes testing straightforward:

```dart
void main() {
  testWidgets('Groups displays grid of notebooks', (tester) async {
    // Mock the repository provider
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          groupContactsRepoProvider.overrideWith((ref) => mockGroups),
        ],
        child: MaterialApp(home: Groups()),
      ),
    );
    
    // Verify grid is displayed
    expect(find.byType(GridView), findsOneWidget);
  });
  
  test('SearchState filters by name', () {
    final state = SearchState(groupContacts: mockGroups);
    state.filter('Prayer');
    expect(state.groupContacts.length, lessThan(mockGroups.length));
  });
}
```

## Contributing

When adding features:

1. Keep components focused and single-purpose
2. Add new components to `components/` directory
3. Only export from `notebook_groups.dart` if truly public API
4. Update this README with new features
5. Add appropriate documentation comments
6. Follow existing theming and design patterns
7. Respect permission system

## Examples

### Read-Only Integration

```dart
// If you only need to display notebooks without edit capability
Groups()
```

### Custom Navigation

```dart
class CustomNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (settings) {
        if (settings.name == '/notebooks') {
          return MaterialPageRoute(builder: (_) => Groups());
        }
        return null;
      },
    );
  }
}
```

### Bottom Navigation

```dart
int _selectedIndex = 0;

BottomNavigationBar(
  currentIndex: _selectedIndex,
  onTap: (index) => setState(() => _selectedIndex = index),
  items: [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Notebooks'),
  ],
)

// Body
IndexedStack(
  index: _selectedIndex,
  children: [
    HomePage(),
    Groups(), // <-- Notebook Groups
  ],
)
```

## Performance

- **Lazy Loading**: Grid items rendered on-demand
- **Auto-Dispose**: Search state cleaned up automatically
- **Efficient Filtering**: O(n) search complexity
- **Shimmer Animation**: Single controller per skeleton
- **Minimal Rebuilds**: Proper widget keys and state management

## Accessibility

- Semantic labels on interactive elements
- High contrast permission badges
- Clear visual hierarchy
- Tappable areas meet minimum size requirements
- Screen reader friendly

## License

Part of the Paper-Prayer-Mobile project.
