class ArticleModel {
  final String id;
  final String title;
  final String summary;
  final String content;
  final String date;
  final String readTime;
  final String category;
  final List<String> tags;
  final String authorName;

  const ArticleModel({
    required this.id,
    required this.title,
    required this.summary,
    required this.content,
    required this.date,
    required this.readTime,
    required this.category,
    required this.tags,
    required this.authorName,
  });
}

class ArticlesData {
  static const List<ArticleModel> allArticles = [
    ArticleModel(
      id: 'isar-offline-architecture',
      title:
          'Building InvoiceFlow Pro: Architecture of an Offline-First Flutter App',
      summary:
          'How we engineered zero-latency local database storage using Isar DB with automatic backup and cross-platform synchronization.',
      content: '''
# Building InvoiceFlow Pro: Architecture of an Offline-First Flutter App

Building a software product for business users requires absolute reliability. When a small business owner is creating an invoice for a customer, network connectivity should never get in the way.

## Why Offline-First?

Traditional SaaS applications rely on cloud databases for every CRUD operation. If the internet drops or an API endpoint returns a 500 error, the user's workflow grinds to a halt.

For **InvoiceFlow Pro**, we flipped this paradigm:
1. **Local-First Writes**: Every invoice, customer record, and line item is stored instantly to local storage via the **Isar Database**.
2. **Zero Latency**: UI state updates in 0ms because data reads occur directly from local RAM/disk cache.
3. **Structured Backups**: Safely export complete JSON/Isar data archives so users own 100% of their business data.

## Key Technical Decisions

### 1. Isar NoSQL Database
Isar provides blazing fast transactions and native Dart queries without requiring slow SQLite bridging overhead.

### 2. Multi-Language RTL Support
Invoicing in global markets requires proper right-to-left layout alignment for languages like Arabic and Urdu. Flutter's `Directionality` widget makes RTL UI clean and declarative.

### 3. Material 3 Dark/Light Themes
Designing high-contrast dark themes reduces eye strain for power users generating dozens of invoices daily.
''',
      date: 'Aug 14, 2026',
      readTime: '5 min read',
      category: 'Architecture',
      tags: ['Flutter', 'Isar DB', 'Offline-First', 'Architecture'],
      authorName: 'Muhammad ADii',
    ),
    ArticleModel(
      id: 'ai-assisted-flutter-workflows',
      title: 'Accelerating Product Development with AI-Assisted Workflows',
      summary:
          'Practical guidelines for pairing Flutter codebases with AI assistants to write cleaner code, maintain zero-warning analyzer states, and test thoroughly.',
      content: '''
# Accelerating Product Development with AI-Assisted Workflows

At **ADii Labs**, our motto is **Build. Ship. Improve.**

To maintain a rapid shipping velocity while maintaining production-grade code quality, we rely on AI-assisted development workflows.

## Our 3 Core AI Pairing Rules

### Rule 1: Never Guess API Schemas
Before generating code or modifying data models, inspect the exact symbol definitions first. This prevents missing parameter crashes and null pointer exceptions.

### Rule 2: Empirical Log Inspection
When an error or test failure occurs, inspect full un-truncated stack traces instead of patching symptoms blindly.

### Rule 3: Automated Verification
Every code iteration MUST be verified with `flutter analyze` and `flutter test` before release.

## Conclusion
AI tools do not replace software engineering; they multiply developer output when paired with disciplined architecture and strict verification routines.
''',
      date: 'Aug 10, 2026',
      readTime: '4 min read',
      category: 'Development',
      tags: ['AI', 'Flutter', 'Productivity', 'Public Building'],
      authorName: 'Muhammad ADii',
    ),
    ArticleModel(
      id: 'rtl-localization-in-flutter',
      title: 'Designing Production-Ready Localized RTL Apps in Flutter',
      summary:
          'Deep dive into handling Arabic, Urdu, and English layouts seamlessly in Flutter with custom currency formatting.',
      content: '''
# Designing Production-Ready Localized RTL Apps in Flutter

Creating software for international business owners requires supporting Right-to-Left (RTL) writing direction natively.

## Key Takeaways

1. **Directionality Scoping**: Wrap localized sub-trees in `Directionality(textDirection: ...)` to automatically flip alignment, icons, and text bounds.
2. **Numeric Localization**: Support both standard Arabic numerals (123) and Eastern Arabic numerals (١٢٣) based on user locale preferences.
3. **Custom Currency Formatting**: Enable business owners to set custom currency symbols (SAR ر.س, USD \$, PKR ₨) dynamically.
''',
      date: 'Aug 04, 2026',
      readTime: '6 min read',
      category: 'Localization',
      tags: ['Flutter', 'RTL', 'Arabic', 'Urdu', 'UI/UX'],
      authorName: 'Muhammad ADii',
    ),
  ];
}
