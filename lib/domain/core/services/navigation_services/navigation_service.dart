import 'package:flutter/material.dart';

import '../../config/app_config.dart';
import 'routers/route_name.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey;

  final AppStateNotifier appStateNotifier;
  NavigationService(this.navigatorKey, this.appStateNotifier);

  Future<dynamic> navigateTo(String routeName,
      {Map<String, String> queryParams = const {},
      bool isClearStack = false,
      bool isReplace = false,
      dynamic arguments}) {
    if (appStateNotifier.isOffline) {
      return navigatorKey.currentState!
          .pushNamed(GeneralRoutes.noNetwork, arguments: arguments);
    }
    String newRouteName = routeName;

    newRouteName =
        Uri(path: newRouteName, queryParameters: queryParams).toString();
    // print(navigatorKey.currentState.toString());

    if (isClearStack) {
      return navigatorKey.currentState!.pushNamedAndRemoveUntil(
          newRouteName, ModalRoute.withName('/'),
          arguments: arguments);
    } else if (isReplace) {
      return navigatorKey.currentState!
          .pushReplacementNamed(newRouteName, arguments: arguments);
    } else {
      return navigatorKey.currentState!
          .pushNamed(newRouteName, arguments: arguments);
    }
  }

  bool goBack({dynamic responseObject}) {
    navigatorKey.currentState!.pop(responseObject);
    return true;
  }

  BuildContext get getNavContext => navigatorKey.currentState!.context;

  GlobalKey<NavigatorState> get getNavKey => navigatorKey;
}
