/// Centralized configuration for ADii Labs brand positioning, URLs, and info.
abstract class BrandConfig {
  static const String brandName = 'ADii Labs';
  static const String tagline = 'Build. Ship. Improve.';
  static const String positioning =
      'Software products built with Flutter + AI.';
  static const String studioDescription =
      'ADii Labs is an independent software studio building practical products that solve real problems.';

  // Founder Information
  static const String founderName = 'Muhammad ADii';
  static const String founderRole = 'Founder & Software Builder';
  static const String founderBio =
      'Flutter developer and product builder behind ADii Labs. Dedicated to crafting fast, offline-first, production-ready software using Flutter and AI-assisted workflows.';

  // External Links & API Endpoints (Official channels)
  static const String xUrl = 'https://x.com/adii_pk';
  static const String xHandle = '@adii_pk';
  static const String githubUrl = 'https://github.com/madeel931/';
  static const String invoiceFlowGithubUrl =
      'https://github.com/madeel931/invoice_flow_pro';
  static const String contactEmail = 'contact@adiilabs.com';
  static const String newsletterApiEndpoint = 'https://formspree.io/f/xknkqypa';
  static const String googleAnalyticsId = 'G-ADIILABS2026';

  // Copyright Year
  static int get currentYear => DateTime.now().year;
}
