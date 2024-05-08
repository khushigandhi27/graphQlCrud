import 'package:flutter/material.dart';
import 'app.dart';
import 'domain/core/config/app_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appConfig = AppConfig(
    appTitle: 'setup',
    buildFlavor: 'dev',
    appUrl:
        'https://37ee-2405-201-36-e039-703d-f6a6-d0ad-78e2.ngrok-free.app/graphql',
    child: Container(),
  );
  appInitializer(appConfig);
}
