import 'package:flutter/material.dart';
import 'app.dart';
import 'domain/core/config/app_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appConfig = AppConfig(
    appTitle: 'setup',
    buildFlavor: 'dev',
    appUrl:
        'https://0199-2405-201-2009-405f-ec33-ceec-5b48-c3ab.ngrok-free.app/graphql',
    child: Container(),
  );
  appInitializer(appConfig);
}
