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
| **Framework** | [Flutter](https://flutter.dev/) (Dart 3.3+) | High-performance cross-platform mobile UI engine |
| **State Management** | [Flutter Riverpod](https://riverpod.dev/) (`2.x`) | Reactive state handling, compile-safe dependency injection, and locale tracking |
| **Maps & Tiles** | [flutter_map](https://pub.dev/packages/flutter_map) + [latlong2](https://pub.dev/packages/latlong2) | OpenStreetMap tile rendering without requiring paid Google Maps API keys |
| **Location & Geocoding** | [geolocator](https://pub.dev/packages/geolocator) + [geocoding](https://pub.dev/packages/geocoding) | Device GPS positioning and coordinate-to-address resolution |
| **OTP Input** | [pinput](https://pub.dev/packages/pinput) | Custom animated PIN/OTP verification input boxes |
| **Vector Animations** | [Lottie](https://pub.dev/packages/lottie) | High-fidelity animations for delivery bags, banners, and loading states |
| **Image Caching** | [cached_network_image](https://pub.dev/packages/cached_network_image) | Disk/memory caching and shimmer placeholder handling for remote images |
| **Typography & Styling** | Custom Fonts (`assets/fonts/`) | Bundled multi-weight custom typography matching Zomato's brand font |
| **Build System** | Gradle 9.x + Modern Plugin DSL | Fully migrated to declarative `plugins {}` block for modern Flutter 3.x+ compatibility |

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

## Multi-Language Setup

The app supports **English (`en`)** and **Hindi (`hi`)**. You can switch languages dynamically:
- Tap the **Language Icon** in the top header of the Delivery screen.
- Or navigate to **Profile -> Choose language**.
- Language state is reactively managed by `appLocaleProvider` and re-renders the app instantly.

---

## License

This project is licensed under the MIT License - feel free to use it for educational and portfolio purposes.
