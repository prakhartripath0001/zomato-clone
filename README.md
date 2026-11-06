# Zomato Clone

A Flutter-based food delivery app UI inspired by Zomato. The project demonstrates a multi-screen restaurant and food ordering experience, including restaurant discovery, location selection, sign-in flows, and a delivery summary.

**Author:** Prakhar

> This is an independent learning project and is not affiliated with or endorsed by Zomato.

## What the app includes

- Browse delivery, restaurants, and dishes.
- Search and view restaurant menus, food items, ratings, and offers.
- Select a delivery location using a map, device location, and address lookup.
- Review selected items, add cooking instructions, and choose a delivery tip.
- Explore the sign-in and OTP screens as UI demos; no account or SMS verification is performed.
- View profile and activity screens, plus a money/gift-card section.
- Localized UI strings for English, Hindi, and Odia.

Some restaurant and dish listing values are generated in the app for demonstration; this project is not a complete production ordering service.

## Tech used

- **Flutter and Dart** for the cross-platform mobile app and UI.
- **Riverpod** (`flutter_riverpod`) for dependency injection and state management.
- **flutter_map**, **latlong2**, **geolocator**, and **geocoding** for maps, coordinates, current location, and address lookup. The map uses OpenStreetMap tiles.
- **Lottie** for animated assets, and **cached_network_image** for network images.
- **flutter_localizations** and generated localization resources for translated UI strings.
- Custom font files and image assets in `assets/`.

The code is organized by feature under `lib/features/`, with shared widgets, models, and utilities under `lib/common/`. Named routes are defined in `lib/routes/`.

## Run locally

You'll need Flutter installed with Dart 3.3 or later, plus an Android or iOS device/emulator.

```sh
flutter pub get
flutter run
```

This project is UI-only and does not connect to Firebase or another authentication backend. Sign-in buttons are demo navigation, and the OTP screen accepts any six-digit code without sending or verifying an SMS.

## Project structure

```text
lib/
  common/       Shared widgets, models, and utilities
  features/     App screens and feature-specific code
  l10n/         English, Hindi, and Odia localization resources
  navigation/   Navigation state and keys
  routes/       Named route configuration
  main.dart     App entry point and theme
assets/
  fonts/        Custom font family
  images/       UI and food imagery
  lottie/       Animation JSON files
```
