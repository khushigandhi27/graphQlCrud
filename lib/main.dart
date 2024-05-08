import 'package:flutter/material.dart';
import 'app.dart';
import 'domain/core/config/app_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appConfig = AppConfig(
    appTitle: 'Coffee Shop',
    buildFlavor: 'production',
    appUrl: '',
    child: Container(),
  );
  appInitializer(appConfig);
}
