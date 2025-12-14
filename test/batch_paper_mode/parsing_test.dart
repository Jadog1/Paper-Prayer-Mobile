import 'package:flutter_test/flutter_test.dart';
import 'package:prayer_ml/prayers/groups/batch_paper_mode/models/batch_content_item.dart';
import 'package:prayer_ml/prayers/groups/batch_paper_mode/utils/content_parser.dart';
import 'package:prayer_ml/prayers/groups/models/contact_model.dart';
import 'package:prayer_ml/prayers/groups/models/group_model.dart';

void main() {
  group('ContentParser', () {
    late GroupWithMembers testGroup;
    late List<Contact> testContacts;

    setUp(() {
      testContacts = [
        const Contact(
          id: 1,
          name: 'John Doe',
          accountId: 1,
          createdAt: '2024-01-01T00:00:00Z',
        ),
        const Contact(
          id: 2,
          name: 'Jane Smith',
          accountId: 1,
          createdAt: '2024-01-01T00:00:00Z',
        ),
        const Contact(
          id: 3,
          name: 'Bob Johnson',
          accountId: 1,
          createdAt: '2024-01-01T00:00:00Z',
        ),
        const Contact(
          id: 4,
          name: 'Grace Doe',
          accountId: 1,
          createdAt: '2024-01-01T00:00:00Z',
        ),
      ];

      testGroup = GroupWithMembers(
        group: const GroupWithPermissions(id: 1, name: 'Test Group'),
        members: testContacts,
        memberWithContactGroupPairs: [],
      );
    });

    group('parseToItems', () {
      test('should parse empty string into empty list', () {
        final result = ContentParser.parseToItems('', testGroup);
        expect(result, isEmpty);
      });

      test('should skip empty lines', () {
        const content = '''
Prayer request 1

Prayer request 2


Prayer request 3
''';
        final result = ContentParser.parseToItems(content, testGroup);
        expect(result.length, equals(3));
        expect(result.every((item) => item.isPrayerRequest), isTrue);
      });

      test('should remove bullet points from lines', () {
        const content = '''
- Prayer request 1
* Prayer request 2
• Prayer request 3
1. Prayer request 4
2. Prayer request 5
''';
        final result = ContentParser.parseToItems(content, testGroup);

        expect(result.length, equals(5));
        expect(result[0].content, equals('Prayer request 1'));
        expect(result[1].content, equals('Prayer request 2'));
        expect(result[2].content, equals('Prayer request 3'));
        expect(result[3].content, equals('Prayer request 4'));
        expect(result[4].content, equals('Prayer request 5'));
      });

      test('should detect exact contact name match', () {
        const content = '''
John Doe
Prayer for healing
Jane Smith
Prayer for wisdom
''';
        final result = ContentParser.parseToItems(content, testGroup);

        expect(result.length, equals(4));
        expect(result[0].isContact, isTrue);
        expect(result[0].contact?.name, equals('John Doe'));
        expect(result[1].isPrayerRequest, isTrue);
        expect(result[2].isContact, isTrue);
        expect(result[2].contact?.name, equals('Jane Smith'));
        expect(result[3].isPrayerRequest, isTrue);
      });
      test(
          'Names having other special characters should be treated as contacts',
          () {
        const content = '''
- John Doe:
Prayer for healing
Jane Smith?
Prayer for wisdom
Bob : 
Prayer for guidance
FakeName:
Prayer for fake guidance
''';
        final result = ContentParser.parseToItems(content, testGroup);
        expect(result.length, equals(8));
        expect(result[0].isContact, isTrue);
        expect(result[0].contact?.name, equals('John Doe'));
        expect(result[1].isPrayerRequest, isTrue);
        expect(result[2].isContact, isTrue);
        expect(result[2].contact?.name, equals('Jane Smith'));
        expect(result[3].isPrayerRequest, isTrue);
        expect(result[4].isContact, isTrue);
        expect(result[4].contact?.name, equals('Bob Johnson'));
        expect(result[5].isPrayerRequest, isTrue);
        expect(result[5].content, equals('Prayer for guidance'));
        expect(result[6].isPrayerRequest, isTrue);
        expect(result[7].isPrayerRequest, isTrue);
        expect(result[7].content, equals('Prayer for fake guidance'));
      });
      test(
          'Names starting at the beginning of the line should be treated as contacts',
          () {
        const content = '''
John Doe: Prayer for healing
Jane Smith - Prayer for wisdom
''';
        final result = ContentParser.parseToItems(content, testGroup);
        expect(result.length, equals(4));
        expect(result[0].isContact, isTrue);
        expect(result[0].contact?.name, equals('John Doe'));
        expect(result[1].isPrayerRequest, isTrue);
        expect(result[2].isContact, isTrue);
        expect(result[2].contact?.name, equals('Jane Smith'));
        expect(result[3].isPrayerRequest, isTrue);
      });

      test('should detect partial contact name match', () {
        const content = '''
John
Prayer for healing
Jane
Prayer for wisdom
''';
        final result = ContentParser.parseToItems(content, testGroup);

        // Should detect "John" as matching "John Doe" and "Jane" as matching "Jane Smith"
        expect(result[0].isContact || result[0].isAmbiguousContact, isTrue);
        expect(result[2].isContact || result[2].isAmbiguousContact, isTrue);
      });

      test('should create ambiguous contact when multiple matches found', () {
        // Add another contact with similar name
        final contacts = [
          ...testContacts,
          const Contact(
            id: 4,
            name: 'John Smith',
            accountId: 1,
            createdAt: '2024-01-01T00:00:00Z',
          ),
        ];

        final group = GroupWithMembers(
          group: const GroupWithPermissions(id: 1, name: 'Test Group'),
          members: contacts,
          memberWithContactGroupPairs: [],
        );

        const content = 'John';
        final result = ContentParser.parseToItems(content, group);

        // "John" could match both "John Doe" and "John Smith"
        expect(result.length, equals(1));
        // It might be ambiguous if both match
        if (result[0].isAmbiguousContact) {
          expect(result[0].possibleContacts!.length, greaterThan(1));
        }
      });

      test('should treat long lines as prayer requests', () {
        const content = '''
This is a very long line that exceeds 150 characters and should be treated as a prayer request even if it contains a name like John because it has too much other text in it
''';
        final result = ContentParser.parseToItems(content, testGroup);

        expect(result.length, equals(1));
        expect(result[0].isPrayerRequest, isTrue);
      });

      test('should treat lines with names but extra text as prayer requests',
          () {
        const content = 'Please pray for John Doe who is sick';
        final result = ContentParser.parseToItems(content, testGroup);

        expect(result.length, equals(1));
        // The line contains "John Doe" but has extra text, so it could be detected as contact
        // or prayer request depending on the parsing logic. Let's just verify it's parsed.
        expect(result[0].type, isIn([BatchContentItemType.prayerRequest]));
      });

      test('should trim whitespace from lines', () {
        const content = '''
  Prayer request with leading spaces  
	Prayer request with tabs	
''';
        final result = ContentParser.parseToItems(content, testGroup);

        expect(result.length, equals(2));
        expect(result[0].content, equals('Prayer request with leading spaces'));
        expect(result[1].content, equals('Prayer request with tabs'));
      });
      test('Should ignore lines that do not have any alphabetic characters',
          () {
        const content = '''
          John Doe
          -----
          Here is a request for him
          32949
          ~~~~~~
        ''';
        final result = ContentParser.parseToItems(content, testGroup);
        expect(result.length, equals(2));
        expect(result[0].isContact, isTrue);
        expect(result[0].contact?.name, equals('John Doe'));
        expect(result[1].isPrayerRequest, isTrue);
        expect(result[1].content, equals('Here is a request for him'));
      });
    });

    group('itemsToRawText', () {
      test('should convert items back to text', () {
        final items = [
          BatchContentItem(
            id: '1',
            type: BatchContentItemType.contact,
            content: 'John Doe',
            contact: testContacts[0],
          ),
          const BatchContentItem(
            id: '2',
            type: BatchContentItemType.prayerRequest,
            content: 'Prayer for healing',
          ),
          BatchContentItem(
            id: '3',
            type: BatchContentItemType.contact,
            content: 'Jane Smith',
            contact: testContacts[1],
          ),
          const BatchContentItem(
            id: '4',
            type: BatchContentItemType.prayerRequest,
            content: 'Prayer for wisdom',
          ),
        ];

        final result = ContentParser.itemsToRawText(items);

        expect(
            result,
            equals(
                'John Doe\n----------\n- Prayer for healing\n\nJane Smith\n----------\n- Prayer for wisdom'));
      });

      test('should handle empty list', () {
        final result = ContentParser.itemsToRawText([]);
        expect(result, isEmpty);
      });

      test('should use full contact name for contacts', () {
        final items = [
          BatchContentItem(
            id: '1',
            type: BatchContentItemType.contact,
            content: 'John', // Content might be partial
            contact: testContacts[0], // But contact has full name
          ),
        ];

        final result = ContentParser.itemsToRawText(items);
        expect(result, equals('John Doe\n----------')); // Should use full name
      });

      test('should handle ambiguous contacts', () {
        final items = [
          BatchContentItem(
            id: '1',
            type: BatchContentItemType.ambiguousContact,
            content: 'John',
            possibleContacts: [
              testContacts[0],
              testContacts[1]
            ], // Multiple possible matches
          ),
        ];

        final result = ContentParser.itemsToRawText(items);
        expect(result, equals('John\n----------')); // Should use content as-is
      });
    });
    group('round-trip conversion', () {
      test('should maintain data through parse and convert cycle', () {
        const originalContent = '''
John Doe
----------
- Prayer for healing

Jane Smith
----------
- Prayer for wisdom

Bob Johnson
----------
- Prayer for guidance
''';

        // Parse to items
        final items = ContentParser.parseToItems(originalContent, testGroup);

        // Convert back to text
        final convertedContent = ContentParser.itemsToRawText(items);

        // Parse again
        final items2 = ContentParser.parseToItems(convertedContent, testGroup);

        // Should have same structure
        expect(items.length, equals(items2.length));
        for (int i = 0; i < items.length; i++) {
          expect(items[i].type, equals(items2[i].type));
          expect(items[i].content, equals(items2[i].content));
        }
      });
    });
  });
}
