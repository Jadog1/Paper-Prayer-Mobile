# Project Context

## Important File Paths & Roles

- **lib/prayers/groups/requests.dart**
- Main UI logic for displaying and interacting with prayer requests in groups. Contains widgets for dashboards, request lists, and request details.
- Uses Riverpod for state management, separates UI into stateless and consumer widgets, and leverages composition for building complex screens.

- **lib/prayers/groups/models/group_model.dart**
- Data model for prayer groups.
- Likely uses immutable data classes and serialization.

- **lib/prayers/groups/models/request_model.dart**
- Data model for individual prayer requests.

- **lib/prayers/groups/repos/collection_repo.dart**
- Repository for fetching and managing collections of prayer requests.
- Implements repository pattern for data abstraction.

- **lib/prayers/groups/repos/repo.dart**
- General repository logic, possibly shared across different models.

- **lib/prayers/groups/view_model.dart**
- ViewModel for managing UI state and business logic.
- MVVM pattern, using Riverpod providers.

- **lib/prayers/prayers_shared/prayers_shared_widgets.dart**
- Shared widgets used across prayer-related screens.

- **lib/shared/widgets.dart**
- General shared widgets for the entire app.

## Design Patterns & Consistent Rules

### 1. Riverpod for State Management

- Widgets that need state use ConsumerWidget or ConsumerStatefulWidget.
- State and async data are accessed via WidgetRef and providers.

### 2. Repository Pattern

- Data access is abstracted into repository classes.
- UI does not directly fetch or mutate data; it calls repository methods.

### 3. MVVM (Model-View-ViewModel)

- Models represent data.
- ViewModels (with Riverpod providers) manage business logic and state.
- Views (widgets) display data and interact with ViewModels.

### 4. Widget Composition

- Complex screens are built by composing smaller widgets.
- Shared widgets are abstracted for reuse.

### 5. Separation of Concerns

- Models, repositories, view models, and widgets are kept in separate files.
- Each file has a clear responsibility.

### 6. Consistent Naming

- Files and classes are named according to their roles (e.g., RequestDashboard, PrayerRequestView, RelatedRequests).

### 7. Error Handling

- Async errors are handled with dedicated widgets (e.g., PrintError).

### 8. UI Patterns

- Uses Flutter’s layout widgets (Column, Row, Expanded, etc.) for responsive design.

## Conventions & Guidelines (for models and contributors)

These rules are intended to be machine-friendly and help downstream models and contributors maintain consistent structure across the app.

- Repository layout
  - Keep feature code under `lib/<feature>/` (e.g. `lib/prayers/groups/`).
  - Models in `models/`, repositories in `repos/`, view models in top-level feature folder, UI widgets in feature folder or `prayers_shared` when reused.

- Naming conventions
  - Files: snake_case (e.g. `request_model.dart`, `request_dashboard.dart`).
  - Classes/Types: PascalCase (e.g. `PrayerRequestView`, `CollectionRepo`).
  - Providers: camelCase with a `Provider` suffix for the exposed provider variable (e.g. `fetchCollectionsProvider`, `prayerRequestRepoProvider`). Use `.notifier` to access the notifier when mutating state.
  - Async value variables: use `viewModel` or `asyncX` and handle with `AsyncValue` pattern.

- Provider & state rules
  - Prefer Riverpod `Provider`, `StateNotifierProvider`, or `FutureProvider` depending on the need.
  - Use `family` for parametrized providers (e.g. `fetchRelatedContactsProvider(userId)`).
  - Keep side-effects inside repository/viewmodel layers; UI widgets should call provider methods but not perform data fetching logic.

- Async & error handling
  - Consume async state using `ref.watch(provider)` and handle `AsyncValue` using `switch`/`when` (show loading / error / data states).
  - Use a shared error widget (e.g. `PrintError`) when handling `AsyncError` so behavior is consistent.

- Widget rules
  - Prefer `StatelessWidget` where possible. Use `ConsumerWidget` or `ConsumerStatefulWidget` only when you need to access providers inside `build`.
  - Keep `build` methods small: extract subtrees into private widgets or helper methods (e.g., `collectionDetails`).
  - Use `const` constructors and `const` widgets where possible for performance.

- Layout & constraints
  - Avoid nested unbounded Columns/Rows. When a child should take remaining space, wrap it in `Expanded` or `Flexible`.
  - For potentially tall sections that should scroll, use `SingleChildScrollView` or give a fixed/max constraint.

- Models & serialization
  - Models should be immutable and provide `copyWith`, `toJson`, and `fromJson` if persisted or sent over network.
  - Prefer code generation (e.g., `freezed` + `json_serializable`) for consistency and safety; keep manual implementations consistent across models if codegen is not used.

- Testing
  - Place widget tests under `test/widgets/` and unit tests under `test/`. Use Riverpod's provider overrides to inject test doubles/mocks.
  - Prefer small, focused tests: widget rendering, provider logic, repository behavior.

- Linting & formatting
  - Follow rules in `analysis_options.yaml`. Run `dart format` and `dart analyze` before pushing.
  - Use spaces (no hard tabs) in Markdown and Dart sources to prevent linter warnings.

- Localization & time formatting
  - Use `intl` for date/time and localized strings where applicable. Keep formatting centralized (e.g. helper functions) to avoid inconsistent displays.

- Accessibility & UX
  - Use `Tooltip`, `Semantics`, and accessible labels for interactive icons and controls.
  - Keep tap targets large enough for mobile (min 48x48 logical pixels) and use `IconButton` or `GestureDetector` with appropriate padding.

- Adding new features (recommended steps)

 1. Add models under `models/` with `toJson`/`fromJson`.
 2. Add repository methods in `repos/` and update providers in `view_model.dart`.
 3. Add UI widgets in feature folder and reuse shared widgets when applicable.
 4. Add tests and update `README.md` or feature docs.

## Additional Conventions & Ops

- CI / Pre-commit
  - Run `dart analyze` and `dart format` in CI. Fail the build on analyzer errors.
  - Prefer lightweight pre-commit hooks to format code and run quick lints.

- Code generation
  - If using `freezed`/`json_serializable`, keep generated files next to sources (e.g. `request_model.freezed.dart`, `request_model.g.dart`) and add them to `.gitignore` only if you prefer regenerating during CI.

- Provider naming examples
  - Read-only FutureProvider: `final fetchCollectionsProvider = FutureProvider.autoDispose.family<List<Collection>, Contact>((ref, user) => ...);`
  - State notifier repo: `final prayerRequestRepoProvider = StateNotifierProvider.family<PrayerRequestRepo, List<PrayerRequest>, int>((ref, userId) => ...);`

- Release & dev workflow
  - Keep feature branches short-lived, target `main` with PRs that include tests and update docs.
  - Use semantic versioning for releases and keep CHANGELOG.md updated.

- Security & secrets
  - Do not store secrets in the repo. Use environment variables or CI secret stores. Ensure `google-services.json` / `GoogleService-Info.plist` are handled per-platform.

- Where to ask for help
  - Add a short CONTRIBUTING.md pointing to team chat channels, common commands, and testing instructions.
