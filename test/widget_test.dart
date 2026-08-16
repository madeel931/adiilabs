// ignore_for_file: unused_import
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:adii_labs/app/app.dart';
import 'package:adii_labs/shared/models/product_model.dart';
import 'package:adii_labs/core/routing/app_router.dart';

import 'package:google_fonts/google_fonts.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  GoogleFonts.config.allowRuntimeFetching = false;

  group('ProductModel Tests', () {
    test('Products catalog contains InvoiceFlow Pro as flagship', () {
      final products = ProductsData.allProducts;
      expect(products.isNotEmpty, true);
      expect(products.first.name, 'InvoiceFlow Pro');
      expect(products.first.isAvailable, true);
      expect(products.first.slug, 'invoiceflow-pro');
    });

    test('Future products are correctly labeled as coming soon', () {
      final products = ProductsData.allProducts;
      final comingSoonProducts = products.where((p) => !p.isAvailable).toList();
      expect(comingSoonProducts.length, 2);
    });
  });

  group('AppRouter Tests', () {
    test('Route titles match PRD specifications', () {
      expect(
        AppRouter.getTitleForRoute('/'),
        'ADii Labs — Build. Ship. Improve.',
      );
      expect(AppRouter.getTitleForRoute('/products'), 'Products — ADii Labs');
      expect(
        AppRouter.getTitleForRoute('/products/invoiceflow-pro'),
        'InvoiceFlow Pro — Offline-First Invoicing',
      );
      expect(
        AppRouter.getTitleForRoute('/blog'),
        'Dev Logs & Engineering — ADii Labs',
      );
      expect(AppRouter.getTitleForRoute('/about'), 'About — ADii Labs');
      expect(AppRouter.getTitleForRoute('/contact'), 'Contact — ADii Labs');
    });
  });

  group('ADiiLabsApp Smoke Test', () {
    testWidgets('App renders headline and brand name without error', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1440, 900);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      await tester.pumpWidget(const ADiiLabsApp());
      await tester.pumpAndSettle();

      expect(find.text('ADii Labs'), findsWidgets);
      expect(find.text('Build. Ship. Improve.'), findsWidgets);
      expect(find.text('Explore Products'), findsWidgets);
    });
  });
}
