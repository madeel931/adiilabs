import 'package:flutter/material.dart';
import '../../features/about/presentation/pages/about_page.dart';
import '../../features/blog/presentation/pages/blog_page.dart';
import '../../features/contact/presentation/pages/contact_page.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/products/presentation/pages/invoiceflow_pro_page.dart';
import '../../features/products/presentation/pages/products_page.dart';

class AppRouter {
  static String getTitleForRoute(String route) {
    switch (route) {
      case '/':
        return 'ADii Labs — Build. Ship. Improve.';
      case '/products':
        return 'Products — ADii Labs';
      case '/products/invoiceflow-pro':
        return 'InvoiceFlow Pro — Offline-First Invoicing';
      case '/blog':
        return 'Dev Logs & Engineering — ADii Labs';
      case '/about':
        return 'About — ADii Labs';
      case '/contact':
        return 'Contact — ADii Labs';
      default:
        return 'ADii Labs — Build. Ship. Improve.';
    }
  }

  static Widget getWidgetForRoute(
    String route,
    Function(String route) onNavigate,
  ) {
    switch (route) {
      case '/':
        return HomePage(onNavigate: onNavigate);
      case '/products':
        return ProductsPage(onNavigate: onNavigate);
      case '/products/invoiceflow-pro':
        return InvoiceFlowProPage(onNavigate: onNavigate);
      case '/blog':
        return BlogPage(onNavigate: onNavigate);
      case '/about':
        return AboutPage(onNavigate: onNavigate);
      case '/contact':
        return ContactPage(onNavigate: onNavigate);
      default:
        return HomePage(onNavigate: onNavigate);
    }
  }
}
