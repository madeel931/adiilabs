class NavigationState {
  final String currentRoute;
  final String pageTitle;

  const NavigationState({required this.currentRoute, required this.pageTitle});

  NavigationState copyWith({String? currentRoute, String? pageTitle}) {
    return NavigationState(
      currentRoute: currentRoute ?? this.currentRoute,
      pageTitle: pageTitle ?? this.pageTitle,
    );
  }
}
