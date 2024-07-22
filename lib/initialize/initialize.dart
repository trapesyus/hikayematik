import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

class Initialize {
  static Future<void> appInitialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    await windowManager.ensureInitialized();

    windowManager.waitUntilReadyToShow().then((_) async {
      await windowManager.setFullScreen(true);
      await windowManager.setResizable(false);
      await windowManager.setTitleBarStyle(TitleBarStyle.hidden);
      await windowManager.show();
    });
  }
}
