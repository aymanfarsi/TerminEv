import 'package:flutter/widgets.dart';
import 'package:terminev/services/config.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';

Future<void> initApp() async {
  WidgetsFlutterBinding.ensureInitialized();

  await loadConfig();

  doWhenWindowReady(() {
    const initialSize = Size(700, 600);
    appWindow
      ..minSize = initialSize
      ..size = initialSize
      ..alignment = Alignment.center
      ..show();
  });
}
