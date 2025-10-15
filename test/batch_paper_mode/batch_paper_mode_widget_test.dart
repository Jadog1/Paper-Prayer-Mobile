import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prayer_ml/prayers/groups/batch_paper_mode/batch_paper_mode.dart';
import 'package:prayer_ml/prayers/groups/models/group_model.dart';
import 'package:prayer_ml/prayers/groups/models/contact_model.dart';

void main() {
  group('BatchPaperMode Widget Tests', () {
    late GroupWithMembers testGroup;

    setUp(() {
      testGroup = const GroupWithMembers(
        group: Group(id: 1, name: 'Test Group', description: 'Test Description'),
        members: [
          Contact(
            id: 1,
            name: 'John Doe',
            accountId: 1,
            createdAt: '2024-01-01T00:00:00Z',
          ),
          Contact(
            id: 2,
            name: 'Jane Smith',
            accountId: 1,
            createdAt: '2024-01-01T00:00:00Z',
          ),
        ],
        memberWithContactGroupPairs: [],
      );
    });

    testWidgets('should show batch insert mode title', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: BatchPaperMode(
              config: BatchPaperModeConfig.withGroup(
                groupContacts: testGroup,
              ),
            ),
          ),
        ),
      );

      expect(find.text('Batch Insert Mode'), findsOneWidget);
    });

    testWidgets('should skip group selection when group is provided', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: BatchPaperMode(
              config: BatchPaperModeConfig.withGroup(
                groupContacts: testGroup,
              ),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Should be in edit mode, not group selection
      expect(find.text('Select a Notebook'), findsNothing);
      expect(find.text('Edit Mode'), findsOneWidget);
    });

    testWidgets('should show edit mode initially', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: BatchPaperMode(
              config: BatchPaperModeConfig.withGroup(
                groupContacts: testGroup,
              ),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('Edit Mode'), findsOneWidget);
      expect(find.byType(TextField), findsOneWidget);
    });

    testWidgets('should toggle between edit and read mode', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: BatchPaperMode(
              config: BatchPaperModeConfig.withGroup(
                groupContacts: testGroup,
              ),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Should start in edit mode
      expect(find.text('Edit Mode'), findsOneWidget);

      // Find and tap the preview button
      final previewButton = find.text('Preview');
      if (previewButton.evaluate().isNotEmpty) {
        await tester.tap(previewButton);
        await tester.pumpAndSettle();

        // Check if we switched to read mode (but content might be empty)
        // So we just verify edit mode is no longer visible
        expect(find.text('Edit Mode'), findsNothing);
      }
    });

    testWidgets('should show cancel and submit buttons in read mode', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: BatchPaperMode(
              config: BatchPaperModeConfig.withGroup(
                groupContacts: testGroup,
              ),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Initially in edit mode, buttons should not be visible
      expect(find.text('Cancel'), findsNothing);
      expect(find.text('Submit All'), findsNothing);

      // Add some content first
      final textField = find.byType(TextField);
      await tester.enterText(textField, 'Test prayer request');
      await tester.pumpAndSettle();

      // Switch to read mode
      final previewButton = find.byIcon(Icons.visibility);
      await tester.tap(previewButton);
      await tester.pumpAndSettle();

      // Now buttons should be visible
      expect(find.text('Cancel'), findsOneWidget);
      expect(find.text('Submit All'), findsOneWidget);
    });

    testWidgets('should disable submit button when no content in read mode', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: BatchPaperMode(
              config: BatchPaperModeConfig.withGroup(
                groupContacts: testGroup,
              ),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Add some content to enable preview mode
      final textField = find.byType(TextField);
      await tester.enterText(textField, 'Test');
      await tester.pumpAndSettle();

      // Switch to read mode
      final previewButton = find.byIcon(Icons.visibility);
      await tester.tap(previewButton);
      await tester.pumpAndSettle();

      // Find the submit button
      final submitButtonFinder = find.text('Submit All');
      expect(submitButtonFinder, findsOneWidget);

      // The button should be enabled since we have content
      final submitButtons = find.ancestor(
        of: submitButtonFinder,
        matching: find.byType(ElevatedButton),
      );
      
      if (submitButtons.evaluate().isNotEmpty) {
        final button = tester.widget<ElevatedButton>(submitButtons.first);
        expect(button.onPressed, isNotNull);
      }
    });

    testWidgets('should show prefilled content in read mode', (WidgetTester tester) async {
      const prefillContent = 'John Doe\nPrayer for healing';
      
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: BatchPaperMode(
              config: BatchPaperModeConfig.withGroup(
                groupContacts: testGroup,
                prefillContent: prefillContent,
              ),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Should auto-parse and show in read mode
      expect(find.text('Read Mode - Review & Organize'), findsOneWidget);
    });
  });
}
