# TerpMatch

A Flutter dating/matching app built exclusively for University of Maryland students ("Terps"). Users sign in with their `@umd.edu` Google account, build a profile, and swipe to match with other Terps.

## Features

- **Google Sign-In** restricted to UMD accounts, backed by Firebase Auth
- **Guided profile setup** — name, date of birth, gender & gender preference, major, campus residence, clubs, photo uploads, and short prompts
- **Swipe-based discovery** with mutual "right swipe" matching
- **Real-time chat** between matches
- **Cloud Firestore** backend for profiles, swipes, matches, and chat data
- **Firebase Storage** for profile photos

## Tech Stack

- [Flutter](https://flutter.dev/) / Dart
- Firebase: Auth, Cloud Firestore, Storage
- State management: `provider` / `get`
- Google Sign-In

## Project Structure

```
lib/
├── main.dart                     # App entry point, Firebase init, providers
├── database/
│   ├── app_user.dart              # User model / ChangeNotifier
│   ├── database_source.dart       # Firestore read/write helpers (matches, swipes, chat)
│   └── user_options.dart          # Static option lists (majors, clubs, etc.)
└── screens/
    ├── authentication/            # Sign-in, auth wrapper, sign-out
    ├── registration/              # Multi-step profile setup flow
    ├── widgets/                   # Shared UI components
    ├── home.dart                  # Swipe/discovery screen
    ├── matched.dart                # Match results screen
    ├── profile.dart                # User profile screen
    ├── chat.dart                   # Messaging screen
    └── wrapper.dart                # Auth-state router
```

## Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (Dart >=2.18.6 <3.0.0)
- A Firebase project with Auth, Firestore, and Storage enabled
- `google-services.json` (Android) / `GoogleService-Info.plist` (iOS) configured for your Firebase project

### Setup

```bash
git clone https://github.com/vibhusings/Terpmatch.git
cd Terpmatch
flutter pub get
```

Add your Firebase configuration files (not committed to the repo):

- `android/app/google-services.json`
- `ios/Runner/GoogleService-Info.plist`

Then run the app:

```bash
flutter run
```

## Data Model (Firestore)

Each user document lives under `users/{userId}` (the UMD email prefix) with subcollections for:

- `profile/required`, `profile/optional`, `profile/images` — profile data
- `right`, `left`, `encountered` — swipe history
- `match` — mutual matches
- `chat` — conversation references between matched users

## Known Issues / Roadmap

- Matching currently checks a single preferred gender rather than supporting multiple preferences
- Some pages have noticeable load latency that needs optimization
- General code organization and structure cleanup is ongoing

## Contributing

This is a student project under active development. Open a PR against `master` with a clear description of your change.
