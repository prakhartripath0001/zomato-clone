# Zomato Clone (Flutter)

A feature-rich, pixel-perfect **Zomato Clone** built with **Flutter & Dart**, replicating the core food discovery, ordering, and delivery experience of the Zomato mobile app.

**Author:** [Prakhar Tripathi](https://github.com/Prakhar-Tripathi)  
**Video Demo:** [![YouTube](https://img.shields.io/badge/YouTube-Watch%20Live%20Demo-red?style=flat&logo=youtube)](https://www.youtube.com/live/vN_i7-8ND0o?si=Od6redDzDr43GU4b)  
> *Disclaimer: This is an independent portfolio and learning project. It is not affiliated with, endorsed by, or sponsored by Zomato.*

---

## 📺 Live Demo & Video Walkthrough

Watch the complete live development & app walkthrough on YouTube:  
👉 **[Watch Live Stream on YouTube](https://www.youtube.com/live/vN_i7-8ND0o?si=Od6redDzDr43GU4b)**


---

## Key Features

- **Delivery & Restaurant Feed**:
  - Interactive food discovery feed with categories, top brands, and curated cuisine collections.
  - Sticky collapsible search bar with `CustomScrollView` and `SliverAppBar`.
  - Rich restaurant cards featuring color-coded ratings, delivery distance, ETA, and active promotional discount badges.
- **Interactive Delivery Location & Map**:
  - OpenStreetMap integration via `flutter_map` with draggable map tiles and pin marker.
  - Automatic current location fetching using GPS (`geolocator`).
  - Reverse geocoding (`geocoding`) converting map coordinates to readable street, area, and city addresses.
- **Active Search Experience**:
  - Auto-focus keyboard on opening search with instant real-time filtering for dishes and restaurants.
  - Quick-tap chips for popular items (Biryani, Burger, Pizza, Momos, Dosa, Paneer, etc.).
- **Restaurant Menu & Dish Selection**:
  - Category-based menus (Bestsellers, Starters, Main Course) with veg/non-veg indicator chips.
  - Interactive `ItemCounterWidget` that smoothly expands from "ADD" to `- 1 +` counter controls.
- **Cart & Delivery Summary**:
  - Complete order checkout screen with itemized bill breakdown, GST/restaurant charges, and delivery partner tip selector.
  - Cooking instructions, delivery notes, and animated order savings banner.
- **Authentication Flow (Demo Mode)**:
  - Phone number input and 6-digit OTP verification screen powered by `pinput`.
  - Works frictionlessly out-of-the-box without requiring third-party SMS gateway or Firebase credentials.
- **Multi-Language Support (i18n)**:
  - Real-time in-app language switching between **English** and **Hindi (हिन्दी)**.
  - Integrated via `flutter_localizations` and Riverpod state management with a clean selection bottom sheet.
- **Zomato Money & Profile Screen**:
  - Wallet balance UI, transaction history, gift card promotions, and user activity settings.

---

## Tech Stack & Architecture

| Layer / Capability | Technology | Purpose |
| :--- | :--- | :--- |
| **Framework** | [Flutter](https://flutter.dev/) (3.47+ / Dart 3.13+) | High-performance cross-platform mobile UI engine |
| **State Management** | [Flutter Riverpod](https://riverpod.dev/) (`^3.5.0`) | Reactive state handling, compile-safe dependency injection, and locale tracking |
| **Maps & Tiles** | [flutter_map](https://pub.dev/packages/flutter_map) (`^8.3.2`) + [latlong2](https://pub.dev/packages/latlong2) (`^0.10.1`) | OpenStreetMap tile rendering without requiring paid Google Maps API keys |
| **Location & Geocoding** | [geolocator](https://pub.dev/packages/geolocator) (`^14.1.2`) + [geocoding](https://pub.dev/packages/geocoding) (`^5.0.1`) | Device GPS positioning and coordinate-to-address resolution |
| **OTP Input** | [pinput](https://pub.dev/packages/pinput) (`^7.0.0`) | Custom animated PIN/OTP verification input boxes |
| **Vector Animations** | [Lottie](https://pub.dev/packages/lottie) (`^3.8.2`) | High-fidelity animations for delivery bags, banners, and loading states |
| **Image Caching** | [cached_network_image](https://pub.dev/packages/cached_network_image) (`^4.0.7`) | Disk/memory caching and shimmer placeholder handling for remote images |
| **Rich Text** | [styled_text](https://pub.dev/packages/styled_text) (`^10.0.0`) | Tag-based formatted rich text rendering |
| **Icons & Fonts** | [cupertino_icons](https://pub.dev/packages/cupertino_icons) (`^2.0.0`) + [google_fonts](https://pub.dev/packages/google_fonts) (`^9.0.0`) | Vector iconography and dynamic typography |
| **Typography & Styling** | Custom Fonts (`assets/fonts/`) | Bundled multi-weight custom typography matching Zomato's brand font |
| **Build System** | Gradle 9.7.1 + AGP 9.1.0 + Kotlin 2.3.20 | Declarative modern plugin DSL with Java 17 support |

---

## Project Structure

The project follows a scalable **Feature-First Architecture**:

```text
lib/
├── common/                  # Reusable UI widgets, color palette, domain models, enums, & utilities
│   ├── constants/           # Zomato brand colors (primaryColor, ghostWhite, gradients)
│   ├── enums/               # AddressType, OrderFor
│   ├── models/              # User, Pair
│   ├── utils/               # Location utilities, language bottom sheet, snackbars
│   └── widgets/             # Item counter, veg/non-veg tags, restaurant cards, dashed dividers
├── features/                # Self-contained feature modules
│   ├── home/
│   │   ├── delivery/        # Main delivery feed, categories, and restaurant listings
│   │   ├── delivery_location/ # MapWidget and interactive location picker
│   │   ├── delivery_summary/  # Cart, bill details, tipping, and instructions
│   │   ├── main_home/       # Bottom navigation container and page switching
│   │   ├── money/           # Zomato Money wallet & gift cards
│   │   ├── profile/         # User profile, language settings, and activity
│   │   ├── restaurant_page/ # Restaurant menu and food items
│   │   └── search_screen/   # Search bar and filtering
│   ├── loginandsignup/      # Phone input and OTP verification screens
│   └── splash/              # Animated splash launch screen
├── l10n/                    # Localization files (.arb) for English and Hindi
├── navigation/              # Riverpod navigation and locale providers
├── routes/                  # Centralized routing (main_router.dart)
└── main.dart                # App entry point, Riverpod ProviderScope, and ThemeData
```

---

## Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (`>= 3.3.0`)
- Android Studio / VS Code with Flutter extension
- An Android Emulator or physical device

### Run the App

1. **Clone the repository:**
   ```bash
   git clone https://github.com/Prakhar-Tripathi/Zomato-Clone-Flutter.git
   cd Zomato-Clone-Flutter
   ```

2. **Install dependencies:**
   ```bash
   flutter pub get
   ```

3. **Launch the application:**
   ```bash
   flutter run
   ```

> **Note**: Zero setup required. This project works immediately after cloning without needing custom API keys or Firebase configuration files.

---

## Build System & Gradle Configuration

| Tool / Component | Version | Configuration File |
| :--- | :--- | :--- |
| **Gradle** | `9.7.1` | `android/gradle/wrapper/gradle-wrapper.properties` |
| **Android Gradle Plugin (AGP)** | `9.1.0` | `android/settings.gradle` |
| **Kotlin** | `2.3.20` | `android/settings.gradle` |
| **Java Compatibility** | `Java 17` | `android/app/build.gradle` |
| **Android Min SDK** | `28` (Android 9.0+) | `android/app/build.gradle` |

### How to Check the Gradle Version

1. **Via the Wrapper Configuration File:**
   Open [android/gradle/wrapper/gradle-wrapper.properties](file:///Users/prakhartripathi/Documents/zomato-clone/android/gradle/wrapper/gradle-wrapper.properties) and look at `distributionUrl`:
   ```properties
   distributionUrl=https\://services.gradle.org/distributions/gradle-9.7.1-bin.zip
   ```
2. **Via Terminal / Command Line:**
   From the project root, run:
   ```bash
   cd android && ./gradlew --version
   ```
3. **Android Gradle Plugin (AGP) & Kotlin Versions:**
   Check the `plugins` block in [android/settings.gradle](file:///Users/prakhartripathi/Documents/zomato-clone/android/settings.gradle):
   ```groovy
   plugins {
       id "com.android.application" version "9.1.0" apply false
       id "org.jetbrains.kotlin.android" version "2.3.20" apply false
   }
   ```

---

## Multi-Language Setup

The app supports **English (`en`)** and **Hindi (`hi`)**. You can switch languages dynamically:
- Tap the **Language Icon** in the top header of the Delivery screen.
- Or navigate to **Profile -> Choose language**.
- Language state is reactively managed by `appLocaleProvider` and re-renders the app instantly.

---

## License

This project is licensed under the MIT License - feel free to use it for educational and portfolio purposes.
