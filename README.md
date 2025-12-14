# Paper Prayer

This application is used to manage prayer requests, manage bible studies, groups, and act as a central hub for communicating these kinds of things out to a group. It is the front end for the Paper Prayer API. For now, the API is a private repo that I am working on scaling out, but demo videos of the app will be coming soon! The [landing page for the app is here](https://paper-prayer-af73d35b1629.herokuapp.com/).

Paper Prayer leverages LLMs, fine-tuned models, and a variety of other systems that I have built out to help automate the process of managing people's prayer requests and bible studies. This is something I'm pretty passionate about, as I've led my share of bible studies!

I built a prototype with the first front-end using React while leading a group. I found this to be quite helpful, and have been tweaking areas that can be automated better and transitioning to mobile app development.

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
