import 'package:flutter_bloc/flutter_bloc.dart';
import '../app_router.dart';
import 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit()
    : super(
        NavigationState(
          currentRoute: '/',
          pageTitle: AppRouter.getTitleForRoute('/'),
        ),
      );

  void navigateTo(String route) {
    if (state.currentRoute != route) {
      final title = AppRouter.getTitleForRoute(route);
      emit(state.copyWith(currentRoute: route, pageTitle: title));
    }
  }
}
