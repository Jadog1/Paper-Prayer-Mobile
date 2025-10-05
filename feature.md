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
4. Add a new view for current recommendations. Similar to how 
