# 📄 ADii Labs Website — Product Requirement Document (PRD V1)

## 1. Project Overview
- **Product Name**: ADii Labs Website
- **Brand Name**: ADii Labs
- **Tagline**: Build. Ship. Improve.
- **Positioning**: Software products built with Flutter + AI.
- **Founder**: Muhammad ADii (`@adii_pk`)
- **Official GitHub**: `https://github.com/madeel931/`
- **Purpose**: Build a professional, fast, responsive web application for ADii Labs, an independent software studio focused on building and shipping useful software products with Flutter and AI. The website establishes ADii Labs as a real software product studio.
- **Flagship Product**: InvoiceFlow Pro (Offline-first invoicing software for small businesses).

---

## 2. Core Specifications & Features

### Brand Identity & Palette
- **Deep Navy**: `#07111F` (Background Dark)
- **Surface Dark**: `#0D1B2A`
- **Card Dark**: `#132337`
- **Electric Blue**: `#2F80FF` (Primary Brand Accent)
- **Indigo Accent**: `#635BFF`
- **Muted Slate**: `#94A3B8`
- **Surface Light**: `#F8FAFC`
- **Card Light**: `#FFFFFF`

### Pages & Navigation Map
1. **Home Page (`/`)**: Studio Hero, Featured Flagship Product Spotlight, Live Interactive Demo Invoice Builder, Studio Philosophy Grid, Product Updates Newsletter Signup, Building in Public Banner.
2. **Products Catalog (`/products`)**: Complete list of studio applications (InvoiceFlow Pro + Coming Soon products).
3. **InvoiceFlow Pro Page (`/products/invoiceflow-pro`)**: Flagship hero, interactive macOS window showcase gallery (Dark/Light/RTL/Currency tabs), live interactive demo widget, capabilities grid, verified technical specifications.
4. **Dev Logs & Engineering Blog (`/blog`)**: Studio articles on offline-first architecture, Isar DB, AI pairing workflows, and RTL localization.
5. **About Page (`/about`)**: Studio mission, founder biography, technology stack focus.
6. **Contact Page (`/contact`)**: Direct mailto triggers, X, and GitHub social connections.

---

## 3. Technical Architecture

- **Framework**: Flutter Web (Dart 3.x)
- **State Management**: `flutter_bloc` (Cubit Pattern)
- **Networking**: `http` package for real HTTP email POST API submissions.
- **Routing Engine**: `AppRouter` with route title synchronization (`ADii Labs — Build. Ship. Improve.`, etc.).
- **Typography**: Google Fonts Inter.
- **Analytics**: Google Analytics GA4 (`G-ADIILABS2026`).
- **CI/CD & Hosting**: GitHub Actions (`.github/workflows/deploy.yml`) for GitHub Pages & Firebase Hosting (`firebase.json`).

---

## 4. Verification & Quality Standards

- **Analyzer**: `flutter analyze` — 0 issues found.
- **Test Suite**: `flutter test` — 4/4 passing unit & smoke tests.
- **Web Release Build**: `flutter build web --release` — Tree-shaken icon assets (>99% font reduction) and 0 compilation errors.
