import 'package:flutter/material.dart';

import '../services/graphql_services/graphql_service.dart';

class AppStateNotifier extends ChangeNotifier {
  bool isAuthorized;
  bool isOffline;
  GraphQLService graphQLService;

  AppStateNotifier({
    required this.isAuthorized,
    required this.graphQLService,
    this.isOffline = false,
  });

  Future<void> updateAfterAuthChange({
    required bool isAuthorized,
  }) async {
    this.isAuthorized = isAuthorized;
    notifyListeners();
  }
}

class AppConfig extends InheritedWidget {
  final String appTitle;
  final String buildFlavor;
  final String appUrl;
  @override
  // ignore: overridden_fields
  final Widget child;

  const AppConfig({
    super.key,
    required this.appTitle,
    required this.buildFlavor,
    required this.appUrl,
    required this.child,
  }) : super(child: child);

  static AppConfig? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppConfig>();
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}
