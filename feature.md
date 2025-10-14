# Feature Request

You can gather project context from ./projectContext.md.

See ./externalContext.md for a generated output of changes from the backend that detail all the new endpoints for interacting with events.

## Request

Several new endpoints have been implemented on the backend to support a new workflow for reviewing events. Events can be thought of moments in time pulled from a prayer request. Specifically, did it detect a specific date something is happening, or a range of dates that something is happening. This is useful for things like birthdays, anniversaries, surgeries, trips, etc.

To do this, we will want to go to ./lib/prayers/home/new_home.dart. This contains the current core logic for the home page. We will want to add support for a calendar view that shows upcoming events, as well as a way to view historical events. This calendar view should allow for either a daily view, weekly view, or monthly view. The default should be a weekly view.

When viewing a specific day, week, or month, we should show the events that are happening in that time frame. For each event, we should show the title of the event, the date(s) it is happening, and a summary of the prayer requests associated with that event.

We should use pagination endpoint to load data incrementally. If clicking into an event, we should show all the requests associated with that event. The paper prayer API can use a new config, `event_id` as an optional parameter. This should use it as a filter when passing to the api. This should open as read-only, and not allow adding new requests from this view.

Additionally, from the home page before clicking the calendar, we should show a preview of a few upcoming events. This can use the API that gets X future events within max X days.

## Solution

1. Create new view models to support collection events
2. In the new home page, add a section that has a preview of upcoming events. This should use the "Get X future events within max X days" endpoint.
3. Add a button to navigate to the calendar view.
4. Create a new calendar view that allows for daily, weekly, and monthly views. Default to weekly view.
5. In the calendar view, show events for the selected time frame. Use the "Get all events via cursor pagination with date range" endpoint to load events. This should start loading events as the pagination cursor loops through the data.
6. We should use loading indicators for each day when loading events.
7. When clicking on an event, navigate to a new view that shows all prayer requests associated with that event. It should use paper mode with read-only mode enabled, and passing the event_id
8. Add support for paper_mode.dart to support taking event_id and passing it as a filter to the backend API.
