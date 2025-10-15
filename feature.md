# Feature Request

You can gather project context from ./projectContext.md.

See ./externalContext.md for a generated output of changes from the backend that detail all the new endpoints for interacting with events.

## Associated files

Here are some files that may be relevant to this feature request:

- `groups.dart`
- `group_model.dart`
- `paper_mode.dart`
- `repo.dart`

## Request

My next option that I would like to add is for supporting batch insert mode. The heart behind batch insert mode is to support copy pasting content from other sources, and making it easier to do so.

This is due to the fact that the current paper mode only supports inserting one prayer request at a time, and seeing real time updates for that. This is great for adding prayer requests in real time as its optimized for showing information while typing. However, it is not optimized for copy pasting large amounts of content.

## Solution

This batch insert mode should show as an icon from notebooks in the groups.dart page. This should open a new page, which should be defined as its own directory. In this directory, the top most file will act as the gateway into "BatchPaperMode", and it will have a subdirectory of components. It will act as a library, similar to how paper mode is structured.

BatchPaperMode should take a list of options to customize the behavior. These options may include:

- The GroupWithMembers to work with
- The widget to return to after exiting batch paper mode
- The content to prefill the batch paper mode with. If this exists, once the user gets to the page for edit/view mode, it should default to view mode with the content already parsed in.

If you can think of other reasonable sounding options, please add them.

This batch paper mode will start first with a wizard as a first page where the user must select the group they want to work with. If the config option for GroupWithMembers is already provided, then this page should be skipped.

Next page will be the actual batch insert page. This page should be composed of a "read" mode and an "edit" mode. The edit mode will show a large text area where the user can paste in or type in multiple prayer requests, one per line. It should first start off as edit mode. If we detect a paste happened, we should automatically switch to read mode. There should be a button to switch between read and edit mode.

The rules for converting the edit mode into read mode are as follows:

- In read mode, the content will be parsed into individual prayer requests based on new lines
- Each new line should be truncated of spaces on the end
- Empty lines should be skipped.
- A contact should go before the prayer request on its own line. This contact should be its own special widget and contain information about the contact.
- If a line is less than 150 characters, check if it contains a name. Names can be checked from the GroupWithMembers. It does not have to be an exact match. It can use case insensitivity. It can split names by spaces and check if any of the parts match. Convert it to the special contact widget.
  - If a name is detected, and there multiple names that could match, we should show a special kind of widget that has a yellow outline and warning icon. For contact, it should show a special placeholder text, and the form should not be able to submit until all of these ambiguous contacts are resolved.
  - If a name is detected but has other text on the line, do not convert it to a contact. Treat it as a normal prayer request.
- If a line starts with bullet points like "-", "*", or "•", or numbers like "1.", "2.", etc, remove the bullet point and treat it as a normal prayer request.

The rules for converting read mode into edit mode are as follows:

- In edit mode, the content will be converted back into a large text area
- Each prayer request will be converted into its own line
- Each contact will be converted into its own line with the full name of the contact

The UI in read mode should support:

- Drag and drop of any lines (including prayer requests or contacts) to reorder them
- Clicking a line should open a dialog to edit the content of that line, or to change between contact and prayer request
- Long pressing a line should open a dialog to delete that line
- The UI should make it obvious whether a line is a contact or a prayer request
- For visual effect, each prayer request should have a bullet point, but do not modify the actual content of the prayer request to include the bullet point.
- A set of tips that describe all of the above actions for drag and drop, clicking, long pressing, etc.
- The UI should make it obvious for groups of prayer requests that belong to a contact. This can be done by grouping them together visually, or indenting them, or using a line to connect them, etc.

Once completed, there should be a button to "Submit All". This button should take all the prayer requests and submit them to the backend using the existing batch insert endpoint. If any prayer request is associated with a contact, it should include the contact ID in the submission. If any do not, it should prevent submission and show an error message. If submission is successful, it should return to the provided widget to return to, or pop if none is provided.

Additionally, there should be a cancel button that will discard all changes and return to the provided widget to return to, or pop if none is provided.

## Testing

Testing should include:

- Unit tests for the parsing logic between edit and read mode
- Widget tests for the BatchPaperMode widget to ensure it behaves correctly in both modes

## Technical details

- To find all groups, you should use the repo riverpod method for fetching groups. Then to convert that into GroupWithMembers, you should use `fetchGroupWithMembers`
- The term "page" used is very loose. I would prefer not to use Navigator for different steps of the wizard, because then it makes returning out of the wizard more complicated. Instead, use a single Scaffold and change the body based on the current step of the wizard.
