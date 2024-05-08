import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'domain/core/config/app_config.dart';
import 'domain/core/config/injection.dart';
import 'domain/core/services/graphql_services/graphql_service.dart';
import 'domain/core/services/navigation_services/navigation_service.dart';
import 'domain/core/services/navigation_services/routers/route_name.dart';
import 'domain/core/services/navigation_services/routers/routing_config.dart';

class MainApp extends StatelessWidget with WidgetsBindingObserver {
  @override
  MainApp({Key? key}) : super(key: key) {
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConfig.of(context)!.appTitle,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'NotoSans',
          primaryColor: const Color(0xff232E78),
          scaffoldBackgroundColor: const Color(0xFFFFFFFF),
          colorScheme: ThemeData().colorScheme.copyWith(
                tertiaryContainer: const Color(0xFF000000),
                primary: const Color(0xff232E78),
                primaryContainer: const Color(0xff0D1756),
                onPrimary: const Color(0xff333333),
                background: const Color(0xffF2F4F7),
                onBackground: const Color(0xffDDE0E6),
                secondary: const Color(0xff12E27E),
                secondaryContainer: const Color(0xff333333),
                onSecondary: const Color(0xff888888),
                tertiary: const Color(0xff64C2F5),
                error: const Color(0xffE65A5A),
                onSurface: const Color(0xff3C64B4),
                onTertiaryContainer: const Color(0xff4F4F4F),
                onTertiary: const Color(0xffFFC821),
                inversePrimary: const Color(0xFFD0F9E5),
                surface: const Color(0xFFEB5757),
                outline: const Color(0xFF292D32),
                shadow: const Color(0xFFFFFFFF),
                onInverseSurface: const Color(0xFFDDE0E6),
                surfaceTint: const Color(0xFF828282),
                inverseSurface: const Color(0xFF7279A9),
              ),
          textTheme: TextTheme(
            bodyLarge: TextStyle(
              fontSize: 27.sp,
              fontWeight: FontWeight.w600,
              fontFamily: 'NotoSans',
            ),
            bodyMedium: TextStyle(
              fontSize: 21.sp,
              fontWeight: FontWeight.w700,
              fontFamily: 'NotoSans',
            ),
            bodySmall: TextStyle(
              fontSize: 17.sp,
              fontWeight: FontWeight.w700,
              fontFamily: 'NotoSans',
            ),
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            elevation: 0,
          )),
      builder: (context, child) {
        return Column(
          children: [
            Expanded(child: child!),
            if (Provider.of<AppStateNotifier>(context).isOffline)
              Material(
                color: Theme.of(context).errorColor,
                child: SafeArea(
                  top: false,
                  left: false,
                  right: false,
                  bottom: Platform.isIOS ? true : false,
                  child: Container(
                    alignment: Alignment.center,
                    width: 100.w,
                    height: 3.h,
                    child: Text(
                      'No Connection',
                      style: TextStyle(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        fontSize: 15.sp,
                      ),
                    ),
                  ),
                ),
              )
          ],
        );
      },
      navigatorKey: navigator<NavigationService>().navigatorKey,
      onGenerateRoute: authorizedNavigation,
      initialRoute: CommonRoutes.homeRoute,
    );
  }
}

Future appInitializer(AppConfig appConfig) async {
  final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();
  bool isAuthorized = true;

  GraphQLService graphQLService = GraphQLService(
    httpUrl: appConfig.appUrl,
    isAuth: false,
    token: '',
  );

  AppStateNotifier appStateNotifier = AppStateNotifier(
    isAuthorized: isAuthorized,
    graphQLService: graphQLService,
  );

  final AppConfig configuredApp = AppConfig(
    appTitle: appConfig.appTitle,
    buildFlavor: appConfig.buildFlavor,
    appUrl: '',
    child: ChangeNotifierProvider<AppStateNotifier>(
      create: (context) {
        return appStateNotifier;
      },
      child: ResponsiveSizer(
        builder: (context, orientation, deviceType) {
          return MainApp();
        },
      ),
    ),
  );

  setupLocator(navKey, appStateNotifier);
  return runApp(configuredApp);
}
