# Feature Request

You can gather project context from ./projectContext.md.

See ./externalContext.md for a generated output of changes from the backend that detail all the new endpoints.

## Request

Several new endpoints have been implemented on the backend to support a new workflow for generating recommendations. We are only generating recommendations at the collection level, and no longer the contact level. Along with this, we should rethink how we display these. It should all be in one single page.

To do this, we will want to go to ./lib/prayers/home/home.dart. This contains the current core logic for the home page. In that directory contains the models and repos for fetching the data.

## Solution

1. Create new view model(s) for supporting historical lookups, and unresolved follow-ups.
2. Update the repo(s) to support the new endpoints.
3. Create a new home page (This should be its own file). This new home page should follow a simple pattern:
   - At the top, show a title of "Paper Prayer".
      - Under it, it should have buttons to open current recommendations
   - At the bottom, keep it blank for now. I will be adding a way to view latest updated requests later.
4. Add a new view for current recommendations. Similar to how the paper_mode.dart file maintains a clean implementation, we should also do something similar for displaying our recommendations. For each recommendation, it uses the PaginatedCollectionRecommendation. We should use a cursor pagination pattern here. That can be defined from the repo like PaginatedPrayerRequestsNotifier.
   - For each collection row, it should show the collection title, and below it as a subtitle font, it should show the summary.
   - When you tap on the collection, it should drop down with the list of 5 most recent prayer requests highlights. That can be found on the `prayerRequest.features.highlights`. While it's performing the API search, it should show the user it is loading with a loading indicator where the 5 highlights would be. Each highlight should only be one line, and if it overflows, it should be truncated with an ellipsis.
   - At the bottom of the list of highlights, it should have a button to "View All Requests". When tapped, it should open a new page that shows all the requests for that collection.
