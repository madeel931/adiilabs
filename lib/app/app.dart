import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../core/routing/app_router.dart';
import '../core/routing/cubit/navigation_cubit.dart';
import '../core/routing/cubit/navigation_state.dart';
import '../core/theme/app_theme.dart';
import '../core/theme/cubit/theme_cubit.dart';
import '../core/theme/cubit/theme_state.dart';
import '../features/blog/cubit/blog_cubit.dart';
import '../features/newsletter/cubit/newsletter_cubit.dart';
import '../features/products/cubit/demo_invoice_cubit.dart';
import '../features/products/cubit/invoiceflow_pro_cubit.dart';
import '../features/products/cubit/products_cubit.dart';
import '../shared/widgets/footer.dart';
import '../shared/widgets/navbar.dart';

class ADiiLabsApp extends StatelessWidget {
  const ADiiLabsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(create: (context) => ThemeCubit()),
        BlocProvider<NavigationCubit>(create: (context) => NavigationCubit()),
        BlocProvider<ProductsCubit>(create: (context) => ProductsCubit()),
        BlocProvider<InvoiceFlowProCubit>(
          create: (context) => InvoiceFlowProCubit(),
        ),
        BlocProvider<BlogCubit>(create: (context) => BlogCubit()),
        BlocProvider<NewsletterCubit>(create: (context) => NewsletterCubit()),
        BlocProvider<DemoInvoiceCubit>(create: (context) => DemoInvoiceCubit()),
      ],
      child: const _ADiiLabsAppView(),
    );
  }
}

class _ADiiLabsAppView extends StatelessWidget {
  const _ADiiLabsAppView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, themeState) {
        return BlocBuilder<NavigationCubit, NavigationState>(
          builder: (context, navState) {
            return MaterialApp(
              title: navState.pageTitle,
              debugShowCheckedModeBanner: false,
              theme: AppTheme.lightTheme(),
              darkTheme: AppTheme.darkTheme(),
              themeMode: themeState.themeMode,
              home: Title(
                title: navState.pageTitle,
                color: const Color(0xFF2F80FF),
                child: Scaffold(
                  appBar: NavBar(
                    currentRoute: navState.currentRoute,
                    onNavigate: (route) =>
                        context.read<NavigationCubit>().navigateTo(route),
                  ),
                  endDrawer: MobileDrawer(
                    currentRoute: navState.currentRoute,
                    onNavigate: (route) =>
                        context.read<NavigationCubit>().navigateTo(route),
                  ),
                  body: SingleChildScrollView(
                    child: Column(
                      children: [
                        AppRouter.getWidgetForRoute(
                          navState.currentRoute,
                          (route) =>
                              context.read<NavigationCubit>().navigateTo(route),
                        ),
                        Footer(
                          onNavigate: (route) =>
                              context.read<NavigationCubit>().navigateTo(route),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
