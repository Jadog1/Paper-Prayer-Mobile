# Paper Prayer

This application is used to manage prayer requests, manage bible studies, groups, and act as a central hub for managing these kinds of things for a group. It is the front end for the Paper Prayer API. The [landing page for the app is here](https://www.paper-prayer.com/).

Paper Prayer leverages agentic workflows that I have built out to help automate the process of managing people's prayer requests and bible studies. This is something I'm pretty passionate about, as I've led my share of bible studies!

This all started with an initial prototype of training pre-trained models from huggingface among other smaller models I built to help manage prayer requests. Due to LLM's ability today to manage that kind of context and capture deeper meaning, I was able to build out a more robust system that can help manage prayer requests and bible studies.

## Features

## Setup

flutter emulators --launch Medium_Phone_API_35

## Useful commands

```bash
dart run build_runner watch --delete-conflicting-outputs

flutter build apk --dart-define=backend_url=paper-prayer-af73d35b1629.herokuapp.com --dart-define=website_url=https://paper-prayer-af73d35b1629.herokuapp.com && flutter install

# Update icon
# assets/icon
dart run flutter_launcher_icons
```
