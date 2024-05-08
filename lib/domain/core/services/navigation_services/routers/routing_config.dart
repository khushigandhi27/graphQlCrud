import 'dart:io';

import 'package:app/presentation/home/home_screen.dart';
import 'package:app/presentation/menu_details/menu_details_screen.dart';
import 'package:app/presentation/menu_form/menu_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../extensions/string_extension.dart';
import 'route_name.dart';
import '../../../../../presentation/core/widgets/default_widget.dart';

Route<dynamic> authorizedNavigation(RouteSettings settings) {
  final routingData = settings.name!.getRoutingData;

  switch (routingData.route) {
    case CommonRoutes.homeRoute:
      return _getPageRoute(const HomeScreen(), settings);

    case CommonRoutes.menuDetailsRoute:
      final routeData = routingData.queryParameters;
      return _getPageRoute(
          MenuDetailsScreen(id: routeData['itemId'] ?? ''), settings);

    case CommonRoutes.menuFormRoute:
      final routeData = routingData.queryParameters;
      final isEdit = routeData['isEdit'] ;
      final menuId = routeData['menuId'] ;

      return _getPageRoute(
          MenuFormScreen(
            isEdit: (isEdit ?? '') == 'true',
            menuId: menuId ?? '',
          ),
          settings);

    default:
      return _getPageRoute(const DefaultWidget(), settings);
  }
}

PageRoute _getPageRoute(
  Widget child,
  RouteSettings settings, {
  bool mainRoute = false,
}) {
  //return CupertinoRoute(enterPage: child);
  if (Platform.isIOS && !mainRoute) {
    return CupertinoPageRoute(builder: (BuildContext context) => child);
  } else {
    return MaterialPageRoute(builder: (BuildContext context) => child);
  }
}
