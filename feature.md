# Feature Request

You can gather project context from ./projectContext.md.

See ./externalContext.md for a generated output of changes from the backend that detail all the new endpoints for interacting with events.

## Associated files

Here are some files that may be relevant to this feature request:

- `lib/prayers/groups/group_access` folder
- `account_permissions_model.dart`
- See `notebook_repo.dart` for how cursor pagination is leveraged from a repo, and it uses PagingHelperView (See `current_recommendations.dart` for a simple example of this)
- `account_api.dart`

## Request

We need to alter how account permission is handled. Before we supported letting a user free search an email, but this introduced PII. 

Instead, we removed the notion of even returning an email, and have a new user_code feature. Every user gets a randomly generated short user identifier that they can share. Or, a user can try and be invited by email on an exact match.

Additionally, there is now a notion of when adding new users, their invite is queued so that the user has to accept it. This is to prevent users being spam added to groups. So there needs to be an additional page to view pending requests (This will show some historical state of other invites, too.)

Also, I added ability for account settings to update notifications. We should add that as a new page to access as a widget from `settings.dart`

## Solution

We need to rework several of the existing endpoints to use the new API definitions. Consider it a rework of the APIs to match the current usage. Then we need to rework the UI for inviting users from a group.

Additionally, support notification settings from settings.dart.