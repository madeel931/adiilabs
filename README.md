# 🚀 ADii Labs Website (V1)

[![Flutter](https://img.shields.io/badge/Flutter-Web-02569B?logo=flutter)](https://flutter.dev)
[![Cubit](https://img.shields.io/badge/State-flutter__bloc_Cubit-blueviolet)](https://pub.dev/packages/flutter_bloc)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![GitHub](https://img.shields.io/badge/GitHub-madeel931-181717?logo=github)](https://github.com/madeel931/)

> **Build. Ship. Improve.**  
> *Software products built with Flutter + AI.*

**ADii Labs** is an independent software product studio focused on building practical, fast, offline-first applications. This repository contains the source code for the official ADii Labs studio website and product catalog.

---

## ✨ Features

- **Flagship Spotlight (InvoiceFlow Pro)**: Full product detail showcase for InvoiceFlow Pro, featuring interactive screenshots, technical trust specifications, and capability grids.
- **Live Interactive Invoice Generator**: Built-in interactive Flutter Web invoice generator widget with real-time rate, quantity, tax, and multi-currency calculations (`USD $`, `SAR ر.س`, `EUR €`).
- **Studio Dev Logs & Blog (`/blog`)**: Dedicated engineering logs section with tagged articles on offline-first architecture (Isar DB), AI pairing workflows, and RTL localization.
- **Product Updates Newsletter**: Email subscription card powered by `NewsletterCubit` with real HTTP API submission and validation.
- **Cubit Architecture (`flutter_bloc`)**: Modular state management handling themes (`ThemeCubit`), navigation (`NavigationCubit`), catalog (`ProductsCubit`), gallery (`InvoiceFlowProCubit`), blog (`BlogCubit`), newsletter (`NewsletterCubit`), and interactive invoice state (`DemoInvoiceCubit`).
- **Material 3 Dark & Light Themes**: Curated Deep Navy (`#07111F`) & Electric Blue (`#2F80FF`) aesthetic with smooth theme mode toggling.
- **Responsive Layout**: Dynamic breakpoints for Desktop (1024px+), Tablet (768–1023px), and Mobile (<768px) with full-featured `MobileDrawer`.
- **Production CI/CD**: Automated GitHub Actions workflow (`.github/workflows/deploy.yml`) for GitHub Pages & Firebase Hosting (`firebase.json`).

---

## 🏗️ Tech Stack & Architecture

| Layer | Technology |
| :--- | :--- |
| **Framework** | Flutter Web (Dart 3.x) |
| **State Management** | `flutter_bloc` (Cubit Pattern) |
| **Networking** | `http` package for real API POST submissions |
| **Design System** | Material 3 + Custom Brand Tokens (`BrandColors`, `AppTheme`) |
| **Typography** | Google Fonts (`Inter`) |
| **Analytics** | Google Analytics 4 (GA4: `G-ADIILABS2026`) |
| **CI/CD & Hosting** | GitHub Actions, GitHub Pages, Firebase Hosting |

---

## 📁 Folder Structure

```text
lib/
├── app/
│   └── app.dart                 # Root MaterialApp & MultiBlocProvider setup
├── core/
│   ├── constants/
│   │   ├── asset_paths.dart     # Centralized asset paths
│   │   ├── brand_colors.dart    # Studio brand color palette
│   │   └── brand_config.dart    # Founder info, URLs, API endpoints
│   ├── responsive/
│   │   └── responsive_layout.dart # Breakpoint engine (<768, 768-1023, 1024+)
│   ├── routing/
│   │   ├── app_router.dart      # Route mapping & document titles
│   │   └── cubit/               # NavigationCubit & state
│   ├── theme/
│   │   ├── app_theme.dart       # M3 Dark & Light theme specs
│   │   └── cubit/               # ThemeCubit & state
│   └── utils/
│       └── url_launcher_utils.dart # External link helper
├── features/
│   ├── about/                   # Studio philosophy & founder story
│   ├── blog/                    # Engineering dev logs, models, cubit, pages
│   ├── contact/                 # Direct mailto & social channels
│   ├── home/                    # Hero, featured product, newsletter, banner
│   ├── newsletter/              # NewsletterCubit & HTTP subscription logic
│   └── products/                # Product catalog, InvoiceFlow Pro showcase, DemoInvoiceCubit
└── shared/
    ├── models/                  # ProductModel & studio catalog data
    └── widgets/                 # NavBar, Footer, Buttons, SectionHeader, Newsletter
```

---

## 🚀 Getting Started

### Prerequisites
- Flutter SDK `^3.24.0` or higher
- Dart SDK `^3.5.0` or higher

### Local Development Setup

1. **Clone the repository**:
   ```bash
   git clone https://github.com/madeel931/adii_labs.git
   cd adii_labs
   ```

2. **Install dependencies**:
   ```bash
   flutter pub get
   ```

3. **Run code analyzer**:
   ```bash
   flutter analyze
   ```

4. **Run unit & widget tests**:
   ```bash
   flutter test
   ```

5. **Start Flutter Web dev server**:
   ```bash
   flutter run -d chrome
   ```

---

## 📦 Building for Production

To build the release Web bundle:

```bash
flutter build web --release
```

The compiled static output will be saved to `build/web/`.

### Hosting Deployments

- **GitHub Pages**: Pushing to `main` branch automatically triggers `.github/workflows/deploy.yml`.
- **Firebase Hosting**:
  ```bash
  firebase deploy
  ```

---

## 👤 Founder & Studio Info

- **Studio**: ADii Labs
- **Founder**: Muhammad ADii
- **Official GitHub**: [github.com/madeel931](https://github.com/madeel931/)
- **X (Twitter)**: [@adii_pk](https://x.com/adii_pk)
- **Contact**: `contact@adiilabs.com`
- **Flagship Product**: InvoiceFlow Pro (Offline-first invoicing software for small businesses)

---

## 📄 License

Copyright © 2026 ADii Labs. Built with Flutter + AI.
