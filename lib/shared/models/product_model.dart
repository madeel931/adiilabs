import '../../core/constants/asset_paths.dart';
import '../../core/constants/brand_config.dart';

enum ProductStatus { available, comingSoon, inDevelopment }

class ProductFeature {
  final String title;
  final String description;

  const ProductFeature({required this.title, required this.description});
}

class ProductModel {
  final String id;
  final String name;
  final String slug;
  final String tagline;
  final String description;
  final String fullDescription;
  final ProductStatus status;
  final String category;
  final String iconAsset;
  final List<String> screenshotAssets;
  final List<ProductFeature> features;
  final List<String> trustSpecs;
  final String? websiteUrl;
  final String? repositoryUrl;
  final String? purchaseUrl;

  const ProductModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.tagline,
    required this.description,
    required this.fullDescription,
    required this.status,
    required this.category,
    required this.iconAsset,
    required this.screenshotAssets,
    required this.features,
    required this.trustSpecs,
    this.websiteUrl,
    this.repositoryUrl,
    this.purchaseUrl,
  });

  bool get isAvailable => status == ProductStatus.available;
}

// Structured catalog of ADii Labs products
abstract class ProductsData {
  static const ProductModel invoiceFlowPro = ProductModel(
    id: 'invoiceflow-pro',
    name: 'InvoiceFlow Pro',
    slug: 'invoiceflow-pro',
    tagline: 'Offline-first invoicing for small businesses.',
    description:
        'InvoiceFlow Pro is designed for businesses that need simple invoicing, customer management, products/services, reporting, PDF invoices, and reliable local data without depending on an internet connection.',
    fullDescription:
        'Built with Flutter, InvoiceFlow Pro delivers lightning-fast offline operation, complete data privacy, custom currency formats, and multi-language support (English, Arabic, Urdu with full RTL optimization).',
    status: ProductStatus.available,
    category: 'Business Software',
    iconAsset: AssetPaths.invoiceFlowAppIcon,
    screenshotAssets: [
      AssetPaths.screenshotDarkDashboard,
      AssetPaths.screenshotLightDashboard,
      AssetPaths.screenshotArabicRtl,
      AssetPaths.screenshotUrduRtl,
      AssetPaths.screenshotSarSelected,
    ],
    features: [
      ProductFeature(
        title: 'Invoicing',
        description:
            'Create and manage professional invoices with customized line items.',
      ),
      ProductFeature(
        title: 'Customers',
        description: 'Manage customer records and contact history securely.',
      ),
      ProductFeature(
        title: 'Products & Services',
        description:
            'Manage reusable products, inventory items, and pricing tiers.',
      ),
      ProductFeature(
        title: 'PDF Invoices',
        description:
            'Generate printable, shareable PDF invoices directly on device.',
      ),
      ProductFeature(
        title: 'Offline First',
        description:
            'Core data remains 100% available without requiring an internet connection.',
      ),
      ProductFeature(
        title: 'Reports',
        description:
            'Understand invoice activity, revenue metrics, and outstanding payments.',
      ),
      ProductFeature(
        title: 'Backup & Restore',
        description: 'Export and restore complete application data safely.',
      ),
      ProductFeature(
        title: 'Localization',
        description:
            'Full native support for English, Arabic, and Urdu UI layout.',
      ),
      ProductFeature(
        title: 'Dark & Light Mode',
        description: 'Modern Material 3 interface with theme customization.',
      ),
    ],
    trustSpecs: [
      'Flutter Web & Mobile',
      '100% Offline-First',
      'Local Isar DB',
      'Material 3 UI',
      'RTL Support',
      'Local Data Backup',
    ],
    repositoryUrl: BrandConfig.invoiceFlowGithubUrl,
    purchaseUrl:
        null, // As specified in PRD Section 13: Hide purchase button if URL does not exist yet
  );

  static const ProductModel comingSoonProduct1 = ProductModel(
    id: 'product-02',
    name: 'Developer Tool Suite',
    slug: 'developer-tool-suite',
    tagline: 'AI-assisted workflow utilities for Flutter builders.',
    description:
        'Next-generation CLI & visual tools designed to accelerate Flutter development, localization, and asset management.',
    fullDescription: 'Currently in design and prototype testing at ADii Labs.',
    status: ProductStatus.comingSoon,
    category: 'Developer Tools',
    iconAsset: '',
    screenshotAssets: [],
    features: [],
    trustSpecs: ['Flutter', 'AI Workflow'],
  );

  static const ProductModel comingSoonProduct2 = ProductModel(
    id: 'product-03',
    name: 'Indie Studio Engine',
    slug: 'indie-studio-engine',
    tagline: 'Modular application core for cross-platform apps.',
    description:
        'A modular, high-performance foundation built for launching production-grade apps at scale.',
    fullDescription: 'Currently under active exploration.',
    status: ProductStatus.comingSoon,
    category: 'Productivity',
    iconAsset: '',
    screenshotAssets: [],
    features: [],
    trustSpecs: ['Flutter', 'Cross-Platform'],
  );

  static List<ProductModel> get allProducts => [
    invoiceFlowPro,
    comingSoonProduct1,
    comingSoonProduct2,
  ];
}
