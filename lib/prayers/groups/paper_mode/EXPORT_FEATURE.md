# Prayer Request Export Feature

## Overview

This feature adds the ability to select and export multiple prayer requests from paper mode. Users can select individual requests, groups by username, or groups by date, then export them with various formatting options.

## Components Created

### 1. State Management

- **`models/export_state.dart`**: Defines the export state and notifier
  - `ExportState`: Immutable state for tracking export mode and selected requests
  - `ExportStateNotifier`: Change notifier for managing export state
  - Supports toggling individual requests and groups of requests

- **`providers/export_provider.dart`**: Provider for export state
  - Auto-dispose provider for export state management

### 2. UI Components

- **`components/export_action_bar.dart`**: Bottom action bar
  - Shows selected request count
  - Provides Cancel and Continue buttons
  - Only visible when in export mode
  - Launches export modal when Continue is pressed

- **`components/export_options_modal.dart`**: Export configuration modal
  - Export options:
    - Keep created date order (vs. group by name only)
    - Include prayer summaries (alongside descriptions)
    - Use summaries only (replace descriptions with summaries)
  - Live preview of formatted export
  - Actions:
    - Copy to clipboard
    - Create email (copies mailto link)

### 3. Modified Components

- **`components/options_header.dart`**: Added export button
  - Toggle icon between download and close
  - Activates/deactivates export mode

- **`components/paper_block.dart`**: Made selectable
  - Wraps content in GestureDetector when in export mode
  - Shows selection highlight with border and background color
  - Displays checkmark icon when selected
  - Tap to toggle selection

- **`components/breaks.dart`**: Enhanced break widgets
  - `usernameBreak()`: Now accepts optional `userRequests` and `ref` parameters
    - In export mode: clicking selects/deselects all requests for that user
    - Normal mode: shows recommended requests as before
  - `dateBreak()`: Now accepts optional `dateRequests`, `ref`, and `context` parameters
    - In export mode: clicking selects/deselects all requests for that date
    - Normal mode: no click action

- **`components/paper.dart`**: Enhanced with export support
  - Added `onRequestsLoaded` callback to notify parent of loaded requests
  - Passes `ref` and `context` to break widgets
  - Calculates request groups for date/username breaks

- **`paper_mode.dart`**: Converted to StatefulWidget
  - Tracks loaded requests from Paper widget
  - Passes requests to ExportActionBar
  - Added ExportActionBar to the widget tree

## User Flow

1. **Enter Export Mode**
   - User taps the export icon in the header
   - All selectable items show visual cues (highlighted color for breaks)
   - Prayer request blocks become tappable for selection

2. **Select Prayer Requests**
   - **Individual Selection**: Tap any prayer request block
     - Shows border, background tint, and checkmark
     - Tap again to deselect

   - **Group by User**: Tap a username break
     - If not all requests for that user are selected, selects all
     - If all are selected, deselects all

   - **Group by Date**: Tap a date break
     - If not all requests for that date are selected, selects all
     - If all are selected, deselects all

3. **Action Bar**
   - Bottom bar shows count of selected requests
   - **Cancel**: Exits export mode and clears selections
   - **Continue**: Opens export options modal (only enabled if ≥1 selected)

4. **Export Configuration**
   - Choose formatting options
   - Preview the formatted export in real-time
   - **Copy**: Copies formatted text to clipboard
   - **Email**: Copies mailto link to clipboard
   - **Cancel**: Closes modal and returns to export mode

5. **Exit Export Mode**
   - After successful export, automatically exits export mode
   - User can also click the export icon again to cancel

## Export Format

### With Date Order (Default)

```text
January 15, 2025
  • Summary or description text
  • Another request

January 14, 2025
  • Older request
```

### Grouped by Name

```text
John Doe
  • Request 1
  • Request 2

Jane Smith
  • Request 3
```

### Options

- **Keep created date order**: Groups by date (default: true)
- **Include summaries**: Shows "Summary - Description" (default: false)
- **Use summaries only**: Shows only summary titles (default: false)

## Technical Notes

### State Management

- Export state is separate from paper mode state
- Uses Riverpod's auto-dispose provider to clean up when leaving paper mode
- Export mode doesn't interfere with AI mode or edit mode

### Selection Logic

- Individual toggles: Simple add/remove from set
- Group toggles:
  - Checks if all items in group are selected
  - If not all selected: selects all (no deselection)
  - If all selected: deselects all

### Performance

- Request grouping is calculated on-demand during build
- Uses efficient Set operations for selection checks
- Filtered items list is already available from pagination

### Accessibility

- Uses semantic icons (check_circle for selected items)
- Clear visual feedback for all interactive elements
- Bottom action bar is in SafeArea for proper positioning

## Future Enhancements

- Add PDF export option
- Add share sheet integration (native sharing)
- Support for selecting date ranges
- Bulk actions (mark as answered, archive, etc.)
- Save export templates/presets
